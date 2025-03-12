import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:mutex/mutex.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../error/exception_with_stack_trace.dart';
import '../logging/app_logger.dart';

class SharedPreferencesService {
  SharedPreferencesService(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;
  final ReadWriteMutex _mutex = ReadWriteMutex();

  String _validateKey(String key) {
    if (key.trim().isEmpty) {
      throw ArgumentError.value(key, 'key', 'Preference key cannot be empty');
    }
    return key;
  }

  ReaderTaskEither<ReadWriteMutex, ExceptionWithStackTrace, A> _protect<A>(
    TaskEither<ExceptionWithStackTrace, A> computation,
    Future<void> Function(ReadWriteMutex) acquireLock,
    String errorMessage,
  ) => ReaderTaskEither<ReadWriteMutex, ExceptionWithStackTrace, A>((
    ReadWriteMutex mutex,
  ) async {
    try {
      await acquireLock(mutex);
      return await computation.run();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(errorMessage, error: e, stackTrace: stackTrace);
      return left(ExceptionWithStackTrace(e, stackTrace));
    } finally {
      mutex.release();
    }
  });

  ReaderTaskEither<ReadWriteMutex, ExceptionWithStackTrace, A> protectRead<A>(
    TaskEither<ExceptionWithStackTrace, A> computation,
  ) => _protect(
    computation,
    (ReadWriteMutex mutex) => mutex.acquireRead(),
    'Failed to read from preferences',
  );

  ReaderTaskEither<ReadWriteMutex, ExceptionWithStackTrace, A> protectWrite<A>(
    TaskEither<ExceptionWithStackTrace, A> computation,
  ) => _protect(
    computation,
    (ReadWriteMutex mutex) => mutex.acquireWrite(),
    'Failed to write to preferences',
  );

  TaskEither<ExceptionWithStackTrace, Option<T>> get<T>({
    required String key,
  }) => TaskEither<ExceptionWithStackTrace, Option<T>>(() async {
    try {
      final String validKey = _validateKey(key);
      final TaskEither<ExceptionWithStackTrace, Option<T>> getOperation =
          TaskEither<ExceptionWithStackTrace, Option<T>>(() async {
            try {
              Object? value;

              if (T == String) {
                value = _sharedPreferences.getString(validKey);
              } else if (T == int) {
                value = _sharedPreferences.getInt(validKey);
              } else if (T == bool) {
                value = _sharedPreferences.getBool(validKey);
              } else if (T == double) {
                value = _sharedPreferences.getDouble(validKey);
              } else if (T == List<String>) {
                value = _sharedPreferences.getStringList(validKey);
              } else {
                throw ArgumentError('Unsupported type: ${T.runtimeType}');
              }

              AppLogger.debug('Read value for key: $validKey');
              return right(Option<T>.fromNullable(value as T?));
            } on Exception catch (e, stackTrace) {
              return left(ExceptionWithStackTrace(e, stackTrace));
            }
          });

      return protectRead(getOperation).run(_mutex);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, Option<String>> getString({
    required String key,
  }) => get<String>(key: key);

  TaskEither<ExceptionWithStackTrace, Option<int>> getInt({
    required String key,
  }) => get<int>(key: key);

  TaskEither<ExceptionWithStackTrace, Option<bool>> getBool({
    required String key,
  }) => get<bool>(key: key);

  TaskEither<ExceptionWithStackTrace, Option<double>> getDouble({
    required String key,
  }) => get<double>(key: key);

  TaskEither<ExceptionWithStackTrace, Option<List<String>>> getStringList({
    required String key,
  }) => get<List<String>>(key: key);

  TaskEither<ExceptionWithStackTrace, Unit> set<T>({
    required String key,
    required T value,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    if (value == null) {
      throw ArgumentError.value(
        value,
        'value',
        'Preference value cannot be null',
      );
    }

    try {
      final String validKey = _validateKey(key);
      final TaskEither<ExceptionWithStackTrace, Unit> setOperation =
          TaskEither<ExceptionWithStackTrace, Unit>(() async {
            try {
              bool result;

              if (value is String) {
                result = await _sharedPreferences.setString(validKey, value);
              } else if (value is int) {
                result = await _sharedPreferences.setInt(validKey, value);
              } else if (value is bool) {
                result = await _sharedPreferences.setBool(validKey, value);
              } else if (value is double) {
                result = await _sharedPreferences.setDouble(validKey, value);
              } else if (value is List<String>) {
                result = await _sharedPreferences.setStringList(
                  validKey,
                  value,
                );
              } else {
                throw ArgumentError('Unsupported type: ${value.runtimeType}');
              }

              if (!result) {
                throw Exception(
                  'Failed to write preference: operation unsuccessful',
                );
              }

              AppLogger.debug('Wrote value for key: $validKey');
              return right(unit);
            } on Exception catch (e, stackTrace) {
              return left(ExceptionWithStackTrace(e, stackTrace));
            }
          });

      return protectWrite(setOperation).run(_mutex);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, Unit> remove({required String key}) =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          final String validKey = _validateKey(key);
          final TaskEither<ExceptionWithStackTrace, Unit> removeOperation =
              TaskEither<ExceptionWithStackTrace, Unit>(() async {
                try {
                  final bool result = await _sharedPreferences.remove(validKey);

                  if (!result) {
                    throw Exception(
                      'Failed to remove preference: operation unsuccessful',
                    );
                  }

                  AppLogger.debug('Removed value for key: $validKey');
                  return right(unit);
                } on Exception catch (e, stackTrace) {
                  return left(ExceptionWithStackTrace(e, stackTrace));
                }
              });

          return protectWrite(removeOperation).run(_mutex);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  TaskEither<ExceptionWithStackTrace, Unit> clear() =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        final TaskEither<ExceptionWithStackTrace, Unit> clearOperation =
            TaskEither<ExceptionWithStackTrace, Unit>(() async {
              try {
                final bool result = await _sharedPreferences.clear();

                if (!result) {
                  throw Exception(
                    'Failed to clear preferences: operation unsuccessful',
                  );
                }

                AppLogger.debug('Cleared all preferences');
                return right(unit);
              } on Exception catch (e, stackTrace) {
                return left(ExceptionWithStackTrace(e, stackTrace));
              }
            });

        return protectWrite(clearOperation).run(_mutex);
      });

  TaskEither<ExceptionWithStackTrace, bool> containsKey({
    required String key,
  }) => TaskEither<ExceptionWithStackTrace, bool>(() async {
    try {
      final String validKey = _validateKey(key);
      final TaskEither<ExceptionWithStackTrace, bool> containsKeyOperation =
          TaskEither<ExceptionWithStackTrace, bool>(() async {
            try {
              final bool exists = _sharedPreferences.containsKey(validKey);
              AppLogger.debug(
                'Checked if key exists: $validKey, result: $exists',
              );
              return right(exists);
            } on Exception catch (e, stackTrace) {
              return left(ExceptionWithStackTrace(e, stackTrace));
            }
          });

      return protectRead(containsKeyOperation).run(_mutex);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  TaskEither<ExceptionWithStackTrace, Set<String>> getKeys() =>
      TaskEither<ExceptionWithStackTrace, Set<String>>(() async {
        final TaskEither<ExceptionWithStackTrace, Set<String>>
        getKeysOperation = TaskEither<ExceptionWithStackTrace, Set<String>>(
          () async {
            try {
              final Set<String> keys = _sharedPreferences.getKeys();
              AppLogger.debug(
                'Retrieved all preference keys: ${keys.length} items',
              );
              return right(keys);
            } on Exception catch (e, stackTrace) {
              return left(ExceptionWithStackTrace(e, stackTrace));
            }
          },
        );

        return protectRead(getKeysOperation).run(_mutex);
      });

  TaskEither<ExceptionWithStackTrace, int> count() =>
      TaskEither<ExceptionWithStackTrace, int>(() async {
        final TaskEither<ExceptionWithStackTrace, int> countOperation =
            TaskEither<ExceptionWithStackTrace, int>(() async {
              try {
                final int count = _sharedPreferences.getKeys().length;
                AppLogger.debug('Preference key count: $count');
                return right(count);
              } on Exception catch (e, stackTrace) {
                return left(ExceptionWithStackTrace(e, stackTrace));
              }
            });

        return protectRead(countOperation).run(_mutex);
      });
}
