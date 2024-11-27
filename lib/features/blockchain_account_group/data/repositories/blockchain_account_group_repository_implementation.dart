import 'package:defy/features/blockchain_account_group/data/models/remote/blockchain_account_group_remote_model.dart';
import 'package:defy/features/blockchain_account_group/data/sources/local/blockchain_account_group_local_source.dart';
import 'package:defy/features/blockchain_account_group/data/sources/remote/blockchain_account_group_remote_source.dart';
import 'package:defy/features/blockchain_account_group/domain/entities/blockchain_account_group.dart';
import 'package:defy/features/blockchain_account_group/domain/repositories/blockchain_account_group_repository.dart';

class BlockchainAccountGroupRepository
    implements IBlockchainAccountGroupRepository {
  final BlockchainAccountGroupLocalDataSource _localDataSource;
  final BlockchainAccountGroupRemoteDataSource _remoteDataSource;

  BlockchainAccountGroupRepository(
      this._localDataSource, this._remoteDataSource);

  @override
  List<BlockchainAccountGroup> listLocalBlockchainAccountGroups() {
    return _localDataSource
        .listBlockchainAccountGroups()
        .map((model) => model.toDomain())
        .toList();
  }

  @override
  BlockchainAccountGroup? getLocalBlockchainAccountGroup(
      String blockchainAccountGroupId) {
    final model =
        _localDataSource.getBlockchainAccountGroup(blockchainAccountGroupId);
    return model?.toDomain();
  }

  @override
  void saveLocalBlockchainAccountGroup(
      BlockchainAccountGroup blockchainAccountGroup) {
    final existingGroup =
        getLocalBlockchainAccountGroup(blockchainAccountGroup.id);
    if (existingGroup != null) {
      final updatedGroup = existingGroup.copyWith(
        name: blockchainAccountGroup.name,
        icon: blockchainAccountGroup.icon,
        color: blockchainAccountGroup.color,
      );
      _localDataSource.saveBlockchainAccountGroup(updatedGroup);
      return;
    }
    _localDataSource.saveBlockchainAccountGroup(blockchainAccountGroup);
  }

  @override
  void deleteLocalBlockchainAccountGroup(String blockchainAccountGroupId) {
    _localDataSource.deleteBlockchainAccountGroup(blockchainAccountGroupId);
  }

  @override
  BlockchainAccountGroup? getLocalBlockchainAccountGroupByName(String name) {
    final model = _localDataSource.getBlockchainAccountGroupByName(name);
    return model?.toDomain();
  }

  @override
  Future<BlockchainAccountGroup> createRemoteBlockchainAccountGroup(
      CreateBlockchainAccountGroupRemoteRequest body) async {
    final response = await _remoteDataSource.createBlockchainAccountGroup(body);
    final group = response.data!.toDomain();
    saveLocalBlockchainAccountGroup(group);
    return group;
  }

  @override
  Future<List<BlockchainAccountGroup>>
      listRemoteBlockchainAccountGroups() async {
    final response = await _remoteDataSource.listBlockchainAccountGroups();
    return response.data?.map((model) => model.toDomain()).toList() ?? [];
  }

  @override
  Future<BlockchainAccountGroup?> getRemoteBlockchainAccountGroup(
      String blockchainAccountGroupId) async {
    final response = await _remoteDataSource
        .getBlockchainAccountGroup(blockchainAccountGroupId);
    return response.data?.toDomain();
  }

  @override
  Future<BlockchainAccountGroup> updateRemoteBlockchainAccountGroup(
      String blockchainAccountGroupId,
      UpdateBlockchainAccountGroupRemoteRequest body) async {
    final response = await _remoteDataSource.updateBlockchainAccountGroup(
        blockchainAccountGroupId, body);
    final updatedGroup = response.data!.toDomain();
    saveLocalBlockchainAccountGroup(updatedGroup);
    return updatedGroup;
  }

  @override
  Future<void> deleteRemoteBlockchainAccountGroup(
      String blockchainAccountGroupId) async {
    await _remoteDataSource
        .deleteBlockchainAccountGroup(blockchainAccountGroupId);
    deleteLocalBlockchainAccountGroup(blockchainAccountGroupId);
  }

  @override
  Future<void> syncBlockchainAccountGroups() async {
    final remoteGroups = await listRemoteBlockchainAccountGroups();
    for (final group in remoteGroups) {
      saveLocalBlockchainAccountGroup(group);
    }
  }
}
