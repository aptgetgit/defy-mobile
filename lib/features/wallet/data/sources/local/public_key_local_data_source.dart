import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../domain/entities/json_web_key.dart';
import '../../models/local/jwk_local_model.dart';

class JwkLocalDataSource {
  JwkLocalDataSource(this._box);
  final Box<JwkLocalModel> _box;

  JwkLocalModel putJwk(Jwk jwk) {
    final JwkLocalModel key = JwkLocalModel.fromDomain(jwk);
    _box.put(key);
    return key;
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
