import 'package:flutter/services.dart';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../domain/entities/json_web_key.dart';
import '../../domain/repositories/private_jwk_repository_interface.dart';
import '../sources/local/private_jwk_local_data_source.dart';
import '../sources/local/signing_key_local_data_source.dart';

class PrivateJwkRepository implements IPrivateJwkRepository {
  PrivateJwkRepository({
    required Store store,
    required PrivateJwkDataSource privateJwkDataSource,
    required SigningKeyDataSource signingKeyDataSource,
  })  : _store = store,
        _privateJwkDataSource = privateJwkDataSource,
        _signingKeyDataSource = signingKeyDataSource;

  final Store _store;
  final PrivateJwkDataSource _privateJwkDataSource;
  final SigningKeyDataSource _signingKeyDataSource;

  @override
  Future<Uint8List> store({required Jwk jwk}) async {
    if (!jwk.hasPrivateKey()) {
      throw StateError('Cannot store jwk: missing private component "d"');
    }

    await _privateJwkDataSource.store(keyId: jwk.keyId, jwk: jwk);
    return jwk.keyId;
  }

  @override
  Future<Jwk?> get({required Uint8List keyId}) =>
      _privateJwkDataSource.get(keyId: keyId);

  @override
  Future<bool> has({required Uint8List keyId}) =>
      _privateJwkDataSource.has(keyId: keyId);

  @override
  Future<void> delete({required Uint8List keyId}) =>
      _store.runInTransaction(TxMode.read, () {
        if (_signingKeyDataSource.getByKeyId(keyId: keyId) != null) {
          throw StateError(
            'Cannot delete: key is used in signing configuration',
          );
        }
        return _privateJwkDataSource.delete(keyId: keyId);
      });

  @override
  Future<void> deleteMany(List<Uint8List> keyIds) =>
      _store.runInTransaction(TxMode.read, () {
        for (final Uint8List keyId in keyIds) {
          if (_signingKeyDataSource.getByKeyId(keyId: keyId) != null) {
            throw StateError(
              'Cannot delete: key is used in signing configuration',
            );
          }
        }
        return _privateJwkDataSource.deleteMany(keyIds);
      });

  @override
  Future<int> count() => _privateJwkDataSource.count();

  @override
  Future<List<Uint8List>> getAllKeyIds() =>
      _privateJwkDataSource.getAllKeyIds();

  @override
  Future<void> clear() async {
    final List<Uint8List> keyIds = await getAllKeyIds();

    for (final Uint8List keyId in keyIds) {
      if (_signingKeyDataSource.getByKeyId(keyId: keyId) != null) {
        throw StateError('Cannot clear: keys used in signing configuration');
      }
    }
    return _store.runInTransaction(TxMode.read, _privateJwkDataSource.clear);
  }
}
