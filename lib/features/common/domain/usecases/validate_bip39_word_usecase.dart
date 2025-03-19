
import '../repositories/bip39_repository.dart';

class ValidateBIP39WordUseCase {

  ValidateBIP39WordUseCase(this.repository);
  final BIP39Repository repository;

  bool execute(String word) => repository.isValidWord(word);
}
