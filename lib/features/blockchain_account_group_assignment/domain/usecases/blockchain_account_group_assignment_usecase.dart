import 'package:defy/features/blockchain_account/domain/entities/blockchain_account.dart';
import 'package:defy/features/blockchain_account_group_assignment/data/repositories/blockchain_account_group_assignment_repository_implementation.dart';
import 'package:defy/features/blockchain_account_group_assignment/domain/entities/blockchain_account_group_assignment.dart';

class ListLocalBlockchainAccountGroupAssignmentUseCase {
  final BlockchainAccountGroupAssignmentRepository _repository;

  ListLocalBlockchainAccountGroupAssignmentUseCase(this._repository);

  List<BlockchainAccountGroupAssignment> call() {
    return _repository.listLocalBlockchainAccountGroupAssignments();
  }
}

class GetLocalBlockchainAccountGroupAssignmentUseCase {
  final BlockchainAccountGroupAssignmentRepository _repository;

  GetLocalBlockchainAccountGroupAssignmentUseCase(this._repository);

  BlockchainAccountGroupAssignment? call(
      String blockchainAccountGroupId, String blockchainAccountId) {
    return _repository.getLocalBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }
}

class GetLocalBlockchainAccountGroupAssignmentByAccountUseCase {
  final BlockchainAccountGroupAssignmentRepository _repository;

  GetLocalBlockchainAccountGroupAssignmentByAccountUseCase(this._repository);

  BlockchainAccountGroupAssignment? call(String blockchainAccountId) {
    return _repository
        .getLocalBlockchainAccountGroupAssignmentByAccount(blockchainAccountId);
  }
}

class GetLocalBlockchainAccountGroupAssignmentsByGroupUseCase {
  final BlockchainAccountGroupAssignmentRepository _repository;

  GetLocalBlockchainAccountGroupAssignmentsByGroupUseCase(this._repository);

  List<BlockchainAccountGroupAssignment> call(String blockchainAccountGroupId) {
    return _repository.getLocalBlockchainAccountGroupAssignmentsByGroup(
        blockchainAccountGroupId);
  }
}

class SaveLocalBlockchainAccountGroupAssignmentUseCase {
  final BlockchainAccountGroupAssignmentRepository _repository;

  SaveLocalBlockchainAccountGroupAssignmentUseCase(this._repository);

  void call(BlockchainAccountGroupAssignment assignment) {
    return _repository.saveLocalBlockchainAccountGroupAssignment(assignment);
  }
}

class DeleteLocalBlockchainAccountGroupAssignmentUseCase {
  final BlockchainAccountGroupAssignmentRepository _repository;

  DeleteLocalBlockchainAccountGroupAssignmentUseCase(this._repository);

  void call(String blockchainAccountGroupId, String blockchainAccountId) {
    return _repository.deleteLocalBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }
}

class ListRemoteBlockchainAccountGroupAssignmentsUseCase {
  final BlockchainAccountGroupAssignmentRepository _repository;

  ListRemoteBlockchainAccountGroupAssignmentsUseCase(this._repository);

  Future<List<BlockchainAccount>> call(String blockchainAccountGroupId) {
    return _repository
        .listRemoteBlockchainAccountGroupAssignments(blockchainAccountGroupId);
  }
}

class GetRemoteBlockchainAccountGroupAssignmentUseCase {
  final BlockchainAccountGroupAssignmentRepository _repository;

  GetRemoteBlockchainAccountGroupAssignmentUseCase(this._repository);

  Future<BlockchainAccount?> call(
      String blockchainAccountGroupId, String blockchainAccountId) {
    return _repository.getRemoteBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }
}

class UpdateRemoteBlockchainAccountGroupAssignmentUseCase {
  final BlockchainAccountGroupAssignmentRepository _repository;

  UpdateRemoteBlockchainAccountGroupAssignmentUseCase(this._repository);

  Future<BlockchainAccount> call(
      String blockchainAccountGroupId, String blockchainAccountId) {
    return _repository.updateRemoteBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }
}

class DeleteRemoteBlockchainAccountGroupAssignmentUseCase {
  final BlockchainAccountGroupAssignmentRepository _repository;

  DeleteRemoteBlockchainAccountGroupAssignmentUseCase(this._repository);

  Future<void> call(
      String blockchainAccountGroupId, String blockchainAccountId) {
    return _repository.deleteRemoteBlockchainAccountGroupAssignment(
        blockchainAccountGroupId, blockchainAccountId);
  }
}

class SyncBlockchainAccountGroupAssignmentsUseCase {
  final BlockchainAccountGroupAssignmentRepository _repository;

  SyncBlockchainAccountGroupAssignmentsUseCase(this._repository);

  Future<void> call(String blockchainAccountGroupId) {
    return _repository
        .syncBlockchainAccountGroupAssignments(blockchainAccountGroupId);
  }
}
