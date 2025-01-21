import 'dart:typed_data';

import 'package:aptos_dart/hex_string.dart';
import 'package:bip39/bip39.dart' as bip39;
import '../../data/repositories/entropy_repository_implementation.dart';

class GenerateMnemonicUseCase {
  GenerateMnemonicUseCase(this._repository);

  final EntropyRepository _repository;

  static const List<int> _validStrengths = <int>[128, 160, 192, 224, 256];

  Future<Uint8List> call({int strength = 128}) async {
    if (!_validStrengths.contains(strength)) {
      throw ArgumentError(
        'Invalid strength: $strength. Must be one of ${_validStrengths.join(", ")} bits',
      );
    }
    final String mnemonic = bip39.generateMnemonic(strength: strength);
    final Uint8List entropy =
        HexString(bip39.mnemonicToEntropy(mnemonic)).toUint8Array();
    final Uint8List entropyHash =
        _repository.computeEntropyHash(entropy: entropy);

    if (await _repository.hasEntropy(entropyHash: entropyHash)) {
      throw StateError('Mnemonic already exists');
    }
    return _repository.storeEntropy(entropy: entropy);
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
    final Uint8List entropyHash =
        _repository.computeEntropyHash(entropy: entropy);

    if (await _repository.hasEntropy(entropyHash: entropyHash)) {
      throw StateError('Mnemonic already imported');
    }

    return _repository.storeEntropy(entropy: entropy);
  }
}

class RemoveMnemonicUseCase {
  RemoveMnemonicUseCase(this._repository);
  final EntropyRepository _repository;

  Future<void> call({required Uint8List entropyHash}) async {
    if (!await _repository.hasEntropy(entropyHash: entropyHash)) {
      throw StateError('Mnemonic not found');
    }

    await _repository.deleteEntropy(entropyHash: entropyHash);
  }
}

class ReadMnemonicUseCase {
  ReadMnemonicUseCase(this._repository);
  final EntropyRepository _repository;

  Future<String> call({required Uint8List entropyHash}) async {
    final Uint8List? entropy =
        await _repository.getEntropy(entropyHash: entropyHash);
    if (entropy == null) {
      throw StateError('Mnemonic not found');
    }
    final String mnemonic = bip39.entropyToMnemonic(
      HexString.fromUint8Array(entropy).toString(),
    );

    return mnemonic;
  }
}
