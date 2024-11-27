import 'package:defy/core/database/objectbox/objectbox.g.dart';
import 'package:defy/features/blockchain_account/data/models/local/blockchain_account_local_model.dart';
import 'package:defy/features/blockchain_account_group/data/models/local/blockchain_account_group_local_model.dart';
import 'package:defy/features/blockchain_account_group_assignment/data/models/local/blockchain_account_group_assignment_local_model.dart';
import 'package:defy/features/blockchain_account_group_assignment/domain/entities/blockchain_account_group_assignment.dart';

class BlockchainAccountGroupAssignmentLocalDataSource {
  final Store _store;

  BlockchainAccountGroupAssignmentLocalDataSource(this._store);

  List<BlockchainAccountGroupAssignmentLocalModel>
      listBlockchainAccountGroupAssignments() {
    return _store.box<BlockchainAccountGroupAssignmentLocalModel>().getAll();
  }

  List<BlockchainAccountGroupAssignmentLocalModel>
      getBlockchainAccountGroupAssignmentsByGroup(
          String blockchainAccountGroupId) {
    final box = _store.box<BlockchainAccountGroupAssignmentLocalModel>();
    final groupBox = _store.box<BlockchainAccountGroupLocalModel>();

    final group = groupBox
        .query(BlockchainAccountGroupLocalModel_.remoteId
            .equals(blockchainAccountGroupId))
        .build()
        .findFirst();
    if (group == null) return [];

    return box
        .query(BlockchainAccountGroupAssignmentLocalModel_
            .blockchainAccountGroup
            .equals(group.localId))
        .build()
        .find();
  }

  BlockchainAccountGroupAssignmentLocalModel?
      getBlockchainAccountGroupAssignmentByAccount(String blockchainAccountId) {
    final box = _store.box<BlockchainAccountGroupAssignmentLocalModel>();
    final accountBox = _store.box<BlockchainAccountLocalModel>();

    final account = accountBox
        .query(
            BlockchainAccountLocalModel_.remoteId.equals(blockchainAccountId))
        .build()
        .findFirst();
    if (account == null) return null;
    return box
        .query(BlockchainAccountGroupAssignmentLocalModel_.blockchainAccount
            .equals(account.localId))
        .build()
        .findFirst();
  }

  BlockchainAccountGroupAssignmentLocalModel?
      getBlockchainAccountGroupAssignment(
          String blockchainAccountGroupId, String blockchainAccountId) {
    final box = _store.box<BlockchainAccountGroupAssignmentLocalModel>();
    final groupBox = _store.box<BlockchainAccountGroupLocalModel>();
    final accountBox = _store.box<BlockchainAccountLocalModel>();

    final group = groupBox
        .query(BlockchainAccountGroupLocalModel_.remoteId
            .equals(blockchainAccountGroupId))
        .build()
        .findFirst();
    final account = accountBox
        .query(
            BlockchainAccountLocalModel_.remoteId.equals(blockchainAccountId))
        .build()
        .findFirst();

    if (group == null || account == null) return null;

    return box
        .query(BlockchainAccountGroupAssignmentLocalModel_
                .blockchainAccountGroup
                .equals(group.localId) &
            BlockchainAccountGroupAssignmentLocalModel_.blockchainAccount
                .equals(account.localId))
        .build()
        .findFirst();
  }

  void saveBlockchainAccountGroupAssignment(
      BlockchainAccountGroupAssignment assignment) {
    final box = _store.box<BlockchainAccountGroupAssignmentLocalModel>();
    final groupBox = _store.box<BlockchainAccountGroupLocalModel>();
    final accountBox = _store.box<BlockchainAccountLocalModel>();

    final group = groupBox
        .query(BlockchainAccountGroupLocalModel_.remoteId
            .equals(assignment.blockchainAccountGroupId))
        .build()
        .findFirst();
    final account = accountBox
        .query(BlockchainAccountLocalModel_.remoteId
            .equals(assignment.blockchainAccountId))
        .build()
        .findFirst();

    if (group == null || account == null) {
      throw Exception('Group or Account not found in local storage');
    }

    final model = BlockchainAccountGroupAssignmentLocalModel.fromDomain(
        group.localId, account.localId);
    box.put(model);
  }

  void deleteAssignment(
      String blockchainAccountGroupId, String blockchainAccountId) {
    final box = _store.box<BlockchainAccountGroupAssignmentLocalModel>();
    final groupBox = _store.box<BlockchainAccountGroupLocalModel>();
    final accountBox = _store.box<BlockchainAccountLocalModel>();

    final group = groupBox
        .query(BlockchainAccountGroupLocalModel_.remoteId
            .equals(blockchainAccountGroupId))
        .build()
        .findFirst();
    final account = accountBox
        .query(
            BlockchainAccountLocalModel_.remoteId.equals(blockchainAccountId))
        .build()
        .findFirst();

    if (group == null || account == null) return;

    final assignment = box
        .query(BlockchainAccountGroupAssignmentLocalModel_
                .blockchainAccountGroup
                .equals(group.localId) &
            BlockchainAccountGroupAssignmentLocalModel_.blockchainAccount
                .equals(account.localId))
        .build()
        .findFirst();

    if (assignment != null) {
      box.remove(assignment.localId);
    }
  }
}
