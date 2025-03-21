import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mutex/mutex.dart';

import '../../shared/utils/crypto_utils.dart';
import '../../shared/utils/hex_utils.dart';
import '../../shared/utils/mutex_utils.dart';
import '../error/exception_with_stack_trace.dart';
import '../logging/app_logger.dart';

class SecureStorageService {
  SecureStorageService(this._storage);
  final FlutterSecureStorage _storage;
  final ReadWriteMutex _mutex = ReadWriteMutex();

  String _hashKey(String key) {
    if (key.trim().isEmpty) {
      throw ArgumentError.value(key, 'key', 'Storage key cannot be empty');
    }

    final Uint8List encodedBytes = utf8.encode(key);
    final Uint8List hash = computeSha256Hash(encodedBytes);
    return bytesToHex(hash);
  }

  TaskEither<ExceptionWithStackTrace, Option<String>> read({
    required String key,
  }) =>
      TaskEither<ExceptionWithStackTrace, Option<String>>(() async {
        try {
          final String hashedKey = _hashKey(key);
          final TaskEither<ExceptionWithStackTrace, Option<String>>
              readOperation =
              TaskEither<ExceptionWithStackTrace, Option<String>>(() async {
            try {
              final String? value = await _storage.read(key: hashedKey);
              AppLogger.debug('Read value for key: $key');
              return right(Option<String>.fromNullable(value));
            } on Exception catch (e, stackTrace) {
              return left(ExceptionWithStackTrace(e, stackTrace));
            }
          });

          return protectRead(readOperation).run(_mutex);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  TaskEither<ExceptionWithStackTrace, Unit> write({
    required String key,
    required String value,
  }) =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        if (value.isEmpty) {
          throw ArgumentError.value(
            value,
            'value',
            'Storage value cannot be empty',
          );
        }
        try {
          final String hashedKey = _hashKey(key);
          final TaskEither<ExceptionWithStackTrace, Unit> writeOperation =
              TaskEither<ExceptionWithStackTrace, Unit>(() async {
            try {
              await _storage.write(key: hashedKey, value: value);
              AppLogger.debug('Wrote value for key: $key');
              return right(unit);
            } on Exception catch (e, stackTrace) {
              return left(ExceptionWithStackTrace(e, stackTrace));
            }
          });

          return protectWrite(writeOperation).run(_mutex);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  TaskEither<ExceptionWithStackTrace, Unit> delete({required String key}) =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          final String hashedKey = _hashKey(key);
          final TaskEither<ExceptionWithStackTrace, Unit> deleteOperation =
              TaskEither<ExceptionWithStackTrace, Unit>(() async {
            try {
              await _storage.delete(key: hashedKey);
              AppLogger.debug('Deleted value for key: $key');
              return right(unit);
            } on Exception catch (e, stackTrace) {
              return left(ExceptionWithStackTrace(e, stackTrace));
            }
          });

          return protectWrite(deleteOperation).run(_mutex);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  TaskEither<ExceptionWithStackTrace, Unit> deleteAll() =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        final TaskEither<ExceptionWithStackTrace, Unit> deleteAllOperation =
            TaskEither<ExceptionWithStackTrace, Unit>(() async {
          try {
            await _storage.deleteAll();
            AppLogger.debug('Deleted all stored values');
            return right(unit);
          } on Exception catch (e, stackTrace) {
            return left(ExceptionWithStackTrace(e, stackTrace));
          }
        });

        return protectWrite(deleteAllOperation).run(_mutex);
      });

  TaskEither<ExceptionWithStackTrace, Set<String>> readAll() =>
      TaskEither<ExceptionWithStackTrace, Set<String>>(() async {
        final TaskEither<ExceptionWithStackTrace, Set<String>>
            readAllOperation = TaskEither<ExceptionWithStackTrace, Set<String>>(
          () async {
            try {
              final Set<String> allValues =
                  (await _storage.readAll()).keys.toSet();
              AppLogger.debug(
                'Read all stored values: ${allValues.length} items',
              );
              return right(allValues);
            } on Exception catch (e, stackTrace) {
              return left(ExceptionWithStackTrace(e, stackTrace));
            }
          },
        );

        return protectRead(readAllOperation).run(_mutex);
      });

  TaskEither<ExceptionWithStackTrace, bool> containsKey({
    required String key,
  }) =>
      TaskEither<ExceptionWithStackTrace, bool>(() async {
        try {
          final String hashedKey = _hashKey(key);
          final TaskEither<ExceptionWithStackTrace, bool> containsKeyOperation =
              TaskEither<ExceptionWithStackTrace, bool>(() async {
            try {
              final bool containsKey = await _storage.containsKey(
                key: hashedKey,
              );
              AppLogger.debug(
                'Checked if key exists: $key, result: $containsKey',
              );
              return right(containsKey);
            } on Exception catch (e, stackTrace) {
              return left(ExceptionWithStackTrace(e, stackTrace));
            }
          });

          return protectRead(containsKeyOperation).run(_mutex);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  TaskEither<ExceptionWithStackTrace, int> count() =>
      TaskEither<ExceptionWithStackTrace, int>(() async {
        final TaskEither<ExceptionWithStackTrace, int> countOperation =
            TaskEither<ExceptionWithStackTrace, int>(() async {
          try {
            final Map<String, String> allValues = await _storage.readAll();
            final int count = allValues.length;
            AppLogger.debug('Storage key count: $count');
            return right(count);
          } on Exception catch (e, stackTrace) {
            return left(ExceptionWithStackTrace(e, stackTrace));
          }
        });

        return protectRead(countOperation).run(_mutex);
      });
}
