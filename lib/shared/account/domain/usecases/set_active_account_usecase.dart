import '../entities/account_address.dart';
import '../repositories/active_account_repository_interface.dart';

class SetActiveAccountUseCase {
  const SetActiveAccountUseCase({
    required IActiveAccountRepository repository,
  }) : _repository = repository;

  final IActiveAccountRepository _repository;

  Future<void> call({required AccountAddress accountAddress}) => 
      _repository.setActiveAccount(accountAddress: accountAddress);
}
