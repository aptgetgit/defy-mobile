import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../core/logging/app_logger.dart';
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

    try {
      await _privateJwkDataSource.store(keyId: jwk.keyId, jwk: jwk);
      return jwk.keyId;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to store private key',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<Jwk?> get({required Uint8List keyId}) async {
    try {
      final Jwk? result = await _privateJwkDataSource.get(keyId: keyId);
      return result;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve private key',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<bool> has({required Uint8List keyId}) async {
    try {
      final bool exists = await _privateJwkDataSource.has(keyId: keyId);
      return exists;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to check private key existence',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> delete({required Uint8List keyId}) async {
    try {
      await _store.runInTransaction(TxMode.write, () async {
        if (_signingKeyDataSource.getByKeyId(keyId: keyId) != null) {
          throw StateError(
            'Cannot delete: key is used in signing configuration',
          );
        }
        await _privateJwkDataSource.delete(keyId: keyId);
      });
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete private key',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> deleteMany(Set<Uint8List> keyIds) async {
    try {
      await _store.runInTransaction(TxMode.write, () async {
        for (final Uint8List keyId in keyIds) {
          if (_signingKeyDataSource.getByKeyId(keyId: keyId) != null) {
            throw StateError(
              'Cannot delete: key is used in signing configuration',
            );
          }
        }
        await _privateJwkDataSource.deleteMany(keyIds: keyIds.toSet());
      });
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete multiple private keys',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<int> count() async {
    try {
      final int result = await _privateJwkDataSource.count();
      return result;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to count private keys',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<Set<Uint8List>> getAllKeyIds() async {
    try {
      final Set<Uint8List> keyIds = await _privateJwkDataSource.getAllKeyIds();
      return keyIds;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve all key IDs',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> clear() async {
    try {
      final Set<Uint8List> keyIds = await getAllKeyIds();

      await _store.runInTransaction(TxMode.write, () async {
        for (final Uint8List keyId in keyIds) {
          if (_signingKeyDataSource.getByKeyId(keyId: keyId) != null) {
            throw StateError(
                'Cannot clear: keys used in signing configuration',);
          }
        }
        await _privateJwkDataSource.clear();
      });
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear all private keys',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
