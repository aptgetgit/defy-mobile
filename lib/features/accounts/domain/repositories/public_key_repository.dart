import 'dart:typed_data';

import '../../data/models/local/hd_key_local_model.dart';
import '../../data/models/local/public_key_local_model.dart';
import '../../data/models/local/signing_key_local_model.dart';
import '../../data/sources/local/public_key_local_data_source.dart';

abstract class IPublicKeyRepository {
  int storePublicKeyWithRelation(StorePublicKeyParams params);
  void deletePublicKeyByKId(Uint8List kId);

  PublicKeyLocalModel? findPublicKeyByKId(Uint8List kId);
  bool hasPublicKeyWithKId(Uint8List kId);

  HDKeyLocalModel? findHDKeyByKId(Uint8List kId);
  SigningKeyLocalModel? findSigningKeyByKId(Uint8List kId);

  List<Uint8List> getAllPublicKeyKIds();
  int getPublicKeyCount();

  List<int> findAccountIndexesByEntropyHash(Uint8List entropyHash);
  int getNextAvailableIndex(Uint8List entropyHash);
}
