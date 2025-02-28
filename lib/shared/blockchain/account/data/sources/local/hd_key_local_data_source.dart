import 'dart:typed_data';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../models/local/hd_key_local_model.dart';

class HDKeyDataSource {
  HDKeyDataSource({required Box<HDKeyLocalModel> box}) : _box = box;
  final Box<HDKeyLocalModel> _box;

  HDKeyLocalModel store({
    required Uint8List keyId,
    required Uint8List entropyHash,
    required Uint8List derivationPath,
  }) {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }
    if (entropyHash.length != 32) {
      throw ArgumentError.value(
        entropyHash,
        'entropyHash',
        'Entropy hash must be exactly 32 bytes in length',
      );
    }
    if (derivationPath.length != 20) {
      throw ArgumentError.value(
        derivationPath,
        'derivationPath',
        'Derivation path must be exactly 20 bytes in length',
      );
    }

    try {
      final HDKeyLocalModel? existingKey = getByKeyId(keyId: keyId);
      if (existingKey != null) {
        throw StateError('Key with this ID already exists');
      }

      final HDKeyLocalModel model = HDKeyLocalModel(
        jwkKeyId: keyId,
        entropyHash: entropyHash,
        derivationPath: derivationPath,
      );

      _box.put(model, mode: PutMode.insert);
      AppLogger.debug('Stored HD key: $model');
      return model;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to store HD key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Unexpected error while storing HD key: $e');
    }
  }

  HDKeyLocalModel? get({required int localId}) {
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
        'Failed to retrieve HD key with ID $localId',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve HD key with ID $localId: $e');
    }
  }

  HDKeyLocalModel? getByKeyId({required Uint8List keyId}) {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      return _box
          .query(HDKeyLocalModel_.jwkKeyId.equals(keyId))
          .build()
          .findFirst();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve HD key by ID',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve HD key by ID: $e');
    }
  }

  Set<HDKeyLocalModel> getByEntropy({required Uint8List entropyHash}) {
    if (entropyHash.length != 32) {
      throw ArgumentError.value(
        entropyHash,
        'entropyHash',
        'Entropy hash must be exactly 32 bytes in length',
      );
    }

    try {
      return _box
          .query(HDKeyLocalModel_.entropyHash.equals(entropyHash))
          .build()
          .find()
          .toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve HD keys by entropy hash',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve HD keys by entropy hash: $e');
    }
  }

  Set<HDKeyLocalModel> getByPath({required Uint8List derivationPath}) {
    if (derivationPath.length != 20) {
      throw ArgumentError.value(
        derivationPath,
        'derivationPath',
        'Derivation path must be exactly 20 bytes in length',
      );
    }

    try {
      return _box
          .query(HDKeyLocalModel_.derivationPath.equals(derivationPath))
          .build()
          .find()
          .toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve HD keys by derivation path',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve HD keys by derivation path: $e');
    }
  }

  Set<HDKeyLocalModel> getByPathAndEntropy({
    required Uint8List derivationPath,
    required Uint8List entropyHash,
  }) {
    if (derivationPath.length != 20) {
      throw ArgumentError.value(
        derivationPath,
        'derivationPath',
        'Derivation path must be exactly 20 bytes in length',
      );
    }

    if (entropyHash.length != 32) {
      throw ArgumentError.value(
        entropyHash,
        'entropyHash',
        'Entropy hash must be exactly 32 bytes in length',
      );
    }

    try {
      return _box
          .query(
            HDKeyLocalModel_.derivationPath
                .equals(derivationPath)
                .and(HDKeyLocalModel_.entropyHash.equals(entropyHash)),
          )
          .build()
          .find()
          .toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve HD keys by path and entropy hash',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception(
          'Failed to retrieve HD keys by path and entropy hash: $e',);
    }
  }

  Set<HDKeyLocalModel> getAll() {
    try {
      return _box.getAll().toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve all HD keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve all HD keys: $e');
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
        throw StateError('HD key with local ID: $localId not found');
      }
      AppLogger.debug('Deleted HD key with local ID: $localId');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Error while deleting HD key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error while deleting HD key: $e');
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
      final HDKeyLocalModel? key = getByKeyId(keyId: keyId);
      if (key == null) {
        throw StateError('HD key not found with the specified ID');
      }

      delete(localId: key.localId);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete HD key by ID',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete HD key by ID: $e');
    }
  }

  void deleteByEntropy({required Uint8List entropyHash}) {
    if (entropyHash.length != 32) {
      throw ArgumentError.value(
        entropyHash,
        'entropyHash',
        'Entropy hash must be exactly 32 bytes in length',
      );
    }

    try {
      final Set<HDKeyLocalModel> keys = getByEntropy(entropyHash: entropyHash);
      if (keys.isEmpty) {
        throw StateError('No HD keys found with the specified entropy hash');
      }

      final Set<int> idsToDelete =
          keys.map((HDKeyLocalModel k) => k.localId).toSet();
      final int deletedCount = _box.removeMany(idsToDelete.toList());

      if (deletedCount != idsToDelete.length) {
        throw StateError(
          'Failed to delete all specified keys: only deleted $deletedCount out of ${idsToDelete.length}',
        );
      }
      AppLogger.debug('Deleted $deletedCount HD keys by entropy hash');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete HD keys by entropy hash',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete HD keys by entropy hash: $e');
    }
  }

  void deleteByPath({required Uint8List derivationPath}) {
    if (derivationPath.length != 20) {
      throw ArgumentError.value(
        derivationPath,
        'derivationPath',
        'Derivation path must be exactly 20 bytes in length',
      );
    }

    try {
      final Set<HDKeyLocalModel> keys =
          getByPath(derivationPath: derivationPath);
      if (keys.isEmpty) {
        throw StateError('No HD keys found with the specified derivation path');
      }

      final Set<int> idsToDelete =
          keys.map((HDKeyLocalModel k) => k.localId).toSet();
      final int deletedCount = _box.removeMany(idsToDelete.toList());

      if (deletedCount != idsToDelete.length) {
        throw StateError(
          'Failed to delete all specified keys: only deleted $deletedCount out of ${idsToDelete.length}',
        );
      }
      AppLogger.debug('Deleted $deletedCount HD keys by derivation path');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete HD keys by derivation path',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete HD keys by derivation path: $e');
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
      AppLogger.debug('Deleted $deletedCount HD keys');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete HD keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error while deleting multiple HD keys: $e');
    }
  }

  void clear() {
    try {
      _box.removeAll();
      AppLogger.debug('Cleared all HD keys');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear all HD keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to clear all HD keys: $e');
    }
  }

  int count() {
    try {
      return _box.count();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to count HD keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to count HD keys: $e');
    }
  }
}
