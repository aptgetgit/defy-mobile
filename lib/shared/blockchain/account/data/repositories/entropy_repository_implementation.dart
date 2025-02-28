import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../core/logging/app_logger.dart';
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

  final Store _store;
  final EntropyDataSource _entropyDataSource;
  final HDKeyDataSource _hdKeyDataSource;

  @override
  Future<Uint8List> store({required Uint8List entropy}) async {
    if (entropy.isEmpty) {
      throw ArgumentError.value(
        entropy,
        'entropy',
        'Entropy must not be empty',
      );
    }
    try {
      final Uint8List hash = computeSha256Hash(entropy);
      await _entropyDataSource.store(hash: hash, entropy: entropy);
      return hash;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to store entropy',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<Uint8List?> get({required Uint8List hash}) async {
    try {
      final Uint8List? result = await _entropyDataSource.get(hash: hash);
      return result;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve entropy',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<bool> has({required Uint8List hash}) async {
    try {
      final bool exists = await _entropyDataSource.has(hash: hash);
      return exists;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to check entropy existence',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> delete({required Uint8List hash}) async {
    try {
      await _store.runInTransaction(TxMode.write, () async {
        if (_hdKeyDataSource.getByEntropy(entropyHash: hash).isNotEmpty) {
          throw StateError('Cannot delete: entropy is used in HD derivation');
        }
        await _entropyDataSource.delete(hash: hash);
      });
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete entropy',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> deleteMany(Set<Uint8List> hashes) async {
    try {
      await _store.runInTransaction(TxMode.write, () async {
        for (final Uint8List hash in hashes) {
          if (_hdKeyDataSource.getByEntropy(entropyHash: hash).isNotEmpty) {
            throw StateError('Cannot delete: entropy is used in HD derivation');
          }
        }
        await _entropyDataSource.deleteMany(hashes: hashes);
      });
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete multiple entropies',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<int> count() async {
    try {
      final int result = await _entropyDataSource.count();
      return result;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to count entropies',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<Set<Uint8List>> getAllHashes() async {
    try {
      final Set<Uint8List> hashes = await _entropyDataSource.getAllHashes();
      return hashes;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve all entropy hashes',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> clear() async {
    try {
      final Set<Uint8List> hashes = await getAllHashes();

      await _store.runInTransaction(TxMode.write, () async {
        for (final Uint8List hash in hashes) {
          if (_hdKeyDataSource.getByEntropy(entropyHash: hash).isNotEmpty) {
            throw StateError('Cannot clear: entropy is used in HD derivation');
          }
        }
        await _entropyDataSource.clear();
      });
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear all entropies',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
