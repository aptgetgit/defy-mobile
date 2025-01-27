import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../../domain/entities/account_address.dart';
import '../../domain/entities/aptos_account.dart';
import '../../domain/entities/authentication_key.dart';
import '../../domain/entities/authentication_key_scheme.dart';
import '../../domain/entities/json_web_key.dart';
import '../../domain/repositories/aptos_account_repository.dart';
import '../models/local/aptos_account_local_model.dart';
import '../models/local/auth_key_config_local_model.dart';
import '../sources/local/aptos_account_local_data_source.dart';
import '../sources/local/auth_key_config_local_data_source.dart';
import '../sources/local/jwk_local_data_source.dart';

class AptosAccountRepository implements IAptosAccountRepository {
  AptosAccountRepository({
    required Store store,
    required AptosAccountDataSource accountDataSource,
    required JwkDataSource jwkDataSource,
    required Ed25519AuthKeyConfigDataSource ed25519ConfigDataSource,
  })  : _store = store,
        _accountDataSource = accountDataSource,
        _jwkDataSource = jwkDataSource,
        _ed25519ConfigDataSource = ed25519ConfigDataSource;

  final Store _store;
  final JwkDataSource _jwkDataSource;
  final AptosAccountDataSource _accountDataSource;
  final Ed25519AuthKeyConfigDataSource _ed25519ConfigDataSource;

  @override
  AptosAccount createAccount({
    required AuthenticatorConfig config,
    AccountAddress? accountAddress,
  }) =>
      _store.runInTransaction(TxMode.write, () {
        final AuthenticationKey authKey = _storeAuthConfig(config: config);
        return _accountDataSource
            .store(
              accountAddress: accountAddress?.toBytes() ??
                  AccountAddress.fromAuthenticationKey(
                    authenticationKey: authKey,
                  ).toBytes(),
              authenticationKey: authKey.toBytes(),
              authenticationKeyScheme: authKey.scheme.toByte(),
            )
            .toDomain();
      });

  AuthenticationKey _storeAuthConfig({required AuthenticatorConfig config}) {
    switch (config) {
      case Ed25519AuthenticatorConfig(:final Uint8List keyId):
        final Jwk? jwk = _jwkDataSource.getByKeyId(keyId: keyId)?.toDomain();
        if (jwk == null) {
          throw StateError('JWK not found');
        }

        final AuthenticationKey authKey =
            AuthenticationKey.ed25519SchemeFromPublicKey(
          publicKeyBytes: jwk.x,
        );

        _ed25519ConfigDataSource.store(
          authenticationKey: authKey.toBytes(),
          keyId: keyId,
        );

        return authKey;
    }
  }

  @override
  void deleteByAddress({required AccountAddress accountAddress}) =>
      _store.runInTransaction(TxMode.write, () {
        final AptosAccount? account =
            getByAddress(accountAddress: accountAddress);
        if (account == null) {
          return;
        }

        _accountDataSource.deleteByAddress(
          accountAddress: accountAddress.toBytes(),
        );

        final List<AptosAccountLocalModel> remainingAccounts =
            _accountDataSource.getByAuthKey(
          authenticationKey: account.authenticationKey.toBytes(),
        );

        if (remainingAccounts.isEmpty) {
          final Ed25519AuthKeyConfigLocalModel? authConfig =
              _ed25519ConfigDataSource.getByAuthKey(
            authenticationKey: account.authenticationKey.toBytes(),
          );
          if (authConfig != null) {
            _ed25519ConfigDataSource.deleteByAuthKey(
              authenticationKey: account.authenticationKey.toBytes(),
            );
            if (_ed25519ConfigDataSource.getByKeyId(
                  keyId: authConfig.jwkKeyId,
                ) ==
                null) {
              _jwkDataSource.deleteByKeyId(keyId: authConfig.jwkKeyId);
            }
          }
        }
      });

  @override
  void deleteMany(List<AccountAddress> accountAddress) {
    for (final AccountAddress address in accountAddress) {
      deleteByAddress(accountAddress: address);
    }
  }

  @override
  void clear() => _store.runInTransaction(TxMode.write, () {
        _accountDataSource.clear();
        final List<Ed25519AuthKeyConfigLocalModel> authConfigs =
            _ed25519ConfigDataSource.getAll();
        for (final Ed25519AuthKeyConfigLocalModel config in authConfigs) {
          if (_accountDataSource
              .getByAuthKey(authenticationKey: config.authenticationKey)
              .isNotEmpty) {
            throw StateError(
              'Cannot clear: auth configs are in use by accounts',
            );
          }
        }
        _ed25519ConfigDataSource.clear();
        final Set<Uint8List> usedJwkIds = authConfigs
            .map((Ed25519AuthKeyConfigLocalModel config) => config.jwkKeyId)
            .toSet();

        for (final Uint8List jwkId in usedJwkIds) {
          if (_ed25519ConfigDataSource.getByKeyId(keyId: jwkId) == null) {
            _jwkDataSource.deleteByKeyId(keyId: jwkId);
          }
        }
      });

  @override
  AptosAccount? getByAddress({required AccountAddress accountAddress}) =>
      _accountDataSource
          .getByAddress(accountAddress: accountAddress.toBytes())
          ?.toDomain();

  @override
  List<AptosAccount> getByAuthKey({required AuthenticationKey authKey}) =>
      _accountDataSource
          .getByAuthKey(authenticationKey: authKey.toBytes())
          .map((AptosAccountLocalModel model) => model.toDomain())
          .toList();

  @override
  List<AptosAccount> getByAuthScheme({
    required AuthenticationKeyScheme scheme,
  }) =>
      _accountDataSource
          .getByScheme(authenticationKeyScheme: scheme.toByte())
          .map((AptosAccountLocalModel model) => model.toDomain())
          .toList();

  @override
  List<AptosAccount> getAll() => _accountDataSource
      .getAll()
      .map((AptosAccountLocalModel model) => model.toDomain())
      .toList();

  @override
  int count() => _accountDataSource.count();

  @override
  bool hasAddress({required AccountAddress accountAddress}) =>
      _accountDataSource.getByAddress(
        accountAddress: accountAddress.toBytes(),
      ) !=
      null;

  @override
  AuthenticatorConfig? getAuthConfigByAuthKey({
    required AuthenticationKey authKey,
  }) {
    final Ed25519AuthKeyConfigLocalModel? config = _ed25519ConfigDataSource
        .getByAuthKey(authenticationKey: authKey.toBytes());
    if (config == null) {
      return null;
    }

    // final JwkLocalModel? jwk =
    //     _jwkDataSource.getByKeyId(keyId: config.jwkKeyId);
    // if (jwk == null) {
    //   return null;
    // }

    return AuthenticatorConfig.ed25519(keyId: config.jwkKeyId);
  }

  @override
  AuthenticatorConfig? getEd25519AuthConfigsByJwkKeyId({
    required Uint8List keyId,
  }) {
    final Ed25519AuthKeyConfigLocalModel? config =
        _ed25519ConfigDataSource.getByKeyId(keyId: keyId);
    if (config == null) {
      return null;
    }

    // final JwkLocalModel? jwk = _jwkDataSource.getByKeyId(keyId: keyId);
    // if (jwk == null) {
    //   return <AuthenticatorConfig>[];
    // }

    return AuthenticatorConfig.ed25519(keyId: config.jwkKeyId);
  }

  // @override
  // void updateAuthKey({
  //   required AccountAddress accountAddress,
  //   required AuthenticationKey newAuthKey,
  // }) =>
  //     _store.runInTransaction(TxMode.write, () {
  //       final AptosAccount? account =
  //           getByAddress(accountAddress: accountAddress);
  //       if (account == null) {
  //         throw StateError('Account not found');
  //       }

  //       final AuthenticationKey oldAuthKey = account.authenticationKey;
  //       final List<AptosAccountLocalModel> otherAccountsWithOldKey =
  //           _accountDataSource
  //               .getByAuthKey(authenticationKey: oldAuthKey.toBytes())
  //               .where(
  //                 (AptosAccountLocalModel a) =>
  //                     a.accountAddress != accountAddress.toBytes(),
  //               )
  //               .toList();

  //       if (otherAccountsWithOldKey.isEmpty) {
  //         _ed25519ConfigDataSource.deleteByAuthKey(
  //           authenticationKey: oldAuthKey.toBytes(),
  //         );
  //       }

  //       _accountDataSource.store(
  //         accountAddress: accountAddress.toBytes(),
  //         authenticationKey: newAuthKey.toBytes(),
  //         authenticationKeyScheme: newAuthKey.scheme.toByte(),
  //       );
  //     });
}
