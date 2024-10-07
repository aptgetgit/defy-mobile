import 'dart:typed_data';

abstract class IMnemonicRepository {
  String generateMnemonic({int strength = 128});
  bool validateMnemonic(String mnemonic);
  Uint8List mnemonicToSeed(String mnemonic, {String passphrase = ''});
  String mnemonicToSeedHex(String mnemonic, {String passphrase = ''});

  Future<String> saveMnemonic(String identityId, String mnemonic);
  Future<String?> getMnemonic(String mnemonicId);
  Future<void> deleteMnemonic(String mnemonicId);
}