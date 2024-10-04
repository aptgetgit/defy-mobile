import 'package:defy/features/shared/domain/entities/user_blockchain_account.dart';
import 'package:defy/features/shared/data/models/user_blockchain_account/user_blockchain_account_remote_model.dart';

abstract class UserBlockchainAccountRepository {
  // Local operations
  List<UserBlockchainAccount> listLocalUserBlockchainAccounts();
  UserBlockchainAccount? getLocalUserBlockchainAccount(
      String blockchainAccountId);
  void saveLocalUserBlockchainAccount(UserBlockchainAccount blockchainAccount);
  void deleteLocalUserBlockchainAccount(String blockchainAccountId);

  // Remote operations
  Future<UserBlockchainAccount> createRemoteUserBlockchainAccount(
      CreateUserBlockchainAccountRemoteRequest body);
  Future<List<UserBlockchainAccount>> listRemoteUserBlockchainAccounts(
      {String? namespace, String? reference});
  Future<UserBlockchainAccount?> getRemoteUserBlockchainAccount(
      String blockchainAccountId);
  Future<void> deleteRemoteUserBlockchainAccount(String blockchainAccountId);

  // Sync operation
  Future<void> syncUserBlockchainAccounts();
}
