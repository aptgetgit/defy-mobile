import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/json_web_key.dart';

abstract class IPrivateJwkRepository {
  TaskEither<ExceptionWithStackTrace, Jwk> store({required Jwk jwk});

  TaskEither<ExceptionWithStackTrace, Option<Jwk>> get({
    required Uint8List keyId,
  });

  TaskEither<ExceptionWithStackTrace, Set<Uint8List>> getAllKeyIds();

  TaskEither<ExceptionWithStackTrace, int> count();

  TaskEither<ExceptionWithStackTrace, bool> has({required Uint8List keyId});

  TaskEither<ExceptionWithStackTrace, Unit> delete({required Uint8List keyId});

  TaskEither<ExceptionWithStackTrace, Unit> deleteMany({
    required Set<Uint8List> keyIds,
  });

  TaskEither<ExceptionWithStackTrace, Unit> clear();
}
