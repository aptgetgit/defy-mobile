import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../repositories/aptos_account_repository_interface.dart';

class GetAptosAccountUseCase {
  GetAptosAccountUseCase({required IAptosAccountRepository repository})
    : _repository = repository;

  final IAptosAccountRepository _repository;

  TaskEither<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>> call({
    required AccountAddress accountAddress,
  }) => _repository.getByAddress(accountAddress: accountAddress);
}
