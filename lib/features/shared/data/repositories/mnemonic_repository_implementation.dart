import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:defy/core/providers/secure_storage_provider.dart';
import 'package:defy/features/shared/domain/repositories/mnemonic_repository.dart';
import 'package:bip39/bip39.dart' as bip39;

class MnemonicRepository implements IMnemonicRepository {
  static String _prefix(String identityId) =>
      'identity:$identityId:secret:mnemonic:';
  static String mnemonicKey(String identityId, String mnemonicHash) =>
      '${_prefix(identityId)}$mnemonicHash:phrase';

  final SecureStorageService _secureStorageService;

  MnemonicRepository(this._secureStorageService);

  @override
  String generateMnemonic({int strength = 128}) {
    return bip39.generateMnemonic(strength: strength).trim();
  }

  @override
  bool validateMnemonic(String mnemonic) {
    return bip39.validateMnemonic(mnemonic.trim());
  }

  @override
  Uint8List mnemonicToSeed(String mnemonic, {String passphrase = ''}) {
    return bip39.mnemonicToSeed(mnemonic.trim(), passphrase: passphrase);
  }

  @override
  String mnemonicToSeedHex(String mnemonic, {String passphrase = ''}) {
    return bip39.mnemonicToSeedHex(mnemonic.trim(), passphrase: passphrase);
  }

  @override
  Future<String> saveMnemonic(String identityId, String mnemonic) async {
    final mnemonicHash = sha512.convert(utf8.encode(mnemonic.trim())).toString();
    final mnemonicId = mnemonicKey(identityId, mnemonicHash);
    await _secureStorageService.write(mnemonicId, mnemonic.trim());
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
