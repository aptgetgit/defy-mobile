import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';

abstract class IEntropyRepository {
  TaskEither<ExceptionWithStackTrace, Uint8List> store({
    required Uint8List entropy,
  });

  TaskEither<ExceptionWithStackTrace, Option<Uint8List>> get({
    required Uint8List hash,
  });

  TaskEither<ExceptionWithStackTrace, Set<Uint8List>> getAllHashes();

  TaskEither<ExceptionWithStackTrace, int> count();

  TaskEither<ExceptionWithStackTrace, bool> has({required Uint8List hash});

  TaskEither<ExceptionWithStackTrace, Unit> delete({required Uint8List hash});

  TaskEither<ExceptionWithStackTrace, Unit> deleteMany({
    required Set<Uint8List> hashes,
  });

  TaskEither<ExceptionWithStackTrace, Unit> clear();
}
