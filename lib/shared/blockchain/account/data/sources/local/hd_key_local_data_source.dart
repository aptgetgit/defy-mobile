import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../models/local/hd_key_local_model.dart';

class HDKeyDataSource {
  HDKeyDataSource({required Box<HDKeyLocalModel> box}) : _box = box;
  final Box<HDKeyLocalModel> _box;

  IOEither<ExceptionWithStackTrace, HDKeyLocalModel> store({
    required Uint8List keyId,
    required Uint8List entropyHash,
    required Uint8List derivationPath,
  }) => IOEither<ExceptionWithStackTrace, HDKeyLocalModel>(() {
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
      final Either<ExceptionWithStackTrace, Option<HDKeyLocalModel>>
      existingKeyResult = getByKeyId(keyId: keyId).run();

      if (existingKeyResult.isLeft()) {
        return left(existingKeyResult.getLeft().toNullable()!);
      }
      if (existingKeyResult.isRight() &&
          existingKeyResult.getRight().isSome() &&
          existingKeyResult.getRight().toNullable()!.isSome()) {
        throw StateError('Key with this ID already exists');
      }

      final HDKeyLocalModel model = HDKeyLocalModel(
        jwkKeyId: keyId,
        entropyHash: entropyHash,
        derivationPath: derivationPath,
      );

      _box.put(model, mode: PutMode.insert);
      AppLogger.debug('Stored HD key: $model');
      return right(model);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Option<HDKeyLocalModel>> get({
    required int localId,
  }) => IOEither<ExceptionWithStackTrace, Option<HDKeyLocalModel>>(() {
    if (localId <= 0) {
      throw ArgumentError.value(
        localId,
        'localId',
        'Local ID must be a positive integer',
      );
    }

    try {
      final HDKeyLocalModel? key = _box.get(localId);
      return right(optionOf(key));
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Option<HDKeyLocalModel>> getByKeyId({
    required Uint8List keyId,
  }) => IOEither<ExceptionWithStackTrace, Option<HDKeyLocalModel>>(() {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      final HDKeyLocalModel? key =
          _box
              .query(HDKeyLocalModel_.jwkKeyId.equals(keyId))
              .build()
              .findFirst();
      return right(optionOf(key));
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Set<HDKeyLocalModel>> getByEntropy({
    required Uint8List entropyHash,
  }) => IOEither<ExceptionWithStackTrace, Set<HDKeyLocalModel>>(() {
    if (entropyHash.length != 32) {
      throw ArgumentError.value(
        entropyHash,
        'entropyHash',
        'Entropy hash must be exactly 32 bytes in length',
      );
    }

    try {
      final Set<HDKeyLocalModel> keys =
          _box
              .query(HDKeyLocalModel_.entropyHash.equals(entropyHash))
              .build()
              .find()
              .toSet();
      return right(keys);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Set<HDKeyLocalModel>> getByPath({
    required Uint8List derivationPath,
  }) => IOEither<ExceptionWithStackTrace, Set<HDKeyLocalModel>>(() {
    if (derivationPath.length != 20) {
      throw ArgumentError.value(
        derivationPath,
        'derivationPath',
        'Derivation path must be exactly 20 bytes in length',
      );
    }

    try {
      final Set<HDKeyLocalModel> keys =
          _box
              .query(HDKeyLocalModel_.derivationPath.equals(derivationPath))
              .build()
              .find()
              .toSet();
      return right(keys);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Set<HDKeyLocalModel>> getByPathAndEntropy({
    required Uint8List derivationPath,
    required Uint8List entropyHash,
  }) => IOEither<ExceptionWithStackTrace, Set<HDKeyLocalModel>>(() {
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
      final Set<HDKeyLocalModel> keys =
          _box
              .query(
                HDKeyLocalModel_.derivationPath
                    .equals(derivationPath)
                    .and(HDKeyLocalModel_.entropyHash.equals(entropyHash)),
              )
              .build()
              .find()
              .toSet();
      return right(keys);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Set<HDKeyLocalModel>> getAll() =>
      IOEither<ExceptionWithStackTrace, Set<HDKeyLocalModel>>(() {
        try {
          return right(_box.getAll().toSet());
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Unit> delete({required int localId}) =>
      IOEither<ExceptionWithStackTrace, Unit>(() {
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
          return right(unit);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Unit> deleteByKeyId({
    required Uint8List keyId,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      final Either<ExceptionWithStackTrace, Option<HDKeyLocalModel>> keyResult =
          getByKeyId(keyId: keyId).run();

      return keyResult.fold(
        left,
        (Option<HDKeyLocalModel> keyOption) => keyOption.fold(
          () => throw StateError('HD key not found with the specified ID'),
          (HDKeyLocalModel key) => delete(localId: key.localId).run(),
        ),
      );
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> deleteByEntropy({
    required Uint8List entropyHash,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (entropyHash.length != 32) {
      throw ArgumentError.value(
        entropyHash,
        'entropyHash',
        'Entropy hash must be exactly 32 bytes in length',
      );
    }

    try {
      final Either<ExceptionWithStackTrace, Set<HDKeyLocalModel>> keysResult =
          getByEntropy(entropyHash: entropyHash).run();

      return keysResult.fold(left, (Set<HDKeyLocalModel> keys) {
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
        return right(unit);
      });
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> deleteByPath({
    required Uint8List derivationPath,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (derivationPath.length != 20) {
      throw ArgumentError.value(
        derivationPath,
        'derivationPath',
        'Derivation path must be exactly 20 bytes in length',
      );
    }

    try {
      final Either<ExceptionWithStackTrace, Set<HDKeyLocalModel>> keysResult =
          getByPath(derivationPath: derivationPath).run();

      return keysResult.fold(left, (Set<HDKeyLocalModel> keys) {
        if (keys.isEmpty) {
          throw StateError(
            'No HD keys found with the specified derivation path',
          );
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
        return right(unit);
      });
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> deleteMany({
    required Set<int> localIds,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
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
      final List<HDKeyLocalModel?> existingObjects = _box.getMany(
        localIds.toList(),
      );
      final Set<int> existingIds =
          existingObjects
              .map((HDKeyLocalModel? obj) => obj?.localId ?? 0)
              .toSet();

      final Set<int> missingIds = localIds.difference(existingIds);

      if (missingIds.isNotEmpty) {
        throw StateError(
          'HD keys not found with the following IDs: $missingIds',
        );
      }
      final int deletedCount = _box.removeMany(localIds.toList());
      if (deletedCount != localIds.length) {
        throw StateError(
          'Failed to delete all specified keys: only deleted $deletedCount out of ${localIds.length}',
        );
      }
      AppLogger.debug('Deleted $deletedCount HD keys');
      return right(unit);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> clear() =>
      IOEither<ExceptionWithStackTrace, Unit>(() {
        try {
          _box.removeAll();
          AppLogger.debug('Cleared all HD keys');
          return right(unit);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, int> count() =>
      IOEither<ExceptionWithStackTrace, int>(() {
        try {
          return right(_box.count());
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });
}