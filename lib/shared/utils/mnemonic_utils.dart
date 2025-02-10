import 'dart:typed_data';
import 'package:bip39/bip39.dart' as bip39;
import '../../shared/utils/hex_utils.dart';

Uint8List generateEntropyWithStrength(int strength) {
  final String mnemonic = bip39.generateMnemonic(strength: strength);
  return hexToBytes(bip39.mnemonicToEntropy(mnemonic));
}

Uint8List mnemonicToEntropy(String mnemonic) =>
    hexToBytes(bip39.mnemonicToEntropy(mnemonic));

String entropyToMnemonic(Uint8List entropy) =>
    bip39.entropyToMnemonic(bytesToHex(entropy));

bool isValidMnemonic(String mnemonic) => bip39.validateMnemonic(mnemonic);

const List<int> validEntropyStrengths = <int>[128, 160, 192, 224, 256];

bool isValidEntropyStrength(int strength) =>
    validEntropyStrengths.contains(strength);
