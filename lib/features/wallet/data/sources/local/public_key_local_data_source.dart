import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../domain/entities/json_web_key.dart';
import '../../models/local/jwk_local_model.dart';

class JwkLocalDataSource {
  JwkLocalDataSource(this._box);
  final Box<JwkLocalModel> _box;

  int putJwk(Jwk jwk) {
    final JwkLocalModel key = JwkLocalModel.fromDomain(jwk);
    return _box.put(key);
  }

  JwkLocalModel? findPublicKeyById(int localId) => _box.get(localId);

  JwkLocalModel? findPublicKeyByKeyId({
    required Uint8List keyId,
  }) =>
      _box.query(JwkLocalModel_.keyId.equals(keyId)).build().findFirst();

  List<JwkLocalModel> findPublicKeysByType({
    required String keyType,
  }) =>
      _box.query(JwkLocalModel_.keyType.equals(keyType)).build().find();

  List<JwkLocalModel> findPublicKeysByCurve({
    required String curve,
  }) =>
      _box.query(JwkLocalModel_.curve.equals(curve)).build().find();

  JwkLocalModel? findKeyByTypeAndCurveAndCoordinates({
    required String keyType,
    required String curve,
    required Uint8List x,
    Uint8List? y,
  }) =>
      _box
          .query(
            y != null
                ? JwkLocalModel_.keyType
                    .equals(keyType)
                    .and(JwkLocalModel_.curve.equals(curve))
                    .and(JwkLocalModel_.x.equals(x))
                    .and(JwkLocalModel_.y.equals(y))
                : JwkLocalModel_.keyType
                    .equals(keyType)
                    .and(JwkLocalModel_.curve.equals(curve))
                    .and(JwkLocalModel_.x.equals(x)),
          )
          .build()
          .findFirst();

  List<JwkLocalModel> getAllKeys() => _box.getAll();

  bool removeKey(int localId) => _box.remove(localId);

  bool removeKeyByKeyId({
    required Uint8List keyId,
  }) {
    final JwkLocalModel? key = findPublicKeyByKeyId(keyId: keyId);
    if (key == null) {
      return false;
    }
    return removeKey(key.localId);
  }

  bool removeKeysByType({
    required String keyType,
  }) {
    final List<JwkLocalModel> keys = findPublicKeysByType(keyType: keyType);
    if (keys.isEmpty) {
      return false;
    }
    return _box.removeMany(
          keys.map((JwkLocalModel k) => k.localId).toList(),
        ) >
        0;
  }

  bool removeKeysByCurve({
    required String curve,
  }) {
    final List<JwkLocalModel> keys = findPublicKeysByCurve(curve: curve);
    if (keys.isEmpty) {
      return false;
    }
    return _box.removeMany(
          keys.map((JwkLocalModel k) => k.localId).toList(),
        ) >
        0;
  }

  int removeAllKeys() => _box.removeAll();

  int countKeys() => _box.count();
}

// // @freezed
// // sealed class StorePublicKeyParams with _$StorePublicKeyParams {
// //   const factory StorePublicKeyParams.fromHDKey({
// //     required Jwk publicKey,
// //     required Uint8List entropyHash,
// //     required Uint8List derivationPath,
// //   }) = HDKeyPublicKeyParams;

// //   const factory StorePublicKeyParams.fromPrivateKey({
// //     required Jwk publicKey,
// //     required Uint8List jwkThumbprint,
// //   }) = PrivateKeyPublicKeyParams;
// // }

// // class PublicKeyLocalDataSource {
// //   PublicKeyLocalDataSource(this._store);
// //   final Store _store;

// //   JwkLocalModel? _findPublicKeyByKId(Uint8List kId) => _store
// //       .box<JwkLocalModel>()
// //       .query(JwkLocalModel_.keyId.equals(kId))
// //       .build()
// //       .findFirst();

// //   HDKeyLocalModel? _findHDKeyByPublicKeyId(int publicKeyId) => _store
// //       .box<HDKeyLocalModel>()
// //       .query(HDKeyLocalModel_.publicKey.equals(publicKeyId))
// //       .build()
// //       .findFirst();

// //   SigningKeyLocalModel? _findSigningKeyByPublicKeyId(int publicKeyId) => _store
// //       .box<SigningKeyLocalModel>()
// //       .query(SigningKeyLocalModel_.publicKey.equals(publicKeyId))
// //       .build()
// //       .findFirst();

// //   // bool _hasHDKeyRelation(int publicKeyId) =>
// //   //     _findHDKeyByPublicKeyId(publicKeyId) != null;

// //   // bool _hasSigningKeyRelation(int publicKeyId) =>
// //   //     _findSigningKeyByPublicKeyId(publicKeyId) != null;

// //   int _storeHDKeyRelation(
// //     int publicKeyId,
// //     Uint8List entropyHash,
// //     Uint8List derivationPath,
// //   ) =>
// //       _store.box<HDKeyLocalModel>().put(
// //             HDKeyLocalModel.withRelation(
// //               localPublicKeyId: publicKeyId,
// //               entropyHash: entropyHash,
// //               derivationPath: derivationPath,
// //             ),
// //           );

// //   int _storeSigningKeyRelation(
// //     int publicKeyId,
// //     Uint8List jwkThumbprint,
// //   ) =>
// //       _store.box<SigningKeyLocalModel>().put(
// //             SigningKeyLocalModel.withRelation(
// //               localPublicKeyId: publicKeyId,
// //               jwkThumbprint: jwkThumbprint,
// //             ),
// //           );

// //   void _deleteKeyRelations(int publicKeyId) {
// //     final HDKeyLocalModel? hdPublicKey = _findHDKeyByPublicKeyId(publicKeyId);
// //     if (hdPublicKey != null) {
// //       _store.box<HDKeyLocalModel>().remove(hdPublicKey.localId);
// //     }

// //     final SigningKeyLocalModel? signingKey =
// //         _findSigningKeyByPublicKeyId(publicKeyId);
// //     if (signingKey != null) {
// //       _store.box<SigningKeyLocalModel>().remove(signingKey.localId);
// //     }
// //   }

// //   int _storePublicKeyWithHDRelation(
// //     Jwk publicKey,
// //     Uint8List entropyHash,
// //     Uint8List derivationPath,
// //   ) {
// //     final JwkLocalModel newPublicKey =
// //         JwkLocalModel.fromJwk(publicKey);
// //     final JwkLocalModel? existingKey =
// //         _findPublicKeyByKId(newPublicKey.keyId);

// //     if (existingKey != null) {
// //       final HDKeyLocalModel? existingHdPublicKeyRelation =
// //           _findHDKeyByPublicKeyId(existingKey.localId);
// //       if (existingHdPublicKeyRelation != null) {
// //         if (existingHdPublicKeyRelation.derivationPath == derivationPath ||
// //             existingHdPublicKeyRelation.entropyHash == entropyHash) {
// //           return existingKey.localId;
// //         }
// //         throw StateError('Public key already has an HDKey relation');
// //       }
// //       _storeHDKeyRelation(existingKey.localId, entropyHash, derivationPath);
// //       return existingKey.localId;
// //     }

// //     final int publicKeyId = _box.put(newPublicKey);
// //     _storeHDKeyRelation(publicKeyId, entropyHash, derivationPath);
// //     return publicKeyId;
// //   }

// //   int _storePublicKeyWithSigningRelation(
// //     Jwk publicKey,
// //     Uint8List jwkThumbprint,
// //   ) {
// //     final JwkLocalModel newPublicKey =
// //         JwkLocalModel.fromJwk(publicKey);
// //     final JwkLocalModel? existingKey =
// //         _findPublicKeyByKId(newPublicKey.keyId);

// //     if (existingKey != null) {
// //       final SigningKeyLocalModel? existingSigningKeyRelation =
// //           _findSigningKeyByPublicKeyId(existingKey.localId);
// //       if (existingSigningKeyRelation != null) {
// //         if (existingSigningKeyRelation.jwkThumbprint == jwkThumbprint) {
// //           return existingKey.localId;
// //         }
// //         throw StateError('Public key already has a SigningKey relation');
// //       }
// //       _storeSigningKeyRelation(existingKey.localId, jwkThumbprint);
// //       return existingKey.localId;
// //     }

// //     final int publicKeyId = _box.put(newPublicKey);
// //     _storeSigningKeyRelation(publicKeyId, jwkThumbprint);
// //     return publicKeyId;
// //   }

// //   JwkLocalModel? findPublicKeyByKId(Uint8List kId) =>
// //       _findPublicKeyByKId(kId);

// //   HDKeyLocalModel? findHDKeyByKId(Uint8List kId) {
// //     final JwkLocalModel? publicKey = _findPublicKeyByKId(kId);
// //     return publicKey != null
// //         ? _findHDKeyByPublicKeyId(publicKey.localId)
// //         : null;
// //   }

// //   SigningKeyLocalModel? findSigningKeyByKId(Uint8List kId) {
// //     final JwkLocalModel? publicKey = _findPublicKeyByKId(kId);
// //     return publicKey != null
// //         ? _findSigningKeyByPublicKeyId(publicKey.localId)
// //         : null;
// //   }

// //   bool hasPublicKeyWithKId(Uint8List kId) => _findPublicKeyByKId(kId) != null;

// //   int storePublicKeyWithRelation(StorePublicKeyParams params) =>
// //       _store.runInTransaction(TxMode.write, () {
// //         switch (params) {
// //           case HDKeyPublicKeyParams(
// //               :final Jwk publicKey,
// //               :final Uint8List entropyHash,
// //               :final Uint8List derivationPath
// //             ):
// //             return _storePublicKeyWithHDRelation(
// //               publicKey,
// //               entropyHash,
// //               derivationPath,
// //             );

// //           case PrivateKeyPublicKeyParams(
// //               :final Jwk publicKey,
// //               :final Uint8List jwkThumbprint
// //             ):
// //             return _storePublicKeyWithSigningRelation(publicKey, jwkThumbprint);
// //         }
// //       });

// //   List<Uint8List> getAllPublicKeyKIds() => _store
// //       .box<JwkLocalModel>()
// //       .getAll()
// //       .map((JwkLocalModel key) => key.keyId)
// //       .toList();

// //   int getPublicKeyCount() => _box.count();

// //   void deletePublicKeyAndRelationsByKId(Uint8List kId) =>
// //       _store.runInTransaction(TxMode.write, () {
// //         final JwkLocalModel? publicKey = _findPublicKeyByKId(kId);
// //         if (publicKey != null) {
// //           _deleteKeyRelations(publicKey.localId);
// //           _box.remove(publicKey.localId);
// //         }
// //       });

// //   List<int> findAccountIndexesByEntropyHash(Uint8List entropyHash) {
// //     final List<HDKeyLocalModel> hdPublicKeys = _store
// //         .box<HDKeyLocalModel>()
// //         .query(HDKeyLocalModel_.entropyHash.equals(entropyHash))
// //         .build()
// //         .find();

// //     return hdPublicKeys
// //         .map(
// //           (HDKeyLocalModel key) =>
// //               AptosDerivationPath.getAccountIndex(key.derivationPath),
// //         )
// //         .toList()
// //       ..sort();
// //   }

// //   int getNextAvailableIndex(Uint8List entropyHash) {
// //     final List<int> existingIndexes =
// //         findAccountIndexesByEntropyHash(entropyHash);
// //     if (existingIndexes.isEmpty) {
// //       return 0;
// //     }

// //     int expectedIndex = 0;
// //     for (final int index in existingIndexes) {
// //       if (index != expectedIndex) {
// //         return expectedIndex;
// //       }
// //       expectedIndex++;
// //     }
// //     return expectedIndex;
// //   }
// // }
