import 'dart:typed_data';

abstract class IMnemonicRepository {
  String generateMnemonic({int strength = 128});
  bool validatePhrase(String phrase);
  Uint8List toSeed(String phrase, {String passphrase = ''});
  String toSeedHex(String phrase, {String passphrase = ''});

  Future<String> saveMnemonic(String identityId, String phrase);
  Future<String?> getMnemonic(String mnemonicId);
  Future<void> deleteMnemonic(String mnemonicId);
}