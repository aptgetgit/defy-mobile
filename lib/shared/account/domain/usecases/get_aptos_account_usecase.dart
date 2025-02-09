import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../repositories/aptos_account_repository_interface.dart';

class GetAptosAccountUseCase {
  GetAptosAccountUseCase({required IAptosAccountRepository repository})
      : _repository = repository;

  final IAptosAccountRepository _repository;

  Future<AptosAccountWithMetadata?> call({
    required AccountAddress accountAddress,
  }) async {
    try {
      final AptosAccountWithMetadata? account =
          _repository.getByAddress(accountAddress: accountAddress);
      return account;
    } catch (e) {
      throw StateError('Failed to get account: $e');
    }
  }
}
