import '../repositories/active_account_repository_interface.dart';

class HasActiveAccountUseCase {
  const HasActiveAccountUseCase({
    required IActiveAccountRepository repository,
  }) : _repository = repository;

  final IActiveAccountRepository _repository;

  Future<bool> call() => _repository.hasActiveAccount();
}
