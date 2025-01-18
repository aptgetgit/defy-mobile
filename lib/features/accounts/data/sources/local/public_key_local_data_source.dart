import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwk/jwk.dart';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../domain/entities/aptos_derivation_path.dart';
import '../../models/local/hd_key_local_model.dart';
import '../../models/local/public_key_local_model.dart';
import '../../models/local/signing_key_local_model.dart';

part 'generated/public_key_local_data_source.freezed.dart';

@freezed
sealed class StorePublicKeyParams with _$StorePublicKeyParams {
  const factory StorePublicKeyParams.fromHDKey({
    required Jwk publicKey,
    required Uint8List entropyHash,
    required Uint8List derivationPath,
  }) = HDKeyPublicKeyParams;

  const factory StorePublicKeyParams.fromPrivateKey({
    required Jwk publicKey,
    required Uint8List jwkThumbprint,
  }) = PrivateKeyPublicKeyParams;
}

class PublicKeyLocalDataSource {
  PublicKeyLocalDataSource(this._store);
  final Store _store;

  PublicKeyLocalModel? _findPublicKeyByKId(Uint8List kId) => _store
      .box<PublicKeyLocalModel>()
      .query(PublicKeyLocalModel_.keyId.equals(kId))
      .build()
      .findFirst();

  HDKeyLocalModel? _findHDKeyByPublicKeyId(int publicKeyId) => _store
      .box<HDKeyLocalModel>()
      .query(HDKeyLocalModel_.publicKey.equals(publicKeyId))
      .build()
      .findFirst();

  SigningKeyLocalModel? _findSigningKeyByPublicKeyId(int publicKeyId) => _store
      .box<SigningKeyLocalModel>()
      .query(SigningKeyLocalModel_.publicKey.equals(publicKeyId))
      .build()
      .findFirst();

  // bool _hasHDKeyRelation(int publicKeyId) =>
  //     _findHDKeyByPublicKeyId(publicKeyId) != null;

  // bool _hasSigningKeyRelation(int publicKeyId) =>
  //     _findSigningKeyByPublicKeyId(publicKeyId) != null;

  int _storeHDKeyRelation(
    int publicKeyId,
    Uint8List entropyHash,
    Uint8List derivationPath,
  ) =>
      _store.box<HDKeyLocalModel>().put(
            HDKeyLocalModel.withRelation(
              localPublicKeyId: publicKeyId,
              entropyHash: entropyHash,
              derivationPath: derivationPath,
            ),
          );

  int _storeSigningKeyRelation(
    int publicKeyId,
    Uint8List jwkThumbprint,
  ) =>
      _store.box<SigningKeyLocalModel>().put(
            SigningKeyLocalModel.withRelation(
              localPublicKeyId: publicKeyId,
              jwkThumbprint: jwkThumbprint,
            ),
          );

  void _deleteKeyRelations(int publicKeyId) {
    final HDKeyLocalModel? hdKey = _findHDKeyByPublicKeyId(publicKeyId);
    if (hdKey != null) {
      _store.box<HDKeyLocalModel>().remove(hdKey.localId);
    }

    final SigningKeyLocalModel? signingKey =
        _findSigningKeyByPublicKeyId(publicKeyId);
    if (signingKey != null) {
      _store.box<SigningKeyLocalModel>().remove(signingKey.localId);
    }
  }

  int _storePublicKeyWithHDRelation(
    Jwk publicKey,
    Uint8List entropyHash,
    Uint8List derivationPath,
  ) {
    final PublicKeyLocalModel newPublicKey =
        PublicKeyLocalModel.fromJwk(publicKey);
    final PublicKeyLocalModel? existingKey =
        _findPublicKeyByKId(newPublicKey.keyId);

    if (existingKey != null) {
      final HDKeyLocalModel? existingHdKeyRelation =
          _findHDKeyByPublicKeyId(existingKey.localId);
      if (existingHdKeyRelation != null) {
        if (existingHdKeyRelation.derivationPath == derivationPath ||
            existingHdKeyRelation.entropyHash == entropyHash) {
          return existingKey.localId;
        }
        throw StateError('Public key already has an HDKey relation');
      }
      _storeHDKeyRelation(existingKey.localId, entropyHash, derivationPath);
      return existingKey.localId;
    }

    final int publicKeyId = _store.box<PublicKeyLocalModel>().put(newPublicKey);
    _storeHDKeyRelation(publicKeyId, entropyHash, derivationPath);
    return publicKeyId;
  }

  int _storePublicKeyWithSigningRelation(
    Jwk publicKey,
    Uint8List jwkThumbprint,
  ) {
    final PublicKeyLocalModel newPublicKey =
        PublicKeyLocalModel.fromJwk(publicKey);
    final PublicKeyLocalModel? existingKey =
        _findPublicKeyByKId(newPublicKey.keyId);

    if (existingKey != null) {
      final SigningKeyLocalModel? existingSigningKeyRelation =
          _findSigningKeyByPublicKeyId(existingKey.localId);
      if (existingSigningKeyRelation != null) {
        if (existingSigningKeyRelation.jwkThumbprint == jwkThumbprint) {
          return existingKey.localId;
        }
        throw StateError('Public key already has a SigningKey relation');
      }
      _storeSigningKeyRelation(existingKey.localId, jwkThumbprint);
      return existingKey.localId;
    }

    final int publicKeyId = _store.box<PublicKeyLocalModel>().put(newPublicKey);
    _storeSigningKeyRelation(publicKeyId, jwkThumbprint);
    return publicKeyId;
  }

  PublicKeyLocalModel? findPublicKeyByKId(Uint8List kId) =>
      _findPublicKeyByKId(kId);

  HDKeyLocalModel? findHDKeyByKId(Uint8List kId) {
    final PublicKeyLocalModel? publicKey = _findPublicKeyByKId(kId);
    return publicKey != null
        ? _findHDKeyByPublicKeyId(publicKey.localId)
        : null;
  }

  SigningKeyLocalModel? findSigningKeyByKId(Uint8List kId) {
    final PublicKeyLocalModel? publicKey = _findPublicKeyByKId(kId);
    return publicKey != null
        ? _findSigningKeyByPublicKeyId(publicKey.localId)
        : null;
  }

  bool hasPublicKeyWithKId(Uint8List kId) => _findPublicKeyByKId(kId) != null;

  int storePublicKeyWithRelation(StorePublicKeyParams params) =>
      _store.runInTransaction(TxMode.write, () {
        switch (params) {
          case HDKeyPublicKeyParams(
              :final Jwk publicKey,
              :final Uint8List entropyHash,
              :final Uint8List derivationPath
            ):
            return _storePublicKeyWithHDRelation(
              publicKey,
              entropyHash,
              derivationPath,
            );

          case PrivateKeyPublicKeyParams(
              :final Jwk publicKey,
              :final Uint8List jwkThumbprint
            ):
            return _storePublicKeyWithSigningRelation(publicKey, jwkThumbprint);
        }
      });

  List<Uint8List> getAllPublicKeyKIds() => _store
      .box<PublicKeyLocalModel>()
      .getAll()
      .map((PublicKeyLocalModel key) => key.keyId)
      .toList();

  int getPublicKeyCount() => _store.box<PublicKeyLocalModel>().count();

  void deletePublicKeyAndRelationsByKId(Uint8List kId) =>
      _store.runInTransaction(TxMode.write, () {
        final PublicKeyLocalModel? publicKey = _findPublicKeyByKId(kId);
        if (publicKey != null) {
          _deleteKeyRelations(publicKey.localId);
          _store.box<PublicKeyLocalModel>().remove(publicKey.localId);
        }
      });

  List<int> findAccountIndexesByEntropyHash(Uint8List entropyHash) {
    final List<HDKeyLocalModel> hdKeys = _store
        .box<HDKeyLocalModel>()
        .query(HDKeyLocalModel_.entropyHash.equals(entropyHash))
        .build()
        .find();

    return hdKeys
        .map(
          (HDKeyLocalModel key) =>
              AptosDerivationPath.getAccountIndex(key.derivationPath),
        )
        .toList()
      ..sort();
  }

  int getNextAvailableIndex(Uint8List entropyHash) {
    final List<int> existingIndexes =
        findAccountIndexesByEntropyHash(entropyHash);
    if (existingIndexes.isEmpty) {
      return 0;
    }

    int expectedIndex = 0;
    for (final int index in existingIndexes) {
      if (index != expectedIndex) {
        return expectedIndex;
      }
      expectedIndex++;
    }
    return expectedIndex;
  }
}
