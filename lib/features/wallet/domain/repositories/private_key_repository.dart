import 'dart:typed_data';

import '../entities/json_web_key.dart';

abstract class IPrivateKeyRepository {
  Future<Uint8List> storePrivateKey({required Jwk jwk});

  Future<Uint8List?> getPrivateKey({required Uint8List jwkKeyId});

  Future<bool> hasPrivateKey({required Uint8List jwkKeyId});

  Future<bool> deletePrivateKey({required Uint8List jwkKeyId});

  Future<int> getTotalKeys();

  Future<List<Uint8List>> listThumbprints();
}
