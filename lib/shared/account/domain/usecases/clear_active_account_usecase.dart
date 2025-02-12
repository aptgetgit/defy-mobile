import '../repositories/active_account_repository_interface.dart';

class ClearActiveAccountUseCase {
  const ClearActiveAccountUseCase({
    required IActiveAccountRepository repository,
  }) : _repository = repository;

  final IActiveAccountRepository _repository;

  Future<void> call() => _repository.clearActiveAccount();
}
