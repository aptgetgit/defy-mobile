
import '../repositories/bip39_repository.dart';

class ValidateBIP39WordUseCase {
  final BIP39Repository repository;

  ValidateBIP39WordUseCase(this.repository);

  bool execute(String word) {
    return repository.isValidWord(word);
  }
}