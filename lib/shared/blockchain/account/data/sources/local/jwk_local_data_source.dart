import 'dart:typed_data';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../domain/entities/json_web_key.dart';
import '../../models/local/jwk_local_model.dart';

class JwkDataSource {
  JwkDataSource({required Box<JwkLocalModel> box}) : _box = box;
  final Box<JwkLocalModel> _box;

  JwkLocalModel store({required Jwk jwk}) {
    if (getByKeyId(keyId: jwk.keyId) != null) {
      throw StateError('Key ID already exists');
    }

    final Uint8List publicKeyBytes = jwk.getPublicKeyBytes();

    if (getByProperties(
          keyType: jwk.keyType.value,
          curve: jwk.curve.value,
          x: switch (jwk) {
            Ed25519Jwk() => publicKeyBytes,
            Secp256k1Jwk() || Secp256r1Jwk() => publicKeyBytes.sublist(0, 32),
          },
          y: switch (jwk) {
            Ed25519Jwk() => null,
            Secp256k1Jwk() || Secp256r1Jwk() => publicKeyBytes.sublist(32, 64),
          },
        ) !=
        null) {
      throw StateError('JWK with same properties already exists');
    }

    final JwkLocalModel model = JwkLocalModel.fromDomain(jwk);
    _box.put(model);
    return model;
  }

  JwkLocalModel? get({required int localId}) => _box.get(localId);

  JwkLocalModel? getByKeyId({required Uint8List keyId}) =>
      _box.query(JwkLocalModel_.keyId.equals(keyId)).build().findFirst();

  List<JwkLocalModel> getByType({required String keyType}) =>
      _box.query(JwkLocalModel_.keyType.equals(keyType)).build().find();

  List<JwkLocalModel> getByCurve({required String curve}) =>
      _box.query(JwkLocalModel_.curve.equals(curve)).build().find();

  JwkLocalModel? getByProperties({
    required String keyType,
    required String curve,
    required Uint8List x,
    Uint8List? y,
  }) {
    final Condition<JwkLocalModel> query = y != null
        ? JwkLocalModel_.keyType
            .equals(keyType)
            .and(JwkLocalModel_.curve.equals(curve))
            .and(JwkLocalModel_.x.equals(x))
            .and(JwkLocalModel_.y.equals(y))
        : JwkLocalModel_.keyType
            .equals(keyType)
            .and(JwkLocalModel_.curve.equals(curve))
            .and(JwkLocalModel_.x.equals(x));

    return _box.query(query).build().findFirst();
  }

  List<JwkLocalModel> getAll() => _box.getAll();

  bool delete({required int localId}) => _box.remove(localId);

  bool deleteByKeyId({required Uint8List keyId}) {
    final JwkLocalModel? key = getByKeyId(keyId: keyId);
    return key != null && delete(localId: key.localId);
  }

  bool deleteByType({required String keyType}) {
    final List<JwkLocalModel> keys = getByType(keyType: keyType);
    return keys.isNotEmpty &&
        _box.removeMany(keys.map((JwkLocalModel k) => k.localId).toList()) > 0;
  }

  bool deleteByCurve({required String curve}) {
    final List<JwkLocalModel> keys = getByCurve(curve: curve);
    return keys.isNotEmpty &&
        _box.removeMany(keys.map((JwkLocalModel k) => k.localId).toList()) > 0;
  }

  int clear() => _box.removeAll();

  int count() => _box.count();
}
