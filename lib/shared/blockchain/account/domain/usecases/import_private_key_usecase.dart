import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/ed25519_utils.dart';
import '../entities/json_web_key.dart';
import '../repositories/jwk_repository_interface.dart';
import '../repositories/private_jwk_repository_interface.dart';

class ImportPrivateKeyUseCase {
  ImportPrivateKeyUseCase({
    required IPrivateJwkRepository privateJwkRepository,
    required IJwkRepository jwkRepository,
  }) : _privateJwkRepository = privateJwkRepository,
       _jwkRepository = jwkRepository;

  final IPrivateJwkRepository _privateJwkRepository;
  final IJwkRepository _jwkRepository;

  Future<Either<ExceptionWithStackTrace, Uint8List>> call({
    required Uint8List privateKeyBytes,
  }) =>
      TaskEither<ExceptionWithStackTrace, Uint8List>(() async {
        try {
          final Uint8List privateKey = expandSecretKey(privateKeyBytes);

          final Jwk jwk = Jwk.fromEd25519PrivateKey(
            privateKey: Uint8List.fromList(privateKey.sublist(0, 32)),
          );

          final Uint8List jwkKeyId = jwk.keyId;

          final Either<ExceptionWithStackTrace, Jwk> storePrivateResult =
              await _privateJwkRepository.store(jwk: jwk).run();

          if (storePrivateResult.isLeft()) {
            return left(storePrivateResult.getLeft().toNullable()!);
          }

          final Either<ExceptionWithStackTrace, Jwk> storePublicResult =
              await _jwkRepository
                  .store(
                    jwk: jwk,
                    config: KeySourceConfig.fromSigningKey(
                      jwkThumbprint: jwkKeyId,
                    ),
                  )
                  .run();

          if (storePublicResult.isLeft()) {
            await _privateJwkRepository.delete(keyId: jwkKeyId).run();
            return left(storePublicResult.getLeft().toNullable()!);
          }

          return right(jwkKeyId);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      }).run();
}
