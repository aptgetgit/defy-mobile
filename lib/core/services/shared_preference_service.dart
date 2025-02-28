import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../logging/app_logger.dart';

class SharedPreferencesService {
  SharedPreferencesService(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;
  final Lock _lock = Lock();

  T? get<T>({required String key}) {
    if (key.trim().isEmpty) {
      throw ArgumentError.value(
        key,
        'key',
        'Preference key cannot be empty',
      );
    }

    try {
      Object? value;

      if (T == String) {
        value = _sharedPreferences.getString(key);
      } else if (T == int) {
        value = _sharedPreferences.getInt(key);
      } else if (T == bool) {
        value = _sharedPreferences.getBool(key);
      } else if (T == double) {
        value = _sharedPreferences.getDouble(key);
      } else if (T == List<String>) {
        value = _sharedPreferences.getStringList(key);
      } else {
        throw ArgumentError('Unsupported type: ${T.runtimeType}');
      }

      AppLogger.debug('Read value for key: $key');
      return value as T?;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to read value for key: $key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to read preference: $e');
    }
  }

  Future<void> set<T>({required String key, required T value}) {
    if (key.trim().isEmpty) {
      throw ArgumentError.value(
        key,
        'key',
        'Preference key cannot be empty',
      );
    }

    if (value == null) {
      throw ArgumentError.value(
        value,
        'value',
        'Preference value cannot be null',
      );
    }

    return _lock.synchronized(() async {
      try {
        bool result;

        if (value is String) {
          result = await _sharedPreferences.setString(key, value);
        } else if (value is int) {
          result = await _sharedPreferences.setInt(key, value);
        } else if (value is bool) {
          result = await _sharedPreferences.setBool(key, value);
        } else if (value is double) {
          result = await _sharedPreferences.setDouble(key, value);
        } else if (value is List<String>) {
          result = await _sharedPreferences.setStringList(key, value);
        } else {
          throw ArgumentError('Unsupported type: ${value.runtimeType}');
        }

        if (!result) {
          throw Exception(
            'Failed to write preference: operation unsuccessful',
          );
        }
        AppLogger.debug('Wrote value for key: $key');
      } on Exception catch (e, stackTrace) {
        AppLogger.error(
          'Failed to write value for key: $key',
          error: e,
          stackTrace: stackTrace,
        );
        throw Exception('Failed to write preference: $e');
      }
    });
  }

  Future<void> remove({required String key}) {
    if (key.trim().isEmpty) {
      throw ArgumentError.value(
        key,
        'key',
        'Preference key cannot be empty',
      );
    }

    return _lock.synchronized(() async {
      try {
        final bool result = await _sharedPreferences.remove(key);
        if (!result) {
          throw Exception(
            'Failed to remove preference: operation unsuccessful',
          );
        }
        AppLogger.debug('Removed value for key: $key');
      } on Exception catch (e, stackTrace) {
        AppLogger.error(
          'Failed to remove value for key: $key',
          error: e,
          stackTrace: stackTrace,
        );
        throw Exception('Failed to remove preference: $e');
      }
    });
  }

  bool containsKey({required String key}) {
    if (key.trim().isEmpty) {
      throw ArgumentError.value(
        key,
        'key',
        'Preference key cannot be empty',
      );
    }

    try {
      final bool exists = _sharedPreferences.containsKey(key);
      AppLogger.debug('Checked if key exists: $key, result: $exists');
      return exists;
    } on Exception catch (e, stackTrace) {
      AppLogger.warning(
        'Failed to check if key exists: $key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to check if key exists: $e');
    }
  }

  Future<void> clear() => _lock.synchronized(() async {
        try {
          final bool result = await _sharedPreferences.clear();
          if (!result) {
            throw Exception(
              'Failed to clear preferences: operation unsuccessful',
            );
          }
          AppLogger.debug('Cleared all preferences');
        } on Exception catch (e, stackTrace) {
          AppLogger.error(
            'Failed to clear all preferences',
            error: e,
            stackTrace: stackTrace,
          );
          throw Exception('Failed to clear preferences: $e');
        }
      });

  Set<String> getKeys() {
    try {
      final Set<String> keys = _sharedPreferences.getKeys();
      AppLogger.debug(
        'Retrieved all preference keys: ${keys.length} items',
      );
      return keys;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get all preference keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to get preference keys: $e');
    }
  }

  int count() {
    try {
      final int count = _sharedPreferences.getKeys().length;
      AppLogger.debug('Preference key count: $count');
      return count;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to count preference keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to count preference keys: $e');
    }
  }

  String? getString({required String key}) => get<String>(key: key);
  int? getInt({required String key}) => get<int>(key: key);
  bool? getBool({required String key}) => get<bool>(key: key);
  double? getDouble({required String key}) => get<double>(key: key);
  List<String>? getStringList({required String key}) =>
      get<List<String>>(key: key);
}

class Lock {
  Completer<void>? _completer;

  Future<T> synchronized<T>(Future<T> Function() computation) async {
    while (_completer != null) {
      await _completer!.future;
    }

    _completer = Completer<void>();

    try {
      return await computation();
    } finally {
      _completer!.complete();
      _completer = null;
    }
  }
}
