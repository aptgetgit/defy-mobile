import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

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

  Future<String?> read(String key) async => _lock.synchronized(() async {
        try {
          final String hashedKey = _hashKey(key);
          final String? value = await _storage.read(key: hashedKey);
          AppLogger.debug('Read value for key: $key');
          return value;
        } on Exception catch (e) {
          AppLogger.warning('Failed to read value for key: $key', error: e);
          return null;
        }
      });

  Future<void> write(String key, String value) async =>
      _lock.synchronized(() async {
        try {
          final String hashedKey = _hashKey(key);
          await _storage.write(key: hashedKey, value: value);
          AppLogger.debug('Wrote value for key: $key');
        } catch (e) {
          AppLogger.error('Failed to write value for key: $key', error: e);
          rethrow;
        }
      });

  Future<void> delete(String key) async => _lock.synchronized(() async {
        try {
          final String hashedKey = _hashKey(key);
          await _storage.delete(key: hashedKey);
          AppLogger.debug('Deleted value for key: $key');
        } catch (e) {
          AppLogger.error('Failed to delete value for key: $key', error: e);
          rethrow;
        }
      });

  Future<void> deleteAll() async => _lock.synchronized(() async {
        try {
          await _storage.deleteAll();
          AppLogger.debug('Deleted all stored values');
        } catch (e) {
          AppLogger.error('Failed to delete all stored values', error: e);
          rethrow;
        }
      });

  Future<Map<String, String>> readAll() async => _lock.synchronized(() async {
        try {
          final Map<String, String> allValues = await _storage.readAll();
          AppLogger.debug('Read all stored values');
          return allValues;
        } on Exception catch (e) {
          AppLogger.error('Failed to read all stored values', error: e);
          return <String, String>{};
        }
      });

  Future<bool> containsKey(String key) async => _lock.synchronized(() async {
        try {
          final String hashedKey = _hashKey(key);
          final bool containsKey = await _storage.containsKey(key: hashedKey);
          AppLogger.debug('Checked if key exists: $key');
          return containsKey;
        } on Exception catch (e) {
          AppLogger.warning('Failed to check if key exists: $key', error: e);
          return false;
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
