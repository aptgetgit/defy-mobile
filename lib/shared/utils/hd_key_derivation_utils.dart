import 'dart:typed_data';

import 'package:aptos_dart/aptos.dart' as aptos;
import 'package:bip39/bip39.dart' as bip39;

import '../account/domain/entities/aptos_derivation_path.dart';
import 'mnemonic_utils.dart';

Uint8List deriveHDKeyFromEntropy({
  required Uint8List entropy,
  required Uint8List derivationPath,
}) {
  try {
    final String mnemonic = entropyToMnemonic(entropy);
    final String seed = bip39.mnemonicToSeedHex(mnemonic);

    final aptos.Keys keys = aptos.derivePath(
      AptosDerivationPath.fromBytes(derivationPath).toDerivationPath(),
      seed,
    );

    if (keys.key == null) {
      throw StateError('Key derivation failed: null key generated');
    }

    if (keys.key!.isEmpty) {
      throw StateError('Key derivation failed: empty key generated');
    }

    return keys.key!;
  } catch (e) {
    throw StateError('Key derivation failed: $e');
  }
}
