import 'package:flutter/services.dart';

import '../../../../../core/services/secure_storage_service.dart';
import '../../../../utils/hex_utils.dart';

class EntropyDataSource {
  EntropyDataSource({required SecureStorageService secureStorage})
      : _secureStorage = secureStorage;

  static const String _prefix = 'entropy:';
  final SecureStorageService _secureStorage;

  String _makeKey(Uint8List hash) => '$_prefix${bytesToHex(hash)}';

  Future<void> store({
    required Uint8List hash,
    required Uint8List entropy,
  }) async {
    if (await has(hash: hash)) {
      throw StateError('Entropy already exists');
    }

    try {
      await _secureStorage.write(_makeKey(hash), bytesToHex(entropy));
    } on PlatformException catch (e) {
      throw StateError('Failed to store entropy: ${e.message}');
    }
  }

  Future<Uint8List?> get({required Uint8List hash}) async {
    try {
      final String? encoded = await _secureStorage.read(_makeKey(hash));
      return encoded != null ? hexToBytes(encoded) : null;
    } on PlatformException catch (e) {
      throw StateError('Failed to retrieve entropy: ${e.message}');
    }
  }

  Future<bool> has({required Uint8List hash}) async {
    try {
      return await _secureStorage.containsKey(_makeKey(hash));
    } on PlatformException catch (e) {
      throw StateError('Failed to check entropy existence: ${e.message}');
    }
  }

  Future<void> delete({required Uint8List hash}) async {
    try {
      await _secureStorage.delete(_makeKey(hash));
    } on PlatformException catch (e) {
      throw StateError('Failed to delete entropy: ${e.message}');
    }
  }

  Future<void> deleteMany(List<Uint8List> hashes) async {
    try {
      for (final Uint8List hash in hashes) {
        await _secureStorage.delete(_makeKey(hash));
      }
    } on PlatformException catch (e) {
      throw StateError('Failed to delete entropies: ${e.message}');
    }
  }

  Future<List<Uint8List>> getAllHashes() async {
    try {
      final Map<String, String> allKeys = await _secureStorage.readAll();
      return allKeys.keys
          .where((String key) => key.startsWith(_prefix))
          .map((String key) => key.substring(_prefix.length))
          .map(hexToBytes)
          .toList();
    } on PlatformException catch (e) {
      throw StateError('Failed to get entropy hashes: ${e.message}');
    }
  }

  Future<int> count() async {
    try {
      final Map<String, String> allKeys = await _secureStorage.readAll();
      return allKeys.keys.where((String key) => key.startsWith(_prefix)).length;
    } on PlatformException catch (e) {
      throw StateError('Failed to count entropies: ${e.message}');
    }
  }

  Future<void> clear() async {
    try {
      final Map<String, String> allKeys = await _secureStorage.readAll();
      final Iterable<String> entropyKeys =
          allKeys.keys.where((String k) => k.startsWith(_prefix));
      for (final String key in entropyKeys) {
        await _secureStorage.delete(key);
      }
    } on PlatformException catch (e) {
      throw StateError('Failed to clear entropies: ${e.message}');
    }
  }
}
