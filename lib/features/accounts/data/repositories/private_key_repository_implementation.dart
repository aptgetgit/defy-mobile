import 'dart:convert';

import 'package:aptos_dart/hex_string.dart';
import 'package:flutter/services.dart';
import 'package:jwk/jwk.dart';

import '../../../../core/services/secure_storage_service.dart';
import '../../domain/repositories/private_key_repository.dart';
import '../models/local/public_key_local_model.dart';

class PrivateKeyRepository implements IPrivateKeyRepository {
  PrivateKeyRepository(this._secureStorage);

  static const String _keyPrefix = 'private:';
  static const int _privateKeyLength = 32;
  static const String _jwkKty = 'OKP';
  static const String _jwkCurve = 'Ed25519';

  final SecureStorageService _secureStorage;

  String _prefix(Uint8List thumbprint) =>
      '$_keyPrefix${HexString.fromUint8Array(thumbprint).noPrefix()}';

  @override
  Jwk createJwk(Uint8List privateKey) {
    if (privateKey.length != 64) {
      throw const FormatException('Private key must be 64 bytes');
    }

    return Jwk(
      kty: _jwkKty,
      crv: _jwkCurve,
      d: privateKey.sublist(0, _privateKeyLength),
      x: privateKey.sublist(_privateKeyLength, privateKey.length),
    );
  }

  @override
  Uint8List computeThumbprint(Jwk jwk) => jwk.generateThumbprint();

  @override
  Future<Uint8List> storePrivateKey(Uint8List privateKey) async {
    try {
      final Jwk jwk = createJwk(privateKey);
      final Uint8List thumbprint = jwk.generateThumbprint();
      final String key = _prefix(thumbprint);

      await _secureStorage.write(
        key,
        json.encode(jwk.toJson()),
      );

      return thumbprint;
    } on PlatformException catch (e) {
      throw StateError('Failed to store private key: ${e.message}');
    }
  }

  @override
  Future<Uint8List?> getPrivateKey(Uint8List jwkThumbprint) async {
    try {
      final String? jwkJson = await _secureStorage.read(_prefix(jwkThumbprint));
      if (jwkJson == null) {
        return null;
      }

      final Map<String, dynamic> jsonMap =
          json.decode(jwkJson) as Map<String, dynamic>;
      final Jwk jwk = Jwk.fromJson(jsonMap);

      final List<int>? d = jwk.d;
      final List<int>? x = jwk.x;
      if (d == null || x == null) {
        throw StateError('Invalid JWK: missing d or x values');
      }

      return Uint8List.fromList(<int>[...d, ...x]);
    } on PlatformException catch (e) {
      throw StateError('Failed to retrieve private key: ${e.message}');
    }
  }

  @override
  Future<bool> hasPrivateKey(Uint8List jwkThumbprint) async {
    try {
      return await _secureStorage.containsKey(_prefix(jwkThumbprint));
    } on PlatformException {
      return false;
    }
  }

  @override
  Future<bool> deletePrivateKey(Uint8List jwkThumbprint) async {
    try {
      await _secureStorage.delete(_prefix(jwkThumbprint));
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
