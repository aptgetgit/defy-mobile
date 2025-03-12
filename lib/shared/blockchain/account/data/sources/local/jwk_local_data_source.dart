import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../../domain/entities/json_web_key.dart';
import '../../models/local/jwk_local_model.dart';

class JwkDataSource {
  JwkDataSource({required Box<JwkLocalModel> box}) : _box = box;
  final Box<JwkLocalModel> _box;

  IOEither<ExceptionWithStackTrace, JwkLocalModel> store({required Jwk jwk}) =>
      IOEither<ExceptionWithStackTrace, JwkLocalModel>(() {
        final Uint8List publicKeyBytes = jwk.getPublicKeyBytes();
        try {
          final Either<ExceptionWithStackTrace, Option<JwkLocalModel>>
          existingKeyResult = getByKeyId(keyId: jwk.keyId).run();

          if (existingKeyResult.isLeft()) {
            return left(existingKeyResult.getLeft().toNullable()!);
          }
          if (existingKeyResult.isRight() &&
              existingKeyResult.getRight().isSome()) {
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

          final Either<ExceptionWithStackTrace, Option<JwkLocalModel>>
          existingPropsResult =
              getByProperties(
                keyType: jwk.keyType.value,
                curve: jwk.curve.value,
                x: x,
                y: Option<Uint8List>.fromNullable(y),
              ).run();

          if (existingPropsResult.isLeft()) {
            return left(existingPropsResult.getLeft().toNullable()!);
          }
          if (existingPropsResult.isRight() &&
              existingPropsResult.getRight().isSome()) {
            throw StateError('JWK with same properties already exists');
          }

          final JwkLocalModel model = JwkLocalModel.fromDomain(jwk);
          _box.put(model, mode: PutMode.insert);
          AppLogger.debug('Stored JWK: $model');
          return right(model);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Option<JwkLocalModel>> get({
    required int localId,
  }) => IOEither<ExceptionWithStackTrace, Option<JwkLocalModel>>(() {
    if (localId <= 0) {
      throw ArgumentError.value(
        localId,
        'localId',
        'Local ID must be a positive integer',
      );
    }

    try {
      final JwkLocalModel? key = _box.get(localId);
      return right(optionOf(key));
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Option<JwkLocalModel>> getByKeyId({
    required Uint8List keyId,
  }) => IOEither<ExceptionWithStackTrace, Option<JwkLocalModel>>(() {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      final JwkLocalModel? key =
          _box.query(JwkLocalModel_.keyId.equals(keyId)).build().findFirst();
      return right(optionOf(key));
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Set<JwkLocalModel>> getByType({
    required String keyType,
  }) => IOEither<ExceptionWithStackTrace, Set<JwkLocalModel>>(() {
    if (keyType.trim().isEmpty) {
      throw ArgumentError.value(keyType, 'keyType', 'Key type cannot be empty');
    }

    try {
      final Set<JwkLocalModel> keys =
          _box
              .query(JwkLocalModel_.keyType.equals(keyType))
              .build()
              .find()
              .toSet();
      return right(keys);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Set<JwkLocalModel>> getByCurve({
    required String curve,
  }) => IOEither<ExceptionWithStackTrace, Set<JwkLocalModel>>(() {
    if (curve.trim().isEmpty) {
      throw ArgumentError.value(curve, 'curve', 'Curve cannot be empty');
    }

    try {
      final Set<JwkLocalModel> keys =
          _box.query(JwkLocalModel_.curve.equals(curve)).build().find().toSet();
      return right(keys);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Option<JwkLocalModel>> getByProperties({
    required String keyType,
    required String curve,
    required Uint8List x,
    Option<Uint8List> y = const None(),
  }) => IOEither<ExceptionWithStackTrace, Option<JwkLocalModel>>(() {
    if (keyType.trim().isEmpty) {
      throw ArgumentError.value(keyType, 'keyType', 'Key type cannot be empty');
    }
    if (curve.trim().isEmpty) {
      throw ArgumentError.value(curve, 'curve', 'Curve cannot be empty');
    }
    if (x.isEmpty) {
      throw ArgumentError.value(x, 'x', 'X coordinate cannot be empty');
    }

    try {
      final Condition<JwkLocalModel> query = y.fold(
        () => JwkLocalModel_.keyType
            .equals(keyType)
            .and(JwkLocalModel_.curve.equals(curve))
            .and(JwkLocalModel_.x.equals(x)),
        (Uint8List yValue) => JwkLocalModel_.keyType
            .equals(keyType)
            .and(JwkLocalModel_.curve.equals(curve))
            .and(JwkLocalModel_.x.equals(x))
            .and(JwkLocalModel_.y.equals(yValue)),
      );
      final JwkLocalModel? key = _box.query(query).build().findFirst();
      return right(optionOf(key));
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Set<JwkLocalModel>> getAll() =>
      IOEither<ExceptionWithStackTrace, Set<JwkLocalModel>>(() {
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
            throw StateError('JWK with local ID: $localId not found');
          }
          AppLogger.debug('Deleted JWK with local ID: $localId');
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
      final Either<ExceptionWithStackTrace, Option<JwkLocalModel>> keyResult =
          getByKeyId(keyId: keyId).run();

      return keyResult.fold(
        left,
        (Option<JwkLocalModel> keyOption) => keyOption.fold(
          () => throw StateError('JWK not found with the specified key ID'),
          (JwkLocalModel key) => delete(localId: key.localId).run(),
        ),
      );
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> deleteByType({
    required String keyType,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (keyType.trim().isEmpty) {
      throw ArgumentError.value(keyType, 'keyType', 'Key type cannot be empty');
    }

    try {
      final Either<ExceptionWithStackTrace, Set<JwkLocalModel>> keysResult =
          getByType(keyType: keyType).run();

      return keysResult.fold(left, (Set<JwkLocalModel> keys) {
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
        return right(unit);
      });
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });
  IOEither<ExceptionWithStackTrace, Unit> deleteByCurve({
    required String curve,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    if (curve.trim().isEmpty) {
      throw ArgumentError.value(curve, 'curve', 'Curve cannot be empty');
    }

    try {
      final Either<ExceptionWithStackTrace, Set<JwkLocalModel>> keysResult =
          getByCurve(curve: curve).run();

      return keysResult.fold(left, (Set<JwkLocalModel> keys) {
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
      final int deletedCount = _box.removeMany(localIds.toList());
      if (deletedCount != localIds.length) {
        throw StateError(
          'Failed to delete all specified keys: only deleted $deletedCount out of ${localIds.length}',
        );
      }

      AppLogger.debug('Deleted $deletedCount JWKs');
      return right(unit);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> clear() =>
      IOEither<ExceptionWithStackTrace, Unit>(() {
        try {
          _box.removeAll();
          AppLogger.debug('Cleared all JWKs');
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
