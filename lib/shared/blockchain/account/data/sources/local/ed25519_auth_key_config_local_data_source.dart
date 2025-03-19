import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../models/local/ed25519_auth_key_config_local_model.dart';

class Ed25519AuthKeyConfigLocalDataSource {
  Ed25519AuthKeyConfigLocalDataSource({
    required Box<Ed25519AuthKeyConfigLocalModel> box,
  }) : _box = box;
  final Box<Ed25519AuthKeyConfigLocalModel> _box;

  IOEither<ExceptionWithStackTrace, Ed25519AuthKeyConfigLocalModel> store({
    required Uint8List authenticationKey,
    required Uint8List keyId,
  }) => IOEither<ExceptionWithStackTrace, Ed25519AuthKeyConfigLocalModel>(() {
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
      final Either<ExceptionWithStackTrace, Option<Ed25519AuthKeyConfigLocalModel>> existingByAuthKeyResult = 
          getByAuthKey(authenticationKey: authenticationKey).run();
          
      if (existingByAuthKeyResult.isLeft()) {
        return left(existingByAuthKeyResult.getLeft().toNullable()!);
      }
      if (existingByAuthKeyResult.isRight() && existingByAuthKeyResult.getRight().isSome()) {
        throw StateError('Authentication key already exists');
      }

      final Either<ExceptionWithStackTrace, Option<Ed25519AuthKeyConfigLocalModel>> existingByKeyIdResult = 
          getByKeyId(keyId: keyId).run();
          
      if (existingByKeyIdResult.isLeft()) {
        return left(existingByKeyIdResult.getLeft().toNullable()!);
      }
      if (existingByKeyIdResult.isRight() && existingByKeyIdResult.getRight().isSome()) {
        throw StateError('JWK Key ID already exists');
      }

      final Ed25519AuthKeyConfigLocalModel model =
          Ed25519AuthKeyConfigLocalModel(
        authenticationKey: authenticationKey,
        jwkKeyId: keyId,
      );

      _box.put(model, mode: PutMode.insert);
      AppLogger.debug('Stored Ed25519 auth key config: $model');
      return right(model);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Option<Ed25519AuthKeyConfigLocalModel>> get({
    required int localId,
  }) => IOEither<ExceptionWithStackTrace, Option<Ed25519AuthKeyConfigLocalModel>>(() {
    if (localId <= 0) {
      throw ArgumentError.value(
        localId,
        'localId',
        'Local ID must be a positive integer',
      );
    }

    try {
      final Ed25519AuthKeyConfigLocalModel? model = _box.get(localId);
      return right(optionOf(model));
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Option<Ed25519AuthKeyConfigLocalModel>> getByAuthKey({
    required Uint8List authenticationKey,
  }) => IOEither<ExceptionWithStackTrace, Option<Ed25519AuthKeyConfigLocalModel>>(() {
    if (authenticationKey.length != 32) {
      throw ArgumentError.value(
        authenticationKey,
        'authenticationKey',
        'Authentication key must be exactly 32 bytes in length',
      );
    }

    try {
      final Ed25519AuthKeyConfigLocalModel? model = _box
          .query(
            Ed25519AuthKeyConfigLocalModel_.authenticationKey
                .equals(authenticationKey),
          )
          .build()
          .findFirst();
      return right(optionOf(model));
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Option<Ed25519AuthKeyConfigLocalModel>> getByKeyId({
    required Uint8List keyId,
  }) => IOEither<ExceptionWithStackTrace, Option<Ed25519AuthKeyConfigLocalModel>>(() {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      final Ed25519AuthKeyConfigLocalModel? model = _box
          .query(
            Ed25519AuthKeyConfigLocalModel_.jwkKeyId.equals(keyId),
          )
          .build()
          .findFirst();
      return right(optionOf(model));
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Set<Ed25519AuthKeyConfigLocalModel>> getAll() =>
      IOEither<ExceptionWithStackTrace, Set<Ed25519AuthKeyConfigLocalModel>>(() {
        try {
          return right(_box.getAll().toSet());
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Unit> delete({
    required int localId,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
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
      return right(unit);
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
      final List<Ed25519AuthKeyConfigLocalModel?> existingObjects = _box.getMany(
        localIds.toList(),
      );

      final Set<int> existingIds =
          existingObjects
              .map((Ed25519AuthKeyConfigLocalModel? obj) => obj?.localId ?? 0)
              .toSet();

      final Set<int> missingIds = localIds.difference(existingIds);

      if (missingIds.isNotEmpty) {
        throw StateError(
          'Ed25519 auth key configs not found with the following local IDs: $missingIds',
        );
      }
      final int deletedCount = _box.removeMany(localIds.toList());
      if (deletedCount != localIds.length) {
        throw StateError(
          'Failed to delete all specified key configs: only deleted $deletedCount out of ${localIds.length}',
        );
      }
      AppLogger.debug('Deleted $deletedCount Ed25519 auth key configs');
      return right(unit);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> deleteByAuthKey({
    required Uint8List authenticationKey,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (authenticationKey.length != 32) {
      throw ArgumentError.value(
        authenticationKey,
        'authenticationKey',
        'Authentication key must be exactly 32 bytes in length',
      );
    }

    try {
      final Either<ExceptionWithStackTrace, Option<Ed25519AuthKeyConfigLocalModel>> configResult = 
          getByAuthKey(authenticationKey: authenticationKey).run();
      
      return configResult.fold(
        left,
        (Option<Ed25519AuthKeyConfigLocalModel> configOption) => configOption.fold(
          () => throw StateError(
            'Ed25519 auth key config not found with the specified authentication key',
          ),
          (Ed25519AuthKeyConfigLocalModel config) => delete(localId: config.localId).run(),
        ),
      );
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
      final Either<ExceptionWithStackTrace, Option<Ed25519AuthKeyConfigLocalModel>> configResult = 
          getByKeyId(keyId: keyId).run();
      
      return configResult.fold(
        left,
        (Option<Ed25519AuthKeyConfigLocalModel> configOption) => configOption.fold(
          () => throw StateError(
            'Ed25519 auth key config not found with the specified JWK Key ID',
          ),
          (Ed25519AuthKeyConfigLocalModel config) => delete(localId: config.localId).run(),
        ),
      );
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> clear() =>
      IOEither<ExceptionWithStackTrace, Unit>(() {
        try {
          _box.removeAll();
          AppLogger.debug('Cleared all Ed25519 auth key configs');
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
