import 'package:defy/core/database/objectbox/objectbox.g.dart';
import 'package:defy/features/blockchain_account_group/data/models/local/blockchain_account_group_local_model.dart';
import 'package:defy/features/blockchain_account_group/domain/entities/blockchain_account_group.dart';

class BlockchainAccountGroupLocalDataSource {
  final Store _store;

  BlockchainAccountGroupLocalDataSource(this._store);

  List<BlockchainAccountGroupLocalModel> listBlockchainAccountGroups() {
    return _store.box<BlockchainAccountGroupLocalModel>().getAll();
  }

  BlockchainAccountGroupLocalModel? getBlockchainAccountGroup(
      String blockchainAccountGroupId) {
    return _store
        .box<BlockchainAccountGroupLocalModel>()
        .query(BlockchainAccountGroupLocalModel_.remoteId
            .equals(blockchainAccountGroupId))
        .build()
        .findFirst();
  }

  void saveBlockchainAccountGroup(
      BlockchainAccountGroup blockchainAccountGroup) {
    final box = _store.box<BlockchainAccountGroupLocalModel>();
    final model =
        BlockchainAccountGroupLocalModel.fromDomain(blockchainAccountGroup);
    box.put(model);
  }

  void deleteBlockchainAccountGroup(String blockchainAccountGroupId) {
    final box = _store.box<BlockchainAccountGroupLocalModel>();
    final model = box
        .query(BlockchainAccountGroupLocalModel_.remoteId
            .equals(blockchainAccountGroupId))
        .build()
        .findFirst();
    if (model != null) {
      box.remove(model.localId);
    }
  }

  BlockchainAccountGroupLocalModel? getBlockchainAccountGroupByName(
      String name) {
    return _store
        .box<BlockchainAccountGroupLocalModel>()
        .query(BlockchainAccountGroupLocalModel_.name.equals(name))
        .build()
        .findFirst();
  }
}
