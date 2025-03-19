import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/account_address.dart';
import '../repositories/aptos_account_repository_interface.dart';

class UpdateAccountLabelUseCase {
  const UpdateAccountLabelUseCase({required IAptosAccountRepository repository})
    : _repository = repository;

  final IAptosAccountRepository _repository;

  Future<Either<ExceptionWithStackTrace, Unit>> call({
    required AccountAddress accountAddress,
    required String newLabel,
  }) =>
      _repository
          .updateLabel(accountAddress: accountAddress, newLabel: newLabel)
          .run();
}
