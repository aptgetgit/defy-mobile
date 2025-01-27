import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../models/local/aptos_account_local_model.dart';

class AptosAccountDataSource {
  AptosAccountDataSource({required Box<AptosAccountLocalModel> box})
      : _box = box;
  final Box<AptosAccountLocalModel> _box;

  AptosAccountLocalModel store({
    required Uint8List accountAddress,
    required Uint8List authenticationKey,
    required int authenticationKeyScheme,
  }) {
    if (getByAddress(accountAddress: accountAddress) != null) {
      throw StateError('Account address already exists');
    }

    final AptosAccountLocalModel model = AptosAccountLocalModel(
      accountAddress: accountAddress,
      authenticationKey: authenticationKey,
      authenticationKeyScheme: authenticationKeyScheme,
    );
    _box.put(model);
    return model;
  }

  AptosAccountLocalModel? getByAddress({required Uint8List accountAddress}) =>
      _box
          .query(AptosAccountLocalModel_.accountAddress.equals(accountAddress))
          .build()
          .findFirst();

  AptosAccountLocalModel? get(int localId) => _box.get(localId);

  List<AptosAccountLocalModel> getByAuthKey({
    required Uint8List authenticationKey,
  }) =>
      _box
          .query(
            AptosAccountLocalModel_.authenticationKey.equals(authenticationKey),
          )
          .build()
          .find();

  List<AptosAccountLocalModel> getByScheme({
    required int authenticationKeyScheme,
  }) =>
      _box
          .query(
            AptosAccountLocalModel_.authenticationKeyScheme
                .equals(authenticationKeyScheme),
          )
          .build()
          .find();

  List<AptosAccountLocalModel> getAll() => _box.getAll();

  bool delete(int localId) => _box.remove(localId);

  int deleteMany(List<int> localIds) => _box.removeMany(localIds);

  bool deleteByAddress({required Uint8List accountAddress}) {
    final AptosAccountLocalModel? account =
        getByAddress(accountAddress: accountAddress);
    return account != null && delete(account.localId);
  }

  bool deleteByAuthKey({required Uint8List authenticationKey}) {
    final List<AptosAccountLocalModel> accounts =
        getByAuthKey(authenticationKey: authenticationKey);
    return accounts.isNotEmpty &&
        deleteMany(
              accounts
                  .map((AptosAccountLocalModel acc) => acc.localId)
                  .toList(),
            ) >
            0;
  }

  bool deleteByScheme({required int authenticationKeyScheme}) {
    final List<AptosAccountLocalModel> accounts =
        getByScheme(authenticationKeyScheme: authenticationKeyScheme);
    return accounts.isNotEmpty &&
        deleteMany(
              accounts
                  .map((AptosAccountLocalModel acc) => acc.localId)
                  .toList(),
            ) >
            0;
  }

  int clear() => _box.removeAll();

  int count() => _box.count();
}
