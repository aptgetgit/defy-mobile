import 'package:defy/features/shared/data/models/user_blockchain_account_group/user_blockchain_account_group_remote_model.dart';
import 'package:defy/features/shared/data/repositories/user_blockchain_account_group_repository_implementation.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account_group.dart';

class ListLocalUserBlockchainAccountGroupsUseCase {
  final UserBlockchainAccountGroupRepository _repository;

  ListLocalUserBlockchainAccountGroupsUseCase(this._repository);

  List<UserBlockchainAccountGroup> call() {
    return _repository.listLocalUserBlockchainAccountGroups();
  }
}

class GetLocalUserBlockchainAccountGroupUseCase {
  final UserBlockchainAccountGroupRepository _repository;

  GetLocalUserBlockchainAccountGroupUseCase(this._repository);

  UserBlockchainAccountGroup? call(String blockchainAccountGroupId) {
    return _repository.getLocalUserBlockchainAccountGroup(blockchainAccountGroupId);
  }
}

class SaveLocalUserBlockchainAccountGroupUseCase {
  final UserBlockchainAccountGroupRepository _repository;

  SaveLocalUserBlockchainAccountGroupUseCase(this._repository);

  void call(UserBlockchainAccountGroup blockchainAccountGroup) {
    return _repository.saveLocalUserBlockchainAccountGroup(blockchainAccountGroup);
  }
}

class DeleteLocalUserBlockchainAccountGroupUseCase {
  final UserBlockchainAccountGroupRepository _repository;

  DeleteLocalUserBlockchainAccountGroupUseCase(this._repository);

  void call(String blockchainAccountGroupId) {
    return _repository.deleteLocalUserBlockchainAccountGroup(blockchainAccountGroupId);
  }
}

class GetLocalUserBlockchainAccountGroupByNameUseCase {
  final UserBlockchainAccountGroupRepository _repository;

  GetLocalUserBlockchainAccountGroupByNameUseCase(this._repository);

  UserBlockchainAccountGroup? call(String name) {
    return _repository.getLocalUserBlockchainAccountGroupByName(name);
  }
}

class CreateRemoteUserBlockchainAccountGroupUseCase {
  final UserBlockchainAccountGroupRepository _repository;

  CreateRemoteUserBlockchainAccountGroupUseCase(this._repository);

  Future<UserBlockchainAccountGroup> call(CreateUserBlockchainAccountGroupRemoteRequest body) {
    return _repository.createRemoteUserBlockchainAccountGroup(body);
  }
}

class ListRemoteUserBlockchainAccountGroupsUseCase {
  final UserBlockchainAccountGroupRepository _repository;

  ListRemoteUserBlockchainAccountGroupsUseCase(this._repository);

  Future<List<UserBlockchainAccountGroup>> call() {
    return _repository.listRemoteUserBlockchainAccountGroups();
  }
}

class GetRemoteUserBlockchainAccountGroupUseCase {
  final UserBlockchainAccountGroupRepository _repository;

  GetRemoteUserBlockchainAccountGroupUseCase(this._repository);

  Future<UserBlockchainAccountGroup?> call(String blockchainAccountGroupId) {
    return _repository.getRemoteUserBlockchainAccountGroup(blockchainAccountGroupId);
  }
}

class UpdateRemoteUserBlockchainAccountGroupUseCase {
  final UserBlockchainAccountGroupRepository _repository;

  UpdateRemoteUserBlockchainAccountGroupUseCase(this._repository);

  Future<UserBlockchainAccountGroup> call(String blockchainAccountGroupId, UpdateUserBlockchainAccountGroupRemoteRequest body) {
    return _repository.updateRemoteUserBlockchainAccountGroup(blockchainAccountGroupId, body);
  }
}

class DeleteRemoteUserBlockchainAccountGroupUseCase {
  final UserBlockchainAccountGroupRepository _repository;

  DeleteRemoteUserBlockchainAccountGroupUseCase(this._repository);

  Future<void> call(String blockchainAccountGroupId) {
    return _repository.deleteRemoteUserBlockchainAccountGroup(blockchainAccountGroupId);
  }
}

class SyncUserBlockchainAccountGroupsUseCase {
  final UserBlockchainAccountGroupRepository _repository;

  SyncUserBlockchainAccountGroupsUseCase(this._repository);

  Future<void> call() {
    return _repository.syncUserBlockchainAccountGroups();
  }
}
