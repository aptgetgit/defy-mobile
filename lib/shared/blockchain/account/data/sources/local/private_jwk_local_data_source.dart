import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../../../../core/logging/app_logger.dart';
import '../../../../../../core/services/secure_storage_service.dart';
import '../../../../../utils/hex_utils.dart';
import '../../../domain/entities/json_web_key.dart';

class PrivateJwkDataSource {
  PrivateJwkDataSource({required SecureStorageService secureStorage})
      : _secureStorage = secureStorage;

  static const String _prefix = 'private:';
  final SecureStorageService _secureStorage;

  String _makeKey(Uint8List keyId) => '$_prefix${bytesToHex(keyId)}';

  Future<void> store({required Uint8List keyId, required Jwk jwk}) async {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    if (!jwk.hasPrivateKey()) {
      throw ArgumentError.value(
        jwk,
        'jwk',
        'JWK must contain a private key component',
      );
    }

    try {
      final bool exists = await has(keyId: keyId);
      if (exists) {
        throw StateError('Private key already exists for the given key ID');
      }

      await _secureStorage.write(
        key: _makeKey(keyId),
        value: json.encode(jwk.toJson()),
      );
      AppLogger.debug('Stored private key for key ID: $keyId');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to store private key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to store private key: $e');
    }
  }

  Future<Jwk?> get({required Uint8List keyId}) async {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      final String? jwkJson = await _secureStorage.read(key: _makeKey(keyId));
      if (jwkJson == null) {
        return null;
      }

      final Jwk jwk =
          Jwk.fromJson(json.decode(jwkJson) as Map<String, dynamic>);

      if (!jwk.hasPrivateKey()) {
        throw StateError('Retrieved JWK missing private component "d"');
      }

      return jwk;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve private key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve private key: $e');
    }
  }

  Future<bool> has({required Uint8List keyId}) async {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      final String? jwkJson = await _secureStorage.read(key: _makeKey(keyId));
      if (jwkJson == null) {
        return false;
      }

      final Jwk jwk =
          Jwk.fromJson(json.decode(jwkJson) as Map<String, dynamic>);
      return jwk.hasPrivateKey();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to check if private key exists',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to check if private key exists: $e');
    }
  }

  Future<void> delete({required Uint8List keyId}) async {
    if (keyId.length != 32) {
      throw ArgumentError.value(
        keyId,
        'keyId',
        'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
      );
    }

    try {
      final bool exists = await has(keyId: keyId);
      if (!exists) {
        throw StateError('No private key found for the given key ID');
      }

      await _secureStorage.delete(key: _makeKey(keyId));
      AppLogger.debug('Deleted private key for key ID: $keyId');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete private key',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete private key: $e');
    }
  }

  Future<void> deleteMany({required Set<Uint8List> keyIds}) async {
    if (keyIds.isEmpty) {
      throw ArgumentError.value(
        keyIds,
        'keyIds',
        'Key IDs list cannot be empty',
      );
    }

    for (final Uint8List keyId in keyIds) {
      if (keyId.length != 32) {
        throw ArgumentError.value(
          keyId,
          'keyId',
          'JWK Key ID must be exactly 32 bytes (SHA-256 thumbprint as per RFC 7638)',
        );
      }
    }

    try {
      for (final Uint8List keyId in keyIds) {
        final bool exists = await has(keyId: keyId);
        if (exists) {
          await _secureStorage.delete(key: _makeKey(keyId));
        }
      }
      AppLogger.debug('Deleted  ${keyIds.length} private keys');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete private keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete private keys: $e');
    }
  }

  Future<Set<Uint8List>> getAllKeyIds() async {
    try {
      final Set<String> allValues = await _secureStorage.readAll();
      final Set<Uint8List> result = allValues
          .where((String key) => key.startsWith(_prefix))
          .map((String key) => key.substring(_prefix.length))
          .map(hexToBytes)
          .toSet();

      return result;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get all key IDs',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to get all key IDs: $e');
    }
  }

  Future<int> count() async {
    try {
      final Set<String> allValues = await _secureStorage.readAll();
      final int count =
          allValues.where((String key) => key.startsWith(_prefix)).length;
      return count;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to count private keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to count private keys: $e');
    }
  }

  Future<void> clear() async {
    try {
      final Set<String> allValues = await _secureStorage.readAll();
      final Set<String> privateKeys =
          allValues.where((String key) => key.startsWith(_prefix)).toSet();

      if (privateKeys.isEmpty) {
        return;
      }

      for (final String key in privateKeys) {
        await _secureStorage.delete(key: key);
      }
      AppLogger.debug('Cleared all private keys');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear private keys',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to clear private keys: $e');
    }
  }
}
