import 'dart:ui';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/account_address.dart';
import '../repositories/aptos_account_repository_interface.dart';

class UpdateAccountBackgroundColorUseCase {
  const UpdateAccountBackgroundColorUseCase({
    required IAptosAccountRepository repository,
  }) : _repository = repository;

  final IAptosAccountRepository _repository;

  TaskEither<ExceptionWithStackTrace, Unit> call({
    required AccountAddress accountAddress,
    required Color newBackgroundColor,
  }) => _repository.updateBackgroundColor(
    accountAddress: accountAddress,
    newBackgroundColor: newBackgroundColor,
  );
}
