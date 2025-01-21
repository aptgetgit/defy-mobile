import 'dart:typed_data';

abstract class IEntropyRepository {
  Future<Uint8List> storeEntropy({required Uint8List entropy});

  Future<Uint8List?> getEntropy({required Uint8List entropyHash});

  Future<bool> hasEntropy({required Uint8List entropyHash});

  Future<bool> deleteEntropy({required Uint8List entropyHash});

  Uint8List computeEntropyHash({required Uint8List entropy});

  Future<List<Uint8List>> listEntropyHashes();

  Future<int> getTotalEntropies();

  bool isValidEntropyLength({required Uint8List entropy});
}
