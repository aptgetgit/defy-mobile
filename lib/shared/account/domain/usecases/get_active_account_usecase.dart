import '../entities/aptos_account_with_metadata.dart';
import '../repositories/active_account_repository_interface.dart';

class GetActiveAccountUseCase {
  const GetActiveAccountUseCase({
    required IActiveAccountRepository repository,
  }) : _repository = repository;

  final IActiveAccountRepository _repository;

  AptosAccountWithMetadata? call() => _repository.getActiveAccount();
}
