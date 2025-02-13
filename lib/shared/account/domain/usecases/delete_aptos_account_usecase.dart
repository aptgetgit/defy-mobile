import '../entities/account_address.dart';
import '../repositories/aptos_account_repository_interface.dart';

class DeleteAptosAccountUseCase {
  DeleteAptosAccountUseCase({required IAptosAccountRepository repository})
      : _repository = repository;

  final IAptosAccountRepository _repository;

  Future<void> call({required AccountAddress accountAddress}) async {
    try {
      _repository.deleteByAddress(accountAddress: accountAddress);
    } catch (e) {
      throw StateError('Failed to delete account: $e');
    }
  }
}
