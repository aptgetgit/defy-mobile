import 'package:defy/features/shared/domain/entities/user_blockchain_account.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account_group_assignment.dart';
import 'package:defy/features/shared/domain/repositories/user_blockchain_account_group_assignment_repository.dart';

class ListLocalUserBlockchainAccountGroupAssignmentUseCase {
  final UserBlockchainAccountGroupAssignmentRepository _repository;

  ListLocalUserBlockchainAccountGroupAssignmentUseCase(this._repository);

  List<UserBlockchainAccountGroupAssignment> call() {
    return _repository.listLocalUserBlockchainAccountGroupAssignments();
  }
}

class GetLocalUserBlockchainAccountGroupAssignmentUseCase {
  final UserBlockchainAccountGroupAssignmentRepository _repository;

  GetLocalUserBlockchainAccountGroupAssignmentUseCase(this._repository);

  UserBlockchainAccountGroupAssignment? call(
      String blockchainAccountGroupId, String blockchainAccountId) {
    return _repository.getLocalUserBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }
}

class SaveLocalUserBlockchainAccountGroupAssignmentUseCase {
  final UserBlockchainAccountGroupAssignmentRepository _repository;

  SaveLocalUserBlockchainAccountGroupAssignmentUseCase(this._repository);

  void call(UserBlockchainAccountGroupAssignment assignment) {
    return _repository
        .saveLocalUserBlockchainAccountGroupAssignment(assignment);
  }
}

class DeleteLocalUserBlockchainAccountGroupAssignmentUseCase {
  final UserBlockchainAccountGroupAssignmentRepository _repository;

  DeleteLocalUserBlockchainAccountGroupAssignmentUseCase(this._repository);

  void call(String blockchainAccountGroupId, String blockchainAccountId) {
    return _repository.deleteLocalUserBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }
}

class ListRemoteUserBlockchainAccountGroupAssignmentsUseCase {
  final UserBlockchainAccountGroupAssignmentRepository _repository;

  ListRemoteUserBlockchainAccountGroupAssignmentsUseCase(this._repository);

  Future<List<UserBlockchainAccount>> call(String blockchainAccountGroupId) {
    return _repository.listRemoteUserBlockchainAccountGroupAssignments(
        blockchainAccountGroupId);
  }
}

class GetRemoteUserBlockchainAccountGroupAssignmentUseCase {
  final UserBlockchainAccountGroupAssignmentRepository _repository;

  GetRemoteUserBlockchainAccountGroupAssignmentUseCase(this._repository);

  Future<UserBlockchainAccount?> call(
      String blockchainAccountGroupId, String blockchainAccountId) {
    return _repository.getRemoteUserBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }
}

class UpdateRemoteUserBlockchainAccountGroupAssignmentUseCase {
  final UserBlockchainAccountGroupAssignmentRepository _repository;

  UpdateRemoteUserBlockchainAccountGroupAssignmentUseCase(this._repository);

  Future<UserBlockchainAccount> call(
      String blockchainAccountGroupId, String blockchainAccountId) {
    return _repository.updateRemoteUserBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }
}

class DeleteRemoteUserBlockchainAccountGroupAssignmentUseCase {
  final UserBlockchainAccountGroupAssignmentRepository _repository;

  DeleteRemoteUserBlockchainAccountGroupAssignmentUseCase(this._repository);

  Future<void> call(
      String blockchainAccountGroupId, String blockchainAccountId) {
    return _repository.deleteRemoteUserBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }
}

class SyncUserBlockchainAccountGroupAssignmentsUseCase {
  final UserBlockchainAccountGroupAssignmentRepository _repository;

  SyncUserBlockchainAccountGroupAssignmentsUseCase(this._repository);

  Future<void> call(String blockchainAccountGroupId) {
    return _repository
        .syncUserBlockchainAccountGroupAssignments(blockchainAccountGroupId);
  }
}
