import 'dart:typed_data';

import '../../domain/repositories/public_key_repository.dart';
import '../models/local/hd_key_local_model.dart';
import '../models/local/public_key_local_model.dart';
import '../models/local/signing_key_local_model.dart';
import '../sources/local/public_key_local_data_source.dart';

class PublicKeyRepository implements IPublicKeyRepository {
  PublicKeyRepository(this._localDataSource);
  final PublicKeyLocalDataSource _localDataSource;

  @override
  int storePublicKeyWithRelation(StorePublicKeyParams params) {
    try {
      return _localDataSource.storePublicKeyWithRelation(params);
    } catch (e) {
      throw StateError('Failed to store public key: $e');
    }
  }

  @override
  void deletePublicKeyByKId(Uint8List kId) {
    try {
      _localDataSource.deletePublicKeyAndRelationsByKId(kId);
    } catch (e) {
      throw StateError('Failed to delete public key: $e');
    }
  }

  @override
  PublicKeyLocalModel? findPublicKeyByKId(Uint8List kId) {
    try {
      return _localDataSource.findPublicKeyByKId(kId);
    } catch (e) {
      throw StateError('Failed to find public key: $e');
    }
  }

  @override
  bool hasPublicKeyWithKId(Uint8List kId) {
    try {
      return _localDataSource.hasPublicKeyWithKId(kId);
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  HDKeyLocalModel? findHDKeyByKId(Uint8List kId) {
    try {
      return _localDataSource.findHDKeyByKId(kId);
    } catch (e) {
      throw StateError('Failed to find HD key: $e');
    }
  }

  @override
  SigningKeyLocalModel? findSigningKeyByKId(Uint8List kId) {
    try {
      return _localDataSource.findSigningKeyByKId(kId);
    } catch (e) {
      throw StateError('Failed to find signing key: $e');
    }
  }

  @override
  List<Uint8List> getAllPublicKeyKIds() {
    try {
      return _localDataSource.getAllPublicKeyKIds();
    } catch (e) {
      throw StateError('Failed to get public key KIds: $e');
    }
  }

  @override
  int getPublicKeyCount() {
    try {
      return _localDataSource.getPublicKeyCount();
    } catch (e) {
      throw StateError('Failed to get public key count: $e');
    }
  }

  @override
  List<int> findAccountIndexesByEntropyHash(Uint8List entropyHash) {
    try {
      return _localDataSource.findAccountIndexesByEntropyHash(entropyHash);
    } catch (e) {
      throw StateError('Failed to find account indexes: $e');
    }
  }

  @override
  int getNextAvailableIndex(Uint8List entropyHash) {
    try {
      return _localDataSource.getNextAvailableIndex(entropyHash);
    } catch (e) {
      throw StateError('Failed to get next available index: $e');
    }
  }
}
