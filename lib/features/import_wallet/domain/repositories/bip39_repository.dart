
abstract class BIP39Repository {
  Set<String> getWordlist();
  bool isValidWord(String word);
}