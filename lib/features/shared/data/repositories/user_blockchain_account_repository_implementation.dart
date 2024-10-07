import 'package:defy/features/shared/data/models/user_blockchain_account/user_blockchain_account_remote_model.dart';
import 'package:defy/features/shared/data/sources/local/user_blockchain_account_local_source.dart';
import 'package:defy/features/shared/data/sources/remote/user_blockchain_account_remote_source.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account.dart';
import 'package:defy/features/shared/domain/repositories/user_blockchain_account_repository.dart';

class UserBlockchainAccountRepository
    implements IUserBlockchainAccountRepository {
  final UserBlockchainAccountLocalDataSource _localDataSource;
  final UserBlockchainAccountRemoteDataSource _remoteDataSource;

  UserBlockchainAccountRepository(
      this._localDataSource, this._remoteDataSource);

  @override
  List<UserBlockchainAccount> listLocalUserBlockchainAccounts() {
    return _localDataSource
        .listUserBlockchainAccounts()
        .map((model) => model.toDomain())
        .toList();
  }

  @override
  UserBlockchainAccount? getLocalUserBlockchainAccount(
      String blockchainAccountId) {
    final model =
        _localDataSource.getUserBlockchainAccount(blockchainAccountId);
    return model?.toDomain();
  }

  @override
  void saveLocalUserBlockchainAccount(UserBlockchainAccount blockchainAccount) {
    final existingAccount = getLocalUserBlockchainAccount(blockchainAccount.id);
    if (existingAccount == null) {
      _localDataSource.saveUserBlockchainAccount(blockchainAccount);
    }
  }

  @override
  void deleteLocalUserBlockchainAccount(String blockchainAccountId) {
    _localDataSource.deleteUserBlockchainAccount(blockchainAccountId);
  }

  @override
  Future<UserBlockchainAccount> createRemoteUserBlockchainAccount(
      CreateUserBlockchainAccountRemoteRequest body) async {
    final response = await _remoteDataSource.createUserBlockchainAccount(body);
    final account = response.data!.toDomain();
    saveLocalUserBlockchainAccount(account);
    return account;
  }

  @override
  Future<List<UserBlockchainAccount>> listRemoteUserBlockchainAccounts(
      {String? namespace, String? reference}) async {
    final response = await _remoteDataSource.listUserBlockchainAccounts(
        namespace: namespace, reference: reference);
    return response.data?.map((model) => model.toDomain()).toList() ?? [];
  }

  @override
  Future<UserBlockchainAccount?> getRemoteUserBlockchainAccount(
      String blockchainAccountId) async {
    final response =
        await _remoteDataSource.getUserBlockchainAccount(blockchainAccountId);
    return response.data?.toDomain();
  }

  @override
  Future<void> deleteRemoteUserBlockchainAccount(
      String blockchainAccountId) async {
    await _remoteDataSource.deleteUserBlockchainAccount(blockchainAccountId);
    deleteLocalUserBlockchainAccount(blockchainAccountId);
  }

  @override
  Future<void> syncUserBlockchainAccounts() async {
    final remoteAccounts = await listRemoteUserBlockchainAccounts();
    for (final account in remoteAccounts) {
      saveLocalUserBlockchainAccount(account);
    }
  }
}
