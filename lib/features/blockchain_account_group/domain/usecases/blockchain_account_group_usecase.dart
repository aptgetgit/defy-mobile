import 'package:defy/features/blockchain_account_group/data/models/remote/blockchain_account_group_remote_model.dart';
import 'package:defy/features/blockchain_account_group/data/repositories/blockchain_account_group_repository_implementation.dart';
import 'package:defy/features/blockchain_account_group/domain/entities/blockchain_account_group.dart';

class ListLocalBlockchainAccountGroupsUseCase {
  final BlockchainAccountGroupRepository _repository;

  ListLocalBlockchainAccountGroupsUseCase(this._repository);

  List<BlockchainAccountGroup> call() {
    return _repository.listLocalBlockchainAccountGroups();
  }
}

class GetLocalBlockchainAccountGroupUseCase {
  final BlockchainAccountGroupRepository _repository;

  GetLocalBlockchainAccountGroupUseCase(this._repository);

  BlockchainAccountGroup? call(String blockchainAccountGroupId) {
    return _repository.getLocalBlockchainAccountGroup(blockchainAccountGroupId);
  }
}

class SaveLocalBlockchainAccountGroupUseCase {
  final BlockchainAccountGroupRepository _repository;

  SaveLocalBlockchainAccountGroupUseCase(this._repository);

  void call(BlockchainAccountGroup blockchainAccountGroup) {
    return _repository.saveLocalBlockchainAccountGroup(blockchainAccountGroup);
  }
}

class DeleteLocalBlockchainAccountGroupUseCase {
  final BlockchainAccountGroupRepository _repository;

  DeleteLocalBlockchainAccountGroupUseCase(this._repository);

  void call(String blockchainAccountGroupId) {
    return _repository
        .deleteLocalBlockchainAccountGroup(blockchainAccountGroupId);
  }
}

class GetLocalBlockchainAccountGroupByNameUseCase {
  final BlockchainAccountGroupRepository _repository;

  GetLocalBlockchainAccountGroupByNameUseCase(this._repository);

  BlockchainAccountGroup? call(String name) {
    return _repository.getLocalBlockchainAccountGroupByName(name);
  }
}

class CreateRemoteBlockchainAccountGroupUseCase {
  final BlockchainAccountGroupRepository _repository;

  CreateRemoteBlockchainAccountGroupUseCase(this._repository);

  Future<BlockchainAccountGroup> call(
      CreateBlockchainAccountGroupRemoteRequest body) {
    return _repository.createRemoteBlockchainAccountGroup(body);
  }
}

class ListRemoteBlockchainAccountGroupsUseCase {
  final BlockchainAccountGroupRepository _repository;

  ListRemoteBlockchainAccountGroupsUseCase(this._repository);

  Future<List<BlockchainAccountGroup>> call() {
    return _repository.listRemoteBlockchainAccountGroups();
  }
}

class GetRemoteBlockchainAccountGroupUseCase {
  final BlockchainAccountGroupRepository _repository;

  GetRemoteBlockchainAccountGroupUseCase(this._repository);

  Future<BlockchainAccountGroup?> call(String blockchainAccountGroupId) {
    return _repository
        .getRemoteBlockchainAccountGroup(blockchainAccountGroupId);
  }
}

class UpdateRemoteBlockchainAccountGroupUseCase {
  final BlockchainAccountGroupRepository _repository;

  UpdateRemoteBlockchainAccountGroupUseCase(this._repository);

  Future<BlockchainAccountGroup> call(String blockchainAccountGroupId,
      UpdateBlockchainAccountGroupRemoteRequest body) {
    return _repository.updateRemoteBlockchainAccountGroup(
        blockchainAccountGroupId, body);
  }
}

class DeleteRemoteBlockchainAccountGroupUseCase {
  final BlockchainAccountGroupRepository _repository;

  DeleteRemoteBlockchainAccountGroupUseCase(this._repository);

  Future<void> call(String blockchainAccountGroupId) {
    return _repository
        .deleteRemoteBlockchainAccountGroup(blockchainAccountGroupId);
  }
}

class SyncBlockchainAccountGroupsUseCase {
  final BlockchainAccountGroupRepository _repository;

  SyncBlockchainAccountGroupsUseCase(this._repository);

  Future<void> call() {
    return _repository.syncBlockchainAccountGroups();
  }
}
