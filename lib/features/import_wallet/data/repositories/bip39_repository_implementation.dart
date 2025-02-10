import '../../../../core/constants/bip39_wordlist.dart';
import '../../domain/repositories/bip39_repository.dart';

class BIP39RepositoryImplementation implements BIP39Repository {
  @override
  Set<String> getWordlist() => bip39Wordlist;

  @override
  bool isValidWord(String word) => bip39Wordlist.contains(word.toLowerCase());
}
