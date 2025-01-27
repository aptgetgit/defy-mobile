import 'dart:math';
import 'dart:typed_data';

import 'package:aptos_dart/aptos.dart' as aptos;
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed25519;

import '../../../../shared/utils/hex_utils.dart';
import '../../data/repositories/entropy_repository_implementation.dart';
import '../../data/repositories/jwk_repository_implementation.dart';
import '../../data/repositories/private_jwk_repository_implementation.dart';
import '../entities/aptos_derivation_path.dart';
import '../entities/json_web_key.dart';
import '../repositories/jwk_repository.dart';

class ImportPrivateKeyUseCase {
  ImportPrivateKeyUseCase({
    required PrivateJwkRepository privateJwkRepository,
    required JwkRepository jwkRepository,
  })  : _privateJwkRepository = privateJwkRepository,
        _jwkRepository = jwkRepository;

  final PrivateJwkRepository _privateJwkRepository;
  final JwkRepository _jwkRepository;

  Future<Uint8List> call(Uint8List privateKeyBytes) async {
    final ed25519.PrivateKey privateKey =
        ed25519.newKeyFromSeed(privateKeyBytes);

    final Jwk jwk = Jwk.fromEd25519PrivateKey(
      privateKeyBytes: Uint8List.fromList(privateKey.bytes.sublist(0, 32)),
    );

    final Uint8List jwkKeyId = jwk.keyId;
    try {
      await _privateJwkRepository.store(jwk: jwk);

      await _jwkRepository.store(
        jwk: jwk,
        config: KeySourceConfig.fromSigningKey(jwkThumbprint: jwkKeyId),
      );

      return jwkKeyId;
    } catch (e) {
      await _privateJwkRepository.delete(keyId: jwkKeyId);
      throw StateError('Failed to import key pair: $e');
    }
  }
}

class ReadPrivateKeyUseCase {
  ReadPrivateKeyUseCase({required PrivateJwkRepository repository})
      : _repository = repository;
  final PrivateJwkRepository _repository;

  Future<Jwk> call({required Uint8List keyId}) async {
    final Jwk? jwk = await _repository.get(keyId: keyId);
    if (jwk == null) {
      throw StateError('Private key not found');
    }
    return jwk;
  }
}

class GeneratePrivateKeyUseCase {
  GeneratePrivateKeyUseCase({
    required EntropyRepository entropyRepository,
    required JwkRepository jwkRepository,
  })  : _entropyRepository = entropyRepository,
        _jwkRepository = jwkRepository;

  final EntropyRepository _entropyRepository;
  final JwkRepository _jwkRepository;

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

      final Uint8List privateKeyBytes =
          _derivePrivateKey(entropy, derivationPath.toBytes());

      final Jwk jwk =
          Jwk.fromEd25519PrivateKey(privateKeyBytes: privateKeyBytes);

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

  Uint8List _derivePrivateKey(Uint8List entropy, Uint8List derivationPath) {
    try {
      final String mnemonic = bip39.entropyToMnemonic(
        bytesToHex(entropy),
      );

      final String seed = bip39.mnemonicToSeedHex(mnemonic);
      final aptos.Keys keys = aptos.derivePath(
        AptosDerivationPath.fromBytes(derivationPath).toString(),
        seed,
      );

      if (keys.key == null) {
        throw StateError('Key derivation failed: null key generated');
      }

      if (keys.key!.isEmpty) {
        throw StateError('Key derivation failed: empty key generated');
      }

      return keys.key!;
    } catch (e) {
      throw StateError('Key derivation failed: $e');
    }
  }

  int _getNextAccountIndex(Iterable<int> existingIndexes) {
    if (existingIndexes.isEmpty) {
      return 0;
    }
    return existingIndexes.reduce(max) + 1;
  }
}
