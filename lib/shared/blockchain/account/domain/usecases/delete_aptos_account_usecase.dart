import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/account_address.dart';
import '../repositories/aptos_account_repository_interface.dart';



class DeleteAptosAccountUseCase {
  DeleteAptosAccountUseCase({required IAptosAccountRepository repository})
    : _repository = repository;

  final IAptosAccountRepository _repository;

  Future<Either<ExceptionWithStackTrace, Unit>> call({
    required AccountAddress accountAddress,
  }) => _repository.deleteByAddress(accountAddress: accountAddress).run();
}
