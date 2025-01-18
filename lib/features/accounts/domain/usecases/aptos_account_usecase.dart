import 'dart:typed_data';

import '../../data/models/local/aptos_account_local_model.dart';
import '../../data/repositories/aptos_account_repository_implementation.dart';

class CreateAptosAccountUseCase {
  CreateAptosAccountUseCase(this._repository);

  final AptosAccountRepository _repository;

  Future<int> call({
    required Uint8List accountAddress,
    required Uint8List authenticationKey,
    required Uint8List publicKeyKId,
  }) async {
    try {
      if (_repository.hasAccountWithAddress(accountAddress)) {
        throw StateError('Account already exists for this address');
      }

      return _repository.storeAccountWithAuthConfig(
        accountAddress: accountAddress,
        authenticationKey: authenticationKey,
        kId: publicKeyKId,
      );
    } catch (e) {
      throw StateError('Failed to create account: $e');
    }
  }
}

// class DeleteAptosAccountUseCase {
//   DeleteAptosAccountUseCase(this._repository);

//   final AptosAccountRepository _repository;

//   Future<void> call(Uint8List address) async {
//     try {
//       if (!_repository.hasAccountWithAddress(address)) {
//         throw StateError('Account not found');
//       }
//       _repository.deleteAccountByAddress(address);
//     } catch (e) {
//       throw StateError('Failed to delete account: $e');
//     }
//   }
// }

class GetAptosAccountUseCase {
  GetAptosAccountUseCase(this._repository);

  final AptosAccountRepository _repository;

  Future<AptosAccountLocalModel> call(Uint8List address) async {
    try {
      final AptosAccountLocalModel? account =
          _repository.findAccountByAddress(address);
      if (account == null) {
        throw StateError('Account not found');
      }
      return account;
    } catch (e) {
      throw StateError('Failed to get account: $e');
    }
  }
}

class ListAptosAccountsUseCase {
  ListAptosAccountsUseCase(this._repository);

  final AptosAccountRepository _repository;

  Future<List<AptosAccountLocalModel>> call() async {
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
