import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../repositories/active_network_repository_interface.dart';

class ClearActiveNetworkUseCase {
  const ClearActiveNetworkUseCase({
    required IActiveNetworkRepository repository,
  }) : _repository = repository;

  final IActiveNetworkRepository _repository;

  Future<Either<ExceptionWithStackTrace, Unit>> call() =>
      _repository.clearActiveNetwork().run();
}
