import 'package:defy/features/shared/data/sources/local/user_blockchain_account_group_assignment_local_source.dart';
import 'package:defy/features/shared/data/sources/remote/user_blockchain_account_group_assignment_remote_source.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account_group_assignment.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account.dart';
import 'package:defy/features/shared/domain/repositories/user_blockchain_account_group_assignment_repository.dart';

class UserBlockchainAccountGroupAssignmentRepository
    implements IUserBlockchainAccountGroupAssignmentRepository {
  final UserBlockchainAccountGroupAssignmentLocalDataSource _localDataSource;
  final UserBlockchainAccountGroupAssignmentRemoteDataSource _remoteDataSource;

  UserBlockchainAccountGroupAssignmentRepository(
      this._localDataSource, this._remoteDataSource);

  @override
  List<UserBlockchainAccountGroupAssignment>
      listLocalUserBlockchainAccountGroupAssignments() {
    return _localDataSource
        .listUserBlockchainAccountGroupAssignments()
        .map((model) => model.toDomain())
        .toList();
  }

  @override
  List<UserBlockchainAccountGroupAssignment>
      getLocalUserBlockchainAccountGroupAssignmentsByGroup(
          String blockchainAccountGroupId) {
    return _localDataSource
        .getUserBlockchainAccountGroupAssignmentsByGroup(
            blockchainAccountGroupId)
        .map((model) => model.toDomain())
        .toList();
  }

  @override
  UserBlockchainAccountGroupAssignment?
      getLocalUserBlockchainAccountGroupAssignmentByAccount(
          String blockchainAccountId) {
    return _localDataSource
        .getUserBlockchainAccountGroupAssignmentByAccount(blockchainAccountId)?.toDomain();
  }

  @override
  UserBlockchainAccountGroupAssignment?
      getLocalUserBlockchainAccountGroupAssignment(
          String blockchainAccountGroupId, String blockchainAccountId) {
    final model = _localDataSource.getUserBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
    return model?.toDomain();
  }

  @override
  void saveLocalUserBlockchainAccountGroupAssignment(
      UserBlockchainAccountGroupAssignment assignment) {
    final existingAssignment =
        _localDataSource.getUserBlockchainAccountGroupAssignment(
            assignment.blockchainAccountGroupId,
            assignment.blockchainAccountId);
    if (existingAssignment == null) {
      _localDataSource.saveUserBlockchainAccountGroupAssignment(assignment);
    }
  }

  @override
  void deleteLocalUserBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId) {
    _localDataSource.deleteAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }

  @override
  Future<List<UserBlockchainAccount>>
      listRemoteUserBlockchainAccountGroupAssignments(
          String blockchainAccountGroupId) async {
    final response = await _remoteDataSource
        .listUserBlockchainAccountGroupAssignments(blockchainAccountGroupId);
    return response.data?.map((model) => model.toDomain()).toList() ?? [];
  }

  @override
  Future<UserBlockchainAccount?> getRemoteUserBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId) async {
    final response =
        await _remoteDataSource.getUserBlockchainAccountGroupAssignment(
            blockchainAccountGroupId, blockchainAccountId);
    return response.data?.toDomain();
  }

  @override
  Future<UserBlockchainAccount>
      updateRemoteUserBlockchainAccountGroupAssignment(
          String blockchainAccountGroupId, String blockchainAccountId) async {
    final response =
        await _remoteDataSource.updateUserBlockchainAccountGroupAssignment(
            blockchainAccountGroupId, blockchainAccountId);
    return response.data!.toDomain();
  }

  @override
  Future<void> deleteRemoteUserBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId) {
    return _remoteDataSource.deleteUserBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }

  @override
  Future<void> syncUserBlockchainAccountGroupAssignments(
      String blockchainAccountGroupId) async {
    final remoteAssignments =
        await listRemoteUserBlockchainAccountGroupAssignments(
            blockchainAccountGroupId);
    final localAssignments =
        getLocalUserBlockchainAccountGroupAssignmentsByGroup(
            blockchainAccountGroupId);

    // Delete local assignments that are not in the remote list
    for (final localAssignment in localAssignments) {
      if (!remoteAssignments
          .any((remote) => remote.id == localAssignment.blockchainAccountId)) {
        deleteLocalUserBlockchainAccountGroupAssignment(
            blockchainAccountGroupId, localAssignment.blockchainAccountId);
      }
    }

    // Add or update local assignments based on remote data
    for (final remoteAccount in remoteAssignments) {
      saveLocalUserBlockchainAccountGroupAssignment(
          UserBlockchainAccountGroupAssignment(
        blockchainAccountGroupId: blockchainAccountGroupId,
        blockchainAccountId: remoteAccount.id,
      ));
    }
  }
}
