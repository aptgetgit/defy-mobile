import 'dart:math';
import 'dart:typed_data';

import '../../../../utils/hd_key_derivation_utils.dart';
import '../entities/aptos_derivation_path.dart';
import '../entities/json_web_key.dart';
import '../repositories/entropy_repository_interface.dart';
import '../repositories/jwk_repository_interface.dart';

class GeneratePrivateKeyFromMnemonicUseCase {
  const GeneratePrivateKeyFromMnemonicUseCase({
    required IEntropyRepository entropyRepository,
    required IJwkRepository jwkRepository,
  })  : _entropyRepository = entropyRepository,
        _jwkRepository = jwkRepository;

  final IEntropyRepository _entropyRepository;
  final IJwkRepository _jwkRepository;

  Future<Uint8List> call({
    required Uint8List entropyHash,
    int? accountIndex,
  }) async {
    final Uint8List? entropy = await _entropyRepository.get(hash: entropyHash);
    if (entropy == null) {
      throw StateError('Mnemonic not found');
    }

    try {
      final List<HDKeySourceConfig> existingHDKeySource = _jwkRepository
          .getAllHDKeySourceConfigs()
          .map(((Uint8List, HDKeySourceConfig) data) => data.$2)
          .toList();

      final Iterable<int> existingIndexes = existingHDKeySource
          .where(
            (HDKeySourceConfig config) => config.entropyHash == entropyHash,
          )
          .map((HDKeySourceConfig e) => e.derivationPath.accountIndex);

      final int resolvedAccountIndex =
          accountIndex ?? _getNextAccountIndex(existingIndexes);

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

      await _jwkRepository.store(
        jwk: jwk,
        config: KeySourceConfig.fromHDKey(
          entropyHash: entropyHash,
          derivationPath: derivationPath,
        ),
      );

      return keyId;
    } catch (e) {
      if (e is StateError) {
        rethrow;
      }
      throw StateError('Failed to generate private key: $e');
    }
  }

  int _getNextAccountIndex(Iterable<int> existingIndexes) {
    if (existingIndexes.isEmpty) {
      return 0;
    }
    return existingIndexes.reduce(max) + 1;
  }
}
