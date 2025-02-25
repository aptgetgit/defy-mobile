import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../utils/crypto_utils.dart';
import '../../domain/repositories/entropy_repository_interface.dart';
import '../sources/local/entropy_local_data_source.dart';
import '../sources/local/hd_key_local_data_source.dart';

class EntropyRepository implements IEntropyRepository {
  EntropyRepository({
    required Store store,
    required EntropyDataSource entropyDataSource,
    required HDKeyDataSource hdKeyDataSource,
  })  : _store = store,
        _entropyDataSource = entropyDataSource,
        _hdKeyDataSource = hdKeyDataSource;

  static final Uint8List _validLengths =
      Uint8List.fromList(<int>[16, 20, 24, 28, 32]);

  final Store _store;
  final EntropyDataSource _entropyDataSource;
  final HDKeyDataSource _hdKeyDataSource;

  bool _isValidLength(Uint8List entropy) =>
      _validLengths.contains(entropy.length);

  @override
  Future<Uint8List> store({required Uint8List entropy}) async {
    if (!_isValidLength(entropy)) {
      throw const FormatException('Invalid entropy length');
    }

    final Uint8List hash = computeSha256Hash(entropy);
    await _entropyDataSource.store(hash: hash, entropy: entropy);
    return hash;
  }

  @override
  Future<Uint8List?> get({required Uint8List hash}) =>
      _entropyDataSource.get(hash: hash);

  @override
  Future<bool> has({required Uint8List hash}) =>
      _entropyDataSource.has(hash: hash);

  @override
  Future<void> delete({required Uint8List hash}) async {
    if (_hdKeyDataSource.getByEntropy(entropyHash: hash).isNotEmpty) {
      throw StateError('Cannot delete: entropy is used in HD derivation');
    }

    return _store.runInTransaction(TxMode.read, () {
      _entropyDataSource.delete(hash: hash);
    });
  }

  @override
  Future<void> deleteMany(List<Uint8List> hashes) =>
      _store.runInTransaction(TxMode.read, () {
        for (final Uint8List hash in hashes) {
          if (_hdKeyDataSource.getByEntropy(entropyHash: hash).isNotEmpty) {
            throw StateError('Cannot delete: entropy is used in HD derivation');
          }
        }
        return _entropyDataSource.deleteMany(hashes);
      });

  @override
  Future<int> count() => _entropyDataSource.count();

  @override
  Future<List<Uint8List>> getAllHashes() => _entropyDataSource.getAllHashes();

  @override
  Future<void> clear() async {
    final List<Uint8List> hashes = await getAllHashes();

    for (final Uint8List hash in hashes) {
      if (_hdKeyDataSource.getByEntropy(entropyHash: hash).isNotEmpty) {
        throw StateError('Cannot clear: entropy is used in HD derivation');
      }
    }
    
    return _store.runInTransaction(TxMode.read, _entropyDataSource.clear);
  }
}
