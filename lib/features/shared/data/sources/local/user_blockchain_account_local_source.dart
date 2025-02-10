
import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../domain/entities/user_blockchain_account.dart';
import '../../models/blockchain_network/blockchain_network_local_model.dart';
import '../../models/user_blockchain_account/user_blockchain_account_local_model.dart';

class UserBlockchainAccountLocalDataSource {
  final Store _store;

  UserBlockchainAccountLocalDataSource(this._store);

  List<UserBlockchainAccountLocalModel> listUserBlockchainAccounts() {
    return _store.box<UserBlockchainAccountLocalModel>().getAll();
  }

  UserBlockchainAccountLocalModel? getUserBlockchainAccount(
      String blockchainAccountId) {
    return _store
        .box<UserBlockchainAccountLocalModel>()
        .query(UserBlockchainAccountLocalModel_.remoteId
            .equals(blockchainAccountId))
        .build()
        .findFirst();
  }

  void saveUserBlockchainAccount(UserBlockchainAccount blockchainAccount) {
    final box = _store.box<UserBlockchainAccountLocalModel>();
    final networkBox = _store.box<BlockchainNetworkLocalModel>();

    final networkModel = networkBox
        .query(BlockchainNetworkLocalModel_.remoteId
            .equals(blockchainAccount.blockchainNetworkId))
        .build()
        .findFirst();
    if (networkModel == null) {
      throw Exception('BlockchainNetwork not found in local storage');
    }

    final model = UserBlockchainAccountLocalModel.fromDomain(
        blockchainAccount, networkModel.localId);
    box.put(model);
  }

  void deleteUserBlockchainAccount(String blockchainAccountId) {
    final box = _store.box<UserBlockchainAccountLocalModel>();
    final model = box
        .query(UserBlockchainAccountLocalModel_.remoteId
            .equals(blockchainAccountId))
        .build()
        .findFirst();
    if (model != null) {
      box.remove(model.localId);
    }
  }
}
