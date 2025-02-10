
import 'package:defy/features/shared/data/models/blockchain_network/blockchain_network_local_model.dart';

import '../../../../../core/database/objectbox/objectbox.g.dart';

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
