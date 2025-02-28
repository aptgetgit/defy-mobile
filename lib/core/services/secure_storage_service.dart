import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../logging/app_logger.dart';

class SecureStorageService {
  SecureStorageService(this._storage);
  final FlutterSecureStorage _storage;
  final Lock _lock = Lock();

  String _hashKey(String key) {
    final Uint8List bytes = utf8.encode(key);
    final Digest digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<String?> read({required String key}) async {
    if (key.trim().isEmpty) {
      throw ArgumentError.value(
        key,
        'key',
        'Storage key cannot be empty',
      );
    }

    return _lock.synchronized(() async {
      try {
        final String hashedKey = _hashKey(key);
        final String? value = await _storage.read(key: hashedKey);
        AppLogger.debug('Read value for key: $key');
        return value;
      } on Exception catch (e, stackTrace) {
        AppLogger.error(
          'Failed to read value for key: $key',
          error: e,
          stackTrace: stackTrace,
        );
        throw Exception('Failed to read from secure storage: $e');
      }
    });
  }

  Future<void> write({required String key, required String value}) async {
    if (key.trim().isEmpty) {
      throw ArgumentError.value(
        key,
        'key',
        'Storage key cannot be empty',
      );
    }

    if (value.isEmpty) {
      throw ArgumentError.value(
        value,
        'value',
        'Storage value cannot be empty',
      );
    }

    return _lock.synchronized(() async {
      try {
        final String hashedKey = _hashKey(key);
        await _storage.write(key: hashedKey, value: value);
        AppLogger.debug('Wrote value for key: $key');
      } on Exception catch (e, stackTrace) {
        AppLogger.error(
          'Failed to write value for key: $key',
          error: e,
          stackTrace: stackTrace,
        );
        throw Exception('Failed to write to secure storage: $e');
      }
    });
  }

  Future<void> delete({required String key}) async {
    if (key.trim().isEmpty) {
      throw ArgumentError.value(
        key,
        'key',
        'Storage key cannot be empty',
      );
    }

    return _lock.synchronized(() async {
      try {
        final String hashedKey = _hashKey(key);
        await _storage.delete(key: hashedKey);
        AppLogger.debug('Deleted value for key: $key');
      } on Exception catch (e, stackTrace) {
        AppLogger.error(
          'Failed to delete value for key: $key',
          error: e,
          stackTrace: stackTrace,
        );
        throw Exception('Failed to delete from secure storage: $e');
      }
    });
  }

  Future<void> deleteAll() async => _lock.synchronized(() async {
        try {
          await _storage.deleteAll();
          AppLogger.debug('Deleted all stored values');
        } on Exception catch (e, stackTrace) {
          AppLogger.error(
            'Failed to delete all stored values',
            error: e,
            stackTrace: stackTrace,
          );
          throw Exception(
            'Failed to delete all values from secure storage: $e',
          );
        }
      });

  Future<Set<String>> readAll() async => _lock.synchronized(() async {
        try {
          final Set<String> allValues = (await _storage.readAll()).keys.toSet();
          AppLogger.debug('Read all stored values: ${allValues.length} items');
          return allValues;
        } on Exception catch (e, stackTrace) {
          AppLogger.error(
            'Failed to read all stored values',
            error: e,
            stackTrace: stackTrace,
          );
          throw Exception('Failed to read all values from secure storage: $e');
        }
      });

  Future<bool> containsKey({required String key}) async {
    if (key.trim().isEmpty) {
      throw ArgumentError.value(
        key,
        'key',
        'Storage key cannot be empty',
      );
    }

    return _lock.synchronized(() async {
      try {
        final String hashedKey = _hashKey(key);
        final bool containsKey = await _storage.containsKey(key: hashedKey);
        AppLogger.debug('Checked if key exists: $key, result: $containsKey');
        return containsKey;
      } on Exception catch (e, stackTrace) {
        AppLogger.warning(
          'Failed to check if key exists: $key',
          error: e,
          stackTrace: stackTrace,
        );
        return false;
      }
    });
  }

  Future<int> count() async => _lock.synchronized(() async {
        try {
          final Map<String, String> allValues = await _storage.readAll();
          final int count = allValues.length;
          AppLogger.debug('Storage key count: $count');
          return count;
        } on Exception catch (e, stackTrace) {
          AppLogger.error(
            'Failed to count keys in storage',
            error: e,
            stackTrace: stackTrace,
          );
          throw Exception('Failed to count keys in secure storage: $e');
        }
      });
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
