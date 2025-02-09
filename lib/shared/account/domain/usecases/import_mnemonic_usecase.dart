import 'dart:typed_data';

import '../../../utils/mnemonic_utils.dart';
import '../repositories/entropy_repository_interface.dart';

class ImportMnemonicUseCase {
  const ImportMnemonicUseCase({required IEntropyRepository repository})
      : _repository = repository;

  final IEntropyRepository _repository;

  Future<Uint8List> call({required String mnemonic}) async {
    if (mnemonic.trim().isEmpty) {
      throw ArgumentError('Mnemonic cannot be empty');
    }

    if (!isValidMnemonic(mnemonic)) {
      throw StateError('Invalid mnemonic phrase');
    }

    try {
      final Uint8List entropy = mnemonicToEntropy(mnemonic);
      return _repository.store(entropy: entropy);
    } catch (e) {
      throw StateError('Failed to convert mnemonic to entropy: $e');
    }
  }
}
