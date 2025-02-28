import 'dart:typed_data';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../models/local/signing_key_local_model.dart';

class SigningKeyDataSource {
  SigningKeyDataSource({required Box<SigningKeyLocalModel> box}) : _box = box;
  final Box<SigningKeyLocalModel> _box;

  SigningKeyLocalModel store({
    required Uint8List keyId,
    required Uint8List jwkThumbprint,
  }) {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }
    if (jwkThumbprint.length != 32) {
      throw ArgumentError.value(
        jwkThumbprint,
        'jwkThumbprint',
        'JWK thumbprint must be exactly 32 bytes (SHA-256 hash)',
      );
    }

    try {
      final SigningKeyLocalModel? existingKey = getByKeyId(keyId: keyId);
      if (existingKey != null) {
        throw StateError('Key with this ID already exists');
      }

      final SigningKeyLocalModel? existingThumbprint =
          getByThumbprint(jwkThumbprint: jwkThumbprint);
      if (existingThumbprint != null) {
        throw StateError('Key with this thumbprint already exists');
      }

      final SigningKeyLocalModel model = SigningKeyLocalModel(
        jwkKeyId: keyId,
        jwkThumbprint: jwkThumbprint,
      );

      _box.put(model, mode: PutMode.insert);
      AppLogger.debug('Stored signing key: $model');
      return model;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to store signing key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Unexpected error while storing signing key: $e');
    }
  }

  SigningKeyLocalModel? get({required int localId}) {
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
        'Failed to retrieve signing key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve signing key with ID $localId: $e');
    }
  }

  SigningKeyLocalModel? getByKeyId({required Uint8List keyId}) {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      return _box
          .query(SigningKeyLocalModel_.jwkKeyId.equals(keyId))
          .build()
          .findFirst();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve signing key by ID',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve signing key by ID: $e');
    }
  }

  SigningKeyLocalModel? getByThumbprint({required Uint8List jwkThumbprint}) {
    if (jwkThumbprint.length != 32) {
      throw ArgumentError.value(
        jwkThumbprint,
        'jwkThumbprint',
        'JWK thumbprint must be exactly 32 bytes (SHA-256 hash)',
      );
    }

    try {
      return _box
          .query(SigningKeyLocalModel_.jwkThumbprint.equals(jwkThumbprint))
          .build()
          .findFirst();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve signing key by thumbprint',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve signing key by thumbprint: $e');
    }
  }

  Set<SigningKeyLocalModel> getAll() {
    try {
      return _box.getAll().toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve all signing keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve all signing keys: $e');
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
        throw StateError('Signing key with local ID: $localId not found');
      }
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete signing key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error while deleting signing key: $e');
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
      final SigningKeyLocalModel? key = getByKeyId(keyId: keyId);
      if (key == null) {
        throw StateError('Signing key not found with the specified ID');
      }

      delete(localId: key.localId);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete signing key by ID',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete signing key by ID: $e');
    }
  }

  void deleteByThumbprint({required Uint8List jwkThumbprint}) {
    if (jwkThumbprint.length != 32) {
      throw ArgumentError.value(
        jwkThumbprint,
        'jwkThumbprint',
        'JWK thumbprint must be exactly 32 bytes (SHA-256 hash)',
      );
    }

    try {
      final SigningKeyLocalModel? key =
          getByThumbprint(jwkThumbprint: jwkThumbprint);
      if (key == null) {
        throw StateError('Signing key not found with the specified thumbprint');
      }

      delete(localId: key.localId);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete signing key by thumbprint',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete signing key by thumbprint: $e');
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
          'Failed to delete all specified keys: only deleted $deletedCount out of ${localIds.length}',
        );
      }
      AppLogger.debug('Deleted $deletedCount signing keys');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete multiple signing keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error while deleting multiple signing keys: $e');
    }
  }

  void clear() {
    try {
      _box.removeAll();
      AppLogger.debug('Cleared all signing keys');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear all signing keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to clear all signing keys: $e');
    }
  }

  int count() {
    try {
      return _box.count();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to count signing keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to count signing keys: $e');
    }
  }
}
