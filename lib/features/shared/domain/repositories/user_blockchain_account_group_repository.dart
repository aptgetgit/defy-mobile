import 'package:defy/features/shared/domain/entities/user_blockchain_account_group.dart';
import 'package:defy/features/shared/data/models/user_blockchain_account_group/user_blockchain_account_group_remote_model.dart';

abstract class UserBlockchainAccountGroupRepository {
  // Local operations
  List<UserBlockchainAccountGroup> listLocalUserBlockchainAccountGroups();
  UserBlockchainAccountGroup? getLocalUserBlockchainAccountGroup(
      String blockchainAccountGroupId);
  void saveLocalUserBlockchainAccountGroup(
      UserBlockchainAccountGroup blockchainAccountGroup);
  void deleteLocalUserBlockchainAccountGroup(String blockchainAccountGroupId);
  UserBlockchainAccountGroup? getLocalUserBlockchainAccountGroupByName(
      String name);

  // Remote operations
  Future<UserBlockchainAccountGroup> createRemoteUserBlockchainAccountGroup(
      CreateUserBlockchainAccountGroupRemoteRequest body);
  Future<List<UserBlockchainAccountGroup>>
      listRemoteUserBlockchainAccountGroups();
  Future<UserBlockchainAccountGroup?> getRemoteUserBlockchainAccountGroup(
      String blockchainAccountGroupId);
  Future<UserBlockchainAccountGroup> updateRemoteUserBlockchainAccountGroup(
      String blockchainAccountGroupId,
      UpdateUserBlockchainAccountGroupRemoteRequest body);
  Future<void> deleteRemoteUserBlockchainAccountGroup(
      String blockchainAccountGroupId);

  // Sync operation
  Future<void> syncUserBlockchainAccountGroups();
}
