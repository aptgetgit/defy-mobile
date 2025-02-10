import 'package:defy/features/shared/data/models/user_blockchain_account/user_blockchain_account_remote_model.dart';
import 'package:defy/features/shared/data/repositories/user_blockchain_account_repository_implementation.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account.dart';

class ListLocalUserBlockchainAccountsUseCase {
  final UserBlockchainAccountRepository _repository;

  ListLocalUserBlockchainAccountsUseCase(this._repository);

  List<UserBlockchainAccount> call() {
    return _repository.listLocalUserBlockchainAccounts();
  }
}

class GetLocalUserBlockchainAccountUseCase {
  final UserBlockchainAccountRepository _repository;

  GetLocalUserBlockchainAccountUseCase(this._repository);

  UserBlockchainAccount? call(String blockchainAccountId) {
    return _repository.getLocalUserBlockchainAccount(blockchainAccountId);
  }
}

class SaveLocalUserBlockchainAccountUseCase {
  final UserBlockchainAccountRepository _repository;

  SaveLocalUserBlockchainAccountUseCase(this._repository);

  void call(UserBlockchainAccount blockchainAccount) {
    return _repository.saveLocalUserBlockchainAccount(blockchainAccount);
  }
}

class DeleteLocalUserBlockchainAccountUseCase {
  final UserBlockchainAccountRepository _repository;

  DeleteLocalUserBlockchainAccountUseCase(this._repository);

  void call(String blockchainAccountId) {
    return _repository.deleteLocalUserBlockchainAccount(blockchainAccountId);
  }
}

class CreateRemoteUserBlockchainAccountUseCase {
  final UserBlockchainAccountRepository _repository;

  CreateRemoteUserBlockchainAccountUseCase(this._repository);

  Future<UserBlockchainAccount> call(
      CreateUserBlockchainAccountRemoteRequest body) {
    return _repository.createRemoteUserBlockchainAccount(body);
  }
}

class ListRemoteUserBlockchainAccountsUseCase {
  final UserBlockchainAccountRepository _repository;

  ListRemoteUserBlockchainAccountsUseCase(this._repository);

  Future<List<UserBlockchainAccount>> call(
      {String? namespace, String? reference}) {
    return _repository.listRemoteUserBlockchainAccounts(
        namespace: namespace, reference: reference);
  }
}

class GetRemoteUserBlockchainAccountUseCase {
  final UserBlockchainAccountRepository _repository;

  GetRemoteUserBlockchainAccountUseCase(this._repository);

  Future<UserBlockchainAccount?> call(String blockchainAccountId) {
    return _repository.getRemoteUserBlockchainAccount(blockchainAccountId);
  }
}

class DeleteRemoteUserBlockchainAccountUseCase {
  final UserBlockchainAccountRepository _repository;

  DeleteRemoteUserBlockchainAccountUseCase(this._repository);

  Future<void> call(String blockchainAccountId) {
    return _repository.deleteRemoteUserBlockchainAccount(blockchainAccountId);
  }
}

class SyncUserBlockchainAccountsUseCase {
  final UserBlockchainAccountRepository _repository;

  SyncUserBlockchainAccountsUseCase(this._repository);

  Future<void> call() {
    return _repository.syncUserBlockchainAccounts();
  }
}
