import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../models/local/signing_key_local_model.dart';

class SigningKeyDataSource {
  SigningKeyDataSource({required Box<SigningKeyLocalModel> box}) : _box = box;
  final Box<SigningKeyLocalModel> _box;

  IOEither<ExceptionWithStackTrace, SigningKeyLocalModel> store({
    required Uint8List keyId,
    required Uint8List jwkThumbprint,
  }) => IOEither<ExceptionWithStackTrace, SigningKeyLocalModel>(() {
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
      final Either<ExceptionWithStackTrace, Option<SigningKeyLocalModel>>
      existingKey = getByKeyId(keyId: keyId).run();
      if (existingKey.isLeft()) {
        return left(existingKey.getLeft().toNullable()!);
      }
      if (existingKey.isRight() && existingKey.getRight().isSome()) {
        throw StateError('Key with this ID already exists');
      }

      final Either<ExceptionWithStackTrace, Option<SigningKeyLocalModel>>
      existingThumbprint = getByThumbprint(jwkThumbprint: jwkThumbprint).run();

      if (existingThumbprint.isLeft()) {
        return left(existingThumbprint.getLeft().toNullable()!);
      }

      if (existingThumbprint.isRight() &&
          existingThumbprint.getRight().isSome()) {
        throw StateError('Key with this thumbprint already exists');
      }

      final SigningKeyLocalModel model = SigningKeyLocalModel(
        jwkKeyId: keyId,
        jwkThumbprint: jwkThumbprint,
      );

      _box.put(model, mode: PutMode.insert);

      AppLogger.debug('Stored signing key: $model');
      return right(model);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Option<SigningKeyLocalModel>> get({
    required int localId,
  }) => IOEither<ExceptionWithStackTrace, Option<SigningKeyLocalModel>>(() {
    if (localId <= 0) {
      throw ArgumentError.value(
        localId,
        'localId',
        'Local ID must be a positive integer',
      );
    }

    try {
      final SigningKeyLocalModel? key = _box.get(localId);
      return right(optionOf(key));
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Option<SigningKeyLocalModel>> getByKeyId({
    required Uint8List keyId,
  }) => IOEither<ExceptionWithStackTrace, Option<SigningKeyLocalModel>>(() {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      final SigningKeyLocalModel? key =
          _box
              .query(SigningKeyLocalModel_.jwkKeyId.equals(keyId))
              .build()
              .findFirst();
      return right(optionOf(key));
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Option<SigningKeyLocalModel>>
  getByThumbprint({required Uint8List jwkThumbprint}) =>
      IOEither<ExceptionWithStackTrace, Option<SigningKeyLocalModel>>(() {
        if (jwkThumbprint.length != 32) {
          throw ArgumentError.value(
            jwkThumbprint,
            'jwkThumbprint',
            'JWK thumbprint must be exactly 32 bytes (SHA-256 hash)',
          );
        }

        try {
          final SigningKeyLocalModel? key =
              _box
                  .query(
                    SigningKeyLocalModel_.jwkThumbprint.equals(jwkThumbprint),
                  )
                  .build()
                  .findFirst();
          return right(optionOf(key));
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Set<SigningKeyLocalModel>> getAll() =>
      IOEither<ExceptionWithStackTrace, Set<SigningKeyLocalModel>>(() {
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
            throw StateError('Signing key with local ID: $localId not found');
          }
          return right(unit);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Unit> deleteByKeyId({
    required Uint8List keyId,
  }) => IOEither<ExceptionWithStackTrace, Unit>(()   {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      final Either<ExceptionWithStackTrace, Option<SigningKeyLocalModel>>
      keyResult = getByKeyId(keyId: keyId).run();

      return keyResult.fold(
        left,
        (Option<SigningKeyLocalModel> keyOption) => keyOption.fold(
          () => throw StateError('Signing key not found with the specified ID'),
          (SigningKeyLocalModel key) => delete(localId: key.localId).run(),
        ),
      );
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> deleteByThumbprint({
    required Uint8List jwkThumbprint,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (jwkThumbprint.length != 32) {
      throw ArgumentError.value(
        jwkThumbprint,
        'jwkThumbprint',
        'JWK thumbprint must be exactly 32 bytes (SHA-256 hash)',
      );
    }

    try {
      return getByThumbprint(jwkThumbprint: jwkThumbprint).run().flatMap(
        (Option<SigningKeyLocalModel> keyOption) => keyOption.fold(
          () =>
              throw StateError(
                'Signing key not found with the specified thumbprint',
              ),
          (SigningKeyLocalModel key) => delete(localId: key.localId).run(),
        ),
      );
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
      final int deletedCount = _box.removeMany(localIds.toList());
      if (deletedCount != localIds.length) {
        throw StateError(
          'Failed to delete all specified keys: only deleted $deletedCount out of ${localIds.length}',
        );
      }
      AppLogger.debug('Deleted $deletedCount signing keys');
      return right(unit);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> clear() =>
      IOEither<ExceptionWithStackTrace, Unit>(() {
        try {
          _box.removeAll();
          AppLogger.debug('Cleared all signing keys');
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
