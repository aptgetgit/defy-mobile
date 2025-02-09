import 'dart:typed_data';

import '../../../utils/mnemonic_utils.dart';
import '../repositories/entropy_repository_interface.dart';

class GetMnemonicUseCase {
  const GetMnemonicUseCase({required IEntropyRepository repository})
      : _repository = repository;
      
  final IEntropyRepository _repository;

  Future<String> call({required Uint8List entropyHash}) async {
    if (entropyHash.isEmpty) {
      throw ArgumentError('Entropy hash cannot be empty');
    }

    final Uint8List? entropy = await _repository.get(hash: entropyHash);
    if (entropy == null) {
      throw StateError('Mnemonic not found');
    }

    try {
      return entropyToMnemonic(entropy);
    } catch (e) {
      throw StateError('Failed to convert entropy to mnemonic: $e');
    }
  }
}
