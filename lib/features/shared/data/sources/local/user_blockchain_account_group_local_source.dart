
import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../domain/entities/user_blockchain_account_group.dart';
import '../../models/user_blockchain_account_group/user_blockchain_account_group_local_model.dart';

class UserBlockchainAccountGroupLocalDataSource {
  final Store _store;

  UserBlockchainAccountGroupLocalDataSource(this._store);

  List<UserBlockchainAccountGroupLocalModel> listUserBlockchainAccountGroups() {
    return _store.box<UserBlockchainAccountGroupLocalModel>().getAll();
  }

  UserBlockchainAccountGroupLocalModel? getUserBlockchainAccountGroup(
      String blockchainAccountGroupId) {
    return _store
        .box<UserBlockchainAccountGroupLocalModel>()
        .query(UserBlockchainAccountGroupLocalModel_.remoteId.equals(blockchainAccountGroupId))
        .build()
        .findFirst();
  }

  void saveUserBlockchainAccountGroup(
      UserBlockchainAccountGroup blockchainAccountGroup) {
    final box = _store.box<UserBlockchainAccountGroupLocalModel>();
    final model =
        UserBlockchainAccountGroupLocalModel.fromDomain(blockchainAccountGroup);
    box.put(model);
  }

  void deleteUserBlockchainAccountGroup(String blockchainAccountGroupId) {
    final box = _store.box<UserBlockchainAccountGroupLocalModel>();
    final model = box
        .query(UserBlockchainAccountGroupLocalModel_.remoteId
            .equals(blockchainAccountGroupId))
        .build()
        .findFirst();
    if (model != null) {
      box.remove(model.localId);
    }
  }

  UserBlockchainAccountGroupLocalModel? getUserBlockchainAccountGroupByName(
      String name) {
    return _store
        .box<UserBlockchainAccountGroupLocalModel>()
        .query(UserBlockchainAccountGroupLocalModel_.name.equals(name))
        .build()
        .findFirst();
  }
}
