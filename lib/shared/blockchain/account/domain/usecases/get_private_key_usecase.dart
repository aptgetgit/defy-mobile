import 'dart:typed_data';

import '../entities/json_web_key.dart';
import '../repositories/private_jwk_repository_interface.dart';

class GetPrivateKeyUseCase {
  const GetPrivateKeyUseCase({required IPrivateJwkRepository repository})
      : _repository = repository;
  final IPrivateJwkRepository _repository;

  Future<Jwk> call({required Uint8List keyId}) async {
    final Jwk? jwk = await _repository.get(keyId: keyId);
    if (jwk == null) {
      throw StateError('Private key not found');
    }
    return jwk;
  }
}
