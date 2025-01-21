import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../models/local/signing_key_local_model.dart';

class SigningKeyLocalDataSource {
  SigningKeyLocalDataSource(this._box);
  final Box<SigningKeyLocalModel> _box;

  int putSigningKey({
    required Uint8List jwkKeyId,
    required Uint8List jwkThumbprint,
  }) {
    final SigningKeyLocalModel key = SigningKeyLocalModel(
      jwkKeyId: jwkKeyId,
      jwkThumbprint: jwkThumbprint,
    );
    return _box.put(key);
  }

  SigningKeyLocalModel? findKeyById(int localId) => _box.get(localId);

  SigningKeyLocalModel? findKeyByJwkKeyId({
    required Uint8List jwkKeyId,
  }) =>
      _box
          .query(SigningKeyLocalModel_.jwkKeyId.equals(jwkKeyId))
          .build()
          .findFirst();

  SigningKeyLocalModel? findKeyByJwkThumbprint({
    required Uint8List jwkThumbprint,
  }) =>
      _box
          .query(SigningKeyLocalModel_.jwkThumbprint.equals(jwkThumbprint))
          .build()
          .findFirst();

  List<SigningKeyLocalModel> getAllKeys() => _box.getAll();

  bool removeKey(int localId) => _box.remove(localId);

  bool removeKeyByJwkKeyId({
    required Uint8List jwkKeyId,
  }) {
    final SigningKeyLocalModel? key = findKeyByJwkKeyId(jwkKeyId: jwkKeyId);
    if (key == null) {
      return false;
    }
    return removeKey(key.localId);
  }

  bool removeKeyByJwkThumbprint({
    required Uint8List jwkThumbprint,
  }) {
    final SigningKeyLocalModel? key =
        findKeyByJwkThumbprint(jwkThumbprint: jwkThumbprint);
    if (key == null) {
      return false;
    }
    return removeKey(key.localId);
  }

  int removeAllKeys() => _box.removeAll();

  int countKeys() => _box.count();
}
