import 'package:defy/core/database/objectbox/objectbox.g.dart';
import 'package:defy/features/blockchain_network/data/models/local/blockchain_network_local_model.dart';

class BlockchainNetworkLocalDataSource {
  final Store _store;

  BlockchainNetworkLocalDataSource(this._store);

  List<BlockchainNetworkLocalModel> listBlockchainNetworks() {
    return _store.box<BlockchainNetworkLocalModel>().getAll();
  }

  BlockchainNetworkLocalModel? getBlockchainNetwork(
      String blockchainNetworkId) {
    return _store
        .box<BlockchainNetworkLocalModel>()
        .query(
            BlockchainNetworkLocalModel_.remoteId.equals(blockchainNetworkId))
        .build()
        .findFirst();
  }

  void saveBlockchainNetwork(BlockchainNetworkLocalModel blockchainNetwork) {
    _store.box<BlockchainNetworkLocalModel>().put(blockchainNetwork);
  }

  void deleteBlockchainNetwork(String blockchainNetworkId) {
    final box = _store.box<BlockchainNetworkLocalModel>();
    final model = box
        .query(
            BlockchainNetworkLocalModel_.remoteId.equals(blockchainNetworkId))
        .build()
        .findFirst();
    if (model != null) {
      box.remove(model.localId);
    }
  }
}
