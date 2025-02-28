import '../entities/aptos_account_with_metadata.dart';
import '../repositories/aptos_account_repository_interface.dart';

class ListAptosAccountsUseCase {
  ListAptosAccountsUseCase({required IAptosAccountRepository repository})
      : _repository = repository;

  final IAptosAccountRepository _repository;

  Future<Set<AptosAccountWithMetadata>> call() async {
    try {
      return _repository.getAll();
    } catch (e) {
      throw StateError('Failed to list accounts: $e');
    }
  }

  Future<int> getCount() async {
    try {
      return _repository.count();
    } catch (e) {
      throw StateError('Failed to get account count: $e');
    }
  }
}
