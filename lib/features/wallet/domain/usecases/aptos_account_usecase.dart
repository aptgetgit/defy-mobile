import '../../data/repositories/aptos_account_repository_implementation.dart';
import '../entities/account_address.dart';
import '../entities/aptos_account.dart';
import '../repositories/aptos_account_repository.dart';

class CreateAptosAccountUseCase {
  CreateAptosAccountUseCase(this._repository);

  final AptosAccountRepository _repository;

  Future<AptosAccount> call({
    required AuthenticatorConfig authenticatorConfig,
    AccountAddress? accountAddress,
  }) async {
    try {
      return _repository.storeAccountWithAuthenticatorConfig(
        accountAddress: accountAddress,
        authenticatorConfig: authenticatorConfig,
      );
    } catch (e) {
      throw StateError('Failed to create account: $e');
    }
  }
}

class DeleteAptosAccountUseCase {
  DeleteAptosAccountUseCase(this._repository);

  final AptosAccountRepository _repository;

  Future<void> call(AccountAddress accountAddress) async {
    try {
      if (!_repository.hasAccountWithAddress(accountAddress: accountAddress)) {
        throw StateError('Account not found');
      }
      _repository.deleteAccountByAddress(accountAddress: accountAddress);
    } catch (e) {
      throw StateError('Failed to delete account: $e');
    }
  }
}

class GetAptosAccountUseCase {
  GetAptosAccountUseCase(this._repository);

  final AptosAccountRepository _repository;

  Future<AptosAccount?> call(AccountAddress accountAddress) async {
    try {
      final AptosAccount? account =
          _repository.findAccountByAddress(accountAddress: accountAddress);
      return account;
    } catch (e) {
      throw StateError('Failed to get account: $e');
    }
  }
}

class ListAptosAccountsUseCase {
  ListAptosAccountsUseCase(this._repository);

  final AptosAccountRepository _repository;

  Future<List<AptosAccount>> call() async {
    try {
      return _repository.getAllAccounts();
    } catch (e) {
      throw StateError('Failed to list accounts: $e');
    }
  }

  Future<int> getCount() async {
    try {
      return _repository.getAccountCount();
    } catch (e) {
      throw StateError('Failed to get account count: $e');
    }
  }
}
