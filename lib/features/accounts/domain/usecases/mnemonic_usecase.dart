// import 'package:aptos_dart/hex_string.dart';
import 'dart:typed_data';

import 'package:aptos_dart/hex_string.dart';
import 'package:bip39/bip39.dart' as bip39;
import '../../data/repositories/entropy_repository_implementation.dart';

class GenerateMnemonicUseCase {
  GenerateMnemonicUseCase(this._repository);

  final EntropyRepository _repository;

  Future<Uint8List> call({int strength = 128}) async {
    final String mnemonic = bip39.generateMnemonic();
    final Uint8List entropy =
        HexString(bip39.mnemonicToEntropy(mnemonic)).toUint8Array();
    final Uint8List entropyHash = _repository.computeEntropyHash(entropy);

    if (await _repository.hasEntropy(entropyHash)) {
      throw StateError('Entropy already exists');
    }
    return _repository.storeEntropy(entropy);
  }
}

class ImportMnemonicUseCase {
  ImportMnemonicUseCase(this._repository);
  final EntropyRepository _repository;

  Future<Uint8List> call({required String mnemonic}) async {
    if (!bip39.validateMnemonic(mnemonic)) {
      throw StateError('Invalid mnemonic phrase');
    }

    final Uint8List entropy =
        HexString(bip39.mnemonicToEntropy(mnemonic)).toUint8Array();
    final Uint8List entropyHash = _repository.computeEntropyHash(entropy);

    if (await _repository.hasEntropy(entropyHash)) {
      throw StateError('Mnemonic already imported');
    }

    return _repository.storeEntropy(entropy);
  }
}

// class RemoveMnemonicUseCase {
//   RemoveMnemonicUseCase(this._repository);
//   final EntropyRepository _repository;

//   Future<void> call({required Uint8List entropyHash}) async {
//     if (!await _repository.hasEntropy(entropyHash)) {
//       throw StateError('Mnemonic not found');
//     }

//     await _repository.deleteEntropy(entropyHash);
//   }
// }

class ReadMnemonicUseCase {
  ReadMnemonicUseCase(this._repository);
  final EntropyRepository _repository;

  Future<String> call({required Uint8List entropyHash}) async {
    final Uint8List? entropy = await _repository.getEntropy(entropyHash);
    if (entropy == null) {
      throw StateError('Mnemonic not found');
    }
    final String mnemonic = bip39.entropyToMnemonic(
      HexString.fromUint8Array(entropy).toString(),
    );

    return mnemonic;
  }
}
