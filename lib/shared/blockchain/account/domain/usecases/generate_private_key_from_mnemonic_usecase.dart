import 'dart:math';
import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/comparison_utils.dart';
import '../../../../utils/hd_key_derivation_utils.dart';
import '../entities/aptos_derivation_path.dart';
import '../entities/json_web_key.dart';
import '../repositories/entropy_repository_interface.dart';
import '../repositories/jwk_repository_interface.dart';

class GeneratePrivateKeyFromMnemonicUseCase {
  const GeneratePrivateKeyFromMnemonicUseCase({
    required IEntropyRepository entropyRepository,
    required IJwkRepository jwkRepository,
  }) : _entropyRepository = entropyRepository,
       _jwkRepository = jwkRepository;

  final IEntropyRepository _entropyRepository;
  final IJwkRepository _jwkRepository;

  TaskEither<ExceptionWithStackTrace, Uint8List> call({
    required Uint8List entropyHash,
    Option<int> accountIndex = const None(),
  }) => TaskEither<ExceptionWithStackTrace, Uint8List>(() async {
    try {
      final Either<ExceptionWithStackTrace, Option<Uint8List>> entropyResult =
          await _entropyRepository.get(hash: entropyHash).run();

      if (entropyResult.isLeft()) {
        return left(entropyResult.getLeft().toNullable()!);
      }

      final Option<Uint8List> entropyOption =
          entropyResult.getRight().toNullable()!;

      if (entropyOption.isNone()) {
        throw StateError('Mnemonic not found');
      }

      final Uint8List entropy = entropyOption.toNullable()!;

      final Either<ExceptionWithStackTrace, Set<(Uint8List, HDKeySourceConfig)>>
      configsResult = _jwkRepository.getAllHDKeySourceConfigs().run();

      if (configsResult.isLeft()) {
        return left(configsResult.getLeft().toNullable()!);
      }

      final Set<(Uint8List, HDKeySourceConfig)> allConfigs =
          configsResult.getRight().toNullable()!;

      final List<HDKeySourceConfig> existingHDKeySource =
          allConfigs
              .map(((Uint8List, HDKeySourceConfig) data) => data.$2)
              .toList();

      final Iterable<int> existingIndexes = existingHDKeySource
          .where(
            (HDKeySourceConfig config) =>
                areByteListsEqual(config.entropyHash, entropyHash),
          )
          .map((HDKeySourceConfig e) => e.derivationPath.accountIndex);

      final int resolvedAccountIndex = accountIndex.getOrElse(
        () => _getNextAccountIndex(existingIndexes),
      );

      if (resolvedAccountIndex < 0) {
        throw ArgumentError('Account index must be non-negative');
      }

      if (existingIndexes.contains(resolvedAccountIndex)) {
        throw StateError(
          'Private key already exists for account index: $resolvedAccountIndex',
        );
      }

      final AptosDerivationPath derivationPath =
          AptosDerivationPath.fromAccountIndex(resolvedAccountIndex);

      final Uint8List privateKeyBytes = deriveHDKeyFromEntropy(
        entropy: entropy,
        derivationPath: derivationPath.toBytes(),
      );

      final Jwk jwk = Jwk.fromEd25519PrivateKey(privateKey: privateKeyBytes);
      final Uint8List keyId = jwk.keyId;

      final Either<ExceptionWithStackTrace, Jwk> storeResult =
          await _jwkRepository
              .store(
                jwk: jwk,
                config: KeySourceConfig.fromHDKey(
                  entropyHash: entropyHash,
                  derivationPath: derivationPath,
                ),
              )
              .run();

      if (storeResult.isLeft()) {
        return left(storeResult.getLeft().toNullable()!);
      }

      return right(keyId);
    } on Exception catch (error, stackTrace) {
      return left(ExceptionWithStackTrace(error, stackTrace));
    }
  });

  int _getNextAccountIndex(Iterable<int> existingIndexes) {
    if (existingIndexes.isEmpty) {
      return 0;
    }
    return existingIndexes.reduce(max) + 1;
  }
}
