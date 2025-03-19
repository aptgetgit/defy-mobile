import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../../../../../core/services/secure_storage_service.dart';
import '../../../../../utils/hex_utils.dart';

class EntropyDataSource {
  EntropyDataSource({required SecureStorageService secureStorage})
    : _secureStorage = secureStorage;

  static const String _prefix = 'entropy:';

  final SecureStorageService _secureStorage;

  String _makeKey(Uint8List hash) {
    if (hash.length != 32) {
      throw ArgumentError.value(
        hash,
        'hash',
        'SHA-256 hash must be exactly 32 bytes in length',
      );
    }

    return '$_prefix${bytesToHex(hash)}';
  }

  TaskEither<ExceptionWithStackTrace, Unit> store({
    required Uint8List hash,
    required Uint8List entropy,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    if (entropy.isEmpty ||
        entropy.length % 4 != 0 ||
        entropy.length < 16 ||
        entropy.length > 32) {
      throw ArgumentError.value(
        entropy,
        'entropy',
        'BIP39 entropy must be between 16 and 32 bytes and a multiple of 4 bytes',
      );
    }
    try {
      final String key = _makeKey(hash);
      final Either<ExceptionWithStackTrace, bool> existsResult =
          await has(hash: hash).run();

      return existsResult.fold(left, (bool exists) async {
      if (exists) {
        throw StateError('Entropy already exists for the given hash');
      }

      final String entropyHex = bytesToHex(entropy);
      final Either<ExceptionWithStackTrace, Unit> writeResult =
          await _secureStorage.write(key: key, value: entropyHex).run();

      return writeResult.fold(left, (_) {
        AppLogger.debug('Stored entropy for hash: ${bytesToHex(hash)}');
        return right(unit);
      });
    });
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, Option<Uint8List>> get({
    required Uint8List hash,
  }) => TaskEither<ExceptionWithStackTrace, Option<Uint8List>>(() async {
    try {
      final Either<ExceptionWithStackTrace, Option<String>> readResult =
          await _secureStorage.read(key: _makeKey(hash)).run();

      return readResult.fold(
        left,
        (Option<String> encodedOption) => right(encodedOption.map(hexToBytes)),
      );
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, bool> has({required Uint8List hash}) =>
      TaskEither<ExceptionWithStackTrace, bool>(() async {
        final String key = _makeKey(hash);
        return _secureStorage.containsKey(key: key).run();
      });

  TaskEither<ExceptionWithStackTrace, Unit> delete({required Uint8List hash}) =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          final Either<ExceptionWithStackTrace, bool> existsResult =
              await has(hash: hash).run();
          return existsResult.fold(left, (bool exists) async {
            if (!exists) {
              throw StateError('No entropy found for the given hash');
            }
            final Either<ExceptionWithStackTrace, Unit> deleteResult =
                await _secureStorage.delete(key: _makeKey(hash)).run();
            return deleteResult.fold(left, (_) {
              AppLogger.debug('Deleted entropy for hash: $hash');
              return right(unit);
            });
          });
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  TaskEither<ExceptionWithStackTrace, Unit> deleteMany({
    required Set<Uint8List> hashes,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    if (hashes.isEmpty) {
      throw ArgumentError.value(hashes, 'hashes', 'Hash set cannot be empty');
    }
    final Set<String> keys = hashes.map(_makeKey).toSet();
    try {
      final List<Either<ExceptionWithStackTrace, bool>>
      existenceResolvedFutures = await Future.wait(
        keys
            .map((String key) => _secureStorage.containsKey(key: key).run())
            .toSet(),
      );

      final List<Either<ExceptionWithStackTrace, bool>>
      existenceResultsExceptions =
          existenceResolvedFutures
              .where(
                (Either<ExceptionWithStackTrace, bool> result) =>
                    result.isLeft(),
              )
              .toList();

      if (existenceResultsExceptions.isNotEmpty) {
        final Option<ExceptionWithStackTrace> errorOption =
            existenceResultsExceptions.first.getLeft();

        if (errorOption.isSome()) {
          return left(errorOption.toNullable()!);
        }
      }

      final bool allKeysExist = existenceResolvedFutures
          .map(
            (Either<ExceptionWithStackTrace, bool> result) =>
                result.getOrElse((_) => false),
          )
          .every((bool exists) => exists);

      if (!allKeysExist) {
        throw StateError('Not all hashes exists');
      }

      final List<Either<ExceptionWithStackTrace, Unit>> deleteResolvedFutures =
          await Future.wait(
            keys
                .map((String key) => _secureStorage.delete(key: key).run())
                .toSet(),
          );

      final List<Either<ExceptionWithStackTrace, Unit>>
      deleteResultsExceptions =
          deleteResolvedFutures
              .where(
                (Either<ExceptionWithStackTrace, Unit> result) =>
                    result.isLeft(),
              )
              .toList();

      if (deleteResultsExceptions.isNotEmpty) {
        return deleteResultsExceptions.first;
      }

      AppLogger.debug('Deleted ${hashes.length} entropies');
      return right(unit);
    } on Exception catch (error, stackTrace) {
      return left(ExceptionWithStackTrace(error, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, Set<Uint8List>> getAllHashes() =>
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

  TaskEither<ExceptionWithStackTrace, Unit>
  clear() => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
      final Either<ExceptionWithStackTrace, Set<String>> readAllResult =
          await _secureStorage.readAll().run();

      return await readAllResult.fold(left, (Set<String> allValues) async {
        final Set<String> entropyKeys =
            allValues.where((String key) => key.startsWith(_prefix)).toSet();

        if (entropyKeys.isEmpty) {
          return right(unit);
        }

        final Iterable<Future<Either<ExceptionWithStackTrace, Unit>>> futures =
            entropyKeys.map(
              (String key) => _secureStorage.delete(key: key).run(),
            );

        final List<Either<ExceptionWithStackTrace, Unit>> results =
            await Future.wait(futures);

        final Iterable<Either<ExceptionWithStackTrace, Unit>> errors = results
            .where(
              (Either<ExceptionWithStackTrace, Unit> result) => result.isLeft(),
            );
        if (errors.isNotEmpty) {
          return errors.first;
        }

        AppLogger.debug('Cleared all entropies');
        return right(unit);
      });
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });
}
