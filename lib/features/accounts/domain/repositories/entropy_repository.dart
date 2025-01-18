import 'dart:typed_data';

abstract class IEntropyRepository {
  Future<Uint8List> storeEntropy(Uint8List entropy);

  Future<Uint8List?> getEntropy(Uint8List entropyHash);

  Future<bool> hasEntropy(Uint8List entropyHash);

  Future<bool> deleteEntropy(Uint8List entropyHash);

  Uint8List computeEntropyHash(Uint8List entropy);

  Future<List<Uint8List>> listEntropyHashes();

  Future<int> getTotalEntropies();

  bool isValidEntropyLength(Uint8List entropy);
}
