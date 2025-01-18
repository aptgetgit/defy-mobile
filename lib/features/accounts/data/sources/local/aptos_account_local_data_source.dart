import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../models/local/aptos_account_local_model.dart';
import '../../models/local/auth_scheme_config_local_model.dart';

part 'generated/aptos_account_local_data_source.freezed.dart';

@freezed
sealed class StoreAptosAccountParams with _$StoreAptosAccountParams {
  const factory StoreAptosAccountParams.withEd25519Config({
    required Uint8List accountAddress,
    required Uint8List authenticationKey,
    required int publicKeyId,
  }) = Ed25519AptosAccountParams;
}

class AptosAccountLocalDataSource {
  AptosAccountLocalDataSource(this._store);
  final Store _store;

  AptosAccountLocalModel? _findAccountByAddress(Uint8List address) => _store
      .box<AptosAccountLocalModel>()
      .query(AptosAccountLocalModel_.accountAddress.equals(address))
      .build()
      .findFirst();

  Ed25519AuthSchemeConfigLocalModel? _findAuthConfigByAccountId(
    int accountLocalId,
  ) =>
      _store
          .box<Ed25519AuthSchemeConfigLocalModel>()
          .query(
            Ed25519AuthSchemeConfigLocalModel_.aptosAccount
                .equals(accountLocalId),
          )
          .build()
          .findFirst();

  List<Ed25519AuthSchemeConfigLocalModel> _findAuthConfigsByPublicKeyId(
    int publicKeyLocalId,
  ) =>
      _store
          .box<Ed25519AuthSchemeConfigLocalModel>()
          .query(
            Ed25519AuthSchemeConfigLocalModel_.publicKey
                .equals(publicKeyLocalId),
          )
          .build()
          .find();

  // bool _hasAuthConfigForAccount(int accountId) =>
  //     _findAuthConfigByAccountId(accountId) != null;

  // Public methods
  int storeAccountWithAuthSchemeConfig(StoreAptosAccountParams params) =>
      _store.runInTransaction(TxMode.write, () {
        switch (params) {
          case Ed25519AptosAccountParams(
              :final Uint8List accountAddress,
              :final Uint8List authenticationKey,
              :final int publicKeyId
            ):
            return _storeAccountWithEd25519AuthSchemeConfig(
              accountAddress,
              authenticationKey,
              publicKeyId,
            );
        }
      });

  int _storeAccountWithEd25519AuthSchemeConfig(
    Uint8List accountAddress,
    Uint8List authenticationKey,
    int publicKeyId,
  ) {
    final AptosAccountLocalModel? existingAccount =
        _findAccountByAddress(accountAddress);
    if (existingAccount != null) {
      final Ed25519AuthSchemeConfigLocalModel? existingEd25519AuthSchemeConfig =
          _findAuthConfigByAccountId(existingAccount.localId);
      if (existingEd25519AuthSchemeConfig != null) {
        if (existingEd25519AuthSchemeConfig.publicKey.targetId == publicKeyId) {
          return existingAccount.localId;
        }
        throw StateError('Account already exists for this address');
      }
      _storeEd25519AuthSchemeConfig(existingAccount.localId, publicKeyId);
      return existingAccount.localId;
    }

    final int accountId = _store.box<AptosAccountLocalModel>().put(
          AptosAccountLocalModel(
            accountAddress: accountAddress,
            authenticationKey: authenticationKey,
            authenticationScheme: 0,
          ),
        );
    _storeEd25519AuthSchemeConfig(accountId, publicKeyId);
    return accountId;
  }

  int _storeEd25519AuthSchemeConfig(
    int accountId,
    int publicKeyId,
  ) =>
      _store.box<Ed25519AuthSchemeConfigLocalModel>().put(
            Ed25519AuthSchemeConfigLocalModel.withRelation(
              localAptosAccountId: accountId,
              localPublicKeyId: publicKeyId,
            ),
          );

  bool hasAccountWithAddress(Uint8List address) =>
      _findAccountByAddress(address) != null;

  AptosAccountLocalModel? findAccountByAddress(Uint8List address) =>
      _findAccountByAddress(address);

  Ed25519AuthSchemeConfigLocalModel? findAuthConfigByAccountId(
    int accountLocalId,
  ) =>
      _findAuthConfigByAccountId(accountLocalId);

  List<Ed25519AuthSchemeConfigLocalModel> findAuthConfigsByPublicKeyId(
    int publicKeyId,
  ) =>
      _findAuthConfigsByPublicKeyId(publicKeyId);

  List<AptosAccountLocalModel> findAccountsByAuthKey(
    Uint8List authenticationKey,
  ) =>
      _store
          .box<AptosAccountLocalModel>()
          .query(
            AptosAccountLocalModel_.authenticationKey.equals(authenticationKey),
          )
          .build()
          .find();

  List<AptosAccountLocalModel> findAccountsByPublicKeyId(int publicKeyLocalId) {
    final List<Ed25519AuthSchemeConfigLocalModel> authConfigs =
        _findAuthConfigsByPublicKeyId(publicKeyLocalId);
    return authConfigs
        .map(
          (Ed25519AuthSchemeConfigLocalModel config) =>
              config.aptosAccount.target,
        )
        .whereType<AptosAccountLocalModel>()
        .toList();
  }

  List<AptosAccountLocalModel> getAllAccounts() =>
      _store.box<AptosAccountLocalModel>().getAll();

  int getAccountCount() => _store.box<AptosAccountLocalModel>().count();

  // void updateAuthenticationKey(Uint8List address, Uint8List newAuthKey) =>
  //     _store.runInTransaction(TxMode.write, () {
  //       final AptosAccountLocalModel? account = _findAccountByAddress(address);
  //       if (account == null) {
  //         throw StateError('Account not found for address');
  //       }

  //       final AptosAccountLocalModel updatedAccount = AptosAccountLocalModel(
  //         accountAddress: account.accountAddress,
  //         authenticationKey: newAuthKey,
  //         authenticationScheme: account.authenticationScheme,
  //       )..localId = account.localId;

  //       _store.box<AptosAccountLocalModel>().put(updatedAccount);
  //     });

  void deleteAccountByAddress(Uint8List address) =>
      _store.runInTransaction(TxMode.write, () {
        final AptosAccountLocalModel? account = _findAccountByAddress(address);
        if (account != null) {
          _deleteAuthSchemeConfigs(account.localId);
          _store.box<AptosAccountLocalModel>().remove(account.localId);
        }
      });

  void _deleteAuthSchemeConfigs(int accountId) {
    final Ed25519AuthSchemeConfigLocalModel? ed25519authSchemeConfig =
        findAuthConfigByAccountId(accountId);
    if (ed25519authSchemeConfig != null) {
      _store
          .box<Ed25519AuthSchemeConfigLocalModel>()
          .remove(ed25519authSchemeConfig.localId);
    }
  }
}
