import 'dart:typed_data';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../models/local/aptos_account_local_model.dart';

class AptosAccountLocalDataSource {
  AptosAccountLocalDataSource(this._box);
  final Box<AptosAccountLocalModel> _box;

  AptosAccountLocalModel putAccount({
    required Uint8List accountAddress,
    required Uint8List authenticationKey,
    required int authenticationKeyScheme,
  }) {
    final AptosAccountLocalModel account = AptosAccountLocalModel(
      accountAddress: accountAddress,
      authenticationKey: authenticationKey,
      authenticationKeyScheme: authenticationKeyScheme,
    );
    _box.put(account);
    return account;
  }

  AptosAccountLocalModel? findAccountByAccountAddress({
    required Uint8List accountAddress,
  }) =>
      _box
          .query(AptosAccountLocalModel_.accountAddress.equals(accountAddress))
          .build()
          .findFirst();

  AptosAccountLocalModel? findAccountById(int localId) => _box.get(localId);

  List<AptosAccountLocalModel> findAccountsByAuthenticationKey({
    required Uint8List authenticationKey,
  }) =>
      _box
          .query(
            AptosAccountLocalModel_.authenticationKey.equals(authenticationKey),
          )
          .build()
          .find();

  List<AptosAccountLocalModel> findAccountsByAuthenticationKeyScheme({
    required int authenticationKeyScheme,
  }) =>
      _box
          .query(
            AptosAccountLocalModel_.authenticationKeyScheme
                .equals(authenticationKeyScheme),
          )
          .build()
          .find();

  List<AptosAccountLocalModel> getAllAccounts() => _box.getAll();

  bool removeAccount(int localId) => _box.remove(localId);

  int removeAccounts(List<int> localIds) => _box.removeMany(localIds);

  bool removeAccountByAddress({
    required Uint8List accountAddress,
  }) {
    final AptosAccountLocalModel? account =
        findAccountByAccountAddress(accountAddress: accountAddress);
    if (account == null) {
      return false;
    }
    return removeAccount(account.localId);
  }

  bool removeAccountByAuthenticationKey({
    required Uint8List authenticationKey,
  }) {
    final List<AptosAccountLocalModel> accounts =
        findAccountsByAuthenticationKey(
      authenticationKey: authenticationKey,
    );
    if (accounts.isEmpty) {
      return false;
    }
    return removeAccounts(
          accounts.map((AptosAccountLocalModel acc) => acc.localId).toList(),
        ) >
        0;
  }

  bool removeAccountsByAuthenticationKeyScheme({
    required int authenticationKeyScheme,
  }) {
    final List<AptosAccountLocalModel> accounts =
        findAccountsByAuthenticationKeyScheme(
      authenticationKeyScheme: authenticationKeyScheme,
    );
    if (accounts.isEmpty) {
      return false;
    }
    return removeAccounts(
          accounts.map((AptosAccountLocalModel acc) => acc.localId).toList(),
        ) >
        0;
  }

  int removeAllAccounts() => _box.removeAll();

  int countAccounts() => _box.count();
}
