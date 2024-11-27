import 'package:defy/features/blockchain_account/data/models/remote/blockchain_account_remote_model.dart';
import 'package:defy/features/blockchain_account/domain/entities/blockchain_account.dart';

abstract class IBlockchainAccountRepository {
  // Local operations
  List<BlockchainAccount> listLocalBlockchainAccounts();
  BlockchainAccount? getLocalBlockchainAccount(String blockchainAccountId);
  void saveLocalBlockchainAccount(BlockchainAccount blockchainAccount);
  void deleteLocalBlockchainAccount(String blockchainAccountId);

  // Remote operations
  Future<BlockchainAccount> createRemoteBlockchainAccount(
      CreateBlockchainAccountRemoteRequest body);
  Future<List<BlockchainAccount>> listRemoteBlockchainAccounts(
      {String? namespace, String? reference});
  Future<BlockchainAccount?> getRemoteBlockchainAccount(
      String blockchainAccountId);
  Future<void> deleteRemoteBlockchainAccount(String blockchainAccountId);

  // Sync operation
  Future<void> syncBlockchainAccounts();
}
