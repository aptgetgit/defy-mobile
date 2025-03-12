import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/json_web_key.dart';
import '../repositories/private_jwk_repository_interface.dart';

class GetPrivateKeyUseCase {
  const GetPrivateKeyUseCase({required IPrivateJwkRepository repository})
      : _repository = repository;
  final IPrivateJwkRepository _repository;

  TaskEither<ExceptionWithStackTrace, Jwk> call({
    required Uint8List keyId,
  }) => TaskEither<ExceptionWithStackTrace, Jwk>(() async {
    final Either<ExceptionWithStackTrace, Option<Jwk>> jwkResult = 
        await _repository.get(keyId: keyId).run();
        
    if (jwkResult.isLeft()) {
      return left(jwkResult.getLeft().toNullable()!);
    }
    
    final Option<Jwk> jwkOption = jwkResult.getRight().toNullable()!;
    
    if (jwkOption.isNone()) {
      throw StateError('Private key not found');
    }
    
    return right(jwkOption.toNullable()!);
  });
}
