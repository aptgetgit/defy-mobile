import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../models/local/hd_key_local_model.dart';

class HDKeyLocalDataSource {
  HDKeyLocalDataSource(this._box);
  final Box<HDKeyLocalModel> _box;

  int putHDKey({
    required Uint8List jwkKeyId,
    required Uint8List entropyHash,
    required Uint8List derivationPath,
  }) {
    final HDKeyLocalModel key = HDKeyLocalModel(
      jwkKeyId: jwkKeyId,
      entropyHash: entropyHash,
      derivationPath: derivationPath,
    );
    return _box.put(key);
  }

  HDKeyLocalModel? findHDKeyById(int localId) => _box.get(localId);

  HDKeyLocalModel? findHDKeyByJwkKeyId({
    required Uint8List jwkKeyId,
  }) =>
      _box
          .query(HDKeyLocalModel_.jwkKeyId.equals(jwkKeyId))
          .build()
          .findFirst();

  List<HDKeyLocalModel> findHDKeysByEntropyHash({
    required Uint8List entropyHash,
  }) =>
      _box
          .query(HDKeyLocalModel_.entropyHash.equals(entropyHash))
          .build()
          .find();

  List<HDKeyLocalModel> findHDKeysByDerivationPath({
    required Uint8List derivationPath,
  }) =>
      _box
          .query(HDKeyLocalModel_.derivationPath.equals(derivationPath))
          .build()
          .find();

  List<HDKeyLocalModel>? findKeyByDerivationPathAndEntropyHash({
    required Uint8List derivationPath,
    required Uint8List entropyHash,
  }) =>
      _box
          .query(
            HDKeyLocalModel_.derivationPath
                .equals(derivationPath)
                .and(HDKeyLocalModel_.entropyHash.equals(entropyHash)),
          )
          .build()
          .find();

  List<HDKeyLocalModel> getAllKeys() => _box.getAll();

  bool removeKey(int localId) => _box.remove(localId);

  bool removeKeyByJwkKeyId({
    required Uint8List jwkKeyId,
  }) {
    final HDKeyLocalModel? key = findHDKeyByJwkKeyId(jwkKeyId: jwkKeyId);
    if (key == null) {
      return false;
    }
    return removeKey(key.localId);
  }

  bool removeKeysByEntropyHash({
    required Uint8List entropyHash,
  }) {
    final List<HDKeyLocalModel> keys =
        findHDKeysByEntropyHash(entropyHash: entropyHash);
    if (keys.isEmpty) {
      return false;
    }
    return _box
            .removeMany(keys.map((HDKeyLocalModel k) => k.localId).toList()) >
        0;
  }

  bool removeKeysByDerivationPath({
    required Uint8List derivationPath,
  }) {
    final List<HDKeyLocalModel> keys =
        findHDKeysByDerivationPath(derivationPath: derivationPath);
    if (keys.isEmpty) {
      return false;
    }
    return _box
            .removeMany(keys.map((HDKeyLocalModel k) => k.localId).toList()) >
        0;
  }

  int removeAllKeys() => _box.removeAll();

  int countKeys() => _box.count();
}
