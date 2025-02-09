import 'dart:typed_data';

import '../../../utils/ed25519_utils.dart';
import '../entities/json_web_key.dart';
import '../repositories/jwk_repository_interface.dart';
import '../repositories/private_jwk_repository_interface.dart';

class ImportPrivateKeyUseCase {
  ImportPrivateKeyUseCase({
    required IPrivateJwkRepository privateJwkRepository,
    required IJwkRepository jwkRepository,
  })  : _privateJwkRepository = privateJwkRepository,
        _jwkRepository = jwkRepository;

  final IPrivateJwkRepository _privateJwkRepository;
  final IJwkRepository _jwkRepository;

  Future<Uint8List> call(Uint8List privateKeyBytes) async {
    final Uint8List privateKey = expandSecretKey(privateKeyBytes);

    final Jwk jwk = Jwk.fromEd25519PrivateKey(
      privateKey: Uint8List.fromList(privateKey.sublist(0, 32)),
    );

    final Uint8List jwkKeyId = jwk.keyId;
    try {
      await _privateJwkRepository.store(jwk: jwk);

      await _jwkRepository.store(
        jwk: jwk,
        config: KeySourceConfig.fromSigningKey(jwkThumbprint: jwkKeyId),
      );

      return jwkKeyId;
    } catch (e) {
      await _privateJwkRepository.delete(keyId: jwkKeyId);
      throw StateError('Failed to import key pair: $e');
    }
  }
}
