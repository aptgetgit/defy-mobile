import 'package:defy/config/objectbox/objectbox.g.dart';
import 'package:defy/features/shared/data/models/user_blockchain_account/user_blockchain_account_local_model.dart';
import 'package:defy/features/shared/data/models/user_blockchain_account_group/user_blockchain_account_group_local_model.dart';
import 'package:defy/features/shared/data/models/user_blockchain_account_group_assignment/user_blockchain_account_group_assignment_local_model.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account_group_assignment.dart';

class UserBlockchainAccountGroupAssignmentLocalDataSource {
  final Store _store;

  UserBlockchainAccountGroupAssignmentLocalDataSource(this._store);

  List<UserBlockchainAccountGroupAssignmentLocalModel>
      listUserBlockchainAccountGroupAssignments() {
    return _store
        .box<UserBlockchainAccountGroupAssignmentLocalModel>()
        .getAll();
  }

  List<UserBlockchainAccountGroupAssignmentLocalModel>
      getUserBlockchainAccountGroupAssignmentsByGroup(
          String blockchainAccountGroupId) {
    final box = _store.box<UserBlockchainAccountGroupAssignmentLocalModel>();
    final groupBox = _store.box<UserBlockchainAccountGroupLocalModel>();

    final group = groupBox
        .query(UserBlockchainAccountGroupLocalModel_.remoteId
            .equals(blockchainAccountGroupId))
        .build()
        .findFirst();
    if (group == null) return [];

    return box
        .query(UserBlockchainAccountGroupAssignmentLocalModel_
            .blockchainAccountGroup
            .equals(group.localId))
        .build()
        .find();
  }

  UserBlockchainAccountGroupAssignmentLocalModel?
      getUserBlockchainAccountGroupAssignmentByAccount(
          String blockchainAccountId) {
    final box = _store.box<UserBlockchainAccountGroupAssignmentLocalModel>();
    final accountBox = _store.box<UserBlockchainAccountLocalModel>();

    final account = accountBox
        .query(UserBlockchainAccountLocalModel_.remoteId
            .equals(blockchainAccountId))
        .build()
        .findFirst();
    if (account == null) return null;
    return box
        .query(UserBlockchainAccountGroupAssignmentLocalModel_
            .blockchainAccount
            .equals(account.localId))
        .build()
        .findFirst();
  }

  UserBlockchainAccountGroupAssignmentLocalModel?
      getUserBlockchainAccountGroupAssignment(
          String blockchainAccountGroupId, String blockchainAccountId) {
    final box = _store.box<UserBlockchainAccountGroupAssignmentLocalModel>();
    final groupBox = _store.box<UserBlockchainAccountGroupLocalModel>();
    final accountBox = _store.box<UserBlockchainAccountLocalModel>();

    final group = groupBox
        .query(UserBlockchainAccountGroupLocalModel_.remoteId
            .equals(blockchainAccountGroupId))
        .build()
        .findFirst();
    final account = accountBox
        .query(UserBlockchainAccountLocalModel_.remoteId
            .equals(blockchainAccountId))
        .build()
        .findFirst();

    if (group == null || account == null) return null;

    return box
        .query(UserBlockchainAccountGroupAssignmentLocalModel_
                .blockchainAccountGroup
                .equals(group.localId) &
            UserBlockchainAccountGroupAssignmentLocalModel_.blockchainAccount
                .equals(account.localId))
        .build()
        .findFirst();
  }

  void saveUserBlockchainAccountGroupAssignment(
      UserBlockchainAccountGroupAssignment assignment) {
    final box = _store.box<UserBlockchainAccountGroupAssignmentLocalModel>();
    final groupBox = _store.box<UserBlockchainAccountGroupLocalModel>();
    final accountBox = _store.box<UserBlockchainAccountLocalModel>();

    final group = groupBox
        .query(UserBlockchainAccountGroupLocalModel_.remoteId
            .equals(assignment.blockchainAccountGroupId))
        .build()
        .findFirst();
    final account = accountBox
        .query(UserBlockchainAccountLocalModel_.remoteId
            .equals(assignment.blockchainAccountId))
        .build()
        .findFirst();

    if (group == null || account == null) {
      throw Exception('Group or Account not found in local storage');
    }

    final model = UserBlockchainAccountGroupAssignmentLocalModel.fromDomain(
        group.localId, account.localId);
    box.put(model);
  }

  void deleteAssignment(
      String blockchainAccountGroupId, String blockchainAccountId) {
    final box = _store.box<UserBlockchainAccountGroupAssignmentLocalModel>();
    final groupBox = _store.box<UserBlockchainAccountGroupLocalModel>();
    final accountBox = _store.box<UserBlockchainAccountLocalModel>();

    final group = groupBox
        .query(UserBlockchainAccountGroupLocalModel_.remoteId
            .equals(blockchainAccountGroupId))
        .build()
        .findFirst();
    final account = accountBox
        .query(UserBlockchainAccountLocalModel_.remoteId
            .equals(blockchainAccountId))
        .build()
        .findFirst();

    if (group == null || account == null) return;

    final assignment = box
        .query(UserBlockchainAccountGroupAssignmentLocalModel_
                .blockchainAccountGroup
                .equals(group.localId) &
            UserBlockchainAccountGroupAssignmentLocalModel_.blockchainAccount
                .equals(account.localId))
        .build()
        .findFirst();

    if (assignment != null) {
      box.remove(assignment.localId);
    }
  }
}
