import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage;
  final _lock = Lock();

  SecureStorageService(this._storage);

  String _hashKey(String key) {
    var bytes = utf8.encode(key); // Convert the string to bytes
    var digest = sha256.convert(bytes); // Create SHA256 hash
    return digest.toString();
  }

  Future<String?> read(String key) async {
    return _lock.synchronized(() async {
      try {
        final hashedKey = _hashKey(key);
        final value = await _storage.read(key: hashedKey);
        AppLogger.debug('Read value for key: $key');
        return value;
      } catch (e) {
        AppLogger.warning('Failed to read value for key: $key', error: e);
        return null;
      }
    });
  }

  Future<void> write(String key, String value) async {
    return _lock.synchronized(() async {
      try {
        final hashedKey = _hashKey(key);
        await _storage.write(key: hashedKey, value: value);
        AppLogger.debug('Wrote value for key: $key');
      } catch (e) {
        AppLogger.error('Failed to write value for key: $key', error: e);
        rethrow;
      }
    });
  }

  Future<void> delete(String key) async {
    return _lock.synchronized(() async {
      try {
        final hashedKey = _hashKey(key);
        await _storage.delete(key: hashedKey);
        AppLogger.debug('Deleted value for key: $key');
      } catch (e) {
        AppLogger.error('Failed to delete value for key: $key', error: e);
        rethrow;
      }
    });
  }

  Future<void> deleteAll() async {
    return _lock.synchronized(() async {
      try {
        await _storage.deleteAll();
        AppLogger.debug('Deleted all stored values');
      } catch (e) {
        AppLogger.error('Failed to delete all stored values', error: e);
        rethrow;
      }
    });
  }

  Future<Map<String, String>> readAll() async {
    return _lock.synchronized(() async {
      try {
        final allValues = await _storage.readAll();
        AppLogger.debug('Read all stored values');
        return allValues;
      } catch (e) {
        AppLogger.error('Failed to read all stored values', error: e);
        return {};
      }
    });
  }

  Future<bool> containsKey(String key) async {
    return _lock.synchronized(() async {
      try {
        final hashedKey = _hashKey(key);
        final containsKey = await _storage.containsKey(key: hashedKey);
        AppLogger.debug('Checked if key exists: $key');
        return containsKey;
      } catch (e) {
        AppLogger.warning('Failed to check if key exists: $key', error: e);
        return false;
      }
    });
  }
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
