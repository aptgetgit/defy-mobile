import 'dart:typed_data';

import '../../../../utils/mnemonic_utils.dart';
import '../repositories/entropy_repository_interface.dart';

class GenerateMnemonicUseCase {
  const GenerateMnemonicUseCase({required IEntropyRepository repository})
      : _repository = repository;

  final IEntropyRepository _repository;

  Future<Uint8List> call({int strength = 128}) async {
    if (!isValidEntropyStrength(strength)) {
      throw ArgumentError(
        'Invalid strength: $strength. Must be one of ${validEntropyStrengths.join(", ")} bits',
      );
    }

    try {
      final Uint8List entropy = generateEntropyWithStrength(strength);
      return _repository.store(entropy: entropy);
    } catch (e) {
      throw StateError('Failed to generate mnemonic: $e');
    }
  }
}
