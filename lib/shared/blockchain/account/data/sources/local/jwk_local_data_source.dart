import 'dart:typed_data';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../../domain/entities/json_web_key.dart';
import '../../models/local/jwk_local_model.dart';

class JwkDataSource {
  JwkDataSource({required Box<JwkLocalModel> box}) : _box = box;
  final Box<JwkLocalModel> _box;

  JwkLocalModel store({required Jwk jwk}) {
    final Uint8List publicKeyBytes = jwk.getPublicKeyBytes();
    try {
      if (getByKeyId(keyId: jwk.keyId) != null) {
        throw StateError('Key ID already exists');
      }

      final Uint8List x = switch (jwk) {
        Ed25519Jwk() => publicKeyBytes,
        Secp256k1Jwk() || Secp256r1Jwk() => publicKeyBytes.sublist(0, 32),
      };

      final Uint8List? y = switch (jwk) {
        Ed25519Jwk() => null,
        Secp256k1Jwk() || Secp256r1Jwk() => publicKeyBytes.sublist(32, 64),
      };

      if (getByProperties(
            keyType: jwk.keyType.value,
            curve: jwk.curve.value,
            x: x,
            y: y,
          ) !=
          null) {
        throw StateError('JWK with same properties already exists');
      }

      final JwkLocalModel model = JwkLocalModel.fromDomain(jwk);
      _box.put(model, mode: PutMode.insert);
      AppLogger.debug('Stored JWK: $model');
      return model;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to store JWK',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Unexpected error while storing JWK: $e');
    }
  }

  JwkLocalModel? get({required int localId}) {
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
        'Failed to retrieve JWK',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve JWK with ID $localId: $e');
    }
  }

  JwkLocalModel? getByKeyId({required Uint8List keyId}) {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      return _box.query(JwkLocalModel_.keyId.equals(keyId)).build().findFirst();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve JWK by key ID',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve JWK by key ID: $e');
    }
  }

  Set<JwkLocalModel> getByType({required String keyType}) {
    if (keyType.trim().isEmpty) {
      throw ArgumentError.value(
        keyType,
        'keyType',
        'Key type cannot be empty',
      );
    }

    try {
      return _box
          .query(JwkLocalModel_.keyType.equals(keyType))
          .build()
          .find()
          .toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve JWKs by key type',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve JWKs by key type: $e');
    }
  }

  Set<JwkLocalModel> getByCurve({required String curve}) {
    if (curve.trim().isEmpty) {
      throw ArgumentError.value(
        curve,
        'curve',
        'Curve cannot be empty',
      );
    }

    try {
      return _box
          .query(JwkLocalModel_.curve.equals(curve))
          .build()
          .find()
          .toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve JWKs by curve',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve JWKs by curve: $e');
    }
  }

  JwkLocalModel? getByProperties({
    required String keyType,
    required String curve,
    required Uint8List x,
    Uint8List? y,
  }) {
    if (keyType.trim().isEmpty) {
      throw ArgumentError.value(
        keyType,
        'keyType',
        'Key type cannot be empty',
      );
    }
    if (curve.trim().isEmpty) {
      throw ArgumentError.value(
        curve,
        'curve',
        'Curve cannot be empty',
      );
    }
    if (x.isEmpty) {
      throw ArgumentError.value(
        x,
        'x',
        'X coordinate cannot be empty',
      );
    }

    try {
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
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve JWK by properties',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve JWK by properties: $e');
    }
  }

  Set<JwkLocalModel> getAll() {
    try {
      return _box.getAll().toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve all JWKs',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve all JWKs: $e');
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
        throw StateError('JWK with local ID: $localId not found');
      }
      AppLogger.debug('Deleted JWK with local ID: $localId');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete JWK',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error while deleting JWK: $e');
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
      final JwkLocalModel? key = getByKeyId(keyId: keyId);
      if (key == null) {
        throw StateError('JWK not found with the specified key ID');
      }

      delete(localId: key.localId);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete JWK by key ID',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete JWK by key ID: $e');
    }
  }

  void deleteByType({required String keyType}) {
    if (keyType.trim().isEmpty) {
      throw ArgumentError.value(
        keyType,
        'keyType',
        'Key type cannot be empty',
      );
    }

    try {
      final Set<JwkLocalModel> keys = getByType(keyType: keyType);
      if (keys.isEmpty) {
        throw StateError('No JWKs found with the specified key type');
      }

      final Set<int> idsToDelete =
          keys.map((JwkLocalModel k) => k.localId).toSet();
      final int deletedCount = _box.removeMany(idsToDelete.toList());
      if (deletedCount != idsToDelete.length) {
        throw StateError(
          'Failed to delete all specified keys: only deleted $deletedCount out of ${idsToDelete.length}',
        );
      }
      AppLogger.debug('Deleted $deletedCount JWKs');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete JWKs by key type',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete JWKs by key type: $e');
    }
  }

  void deleteByCurve({required String curve}) {
    if (curve.trim().isEmpty) {
      throw ArgumentError.value(
        curve,
        'curve',
        'Curve cannot be empty',
      );
    }

    try {
      final Set<JwkLocalModel> keys = getByCurve(curve: curve);
      if (keys.isEmpty) {
        throw StateError('No JWKs found with the specified curve');
      }

      final Set<int> idsToDelete =
          keys.map((JwkLocalModel k) => k.localId).toSet();
      final int deletedCount = _box.removeMany(idsToDelete.toList());

      if (deletedCount != idsToDelete.length) {
        throw StateError(
          'Failed to delete all specified keys: only deleted $deletedCount out of ${idsToDelete.length}',
        );
      }
      AppLogger.debug('Deleted $deletedCount JWKs');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete JWKs by curve',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete JWKs by curve: $e');
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
      AppLogger.debug('Deleted $deletedCount JWKs');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete JWKs',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error while deleting multiple JWKs: $e');
    }
  }

  void clear() {
    try {
      _box.removeAll();
      AppLogger.debug('Cleared all JWKs');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear all JWKs',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to clear all JWKs: $e');
    }
  }

  int count() {
    try {
      return _box.count();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to count JWKs',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to count JWKs: $e');
    }
  }
}
