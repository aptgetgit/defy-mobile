import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/db_utils.dart';
import '../../domain/entities/json_web_key.dart';
import '../../domain/repositories/private_jwk_repository_interface.dart';
import '../models/local/signing_key_local_model.dart';
import '../sources/local/private_jwk_local_data_source.dart';
import '../sources/local/signing_key_local_data_source.dart';

class PrivateJwkRepository implements IPrivateJwkRepository {
  PrivateJwkRepository({
    required Store store,
    required PrivateJwkDataSource privateJwkDataSource,
    required SigningKeyDataSource signingKeyDataSource,
  }) : _store = store,
       _privateJwkDataSource = privateJwkDataSource,
       _signingKeyDataSource = signingKeyDataSource;

  final Store _store;
  final PrivateJwkDataSource _privateJwkDataSource;
  final SigningKeyDataSource _signingKeyDataSource;

  @override
  TaskEither<ExceptionWithStackTrace, Jwk> store({required Jwk jwk}) =>
      TaskEither<ExceptionWithStackTrace, Jwk>(() async {
        if (!jwk.hasPrivateKey()) {
          throw StateError('Cannot store jwk: missing private component "d"');
        }

        try {
          final Either<ExceptionWithStackTrace, Unit> result =
              await _privateJwkDataSource
                  .store(keyId: jwk.keyId, jwk: jwk)
                  .run();

          return result.fold(left, (_) => right(jwk));
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, Option<Jwk>> get({
    required Uint8List keyId,
  }) => TaskEither<ExceptionWithStackTrace, Option<Jwk>>(() async {
    try {
      return _privateJwkDataSource.get(keyId: keyId).run();
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, bool> has({required Uint8List keyId}) =>
      TaskEither<ExceptionWithStackTrace, bool>(() async {
        try {
          return await _privateJwkDataSource.has(keyId: keyId).run();
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> delete({
    required Uint8List keyId,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
      final IOEither<ExceptionWithStackTrace, bool> checkKeyUsage =
          IOEither<ExceptionWithStackTrace, bool>(() {
            final Either<ExceptionWithStackTrace, Option<SigningKeyLocalModel>>
            signingKeyResult =
                _signingKeyDataSource.getByKeyId(keyId: keyId).run();
            if (signingKeyResult.isLeft()) {
              return left(signingKeyResult.getLeft().toNullable()!);
            }
            return right(signingKeyResult.getRight().toNullable()!.isSome());
          });

      final Either<ExceptionWithStackTrace, bool> keyUsageResult =
          await runInsideTransaction(TxMode.read, checkKeyUsage).run(_store);

      if (keyUsageResult.isLeft()) {
        return left(keyUsageResult.getLeft().toNullable()!);
      }

      final bool keyInUse = keyUsageResult.getRight().toNullable()!;
      if (keyInUse) {
        throw StateError('Cannot delete: key is used in signing configuration');
      }
      return await _privateJwkDataSource.delete(keyId: keyId).run();
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> deleteMany({
    required Set<Uint8List> keyIds,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    if (keyIds.isEmpty) {
      return right(unit);
    }
    try {
      final IOEither<ExceptionWithStackTrace, bool>
      checkKeysInUse = IOEither<ExceptionWithStackTrace, bool>(() {
        bool keyInUse = false;
        for (final Uint8List keyId in keyIds) {
          final Either<ExceptionWithStackTrace, Option<SigningKeyLocalModel>>
          signingKeyResult =
              _signingKeyDataSource.getByKeyId(keyId: keyId).run();

          if (signingKeyResult.isLeft()) {
            return left(signingKeyResult.getLeft().toNullable()!);
          }

          if (signingKeyResult.getRight().toNullable()!.isSome()) {
            keyInUse = true;
            break;
          }
        }
        return right(keyInUse);
      });

      final Either<ExceptionWithStackTrace, bool> keysInUseResult =
          await runInsideTransaction(TxMode.read, checkKeysInUse).run(_store);

      if (keysInUseResult.isLeft()) {
        return left(keysInUseResult.getLeft().toNullable()!);
      }

      final bool keysInUse = keysInUseResult.getRight().toNullable()!;
      if (keysInUse) {
        throw StateError('Cannot delete: key is used in signing configuration');
      }
      return _privateJwkDataSource.deleteMany(keyIds: keyIds).run();
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, int> count() =>
      TaskEither<ExceptionWithStackTrace, int>(() async {
        try {
          return await _privateJwkDataSource.count().run();
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, Set<Uint8List>> getAllKeyIds() =>
      TaskEither<ExceptionWithStackTrace, Set<Uint8List>>(() async {
        try {
          return await _privateJwkDataSource.getAllKeyIds().run();
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, Unit>
  clear() => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
      final Either<ExceptionWithStackTrace, Set<Uint8List>> keyIdsResult =
          await getAllKeyIds().run();

      if (keyIdsResult.isLeft()) {
        return left(keyIdsResult.getLeft().toNullable()!);
      }

      final Set<Uint8List> keyIds = keyIdsResult.getRight().toNullable()!;

      if (keyIds.isEmpty) {
        return right(unit);
      }

      final IOEither<ExceptionWithStackTrace, bool>
      checkKeysUsage = IOEither<ExceptionWithStackTrace, bool>(() {
        bool keysInUse = false;
        for (final Uint8List keyId in keyIds) {
          final Either<ExceptionWithStackTrace, Option<SigningKeyLocalModel>>
          signingKeyResult =
              _signingKeyDataSource.getByKeyId(keyId: keyId).run();

          if (signingKeyResult.isLeft()) {
            return left(signingKeyResult.getLeft().toNullable()!);
          }

          if (signingKeyResult.getRight().toNullable()!.isSome()) {
            keysInUse = true;
            break;
          }
        }
        return right(keysInUse);
      });

      final Either<ExceptionWithStackTrace, bool> keysUsageResult =
          await runInsideTransaction(TxMode.read, checkKeysUsage).run(_store);

      if (keysUsageResult.isLeft()) {
        return left(keysUsageResult.getLeft().toNullable()!);
      }

      final bool keysInUse = keysUsageResult.getRight().toNullable()!;
      if (keysInUse) {
        throw StateError('Cannot clear: keys used in signing configuration');
      }

      return _privateJwkDataSource.clear().run();
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });
}
