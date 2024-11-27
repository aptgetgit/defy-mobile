import 'package:defy/core/database/objectbox/objectbox.g.dart';
import 'package:defy/features/blockchain_account/data/models/local/blockchain_account_local_model.dart';
import 'package:defy/features/blockchain_account/domain/entities/blockchain_account.dart';
import 'package:defy/features/blockchain_network/data/models/local/blockchain_network_local_model.dart';

class BlockchainAccountLocalDataSource {
  final Store _store;

  BlockchainAccountLocalDataSource(this._store);

  List<BlockchainAccountLocalModel> listBlockchainAccounts() {
    return _store.box<BlockchainAccountLocalModel>().getAll();
  }

  BlockchainAccountLocalModel? getBlockchainAccount(
      String blockchainAccountId) {
    return _store
        .box<BlockchainAccountLocalModel>()
        .query(
            BlockchainAccountLocalModel_.remoteId.equals(blockchainAccountId))
        .build()
        .findFirst();
  }

  void saveBlockchainAccount(BlockchainAccount blockchainAccount) {
    final box = _store.box<BlockchainAccountLocalModel>();
    final networkBox = _store.box<BlockchainNetworkLocalModel>();

    final networkModel = networkBox
        .query(BlockchainNetworkLocalModel_.remoteId
            .equals(blockchainAccount.blockchainNetworkId))
        .build()
        .findFirst();
    if (networkModel == null) {
      throw Exception('BlockchainNetwork not found in local storage');
    }

    final model = BlockchainAccountLocalModel.fromDomain(
        blockchainAccount, networkModel.localId);
    box.put(model);
  }

  void deleteBlockchainAccount(String blockchainAccountId) {
    final box = _store.box<BlockchainAccountLocalModel>();
    final model = box
        .query(
            BlockchainAccountLocalModel_.remoteId.equals(blockchainAccountId))
        .build()
        .findFirst();
    if (model != null) {
      box.remove(model.localId);
    }
  }
}
