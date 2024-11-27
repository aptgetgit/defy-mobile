import 'package:defy/features/blockchain_account/domain/entities/blockchain_account.dart';
import 'package:defy/features/blockchain_account_group_assignment/data/sources/local/blockchain_account_group_assignment_local_source.dart';
import 'package:defy/features/blockchain_account_group_assignment/data/sources/remote/blockchain_account_group_assignment_remote_source.dart';
import 'package:defy/features/blockchain_account_group_assignment/domain/entities/blockchain_account_group_assignment.dart';
import 'package:defy/features/blockchain_account_group_assignment/domain/repositories/blockchain_account_group_assignment_repository.dart';

class BlockchainAccountGroupAssignmentRepository
    implements IBlockchainAccountGroupAssignmentRepository {
  final BlockchainAccountGroupAssignmentLocalDataSource _localDataSource;
  final BlockchainAccountGroupAssignmentRemoteDataSource _remoteDataSource;

  BlockchainAccountGroupAssignmentRepository(
      this._localDataSource, this._remoteDataSource);

  @override
  List<BlockchainAccountGroupAssignment>
      listLocalBlockchainAccountGroupAssignments() {
    return _localDataSource
        .listBlockchainAccountGroupAssignments()
        .map((model) => model.toDomain())
        .toList();
  }

  @override
  List<BlockchainAccountGroupAssignment>
      getLocalBlockchainAccountGroupAssignmentsByGroup(
          String blockchainAccountGroupId) {
    return _localDataSource
        .getBlockchainAccountGroupAssignmentsByGroup(blockchainAccountGroupId)
        .map((model) => model.toDomain())
        .toList();
  }

  @override
  BlockchainAccountGroupAssignment?
      getLocalBlockchainAccountGroupAssignmentByAccount(
          String blockchainAccountId) {
    return _localDataSource
        .getBlockchainAccountGroupAssignmentByAccount(blockchainAccountId)
        ?.toDomain();
  }

  @override
  BlockchainAccountGroupAssignment? getLocalBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId) {
    final model = _localDataSource.getBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
    return model?.toDomain();
  }

  @override
  void saveLocalBlockchainAccountGroupAssignment(
      BlockchainAccountGroupAssignment assignment) {
    final existingAssignment =
        _localDataSource.getBlockchainAccountGroupAssignment(
            assignment.blockchainAccountGroupId,
            assignment.blockchainAccountId);
    if (existingAssignment == null) {
      _localDataSource.saveBlockchainAccountGroupAssignment(assignment);
    }
  }

  @override
  void deleteLocalBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId) {
    _localDataSource.deleteAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }

  @override
  Future<List<BlockchainAccount>> listRemoteBlockchainAccountGroupAssignments(
      String blockchainAccountGroupId) async {
    final response = await _remoteDataSource
        .listBlockchainAccountGroupAssignments(blockchainAccountGroupId);
    return response.data?.map((model) => model.toDomain()).toList() ?? [];
  }

  @override
  Future<BlockchainAccount?> getRemoteBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId) async {
    final response =
        await _remoteDataSource.getBlockchainAccountGroupAssignment(
            blockchainAccountGroupId, blockchainAccountId);
    return response.data?.toDomain();
  }

  @override
  Future<BlockchainAccount> updateRemoteBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId) async {
    final response =
        await _remoteDataSource.updateBlockchainAccountGroupAssignment(
            blockchainAccountGroupId, blockchainAccountId);
    return response.data!.toDomain();
  }

  @override
  Future<void> deleteRemoteBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId) {
    return _remoteDataSource.deleteBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }

  @override
  Future<void> syncBlockchainAccountGroupAssignments(
      String blockchainAccountGroupId) async {
    final remoteAssignments = await listRemoteBlockchainAccountGroupAssignments(
        blockchainAccountGroupId);
    final localAssignments = getLocalBlockchainAccountGroupAssignmentsByGroup(
        blockchainAccountGroupId);

    // Delete local assignments that are not in the remote list
    for (final localAssignment in localAssignments) {
      if (!remoteAssignments
          .any((remote) => remote.id == localAssignment.blockchainAccountId)) {
        deleteLocalBlockchainAccountGroupAssignment(
            blockchainAccountGroupId, localAssignment.blockchainAccountId);
      }
    }

    // Add or update local assignments based on remote data
    for (final remoteAccount in remoteAssignments) {
      saveLocalBlockchainAccountGroupAssignment(
          BlockchainAccountGroupAssignment(
        blockchainAccountGroupId: blockchainAccountGroupId,
        blockchainAccountId: remoteAccount.id,
      ));
    }
  }
}
