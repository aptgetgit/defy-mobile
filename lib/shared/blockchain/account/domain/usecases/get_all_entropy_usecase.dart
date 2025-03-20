import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../repositories/entropy_repository_interface.dart';

class GetAllEntropyUseCase {
  const GetAllEntropyUseCase({required IEntropyRepository repository})
      : _repository = repository;

  final IEntropyRepository _repository;

  Future<Either<ExceptionWithStackTrace, Set<Uint8List>>> call() =>
      _repository.getAllHashes().run();
}
