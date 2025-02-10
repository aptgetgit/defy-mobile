import 'package:defy/features/shared/domain/entities/user_blockchain_account_group_assignment.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account.dart';

abstract class IUserBlockchainAccountGroupAssignmentRepository {
  // Local operations
  List<UserBlockchainAccountGroupAssignment>
      listLocalUserBlockchainAccountGroupAssignments();
  List<UserBlockchainAccountGroupAssignment>
      getLocalUserBlockchainAccountGroupAssignmentsByGroup(
          String blockchainAccountGroupId);
  UserBlockchainAccountGroupAssignment?
      getLocalUserBlockchainAccountGroupAssignmentByAccount(
          String blockchainAccountId);
  UserBlockchainAccountGroupAssignment?
      getLocalUserBlockchainAccountGroupAssignment(
          String blockchainAccountGroupId, String blockchainAccountId);
  void saveLocalUserBlockchainAccountGroupAssignment(
      UserBlockchainAccountGroupAssignment assignment);
  void deleteLocalUserBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId);

  // Remote operations
  Future<List<UserBlockchainAccount>>
      listRemoteUserBlockchainAccountGroupAssignments(
          String blockchainAccountGroupId);
  Future<UserBlockchainAccount?> getRemoteUserBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId);
  Future<UserBlockchainAccount>
      updateRemoteUserBlockchainAccountGroupAssignment(
          String blockchainAccountGroupId, String blockchainAccountId);
  Future<void> deleteRemoteUserBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId);

  // Sync operation
  Future<void> syncUserBlockchainAccountGroupAssignments(
      String blockchainAccountGroupId);
}
