import 'dart:typed_data';

import 'package:jwk/jwk.dart';

abstract class IPrivateKeyRepository {
  Future<Uint8List> storePrivateKey(Uint8List privateKey);

  Future<Uint8List?> getPrivateKey(Uint8List jwkThumbprint);

  Future<bool> hasPrivateKey(Uint8List jwkThumbprint);

  Future<bool> deletePrivateKey(Uint8List jwkThumbprint);

  Future<int> getTotalKeys();

  Future<List<Uint8List>> listThumbprints();

  Jwk createJwk(Uint8List privateKey);

  Uint8List computeThumbprint(Jwk jwk);
}
