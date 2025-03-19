import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../../../../../core/services/secure_storage_service.dart';
import '../../../../../utils/hex_utils.dart';
import '../../../domain/entities/json_web_key.dart';

class PrivateJwkDataSource {
  PrivateJwkDataSource({required SecureStorageService secureStorage})
    : _secureStorage = secureStorage;

  static const String _prefix = 'private:';
  final SecureStorageService _secureStorage;

  String _makeKey(Uint8List keyId) {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    return '$_prefix${bytesToHex(keyId)}';
  }

  TaskEither<ExceptionWithStackTrace, Unit> store({
    required Uint8List keyId,
    required Jwk jwk,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    if (!jwk.hasPrivateKey()) {
      throw ArgumentError.value(
        jwk,
        'jwk',
        'JWK must contain a private key component',
      );
    }

    try {
      final String key = _makeKey(keyId);

      final Either<ExceptionWithStackTrace, bool> existsResult =
          await has(keyId: keyId).run();

      return existsResult.fold(left, (bool exists) async {
        if (exists) {
          throw StateError('Private key already exists for the given key ID');
        }

        final String jwkJson = json.encode(jwk.toJson());

        final Either<ExceptionWithStackTrace, Unit> writeResult =
            await _secureStorage.write(key: key, value: jwkJson).run();

        return writeResult.fold(left, (_) {
          AppLogger.debug(
            'Stored private key for key ID: ${bytesToHex(keyId)}',
          );
          return right(unit);
        });
      });
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, Option<Jwk>> get({
    required Uint8List keyId,
  }) => TaskEither<ExceptionWithStackTrace, Option<Jwk>>(() async {
    try {
      final String key = _makeKey(keyId);

      final Either<ExceptionWithStackTrace, Option<String>> readResult =
          await _secureStorage.read(key: key).run();

      return readResult.fold(
        left,
        (
          Option<String> jwkJsonOption,
        ) => jwkJsonOption.fold(() => right(const Option<Jwk>.none()), (
          String jwkJson,
        ) {
          final Jwk jwk = Jwk.fromJson(
            json.decode(jwkJson) as Map<String, dynamic>,
          );

          if (!jwk.hasPrivateKey()) {
            AppLogger.warning(
              'Retrieved JWK missing private component "d" for key ID: ${bytesToHex(keyId)}',
            );
            throw StateError('Retrieved JWK missing private component "d"');
          }

          return right(Option<Jwk>.of(jwk));
        }),
      );
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, bool> has({required Uint8List keyId}) =>
      TaskEither<ExceptionWithStackTrace, bool>(() async {
        final String key = _makeKey(keyId);
        return _secureStorage.containsKey(key: key).run();
      });

  TaskEither<ExceptionWithStackTrace, Unit> delete({
    required Uint8List keyId,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    final String key = _makeKey(keyId);

    try {
      final Either<ExceptionWithStackTrace, bool> existsResult =
          await has(keyId: keyId).run();

      return await existsResult.fold(left, (bool exists) async {
        if (!exists) {
          throw StateError('No private key found for the given key ID');
        }

        final Either<ExceptionWithStackTrace, Unit> deleteResult =
            await _secureStorage.delete(key: key).run();

        return deleteResult.fold(left, (_) {
          AppLogger.debug(
            'Deleted private key for key ID: ${bytesToHex(keyId)}',
          );
          return right(unit);
        });
      });
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, Unit> deleteMany({
    required Set<Uint8List> keyIds,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    if (keyIds.isEmpty) {
      throw ArgumentError.value(
        keyIds,
        'keyIds',
        'Key IDs set cannot be empty',
      );
    }

    final Set<String> keys = keyIds.map(_makeKey).toSet();

    try {
      final List<Either<ExceptionWithStackTrace, bool>> existenceResults =
          await Future.wait(
            keyIds.map((Uint8List keyId) => has(keyId: keyId).run()).toList(),
          );

      final List<Either<ExceptionWithStackTrace, bool>> errors =
          existenceResults
              .where(
                (Either<ExceptionWithStackTrace, bool> result) =>
                    result.isLeft(),
              )
              .toList();

      if (errors.isNotEmpty) {
        final Option<ExceptionWithStackTrace> errorOption =
            errors.first.getLeft();
        if (errorOption.isSome()) {
          return left(errorOption.toNullable()!);
        }
      }

      final bool allKeysExist = existenceResults
          .map(
            (Either<ExceptionWithStackTrace, bool> result) =>
                result.getOrElse((_) => false),
          )
          .every((bool exists) => exists);

      if (!allKeysExist) {
        throw StateError('Not all private keys exist');
      }

      final List<Either<ExceptionWithStackTrace, Unit>> deleteResults =
          await Future.wait(
            keys
                .map((String key) => _secureStorage.delete(key: key).run())
                .toList(),
          );

      final List<Either<ExceptionWithStackTrace, Unit>> deleteErrors =
          deleteResults
              .where(
                (Either<ExceptionWithStackTrace, Unit> result) =>
                    result.isLeft(),
              )
              .toList();

      if (deleteErrors.isNotEmpty) {
        return deleteErrors.first;
      }

      AppLogger.debug('Deleted ${keyIds.length} private keys');
      return right(unit);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, Set<Uint8List>> getAllKeyIds() =>
      TaskEither<ExceptionWithStackTrace, Set<Uint8List>>(() async {
        try {
          final Either<ExceptionWithStackTrace, Set<String>> readAllResult =
              await _secureStorage.readAll().run();

          return readAllResult.fold(left, (Set<String> allValues) {
            final Set<Uint8List> result =
                allValues
                    .where((String key) => key.startsWith(_prefix))
                    .map((String key) => key.substring(_prefix.length))
                    .map(hexToBytes)
                    .toSet();

            return right(result);
          });
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  TaskEither<ExceptionWithStackTrace, int> count() =>
      TaskEither<ExceptionWithStackTrace, int>(() async {
        try {
          final Either<ExceptionWithStackTrace, Set<String>> readAllResult =
              await _secureStorage.readAll().run();

          return readAllResult.fold(left, (Set<String> allValues) {
            final int count =
                allValues.where((String key) => key.startsWith(_prefix)).length;
            return right(count);
          });
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  TaskEither<ExceptionWithStackTrace, Unit> clear() =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          final Either<ExceptionWithStackTrace, Set<String>> readAllResult =
              await _secureStorage.readAll().run();

          return await readAllResult.fold(left, (Set<String> allValues) async {
            final Set<String> privateKeys =
                allValues
                    .where((String key) => key.startsWith(_prefix))
                    .toSet();

            if (privateKeys.isEmpty) {
              return right(unit);
            }

            final Iterable<Future<Either<ExceptionWithStackTrace, Unit>>>
            futures = privateKeys.map(
              (String key) => _secureStorage.delete(key: key).run(),
            );

            final List<Either<ExceptionWithStackTrace, Unit>> results =
                await Future.wait(futures);

            final Set<Either<ExceptionWithStackTrace, Unit>> errors =
                results
                    .where(
                      (Either<ExceptionWithStackTrace, Unit> result) =>
                          result.isLeft(),
                    )
                    .toSet();

            if (errors.isNotEmpty) {
              return errors.first;
            }

            AppLogger.debug('Cleared all private keys');
            return right(unit);
          });
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });
}
