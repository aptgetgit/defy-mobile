import 'package:defy/features/blockchain_account/data/models/remote/blockchain_account_remote_model.dart';
import 'package:defy/features/blockchain_account/data/sources/local/blockchain_account_local_source.dart';
import 'package:defy/features/blockchain_account/data/sources/remote/blockchain_account_remote_source.dart';
import 'package:defy/features/blockchain_account/domain/entities/blockchain_account.dart';
import 'package:defy/features/blockchain_account/domain/repositories/blockchain_account_repository.dart';

class BlockchainAccountRepository implements IBlockchainAccountRepository {
  final BlockchainAccountLocalDataSource _localDataSource;
  final BlockchainAccountRemoteDataSource _remoteDataSource;

  BlockchainAccountRepository(this._localDataSource, this._remoteDataSource);

  @override
  List<BlockchainAccount> listLocalBlockchainAccounts() {
    return _localDataSource
        .listBlockchainAccounts()
        .map((model) => model.toDomain())
        .toList();
  }

  @override
  BlockchainAccount? getLocalBlockchainAccount(String blockchainAccountId) {
    final model = _localDataSource.getBlockchainAccount(blockchainAccountId);
    return model?.toDomain();
  }

  @override
  void saveLocalBlockchainAccount(BlockchainAccount blockchainAccount) {
    final existingAccount = getLocalBlockchainAccount(blockchainAccount.id);
    if (existingAccount == null) {
      _localDataSource.saveBlockchainAccount(blockchainAccount);
    }
  }

  @override
  void deleteLocalBlockchainAccount(String blockchainAccountId) {
    _localDataSource.deleteBlockchainAccount(blockchainAccountId);
  }

  @override
  Future<BlockchainAccount> createRemoteBlockchainAccount(
      CreateBlockchainAccountRemoteRequest body) async {
    final response = await _remoteDataSource.createBlockchainAccount(body);
    final account = response.data!.toDomain();
    saveLocalBlockchainAccount(account);
    return account;
  }

  @override
  Future<List<BlockchainAccount>> listRemoteBlockchainAccounts(
      {String? namespace, String? reference}) async {
    final response = await _remoteDataSource.listBlockchainAccounts(
        namespace: namespace, reference: reference);
    return response.data?.map((model) => model.toDomain()).toList() ?? [];
  }

  @override
  Future<BlockchainAccount?> getRemoteBlockchainAccount(
      String blockchainAccountId) async {
    final response =
        await _remoteDataSource.getBlockchainAccount(blockchainAccountId);
    return response.data?.toDomain();
  }

  @override
  Future<void> deleteRemoteBlockchainAccount(String blockchainAccountId) async {
    await _remoteDataSource.deleteBlockchainAccount(blockchainAccountId);
    deleteLocalBlockchainAccount(blockchainAccountId);
  }

  @override
  Future<void> syncBlockchainAccounts() async {
    final remoteAccounts = await listRemoteBlockchainAccounts();
    for (final account in remoteAccounts) {
      saveLocalBlockchainAccount(account);
    }
  }
}
