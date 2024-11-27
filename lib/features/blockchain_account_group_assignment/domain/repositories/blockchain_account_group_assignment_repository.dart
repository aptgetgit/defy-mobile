import 'package:defy/features/blockchain_account/domain/entities/blockchain_account.dart';
import 'package:defy/features/blockchain_account_group_assignment/domain/entities/blockchain_account_group_assignment.dart';

abstract class IBlockchainAccountGroupAssignmentRepository {
  // Local operations
  List<BlockchainAccountGroupAssignment>
      listLocalBlockchainAccountGroupAssignments();
  List<BlockchainAccountGroupAssignment>
      getLocalBlockchainAccountGroupAssignmentsByGroup(
          String blockchainAccountGroupId);
  BlockchainAccountGroupAssignment?
      getLocalBlockchainAccountGroupAssignmentByAccount(
          String blockchainAccountId);
  BlockchainAccountGroupAssignment? getLocalBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId);
  void saveLocalBlockchainAccountGroupAssignment(
      BlockchainAccountGroupAssignment assignment);
  void deleteLocalBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId);

  // Remote operations
  Future<List<BlockchainAccount>> listRemoteBlockchainAccountGroupAssignments(
      String blockchainAccountGroupId);
  Future<BlockchainAccount?> getRemoteBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId);
  Future<BlockchainAccount> updateRemoteBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId);
  Future<void> deleteRemoteBlockchainAccountGroupAssignment(
      String blockchainAccountGroupId, String blockchainAccountId);

  // Sync operation
  Future<void> syncBlockchainAccountGroupAssignments(
      String blockchainAccountGroupId);
}
