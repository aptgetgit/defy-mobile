import 'dart:ui';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../repositories/aptos_account_repository_interface.dart';

class CreateAptosAccountUseCase {
  CreateAptosAccountUseCase({required IAptosAccountRepository repository})
    : _repository = repository;

  final IAptosAccountRepository _repository;

  TaskEither<ExceptionWithStackTrace, AptosAccountWithMetadata> call({
    required String label,
    required Uri iconUri,
    required Color backgroundColor,
    required AuthenticatorConfig authenticatorConfig,
    Option<AccountAddress> accountAddress = const Option<AccountAddress>.none(),
  }) => TaskEither<ExceptionWithStackTrace, AptosAccountWithMetadata>(() async {
    if (label.trim().isEmpty) {
      throw StateError('Label cannot be empty');
    }

    return _repository
        .createAccount(
          label: label,
          iconUri: iconUri,
          backgroundColor: backgroundColor,
          config: authenticatorConfig,
          accountAddress: accountAddress,
        )
        .run();
  });
}
