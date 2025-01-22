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
import '../models/local/jwk_local_model.dart';
import '../sources/local/aptos_account_local_data_source.dart';
import '../sources/local/auth_key_config_local_data_source.dart';
import '../sources/local/public_key_local_data_source.dart';

class AptosAccountRepository implements IAptosAccountRepository {
  AptosAccountRepository(this._store)
      : _accountLocalDataSource =
            AptosAccountLocalDataSource(_store.box<AptosAccountLocalModel>()),
        _jwkLocalDataSource = JwkLocalDataSource(_store.box<JwkLocalModel>()),
        _ed25519AuthKeyConfigDataSource = Ed25519AuthKeyConfigLocalDataSource(
          _store.box<Ed25519AuthKeyConfigLocalModel>(),
        );

  final Store _store;
  final AptosAccountLocalDataSource _accountLocalDataSource;
  final JwkLocalDataSource _jwkLocalDataSource;
  final Ed25519AuthKeyConfigLocalDataSource _ed25519AuthKeyConfigDataSource;

  @override
  AptosAccount storeAccountWithAuthenticatorConfig({
    required AuthenticatorConfig authenticatorConfig,
    AccountAddress? accountAddress,
  }) =>
      _store.runInTransaction(TxMode.write, () {
        final AuthenticationKey computedAuthKey =
            authenticatorConfig.toAuthenticationKey();

        final AccountAddress computedAccountAddress =
            accountAddress ?? AccountAddress(bytes: computedAuthKey.toBytes());
        if (_accountLocalDataSource.findAccountByAccountAddress(
              accountAddress: computedAccountAddress.toBytes(),
            ) !=
            null) {
          throw StateError('Account with this address already exists');
        }
        _validateAndStoreAuthenticatorConfig(
          authenticationKey: computedAuthKey,
          authenticatorConfig: authenticatorConfig,
        );

        return _accountLocalDataSource.putAccount(
          accountAddress: computedAccountAddress.toBytes(),
          authenticationKey: computedAuthKey.toBytes(),
          authenticationKeyScheme: computedAuthKey.scheme.toByte(),
        ).toDomain();
      });

  void _validateAndStoreAuthenticatorConfig({
    required AuthenticationKey authenticationKey,
    required AuthenticatorConfig authenticatorConfig,
  }) {
    switch (authenticatorConfig) {
      case Ed25519AuthenticatorConfig(:final Jwk jwk):
        _validateAndStoreEd25519Config(
          authenticationKey: authenticationKey,
          jwk: jwk,
        );
    }
  }

  void _validateAndStoreEd25519Config({
    required AuthenticationKey authenticationKey,
    required Jwk jwk,
  }) {
    final JwkLocalModel? publicKey =
        _jwkLocalDataSource.findPublicKeyByKeyId(keyId: jwk.keyId);
    if (publicKey == null) {
      throw StateError('Required public key not found for keyId: ${jwk.keyId}');
    }
    final Ed25519AuthKeyConfigLocalModel? existingConfig =
        _ed25519AuthKeyConfigDataSource
            .findEd25519AuthKeyConfigByAuthenticationKey(
      authenticationKey: authenticationKey.toBytes(),
    );

    if (existingConfig != null) {
      if (existingConfig.jwkKeyId != jwk.keyId) {
        throw StateError(
          'Authentication key conflict: existing config uses different JWK',
        );
      }
      return;
    }
    _ed25519AuthKeyConfigDataSource.putEd25519AuthKeyConfig(
      authenticationKey: authenticationKey.toBytes(),
      jwkKeyId: jwk.keyId,
    );
  }

  @override
  void deleteAccountByAddress({
    required AccountAddress accountAddress,
  }) =>
      _store.runInTransaction(TxMode.write, () {
        final AptosAccount? account =
            findAccountByAddress(accountAddress: accountAddress);
        if (account == null) {
          return;
        }

        _accountLocalDataSource.removeAccountByAddress(
          accountAddress: accountAddress.toBytes(),
        );

        final AuthenticationKey authKey = account.authenticationKey;
        final List<AptosAccountLocalModel> remainingAccounts =
            _accountLocalDataSource.findAccountsByAuthenticationKey(
          authenticationKey: authKey.toBytes(),
        );

        if (remainingAccounts.isEmpty) {
          _ed25519AuthKeyConfigDataSource
              .removeEd25519AuthKeyConfigByAuthenticationKey(
            authenticationKey: authKey.toBytes(),
          );
        }
      });

  @override
  List<AptosAccount> findAccountsByJwkKeyId({
    required Uint8List jwkKeyId,
  }) {
    final Ed25519AuthKeyConfigLocalModel? config =
        _ed25519AuthKeyConfigDataSource.findEd25519AuthKeyConfigByJwkKeyId(
      jwkKeyId: jwkKeyId,
    );
    if (config == null) {
      return <AptosAccount>[];
    }

    return _accountLocalDataSource
        .findAccountsByAuthenticationKey(
          authenticationKey: config.authenticationKey,
        )
        .map((AptosAccountLocalModel model) => model.toDomain())
        .toList();
  }

  @override
  List<AptosAccount> findAccountsByAuthKey({
    required AuthenticationKey authenticationKey,
  }) =>
      _accountLocalDataSource
          .findAccountsByAuthenticationKey(
            authenticationKey: authenticationKey.toBytes(),
          )
          .map((AptosAccountLocalModel model) => model.toDomain())
          .toList();

  @override
  List<AptosAccount> findAccountsByAuthKeyScheme({
    required AuthenticationKeyScheme authenticationKeyScheme,
  }) =>
      _accountLocalDataSource
          .findAccountsByAuthenticationKeyScheme(
            authenticationKeyScheme: authenticationKeyScheme.toByte(),
          )
          .map((AptosAccountLocalModel model) => model.toDomain())
          .toList();

  @override
  void updateAuthKey({
    required AccountAddress accountAddress,
    required AuthenticationKey newAuthKey,
  }) =>
      _store.runInTransaction(TxMode.write, () {
        final AptosAccount? account =
            findAccountByAddress(accountAddress: accountAddress);
        if (account == null) {
          throw StateError('Account not found');
        }

        final AuthenticationKey oldAuthKey = account.authenticationKey;
        final List<AptosAccountLocalModel> otherAccountsWithOldKey =
            _accountLocalDataSource
                .findAccountsByAuthenticationKey(
                  authenticationKey: oldAuthKey.toBytes(),
                )
                .where(
                  (AptosAccountLocalModel a) =>
                      a.accountAddress != accountAddress.toBytes(),
                )
                .toList();

        if (otherAccountsWithOldKey.isEmpty) {
          _ed25519AuthKeyConfigDataSource
              .removeEd25519AuthKeyConfigByAuthenticationKey(
            authenticationKey: oldAuthKey.toBytes(),
          );
        }

        _accountLocalDataSource.putAccount(
          accountAddress: accountAddress.toBytes(),
          authenticationKey: newAuthKey.toBytes(),
          authenticationKeyScheme: newAuthKey.scheme.toByte(),
        );
      });

  @override
  bool hasAccountWithAddress({
    required AccountAddress accountAddress,
  }) =>
      _accountLocalDataSource.findAccountByAccountAddress(
        accountAddress: accountAddress.toBytes(),
      ) !=
      null;

  @override
  AptosAccount? findAccountByAddress({
    required AccountAddress accountAddress,
  }) {
    final AptosAccountLocalModel? account =
        _accountLocalDataSource.findAccountByAccountAddress(
      accountAddress: accountAddress.toBytes(),
    );
    return account?.toDomain();
  }

  @override
  AuthenticatorConfig? findAuthConfigByAuthenticationKey({
    required AuthenticationKey authenticationKey,
  }) {
    final Ed25519AuthKeyConfigLocalModel? config =
        _ed25519AuthKeyConfigDataSource
            .findEd25519AuthKeyConfigByAuthenticationKey(
      authenticationKey: authenticationKey.toBytes(),
    );
    if (config == null) {
      return null;
    }

    final JwkLocalModel? jwk = _jwkLocalDataSource.findPublicKeyByKeyId(
      keyId: config.jwkKeyId,
    );
    if (jwk == null) {
      return null;
    }

    return AuthenticatorConfig.ed25519(jwk: jwk.toDomain());
  }

  @override
  List<AuthenticatorConfig> findAuthConfigsByJwkKeyId({
    required Uint8List jwkKeyId,
  }) {
    final Ed25519AuthKeyConfigLocalModel? configs =
        _ed25519AuthKeyConfigDataSource.findEd25519AuthKeyConfigByJwkKeyId(
      jwkKeyId: jwkKeyId,
    );
    if (configs == null) {
      return <AuthenticatorConfig>[];
    }

    final JwkLocalModel? jwk =
        _jwkLocalDataSource.findPublicKeyByKeyId(keyId: jwkKeyId);
    if (jwk == null) {
      return <AuthenticatorConfig>[];
    }

    return <AuthenticatorConfig>[
      AuthenticatorConfig.ed25519(jwk: jwk.toDomain()),
    ];
  }

  @override
  List<AptosAccount> getAllAccounts() => _accountLocalDataSource
      .getAllAccounts()
      .map((AptosAccountLocalModel model) => model.toDomain())
      .toList();

  @override
  int getAccountCount() => _accountLocalDataSource.countAccounts();
}
