import 'package:aptos_dart/hex_string.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/services.dart';

import '../../../../core/services/secure_storage_service.dart';
import '../../domain/repositories/entropy_repository.dart';

class EntropyRepository implements IEntropyRepository {
  EntropyRepository(this._secureStorage);

  static const String _entropyPrefix = 'entropy:';
  static const int _prefixLength = 8;

  static final Uint8List _validEntropyLengths = Uint8List.fromList(
    const <int>[16, 20, 24, 28, 32],
  );

  final SecureStorageService _secureStorage;

  String _prefix(Uint8List entropyHash) =>
      '$_entropyPrefix${_entropyToHex(entropyHash)}';

  String _entropyToHex(Uint8List entropy) =>
      HexString.fromUint8Array(entropy).noPrefix();

  Uint8List _hexToEntropy(String hexString) =>
      HexString(hexString).toUint8Array();

  @override
  bool isValidEntropyLength({required Uint8List entropy}) =>
      _validEntropyLengths.contains(entropy.length);

  @override
  Uint8List computeEntropyHash({required Uint8List entropy}) =>
      Uint8List.fromList(crypto.sha256.convert(entropy).bytes);

  @override
  Future<Uint8List> storeEntropy({required Uint8List entropy}) async {
    if (!isValidEntropyLength(entropy: entropy)) {
      throw const FormatException('Invalid entropy length');
    }

    final Uint8List entropyHash = computeEntropyHash(entropy: entropy);
    final String key = _prefix(entropyHash);

    try {
      await _secureStorage.write(key, _entropyToHex(entropy));
      return entropyHash;
    } on PlatformException catch (e) {
      throw StateError('Failed to store entropy: ${e.message}');
    }
  }

  @override
  Future<Uint8List?> getEntropy({required Uint8List entropyHash}) async {
    try {
      final String? encodedEntropy =
          await _secureStorage.read(_prefix(entropyHash));
      return encodedEntropy != null ? _hexToEntropy(encodedEntropy) : null;
    } on PlatformException catch (e) {
      throw StateError('Failed to retrieve entropy: ${e.message}');
    }
  }

  @override
  Future<bool> hasEntropy({required Uint8List entropyHash}) async {
    try {
      return await _secureStorage.containsKey(_prefix(entropyHash));
    } on PlatformException {
      return false;
    }
  }

  @override
  Future<bool> deleteEntropy({required Uint8List entropyHash}) async {
    try {
      await _secureStorage.delete(_prefix(entropyHash));
      return true;
    } on PlatformException {
      return false;
    }
  }

  @override
  Future<int> getTotalEntropies() async {
    try {
      final Map<String, String> allKeys = await _secureStorage.readAll();
      return allKeys.keys
          .where((String key) => key.startsWith(_entropyPrefix))
          .length;
    } on PlatformException catch (e) {
      throw StateError('Failed to count entropies: ${e.message}');
    }
  }

  @override
  Future<List<Uint8List>> listEntropyHashes() async {
    try {
      final Map<String, String> allKeys = await _secureStorage.readAll();
      return allKeys.keys
          .where((String key) => key.startsWith(_entropyPrefix))
          .map((String key) => key.substring(_prefixLength))
          .map(_hexToEntropy)
          .toList();
    } on PlatformException catch (e) {
      throw StateError('Failed to list entropy hashes: ${e.message}');
    }
  }
}
