import 'dart:typed_data';
import 'dart:ui';

import 'package:objectbox/objectbox.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/comparison_utils.dart';
import '../../domain/entities/account_address.dart';
import '../../domain/entities/aptos_account_with_metadata.dart';
import '../../domain/entities/authentication_key.dart';
import '../../domain/entities/authentication_key_scheme.dart';
import '../../domain/entities/json_web_key.dart';
import '../../domain/repositories/aptos_account_repository_interface.dart';
import '../models/local/account_metadata_local_model.dart';
import '../models/local/aptos_account_local_model.dart';
import '../models/local/ed25519_auth_key_config_local_model.dart';
import '../sources/local/account_metadata_local_data_source.dart';
import '../sources/local/aptos_account_local_data_source.dart';
import '../sources/local/ed25519_auth_key_config_local_data_source.dart';
import '../sources/local/jwk_local_data_source.dart';

class AptosAccountRepository implements IAptosAccountRepository {
  AptosAccountRepository({
    required Store store,
    required JwkDataSource jwkDataSource,
    required AptosAccountLocalDataSource accountDataSource,
    required AccountMetadataLocalDataSource metadataDataSource,
    required Ed25519AuthKeyConfigLocalDataSource ed25519ConfigDataSource,
  })  : _store = store,
        _jwkDataSource = jwkDataSource,
        _accountDataSource = accountDataSource,
        _metadataDataSource = metadataDataSource,
        _ed25519ConfigDataSource = ed25519ConfigDataSource;

  final Store _store;
  final JwkDataSource _jwkDataSource;
  final AptosAccountLocalDataSource _accountDataSource;
  final AccountMetadataLocalDataSource _metadataDataSource;
  final Ed25519AuthKeyConfigLocalDataSource _ed25519ConfigDataSource;

  AptosAccountWithMetadata _combineToAccountWithMetadata({
    required AptosAccountLocalModel account,
    required AccountMetadataLocalModel metadata,
  }) =>
      (areByteListsEqual(account.accountAddress, metadata.accountAddress))
          ? throw StateError(
              'Account and metadata address mismatch',
            )
          : AptosAccountWithMetadata(
              label: metadata.label,
              iconUri: Uri.parse(metadata.iconUri),
              backgroundColor: Color(metadata.backgroundColor),
              accountAddress: AccountAddress(bytes: account.accountAddress),
              authenticationKey:
                  AuthenticationKey(bytes: account.authenticationKey),
              authenticationKeyScheme: AuthenticationKeyScheme.fromByte(
                byte: account.authenticationKeyScheme,
              ),
            );

  @override
  AptosAccountWithMetadata createAccount({
    required String label,
    required Uri iconUri,
    required Color backgroundColor,
    required AuthenticatorConfig config,
    AccountAddress? accountAddress,
  }) =>
      _store.runInTransaction(TxMode.write, () {
        final AuthenticationKeyScheme scheme = config.scheme;
        final AuthenticationKey authKey = _storeAuthConfig(config: config);

        final AccountAddress address = accountAddress ??
            AccountAddress.fromAuthenticationKey(
              authenticationKey: authKey,
            );

        final AptosAccountLocalModel accountModel = _accountDataSource.store(
          accountAddress: address.toBytes(),
          authenticationKey: authKey.toBytes(),
          authenticationKeyScheme: scheme.toByte(),
        );

        final AccountMetadataLocalModel metadataModel = _storeMetadata(
          label: label,
          iconUri: iconUri,
          backgroundColor: colorToInt(backgroundColor),
          accountAddress: address.toBytes(),
        );

        return _combineToAccountWithMetadata(
          account: accountModel,
          metadata: metadataModel,
        );
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
          publicKeyBytes: jwk.getPublicKeyBytes(),
        );

        _ed25519ConfigDataSource.store(
          authenticationKey: authKey.toBytes(),
          keyId: keyId,
        );

        return authKey;
    }
  }

  AccountMetadataLocalModel _storeMetadata({
    required String label,
    required Uri iconUri,
    required int backgroundColor,
    required Uint8List accountAddress,
  }) {
    if (_metadataDataSource.getByLabel(label: label) != null) {
      throw StateError('Label already exists');
    }

    return _metadataDataSource.store(
      label: label,
      iconUri: iconUri.toString(),
      backgroundColor: backgroundColor,
      accountAddress: accountAddress,
    );
  }

  @override
  void deleteByAddress({required AccountAddress accountAddress}) =>
      _store.runInTransaction(TxMode.write, () {
        _deleteAddressImpl(accountAddress: accountAddress);
      });

  @override
  void deleteMany(List<AccountAddress> accountAddresses) =>
      _store.runInTransaction(TxMode.write, () {
        for (final AccountAddress address in accountAddresses) {
          _deleteAddressImpl(accountAddress: address);
        }
      });

  @override
  void clear() => _store.runInTransaction(TxMode.write, () {
        _metadataDataSource.clear();
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
  AptosAccountWithMetadata? getByAddress({
    required AccountAddress accountAddress,
  }) =>
      _store.runInTransaction(TxMode.read, () {
        final AptosAccountLocalModel? accountModel =
            _accountDataSource.getByAddress(
          accountAddress: accountAddress.toBytes(),
        );
        if (accountModel == null) {
          return null;
        }

        final AccountMetadataLocalModel? metadataModel =
            _metadataDataSource.getByAddress(
          accountAddress: accountAddress.toBytes(),
        );
        if (metadataModel == null) {
          return null;
        }

        return _combineToAccountWithMetadata(
          account: accountModel,
          metadata: metadataModel,
        );
      });

  @override
  List<AptosAccountWithMetadata> getByAuthKey({
    required AuthenticationKey authKey,
  }) =>
      _store.runInTransaction(TxMode.read, () {
        final List<AptosAccountLocalModel> accounts = _accountDataSource
            .getByAuthKey(authenticationKey: authKey.toBytes());

        return accounts.map((AptosAccountLocalModel accountModel) {
          final AccountMetadataLocalModel? metadataModel =
              _metadataDataSource.getByAddress(
            accountAddress: accountModel.accountAddress,
          );
          if (metadataModel == null) {
            throw StateError('Metadata not found for account');
          }

          return _combineToAccountWithMetadata(
            account: accountModel,
            metadata: metadataModel,
          );
        }).toList();
      });

  @override
  List<AptosAccountWithMetadata> getByAuthScheme({
    required AuthenticationKeyScheme scheme,
  }) =>
      _store.runInTransaction(TxMode.read, () {
        final List<AptosAccountLocalModel> accounts =
            _accountDataSource.getByScheme(
          authenticationKeyScheme: scheme.toByte(),
        );

        return accounts.map((AptosAccountLocalModel accountModel) {
          final AccountMetadataLocalModel? metadataModel =
              _metadataDataSource.getByAddress(
            accountAddress: accountModel.accountAddress,
          );
          if (metadataModel == null) {
            throw StateError('Metadata not found for account');
          }

          return _combineToAccountWithMetadata(
            account: accountModel,
            metadata: metadataModel,
          );
        }).toList();
      });

  @override
  List<AptosAccountWithMetadata> getAll() =>
      _store.runInTransaction(TxMode.read, () {
        final List<AptosAccountLocalModel> accounts =
            _accountDataSource.getAll();
        final List<AccountMetadataLocalModel> allMetadata =
            _metadataDataSource.getAll();

        final Map<Uint8List, AccountMetadataLocalModel> metadataByAddress =
            <Uint8List, AccountMetadataLocalModel>{
          for (final AccountMetadataLocalModel metadata in allMetadata)
            metadata.accountAddress: metadata,
        };

        return accounts
            .where(
              (AptosAccountLocalModel account) =>
                  metadataByAddress.containsKey(account.accountAddress),
            )
            .map(
              (AptosAccountLocalModel account) => _combineToAccountWithMetadata(
                account: account,
                metadata: metadataByAddress[account.accountAddress]!,
              ),
            )
            .toList();
      });

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
  }) =>
      _store.runInTransaction(TxMode.read, () {
        final Ed25519AuthKeyConfigLocalModel? config = _ed25519ConfigDataSource
            .getByAuthKey(authenticationKey: authKey.toBytes());
        if (config == null) {
          return null;
        }
        return AuthenticatorConfig.ed25519(keyId: config.jwkKeyId);
      });

  @override
  AuthenticatorConfig? getEd25519AuthConfigsByJwkKeyId({
    required Uint8List keyId,
  }) =>
      _store.runInTransaction(TxMode.read, () {
        final Ed25519AuthKeyConfigLocalModel? config =
            _ed25519ConfigDataSource.getByKeyId(keyId: keyId);
        if (config == null) {
          return null;
        }
        return AuthenticatorConfig.ed25519(keyId: config.jwkKeyId);
      });

  @override
  void deleteByLabel({required String label}) =>
      _store.runInTransaction(TxMode.write, () {
        final AccountMetadataLocalModel? metadataModel =
            _metadataDataSource.getByLabel(label: label);
        if (metadataModel == null) {
          return;
        }
        _deleteAddressImpl(
          accountAddress: AccountAddress(bytes: metadataModel.accountAddress),
        );
      });

  void _deleteAddressImpl({required AccountAddress accountAddress}) {
    final AptosAccountLocalModel? account = _accountDataSource.getByAddress(
      accountAddress: accountAddress.toBytes(),
    );
    if (account == null) {
      return;
    }
    _metadataDataSource.deleteByAddress(
      accountAddress: accountAddress.toBytes(),
    );
    _accountDataSource.deleteByAddress(
      accountAddress: accountAddress.toBytes(),
    );
    final List<AptosAccountLocalModel> remainingAccounts =
        _accountDataSource.getByAuthKey(
      authenticationKey: account.authenticationKey,
    );
    if (remainingAccounts.isEmpty) {
      final Ed25519AuthKeyConfigLocalModel? authConfig =
          _ed25519ConfigDataSource.getByAuthKey(
        authenticationKey: account.authenticationKey,
      );
      if (authConfig != null) {
        _ed25519ConfigDataSource.deleteByAuthKey(
          authenticationKey: account.authenticationKey,
        );
        if (_ed25519ConfigDataSource.getByKeyId(
              keyId: authConfig.jwkKeyId,
            ) ==
            null) {
          _jwkDataSource.deleteByKeyId(keyId: authConfig.jwkKeyId);
        }
      }
    }
  }

  @override
  AptosAccountWithMetadata? getByLabel({required String label}) =>
      _store.runInTransaction(TxMode.read, () {
        final AccountMetadataLocalModel? metadataModel =
            _metadataDataSource.getByLabel(label: label);
        if (metadataModel == null) {
          return null;
        }

        final AptosAccountLocalModel? accountModel =
            _accountDataSource.getByAddress(
          accountAddress: metadataModel.accountAddress,
        );
        if (accountModel == null) {
          return null;
        }

        return _combineToAccountWithMetadata(
          account: accountModel,
          metadata: metadataModel,
        );
      });

  @override
  bool hasLabel({required String label}) =>
      _metadataDataSource.getByLabel(label: label) != null;

  @override
  void updateIconUri({
    required AccountAddress accountAddress,
    required Uri newIconUri,
  }) =>
      _store.runInTransaction(TxMode.write, () {
        final AccountMetadataLocalModel? metadata =
            _metadataDataSource.getByAddress(
          accountAddress: accountAddress.toBytes(),
        );
        if (metadata == null) {
          throw StateError('Account not found');
        }

        if (!_metadataDataSource.update(
          localId: metadata.localId,
          iconUri: newIconUri.toString(),
        )) {
          throw StateError('Failed to update icon URI');
        }
      });

  @override
  void updateLabel({
    required AccountAddress accountAddress,
    required String newLabel,
  }) =>
      _store.runInTransaction(TxMode.write, () {
        final AccountMetadataLocalModel? metadata =
            _metadataDataSource.getByAddress(
          accountAddress: accountAddress.toBytes(),
        );
        if (metadata == null) {
          throw StateError('Account not found');
        }

        if (!_metadataDataSource.update(
          localId: metadata.localId,
          label: newLabel,
        )) {
          throw StateError('Failed to update label');
        }
      });

  @override
  void updateBackgroundColor({
    required AccountAddress accountAddress,
    required Color newBackgroundColor,
  }) =>
      _store.runInTransaction(TxMode.write, () {
        final AccountMetadataLocalModel? metadata =
            _metadataDataSource.getByAddress(
          accountAddress: accountAddress.toBytes(),
        );
        if (metadata == null) {
          throw StateError('Account not found');
        }

        if (!_metadataDataSource.update(
          localId: metadata.localId,
          backgroundColor: colorToInt(newBackgroundColor),
        )) {
          throw StateError('Failed to update background color');
        }
      });
}
