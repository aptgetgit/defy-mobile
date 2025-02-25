import 'dart:typed_data';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../models/local/hd_key_local_model.dart';

class HDKeyDataSource {
  HDKeyDataSource({required Box<HDKeyLocalModel> box}) : _box = box;
  final Box<HDKeyLocalModel> _box;

  int store({
    required Uint8List keyId,
    required Uint8List entropyHash,
    required Uint8List derivationPath,
  }) {
    if (getByKeyId(keyId: keyId) != null) {
      throw StateError('Key ID already exists');
    }

    final HDKeyLocalModel model = HDKeyLocalModel(
      jwkKeyId: keyId,
      entropyHash: entropyHash,
      derivationPath: derivationPath,
    );
    return _box.put(model);
  }

  HDKeyLocalModel? get({required int localId}) => _box.get(localId);

  HDKeyLocalModel? getByKeyId({required Uint8List keyId}) =>
      _box.query(HDKeyLocalModel_.jwkKeyId.equals(keyId)).build().findFirst();

  List<HDKeyLocalModel> getByEntropy({required Uint8List entropyHash}) => _box
      .query(HDKeyLocalModel_.entropyHash.equals(entropyHash))
      .build()
      .find();

  List<HDKeyLocalModel> getByPath({required Uint8List derivationPath}) => _box
      .query(HDKeyLocalModel_.derivationPath.equals(derivationPath))
      .build()
      .find();

  List<HDKeyLocalModel>? getByPathAndEntropy({
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

  List<HDKeyLocalModel> getAll() => _box.getAll();

  bool delete({required int localId}) => _box.remove(localId);

  bool deleteByKeyId({required Uint8List keyId}) {
    final HDKeyLocalModel? key = getByKeyId(keyId: keyId);
    return key != null && delete(localId: key.localId);
  }

  bool deleteByEntropy({required Uint8List entropyHash}) {
    final List<HDKeyLocalModel> keys = getByEntropy(entropyHash: entropyHash);
    return keys.isNotEmpty &&
        _box.removeMany(keys.map((HDKeyLocalModel k) => k.localId).toList()) >
            0;
  }

  bool deleteByPath({required Uint8List derivationPath}) {
    final List<HDKeyLocalModel> keys =
        getByPath(derivationPath: derivationPath);
    return keys.isNotEmpty &&
        _box.removeMany(keys.map((HDKeyLocalModel k) => k.localId).toList()) >
            0;
  }

  int clear() => _box.removeAll();

  int count() => _box.count();
}
