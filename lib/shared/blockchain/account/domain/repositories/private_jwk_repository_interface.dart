import 'dart:typed_data';

import '../entities/json_web_key.dart';

abstract class IPrivateJwkRepository {
  Future<Uint8List> store({required Jwk jwk});

  Future<Jwk?> get({required Uint8List keyId});

  Future<Set<Uint8List>> getAllKeyIds();

  Future<int> count();

  Future<bool> has({required Uint8List keyId});

  Future<void> delete({required Uint8List keyId});

  Future<void> deleteMany(Set<Uint8List> keyIds);

  Future<void> clear();
}
