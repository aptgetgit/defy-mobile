import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:defy/core/providers/secure_storage_provider.dart';
import 'package:defy/features/shared/domain/repositories/mnemonic_repository.dart';
import 'package:wallet_core/wallet_core.dart';

class MnemonicRepository implements IMnemonicRepository {
  static String _prefix(String identityId) =>
      'identity:$identityId:secret:mnemonic:';
  static String mnemonicKey(String identityId, String mnemonicHash) =>
      '${_prefix(identityId)}$mnemonicHash:phrase';

  final SecureStorageService _secureStorageService;

  MnemonicRepository(this._secureStorageService);

  @override
  String generateMnemonic({int strength = 128}) {
    return Mnemonic.generateMnemonic(strength: strength).trim();
  }

  @override
  bool validatePhrase(String phrase) {
    return Mnemonic.validatePhrase(phrase.trim());
  }

  @override
  Uint8List toSeed(String phrase, {String passphrase = ''}) {
    return Mnemonic.toSeed(phrase.trim(), passphrase: passphrase);
  }

  @override
  String toSeedHex(String phrase, {String passphrase = ''}) {
    return Mnemonic.toSeedHex(phrase.trim(), passphrase: passphrase);
  }

  @override
  Future<String> saveMnemonic(String identityId, String phrase) async {
    final mnemonicHash = sha512.convert(utf8.encode(phrase.trim())).toString();
    final mnemonicId = mnemonicKey(identityId, mnemonicHash);
    await _secureStorageService.write(mnemonicId, phrase.trim());
    return mnemonicId;
  }

  @override
  Future<String?> getMnemonic(String mnemonicId) async {
    return _secureStorageService.read(mnemonicId);
  }

  @override
  Future<void> deleteMnemonic(String mnemonicId) async {
    await _secureStorageService.delete(mnemonicId);
  }
}
