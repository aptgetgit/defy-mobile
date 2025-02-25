import 'dart:typed_data';

abstract class IEntropyRepository {
  Future<Uint8List> store({required Uint8List entropy});

  Future<Uint8List?> get({required Uint8List hash});

  Future<List<Uint8List>> getAllHashes();

  Future<int> count();

  Future<bool> has({required Uint8List hash});

  Future<void> delete({required Uint8List hash});
  
  Future<void> deleteMany(List<Uint8List> hashes);

  Future<void> clear();
}
