import 'package:defy/features/shared/data/models/user_blockchain_account_group/user_blockchain_account_group_remote_model.dart';
import 'package:defy/features/shared/data/sources/local/user_blockchain_account_group_local_source.dart';
import 'package:defy/features/shared/data/sources/remote/user_blockchain_account_group_remote_source.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account_group.dart';
import 'package:defy/features/shared/domain/repositories/user_blockchain_account_group_repository.dart';

class UserBlockchainAccountGroupRepositoryImplementation implements UserBlockchainAccountGroupRepository {
  final UserBlockchainAccountGroupLocalDataSource _localDataSource;
  final UserBlockchainAccountGroupRemoteDataSource _remoteDataSource;

  UserBlockchainAccountGroupRepositoryImplementation(this._localDataSource, this._remoteDataSource);

  @override
  List<UserBlockchainAccountGroup> listLocalUserBlockchainAccountGroups() {
    return _localDataSource.listUserBlockchainAccountGroups()
        .map((model) => model.toDomain())
        .toList();
  }

  @override
  UserBlockchainAccountGroup? getLocalUserBlockchainAccountGroup(String blockchainAccountGroupId) {
    final model = _localDataSource.getUserBlockchainAccountGroup(blockchainAccountGroupId);
    return model?.toDomain();
  }

  @override
  void saveLocalUserBlockchainAccountGroup(UserBlockchainAccountGroup blockchainAccountGroup) {
    final existingGroup = getLocalUserBlockchainAccountGroup(blockchainAccountGroup.id);
    if (existingGroup != null) {
      final updatedGroup = existingGroup.copyWith(
        name: blockchainAccountGroup.name,
        animatedIconUrl: blockchainAccountGroup.animatedIconUrl,
        backgroundColor: blockchainAccountGroup.backgroundColor,
      );
      _localDataSource.saveUserBlockchainAccountGroup(updatedGroup);
      return;
    }
    _localDataSource.saveUserBlockchainAccountGroup(blockchainAccountGroup);
  }

  @override
  void deleteLocalUserBlockchainAccountGroup(String blockchainAccountGroupId) {
    _localDataSource.deleteUserBlockchainAccountGroup(blockchainAccountGroupId);
  }

  @override
  UserBlockchainAccountGroup? getLocalUserBlockchainAccountGroupByName(String name) {
    final model = _localDataSource.getUserBlockchainAccountGroupByName(name);
    return model?.toDomain();
  }

  @override
  Future<UserBlockchainAccountGroup> createRemoteUserBlockchainAccountGroup(CreateUserBlockchainAccountGroupRemoteRequest body) async {
    final response = await _remoteDataSource.createUserBlockchainAccountGroup(body);
    final group = response.data!.toDomain();
    saveLocalUserBlockchainAccountGroup(group);
    return group;
  }

  @override
  Future<List<UserBlockchainAccountGroup>> listRemoteUserBlockchainAccountGroups() async {
    final response = await _remoteDataSource.listUserBlockchainAccountGroups();
    return response.data?.map((model) => model.toDomain()).toList() ?? [];
  }

  @override
  Future<UserBlockchainAccountGroup?> getRemoteUserBlockchainAccountGroup(String blockchainAccountGroupId) async {
    final response = await _remoteDataSource.getUserBlockchainAccountGroup(blockchainAccountGroupId);
    return response.data?.toDomain();
  }

  @override
  Future<UserBlockchainAccountGroup> updateRemoteUserBlockchainAccountGroup(String blockchainAccountGroupId, UpdateUserBlockchainAccountGroupRemoteRequest body) async {
    final response = await _remoteDataSource.updateUserBlockchainAccountGroup(blockchainAccountGroupId, body);
    final updatedGroup = response.data!.toDomain();
    saveLocalUserBlockchainAccountGroup(updatedGroup);
    return updatedGroup;
  }

  @override
  Future<void> deleteRemoteUserBlockchainAccountGroup(String blockchainAccountGroupId) async {
    await _remoteDataSource.deleteUserBlockchainAccountGroup(blockchainAccountGroupId);
    deleteLocalUserBlockchainAccountGroup(blockchainAccountGroupId);
  }

  @override
  Future<void> syncUserBlockchainAccountGroups() async {
    final remoteGroups = await listRemoteUserBlockchainAccountGroups();
    for (final group in remoteGroups) {
      saveLocalUserBlockchainAccountGroup(group);
    }
  }
}