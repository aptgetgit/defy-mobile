import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../models/local/auth_key_config_local_model.dart';

class Ed25519AuthKeyConfigLocalDataSource {
  Ed25519AuthKeyConfigLocalDataSource(this._box);
  final Box<Ed25519AuthKeyConfigLocalModel> _box;

  int putEd25519AuthKeyConfig({
    required Uint8List authenticationKey,
    required Uint8List jwkKeyId,
  }) {
    final Ed25519AuthKeyConfigLocalModel config =
        Ed25519AuthKeyConfigLocalModel(
      authenticationKey: authenticationKey,
      jwkKeyId: jwkKeyId,
    );
    return _box.put(config);
  }

  Ed25519AuthKeyConfigLocalModel? findEd25519AuthKeyConfigById(int localId) =>
      _box.get(localId);

  Ed25519AuthKeyConfigLocalModel? findEd25519AuthKeyConfigByAuthenticationKey({
    required Uint8List authenticationKey,
  }) =>
      _box
          .query(
            Ed25519AuthKeyConfigLocalModel_.authenticationKey
                .equals(authenticationKey),
          )
          .build()
          .findFirst();

  Ed25519AuthKeyConfigLocalModel? findEd25519AuthKeyConfigByJwkKeyId({
    required Uint8List jwkKeyId,
  }) =>
      _box
          .query(
            Ed25519AuthKeyConfigLocalModel_.jwkKeyId.equals(jwkKeyId),
          )
          .build()
          .findFirst();

  List<Ed25519AuthKeyConfigLocalModel> getAllEd25519AuthKeyConfigs() =>
      _box.getAll();

  bool removeEd25519AuthKeyConfig(int localId) => _box.remove(localId);

  int removeEd25519AuthKeyConfigs(List<int> localIds) =>
      _box.removeMany(localIds);

  bool removeEd25519AuthKeyConfigByAuthenticationKey({
    required Uint8List authenticationKey,
  }) {
    final Ed25519AuthKeyConfigLocalModel? config =
        findEd25519AuthKeyConfigByAuthenticationKey(
      authenticationKey: authenticationKey,
    );
    if (config == null) {
      return false;
    }
    return removeEd25519AuthKeyConfig(config.localId);
  }

  bool removeEd25519AuthKeyConfigByJwkKeyId({
    required Uint8List jwkKeyId,
  }) {
    final Ed25519AuthKeyConfigLocalModel? config =
        findEd25519AuthKeyConfigByJwkKeyId(jwkKeyId: jwkKeyId);
    if (config == null) {
      return false;
    }
    return removeEd25519AuthKeyConfig(config.localId);
  }

  int removeAllEd25519AuthKeyConfigs() => _box.removeAll();

  int countEd25519AuthKeyConfigs() => _box.count();
}
