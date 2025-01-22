import 'dart:convert';

import 'package:aptos_dart/hex_string.dart';
import 'package:flutter/services.dart';

import '../../../../core/services/secure_storage_service.dart';
import '../../domain/entities/json_web_key.dart';
import '../../domain/repositories/private_key_repository.dart';

class PrivateKeyRepository implements IPrivateKeyRepository {
  PrivateKeyRepository(this._secureStorage);

  static const String _keyPrefix = 'private:';
  final SecureStorageService _secureStorage;

  String _prefix(Uint8List thumbprint) =>
      '$_keyPrefix${HexString.fromUint8Array(thumbprint).noPrefix()}';

  @override
  Future<Uint8List> storePrivateKey({required Jwk jwk}) async {
    final Uint8List? d = switch (jwk) {
      Ed25519Jwk(:final Uint8List d?) => d,
      Secp256k1Jwk(:final Uint8List d?) => d,
      Secp256r1Jwk(:final Uint8List d?) => d,
      _ => null,
    };

    if (d == null) {
      throw StateError(
        'Cannot store public key as private key: missing private component "d"',
      );
    }

    try {
      final String key = _prefix(jwk.keyId);
      await _secureStorage.write(
        key,
        json.encode(jwk.toJson()),
      );
      return jwk.keyId;
    } on PlatformException catch (e) {
      throw StateError('Failed to store private key: ${e.message}');
    }
  }

  @override
  Future<Jwk?> getPrivateKey({required Uint8List jwkKeyId}) async {
    try {
      final String? jwkJson = await _secureStorage.read(_prefix(jwkKeyId));
      if (jwkJson == null) {
        return null;
      }

      final Map<String, dynamic> jsonMap =
          json.decode(jwkJson) as Map<String, dynamic>;
      final Jwk jwk = Jwk.fromJson(jsonMap);

      final (Uint8List d, Uint8List x) = switch (jwk) {
        Ed25519Jwk(:final Uint8List? d, :final Uint8List x) when d != null => (
            d,
            x
          ),
        Secp256k1Jwk(:final Uint8List? d, :final Uint8List x) when d != null =>
          (d, x),
        Secp256r1Jwk(:final Uint8List? d, :final Uint8List x) when d != null =>
          (d, x),
        _ => throw StateError(
            'Retrieved JWK is not a private key: missing private component "d"',
          ),
      };

      return jwk;
    } on PlatformException catch (e) {
      throw StateError('Failed to retrieve private key: ${e.message}');
    }
  }

  @override
  Future<bool> hasPrivateKey({required Uint8List jwkKeyId}) async {
    try {
      final String? jwkJson = await _secureStorage.read(_prefix(jwkKeyId));
      if (jwkJson == null) {
        return false;
      }

      final Map<String, dynamic> jsonMap =
          json.decode(jwkJson) as Map<String, dynamic>;
      final Jwk jwk = Jwk.fromJson(jsonMap);

      final bool hasPrivateComponent = switch (jwk) {
        Ed25519Jwk(d: final Uint8List? d) => d != null,
        Secp256k1Jwk(d: final Uint8List? d) => d != null,
        Secp256r1Jwk(d: final Uint8List? d) => d != null,
      };

      return hasPrivateComponent;
    } on PlatformException {
      return false;
    }
  }

  @override
  Future<bool> deletePrivateKey({required Uint8List jwkKeyId}) async {
    try {
      await _secureStorage.delete(_prefix(jwkKeyId));
      return true;
    } on PlatformException {
      return false;
    }
  }

  @override
  Future<int> getTotalKeys() async {
    try {
      final Map<String, String> allKeys = await _secureStorage.readAll();
      return allKeys.keys
          .where((String key) => key.startsWith(_keyPrefix))
          .length;
    } on PlatformException catch (e) {
      throw StateError('Failed to count private keys: ${e.message}');
    }
  }

  @override
  Future<List<Uint8List>> listThumbprints() async {
    try {
      final Map<String, String> allKeys = await _secureStorage.readAll();
      return allKeys.keys
          .where((String key) => key.startsWith(_keyPrefix))
          .map((String key) => key.substring(_keyPrefix.length))
          .map((String hex) => HexString(hex).toUint8Array())
          .toList();
    } on PlatformException catch (e) {
      throw StateError('Failed to list thumbprints: ${e.message}');
    }
  }
}
