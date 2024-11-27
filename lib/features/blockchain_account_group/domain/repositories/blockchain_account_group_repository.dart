import 'package:defy/features/blockchain_account_group/data/models/remote/blockchain_account_group_remote_model.dart';
import 'package:defy/features/blockchain_account_group/domain/entities/blockchain_account_group.dart';

abstract class IBlockchainAccountGroupRepository {
  // Local operations
  List<BlockchainAccountGroup> listLocalBlockchainAccountGroups();
  BlockchainAccountGroup? getLocalBlockchainAccountGroup(
      String blockchainAccountGroupId);
  void saveLocalBlockchainAccountGroup(
      BlockchainAccountGroup blockchainAccountGroup);
  void deleteLocalBlockchainAccountGroup(String blockchainAccountGroupId);
  BlockchainAccountGroup? getLocalBlockchainAccountGroupByName(String name);

  // Remote operations
  Future<BlockchainAccountGroup> createRemoteBlockchainAccountGroup(
      CreateBlockchainAccountGroupRemoteRequest body);
  Future<List<BlockchainAccountGroup>> listRemoteBlockchainAccountGroups();
  Future<BlockchainAccountGroup?> getRemoteBlockchainAccountGroup(
      String blockchainAccountGroupId);
  Future<BlockchainAccountGroup> updateRemoteBlockchainAccountGroup(
      String blockchainAccountGroupId,
      UpdateBlockchainAccountGroupRemoteRequest body);
  Future<void> deleteRemoteBlockchainAccountGroup(
      String blockchainAccountGroupId);

  // Sync operation
  Future<void> syncBlockchainAccountGroups();
}
