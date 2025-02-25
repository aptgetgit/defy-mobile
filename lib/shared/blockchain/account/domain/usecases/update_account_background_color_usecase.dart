import 'dart:ui';

import '../entities/account_address.dart';
import '../repositories/aptos_account_repository_interface.dart';

class UpdateAccountBackgroundColorUseCase {
  const UpdateAccountBackgroundColorUseCase({
    required IAptosAccountRepository repository,
  }) : _repository = repository;

  final IAptosAccountRepository _repository;

  void call({
    required AccountAddress accountAddress,
    required Color newBackgroundColor,
  }) =>
      _repository.updateBackgroundColor(
        accountAddress: accountAddress,
        newBackgroundColor: newBackgroundColor,
      );
}
