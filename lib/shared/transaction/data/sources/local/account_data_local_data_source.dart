import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../models/local/account_data_local_model.dart';

class AccountDataLocalDataSource {
  AccountDataLocalDataSource({required Box<AccountDataLocalModel> box}) : _box = box;
  final Box<AccountDataLocalModel> _box;

  AccountDataLocalModel store({
    required Uint8List accountAddress,
    required Uint8List authenticationKey,
    required String sequenceNumber,
  }) {
    final AccountDataLocalModel? existing =
        getByAddress(accountAddress: accountAddress);
    final AccountDataLocalModel model = AccountDataLocalModel(
      accountAddress: accountAddress,
      authenticationKey: authenticationKey,
      sequenceNumber: sequenceNumber,
    );

    if (existing != null) {
      model.lastUpdated = DateTime.now();
    }

    _box.put(model);
    return model;
  }

  AccountDataLocalModel? getByAddress({required Uint8List accountAddress}) =>
      _box
          .query(AccountDataLocalModel_.accountAddress.equals(accountAddress))
          .build()
          .findFirst();

  AccountDataLocalModel? get(int localId) => _box.get(localId);

  List<AccountDataLocalModel> getAll() => _box.getAll();

  bool delete(int localId) => _box.remove(localId);

  bool deleteByAddress({required Uint8List accountAddress}) {
    final AccountDataLocalModel? account =
        getByAddress(accountAddress: accountAddress);
    return account != null && delete(account.localId);
  }

  int clear() => _box.removeAll();

  int count() => _box.count();

  bool updateLastUpdated(Uint8List accountAddress) {
    final AccountDataLocalModel? account =
        getByAddress(accountAddress: accountAddress);
    if (account != null) {
      account.lastUpdated = DateTime.now();
      _box.put(account);
      return true;
    }
    return false;
  }
}
