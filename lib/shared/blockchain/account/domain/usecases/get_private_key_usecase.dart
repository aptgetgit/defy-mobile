import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/json_web_key.dart';
import '../repositories/private_jwk_repository_interface.dart';

class GetPrivateKeyUseCase {
  const GetPrivateKeyUseCase({required IPrivateJwkRepository repository})
    : _repository = repository;
  final IPrivateJwkRepository _repository;

  Future<Either<ExceptionWithStackTrace, Option<Jwk>>> call({
    required Uint8List keyId,
  }) =>
      TaskEither<ExceptionWithStackTrace, Option<Jwk>>(() async {
        final Either<ExceptionWithStackTrace, Option<Jwk>> jwkResult =
            await _repository.get(keyId: keyId).run();

        if (jwkResult.isLeft()) {
          return left(jwkResult.getLeft().toNullable()!);
        }

        return jwkResult;
      }).run();
}
