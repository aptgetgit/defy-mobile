import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../repositories/aptos_account_repository_interface.dart';

class ListAptosAccountsUseCase {
  ListAptosAccountsUseCase({required IAptosAccountRepository repository})
    : _repository = repository;

  final IAptosAccountRepository _repository;

  Future<Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>>
  call() => _repository.getAll().run();

  Either<ExceptionWithStackTrace, int> getCount() => _repository.count().run();
}
