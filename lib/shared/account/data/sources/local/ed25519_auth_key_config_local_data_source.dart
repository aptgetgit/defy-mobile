import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../models/local/ed25519_auth_key_config_local_model.dart';

class Ed25519AuthKeyConfigLocalDataSource {
  Ed25519AuthKeyConfigLocalDataSource({
    required Box<Ed25519AuthKeyConfigLocalModel> box,
  }) : _box = box;
  final Box<Ed25519AuthKeyConfigLocalModel> _box;

  int store({
    required Uint8List authenticationKey,
    required Uint8List keyId,
  }) {
    if (getByAuthKey(authenticationKey: authenticationKey) != null) {
      throw StateError('Authentication key already exists');
    }

    if (getByKeyId(keyId: keyId) != null) {
      throw StateError('JWK Key ID already exists');
    }

    final Ed25519AuthKeyConfigLocalModel model = Ed25519AuthKeyConfigLocalModel(
      authenticationKey: authenticationKey,
      jwkKeyId: keyId,
    );
    return _box.put(model);
  }

  Ed25519AuthKeyConfigLocalModel? get({required int localId}) =>
      _box.get(localId);

  Ed25519AuthKeyConfigLocalModel? getByAuthKey({
    required Uint8List authenticationKey,
  }) =>
      _box
          .query(
            Ed25519AuthKeyConfigLocalModel_.authenticationKey
                .equals(authenticationKey),
          )
          .build()
          .findFirst();

  Ed25519AuthKeyConfigLocalModel? getByKeyId({
    required Uint8List keyId,
  }) =>
      _box
          .query(
            Ed25519AuthKeyConfigLocalModel_.jwkKeyId.equals(keyId),
          )
          .build()
          .findFirst();

  List<Ed25519AuthKeyConfigLocalModel> getAll() => _box.getAll();

  bool delete({required int localId}) => _box.remove(localId);

  int deleteMany({required List<int> localIds}) => _box.removeMany(localIds);

  bool deleteByAuthKey({required Uint8List authenticationKey}) {
    final Ed25519AuthKeyConfigLocalModel? config =
        getByAuthKey(authenticationKey: authenticationKey);
    return config != null && delete(localId: config.localId);
  }

  bool deleteByKeyId({required Uint8List keyId}) {
    final Ed25519AuthKeyConfigLocalModel? config = getByKeyId(keyId: keyId);
    return config != null && delete(localId: config.localId);
  }

  int clear() => _box.removeAll();

  int count() => _box.count();
}
