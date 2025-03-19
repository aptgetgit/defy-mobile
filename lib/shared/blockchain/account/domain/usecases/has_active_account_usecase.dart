import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../repositories/active_account_repository_interface.dart';

class HasActiveAccountUseCase {
  const HasActiveAccountUseCase({required IActiveAccountRepository repository})
    : _repository = repository;

  final IActiveAccountRepository _repository;

  Future<Either<ExceptionWithStackTrace, bool>> call() =>
      _repository.hasActiveAccount().run();
}
