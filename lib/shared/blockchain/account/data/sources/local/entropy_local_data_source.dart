import 'package:flutter/services.dart';

import '../../../../../../core/logging/app_logger.dart';
import '../../../../../../core/services/secure_storage_service.dart';
import '../../../../../utils/hex_utils.dart';

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
    if (hash.length != 32) {
      throw ArgumentError.value(
        hash,
        'hash',
        'SHA-256 hash must be exactly 32 bytes in length',
      );
    }

    if (entropy.isEmpty ||
        entropy.length % 4 != 0 ||
        entropy.length < 16 ||
        entropy.length > 32) {
      throw ArgumentError.value(
        entropy,
        'entropy',
        'BIP39 entropy must be between 16 and 32 bytes and a multiple of 4 bytes',
      );
    }

    try {
      final bool exists = await has(hash: hash);
      if (exists) {
        throw StateError('Entropy already exists for the given hash');
      }

      await _secureStorage.write(
        key: _makeKey(hash),
        value: bytesToHex(entropy),
      );
      AppLogger.debug('Stored entropy for hash: $hash');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to store entropy',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to store entropy: $e');
    }
  }

  Future<Uint8List?> get({required Uint8List hash}) async {
    if (hash.length != 32) {
      throw ArgumentError.value(
        hash,
        'hash',
        'SHA-256 hash must be exactly 32 bytes in length',
      );
    }

    try {
      final String? encoded = await _secureStorage.read(key: _makeKey(hash));
      if (encoded == null) {
        return null;
      }

      return hexToBytes(encoded);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve entropy',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve entropy: $e');
    }
  }

  Future<bool> has({required Uint8List hash}) async {
    if (hash.length != 32) {
      throw ArgumentError.value(
        hash,
        'hash',
        'SHA-256 hash must be exactly 32 bytes in length',
      );
    }

    try {
      final bool exists = await _secureStorage.containsKey(key: _makeKey(hash));
      return exists;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to check entropy existence',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to check entropy existence: $e');
    }
  }

  Future<void> delete({required Uint8List hash}) async {
    if (hash.length != 32) {
      throw ArgumentError.value(
        hash,
        'hash',
        'SHA-256 hash must be exactly 32 bytes in length',
      );
    }

    try {
      final bool exists = await has(hash: hash);
      if (!exists) {
        throw StateError('No entropy found for the given hash');
      }

      await _secureStorage.delete(key: _makeKey(hash));
      AppLogger.debug('Deleted entropy for hash: $hash');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete entropy',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete entropy: $e');
    }
  }

  Future<void> deleteMany({required Set<Uint8List> hashes}) async {
    if (hashes.isEmpty) {
      throw ArgumentError.value(
        hashes,
        'hashes',
        'Hash set cannot be empty',
      );
    }

    for (final Uint8List hash in hashes) {
      if (hash.length != 32) {
        throw ArgumentError.value(
          hash,
          'hash',
          'SHA-256 hash must be exactly 32 bytes in length',
        );
      }
    }

    try {
      for (final Uint8List hash in hashes) {
        final bool exists = await has(hash: hash);
        if (exists) {
          await _secureStorage.delete(key: _makeKey(hash));
        }
      }
      AppLogger.debug('Deleted ${hashes.length} entropies');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete entropies',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete entropies: $e');
    }
  }

  Future<Set<Uint8List>> getAllHashes() async {
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
        'Failed to get entropy hashes',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to get entropy hashes: $e');
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
        'Failed to count entropies',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to count entropies: $e');
    }
  }

  Future<void> clear() async {
    try {
      final Set<String> allValues = await _secureStorage.readAll();
      final Set<String> entropyKeys =
          allValues.where((String key) => key.startsWith(_prefix)).toSet();

      if (entropyKeys.isEmpty) {
        return;
      }

      for (final String key in entropyKeys) {
        await _secureStorage.delete(key: key);
      }
      AppLogger.debug('Cleared all entropies');
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear entropies',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to clear entropies: $e');
    }
  }
}
