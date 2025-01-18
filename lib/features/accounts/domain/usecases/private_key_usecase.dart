import 'dart:typed_data';

import 'package:aptos_dart/aptos.dart' as aptos;
import 'package:aptos_dart/hex_string.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed25519;
import 'package:jwk/jwk.dart';

import '../../data/repositories/entropy_repository_implementation.dart';
import '../../data/repositories/private_key_repository_implementation.dart';
import '../../data/repositories/public_key_repository_implementation.dart';
import '../../data/sources/local/public_key_local_data_source.dart';
import '../entities/aptos_derivation_path.dart';

class ImportPrivateKeyUseCase {
  ImportPrivateKeyUseCase(
    this._privateKeyRepository,
    this._publicKeyRepository,
  );

  final PrivateKeyRepository _privateKeyRepository;
  final PublicKeyRepository _publicKeyRepository;

  Future<Uint8List> call(Uint8List privateKeyBytes) async {
    final ed25519.PrivateKey privateKey =
        ed25519.newKeyFromSeed(privateKeyBytes);
    final Jwk jwk = _privateKeyRepository.createJwk(privateKeyBytes);
    final Uint8List thumbprint = _privateKeyRepository.computeThumbprint(jwk);

    if (await _privateKeyRepository.hasPrivateKey(thumbprint)) {
      throw StateError('Private Key already imported');
    }

    try {
      await _privateKeyRepository.storePrivateKey(
        Uint8List.fromList(privateKey.bytes),
      );

      _publicKeyRepository.storePublicKeyWithRelation(
        StorePublicKeyParams.fromPrivateKey(
          publicKey: jwk,
          jwkThumbprint: thumbprint,
        ),
      );

      return thumbprint;
    } catch (e) {
      await _privateKeyRepository.deletePrivateKey(thumbprint);
      throw StateError('Failed to import key pair: $e');
    }
  }
}

// class RemovePrivateKeyUseCase {
//   RemovePrivateKeyUseCase(
//     this._privateKeyRepository,
//     this._publicKeyRepository,
//   );

//   final PrivateKeyRepository _privateKeyRepository;
//   final PublicKeyRepository _publicKeyRepository;

//   Future<void> call({required Uint8List thumbprint}) async {
//     if (!await _privateKeyRepository.hasPrivateKey(thumbprint)) {
//       throw StateError('Private key not found');
//     }

//     await _privateKeyRepository.deletePrivateKey(thumbprint);
//     _publicKeyRepository.deletePublicKeyByKId(thumbprint);
//   }
// }

class ReadPrivateKeyUseCase {
  ReadPrivateKeyUseCase(this._repository);
  final PrivateKeyRepository _repository;

  Future<String> call({required Uint8List thumbprint}) async {
    final Uint8List? privateKeyBytes =
        await _repository.getPrivateKey(thumbprint);
    if (privateKeyBytes == null) {
      throw StateError('Private key not found');
    }
    return HexString.fromUint8Array(privateKeyBytes.sublist(0, 32)).toString();
  }
}

class GeneratePrivateKeyUseCase {
  GeneratePrivateKeyUseCase(
    this._entropyRepository,
    this._privateKeyRepository,
    this._publicKeyRepository,
  );

  final EntropyRepository _entropyRepository;
  final PrivateKeyRepository _privateKeyRepository;
  final PublicKeyRepository _publicKeyRepository;

  Future<Uint8List> call({
    required Uint8List entropyHash,
    int? accountIndex,
  }) async {
    final Uint8List? entropy = await _entropyRepository.getEntropy(entropyHash);
    if (entropy == null) {
      throw StateError('Entropy not found');
    }

    try {
      if (accountIndex != null) {
        if (accountIndex < 0) {
          throw ArgumentError('Account index must be non-negative');
        }

        final List<int> existingIndexes =
            _publicKeyRepository.findAccountIndexesByEntropyHash(entropyHash);
        if (existingIndexes.contains(accountIndex)) {
          throw StateError(
            'Private key already exists for account index: $accountIndex',
          );
        }
      } else {
        accountIndex = _publicKeyRepository.getNextAvailableIndex(entropyHash);
      }

      final Uint8List derivationPath = AptosDerivationPath.encode(accountIndex);
      final Uint8List privateKeyBytes =
          _derivePrivateKey(entropy, derivationPath);
      final ed25519.PrivateKey privateKey =
          ed25519.newKeyFromSeed(privateKeyBytes);
      final Jwk jwk = _privateKeyRepository.createJwk(
        Uint8List.fromList(privateKey.bytes),
      );
      final Uint8List thumbprint = _privateKeyRepository.computeThumbprint(jwk);

      _publicKeyRepository.storePublicKeyWithRelation(
        StorePublicKeyParams.fromHDKey(
          publicKey: jwk,
          entropyHash: entropyHash,
          derivationPath: derivationPath,
        ),
      );

      return thumbprint;
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
        HexString.fromUint8Array(entropy).noPrefix(),
      );

      final String seed = bip39.mnemonicToSeedHex(mnemonic);
      final aptos.Keys keys = aptos.derivePath(
        AptosDerivationPath.formatPath(derivationPath),
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
}
