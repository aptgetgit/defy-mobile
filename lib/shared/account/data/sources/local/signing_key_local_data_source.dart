import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../models/local/signing_key_local_model.dart';

class SigningKeyDataSource {
  SigningKeyDataSource({required Box<SigningKeyLocalModel> box}) : _box = box;
  final Box<SigningKeyLocalModel> _box;

  int store({
    required Uint8List keyId,
    required Uint8List jwkThumbprint,
  }) {
    if (getByKeyId(keyId: keyId) != null) {
      throw StateError('Key ID already exists');
    }
    if (getByThumbprint(jwkThumbprint: jwkThumbprint) != null) {
      throw StateError('Thumbprint already exists');
    }

    final SigningKeyLocalModel model = SigningKeyLocalModel(
      jwkKeyId: keyId,
      jwkThumbprint: jwkThumbprint,
    );
    return _box.put(model);
  }

  SigningKeyLocalModel? get({required int localId}) => _box.get(localId);

  SigningKeyLocalModel? getByKeyId({required Uint8List keyId}) => _box
      .query(SigningKeyLocalModel_.jwkKeyId.equals(keyId))
      .build()
      .findFirst();

  SigningKeyLocalModel? getByThumbprint({required Uint8List jwkThumbprint}) =>
      _box
          .query(SigningKeyLocalModel_.jwkThumbprint.equals(jwkThumbprint))
          .build()
          .findFirst();

  List<SigningKeyLocalModel> getAll() => _box.getAll();

  bool delete({required int localId}) => _box.remove(localId);

  bool deleteByKeyId({required Uint8List keyId}) {
    final SigningKeyLocalModel? key = getByKeyId(keyId: keyId);
    return key != null && delete(localId: key.localId);
  }

  bool deleteByThumbprint({required Uint8List jwkThumbprint}) {
    final SigningKeyLocalModel? key =
        getByThumbprint(jwkThumbprint: jwkThumbprint);
    return key != null && delete(localId: key.localId);
  }

  int clear() => _box.removeAll();

  int count() => _box.count();
}
