import 'dart:typed_data';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../models/local/ed25519_auth_key_config_local_model.dart';

class Ed25519AuthKeyConfigLocalDataSource {
  Ed25519AuthKeyConfigLocalDataSource({
    required Box<Ed25519AuthKeyConfigLocalModel> box,
  }) : _box = box;
  final Box<Ed25519AuthKeyConfigLocalModel> _box;

  Ed25519AuthKeyConfigLocalModel store({
    required Uint8List authenticationKey,
    required Uint8List keyId,
  }) {
    if (authenticationKey.length != 32) {
      throw ArgumentError.value(
        authenticationKey,
        'authenticationKey',
        'Authentication key must be exactly 32 bytes in length',
      );
    }

    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      final Ed25519AuthKeyConfigLocalModel? existingByAuthKey =
          getByAuthKey(authenticationKey: authenticationKey);
      if (existingByAuthKey != null) {
        throw StateError('Authentication key already exists');
      }

      final Ed25519AuthKeyConfigLocalModel? existingByKeyId =
          getByKeyId(keyId: keyId);
      if (existingByKeyId != null) {
        throw StateError('JWK Key ID already exists');
      }

      final Ed25519AuthKeyConfigLocalModel model =
          Ed25519AuthKeyConfigLocalModel(
        authenticationKey: authenticationKey,
        jwkKeyId: keyId,
      );

      _box.put(model, mode: PutMode.insert);
      AppLogger.debug('Stored Ed25519 auth key config: $model');
      return model;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to store Ed25519 authentication key config',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception(
        'Unexpected error while storing Ed25519 authentication key config: $e',
      );
    }
  }

  Ed25519AuthKeyConfigLocalModel? get({required int localId}) {
    if (localId <= 0) {
      throw ArgumentError.value(
        localId,
        'localId',
        'Local ID must be a positive integer',
      );
    }

    try {
      return _box.get(localId);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve Ed25519 auth key config',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception(
        'Failed to retrieve Ed25519 auth key config with ID $localId: $e',
      );
    }
  }

  Ed25519AuthKeyConfigLocalModel? getByAuthKey({
    required Uint8List authenticationKey,
  }) {
    if (authenticationKey.length != 32) {
      throw ArgumentError.value(
        authenticationKey,
        'authenticationKey',
        'Authentication key must be exactly 32 bytes in length',
      );
    }

    try {
      return _box
          .query(
            Ed25519AuthKeyConfigLocalModel_.authenticationKey
                .equals(authenticationKey),
          )
          .build()
          .findFirst();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve Ed25519 auth key config by authentication key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception(
        'Failed to retrieve Ed25519 auth key config by authentication key: $e',
      );
    }
  }

  Ed25519AuthKeyConfigLocalModel? getByKeyId({
    required Uint8List keyId,
  }) {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      return _box
          .query(
            Ed25519AuthKeyConfigLocalModel_.jwkKeyId.equals(keyId),
          )
          .build()
          .findFirst();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve Ed25519 auth key config by JWK Key ID',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception(
        'Failed to retrieve Ed25519 auth key config by JWK Key ID: $e',
      );
    }
  }

  Set<Ed25519AuthKeyConfigLocalModel> getAll() {
    try {
      return _box.getAll().toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve all Ed25519 auth key configs',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve all Ed25519 auth key configs: $e');
    }
  }

  void delete({required int localId}) {
    if (localId <= 0) {
      throw ArgumentError.value(
        localId,
        'localId',
        'Local ID must be a positive integer',
      );
    }

    try {
      final bool success = _box.remove(localId);
      if (!success) {
        throw StateError(
          'Ed25519 auth key config with local ID: $localId not found',
        );
      }
      AppLogger.debug(
        'Deleted Ed25519 auth key config with local ID: $localId',
      );
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete Ed25519 auth key config',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error while deleting Ed25519 auth key config: $e');
    }
  }

  void deleteMany({required Set<int> localIds}) {
    if (localIds.isEmpty) {
      throw ArgumentError.value(
        localIds,
        'localIds',
        'List of IDs cannot be empty',
      );
    }

    for (final int id in localIds) {
      if (id <= 0) {
        throw ArgumentError.value(
          id,
          'localId',
          'Each local ID must be a positive integer',
        );
      }
    }

    try {
      final int deletedCount = _box.removeMany(localIds.toList());
      if (deletedCount != localIds.length) {
        throw StateError(
          'Failed to delete all specified key configs: only deleted $deletedCount out of ${localIds.length}',
        );
      }
      AppLogger.debug('Deleted $deletedCount Ed25519 auth key configs');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete multiple Ed25519 auth key configs',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception(
        'Error while deleting multiple Ed25519 auth key configs: $e',
      );
    }
  }

  void deleteByAuthKey({required Uint8List authenticationKey}) {
    if (authenticationKey.length != 32) {
      throw ArgumentError.value(
        authenticationKey,
        'authenticationKey',
        'Authentication key must be exactly 32 bytes in length',
      );
    }

    try {
      final Ed25519AuthKeyConfigLocalModel? config =
          getByAuthKey(authenticationKey: authenticationKey);
      if (config == null) {
        throw StateError(
          'Ed25519 auth key config not found with the specified authentication key',
        );
      }

      delete(localId: config.localId);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete Ed25519 auth key config by authentication key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception(
        'Failed to delete Ed25519 auth key config by authentication key: $e',
      );
    }
  }

  void deleteByKeyId({required Uint8List keyId}) {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      final Ed25519AuthKeyConfigLocalModel? config = getByKeyId(keyId: keyId);
      if (config == null) {
        throw StateError(
          'Ed25519 auth key config not found with the specified JWK Key ID',
        );
      }

      delete(localId: config.localId);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete Ed25519 auth key config by JWK Key ID',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception(
        'Failed to delete Ed25519 auth key config by JWK Key ID: $e',
      );
    }
  }

  void clear() {
    try {
      _box.removeAll();
      AppLogger.debug('Cleared all Ed25519 auth key configs');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear all Ed25519 auth key configs',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to clear all Ed25519 auth key configs: $e');
    }
  }

  int count() {
    try {
      return _box.count();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to count Ed25519 auth key configs',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to count Ed25519 auth key configs: $e');
    }
  }
}
