import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../../../core/services/secure_storage_service.dart';
import '../../../../utils/hex_utils.dart';
import '../../../domain/entities/json_web_key.dart';

class PrivateJwkDataSource {
  PrivateJwkDataSource({required SecureStorageService secureStorage})
      : _secureStorage = secureStorage;

  static const String _prefix = 'private:';
  final SecureStorageService _secureStorage;

  String _makeKey(Uint8List keyId) => '$_prefix${bytesToHex(keyId)}';

  Future<void> store({required Uint8List keyId, required Jwk jwk}) async {
    if (await has(keyId: keyId)) {
      throw StateError('Private key already exists');
    }

    try {
      await _secureStorage.write(_makeKey(keyId), json.encode(jwk.toJson()));
    } on PlatformException catch (e) {
      throw StateError('Failed to store private key: ${e.message}');
    }
  }

  Future<Jwk?> get({required Uint8List keyId}) async {
    try {
      final String? jwkJson = await _secureStorage.read(_makeKey(keyId));
      if (jwkJson == null) {
        return null;
      }

      final Jwk jwk =
          Jwk.fromJson(json.decode(jwkJson) as Map<String, dynamic>);


      if (!jwk.hasPrivateKey()) {
        throw StateError('Retrieved JWK missing private component "d"');
      }

      return jwk;
    } on PlatformException catch (e) {
      throw StateError('Failed to retrieve private key: ${e.message}');
    }
  }

  Future<bool> has({required Uint8List keyId}) async {
    try {
      final String? jwkJson = await _secureStorage.read(_makeKey(keyId));
      if (jwkJson == null) {
        return false;
      }

      final Jwk jwk =
          Jwk.fromJson(json.decode(jwkJson) as Map<String, dynamic>);

      return jwk.hasPrivateKey();
    } on PlatformException catch (e) {
      throw StateError('Failed to check private key: ${e.message}');
    }
  }

  Future<void> delete({required Uint8List keyId}) async {
    try {
      await _secureStorage.delete(_makeKey(keyId));
    } on PlatformException catch (e) {
      throw StateError('Failed to delete private key: ${e.message}');
    }
  }

  Future<void> deleteMany(List<Uint8List> keyIds) async {
    try {
      for (final Uint8List keyId in keyIds) {
        await _secureStorage.delete(_makeKey(keyId));
      }
    } on PlatformException catch (e) {
      throw StateError('Failed to delete private keys: ${e.message}');
    }
  }

  Future<List<Uint8List>> getAllKeyIds() async {
    try {
      final Map<String, String> allKeys = await _secureStorage.readAll();
      return allKeys.keys
          .where((String key) => key.startsWith(_prefix))
          .map((String key) => key.substring(_prefix.length))
          .map(hexToBytes)
          .toList();
    } on PlatformException catch (e) {
      throw StateError('Failed to list key IDs: ${e.message}');
    }
  }

  Future<int> count() async {
    try {
      final Map<String, String> allKeys = await _secureStorage.readAll();
      return allKeys.keys.where((String key) => key.startsWith(_prefix)).length;
    } on PlatformException catch (e) {
      throw StateError('Failed to count private keys: ${e.message}');
    }
  }

  Future<void> clear() async {
    try {
      final Map<String, String> allKeys = await _secureStorage.readAll();
      final Iterable<String> privateKeys =
          allKeys.keys.where((String k) => k.startsWith(_prefix));
      for (final String key in privateKeys) {
        await _secureStorage.delete(key);
      }
    } on PlatformException catch (e) {
      throw StateError('Failed to clear private keys: ${e.message}');
    }
  }
}
