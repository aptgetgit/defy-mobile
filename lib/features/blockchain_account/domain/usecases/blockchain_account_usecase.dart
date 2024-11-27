import 'package:defy/features/blockchain_account/data/models/remote/blockchain_account_remote_model.dart';
import 'package:defy/features/blockchain_account/data/repositories/blockchain_account_repository_implementation.dart';
import 'package:defy/features/blockchain_account/domain/entities/blockchain_account.dart';

class ListLocalBlockchainAccountsUseCase {
  final BlockchainAccountRepository _repository;

  ListLocalBlockchainAccountsUseCase(this._repository);

  List<BlockchainAccount> call() {
    return _repository.listLocalBlockchainAccounts();
  }
}

class GetLocalBlockchainAccountUseCase {
  final BlockchainAccountRepository _repository;

  GetLocalBlockchainAccountUseCase(this._repository);

  BlockchainAccount? call(String blockchainAccountId) {
    return _repository.getLocalBlockchainAccount(blockchainAccountId);
  }
}

class SaveLocalBlockchainAccountUseCase {
  final BlockchainAccountRepository _repository;

  SaveLocalBlockchainAccountUseCase(this._repository);

  void call(BlockchainAccount blockchainAccount) {
    return _repository.saveLocalBlockchainAccount(blockchainAccount);
  }
}

class DeleteLocalBlockchainAccountUseCase {
  final BlockchainAccountRepository _repository;

  DeleteLocalBlockchainAccountUseCase(this._repository);

  void call(String blockchainAccountId) {
    return _repository.deleteLocalBlockchainAccount(blockchainAccountId);
  }
}

class CreateRemoteBlockchainAccountUseCase {
  final BlockchainAccountRepository _repository;

  CreateRemoteBlockchainAccountUseCase(this._repository);

  Future<BlockchainAccount> call(CreateBlockchainAccountRemoteRequest body) {
    return _repository.createRemoteBlockchainAccount(body);
  }
}

class ListRemoteBlockchainAccountsUseCase {
  final BlockchainAccountRepository _repository;

  ListRemoteBlockchainAccountsUseCase(this._repository);

  Future<List<BlockchainAccount>> call({String? namespace, String? reference}) {
    return _repository.listRemoteBlockchainAccounts(
        namespace: namespace, reference: reference);
  }
}

class GetRemoteBlockchainAccountUseCase {
  final BlockchainAccountRepository _repository;

  GetRemoteBlockchainAccountUseCase(this._repository);

  Future<BlockchainAccount?> call(String blockchainAccountId) {
    return _repository.getRemoteBlockchainAccount(blockchainAccountId);
  }
}

class DeleteRemoteBlockchainAccountUseCase {
  final BlockchainAccountRepository _repository;

  DeleteRemoteBlockchainAccountUseCase(this._repository);

  Future<void> call(String blockchainAccountId) {
    return _repository.deleteRemoteBlockchainAccount(blockchainAccountId);
  }
}

class SyncBlockchainAccountsUseCase {
  final BlockchainAccountRepository _repository;

  SyncBlockchainAccountsUseCase(this._repository);

  Future<void> call() {
    return _repository.syncBlockchainAccounts();
  }
}
