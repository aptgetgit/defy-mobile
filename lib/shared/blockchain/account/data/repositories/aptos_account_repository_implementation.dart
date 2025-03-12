import 'dart:typed_data';
import 'dart:ui';

import 'package:fpdart/fpdart.dart';
import 'package:objectbox/objectbox.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/color_utils.dart';
import '../../../../utils/comparison_utils.dart';
import '../../../../utils/db_utils.dart';
import '../../domain/entities/account_address.dart';
import '../../domain/entities/aptos_account_with_metadata.dart';
import '../../domain/entities/authentication_key.dart';
import '../../domain/entities/authentication_key_scheme.dart';
import '../../domain/entities/json_web_key.dart';
import '../../domain/repositories/aptos_account_repository_interface.dart';
import '../models/local/account_metadata_local_model.dart';
import '../models/local/aptos_account_local_model.dart';
import '../models/local/ed25519_auth_key_config_local_model.dart';
import '../models/local/jwk_local_model.dart';
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
  }) : _store = store,
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
      (!areByteListsEqual(account.accountAddress, metadata.accountAddress))
          ? throw StateError('Account and metadata address mismatch')
          : AptosAccountWithMetadata(
            label: metadata.label,
            iconUri: Uri.parse(metadata.iconUri),
            backgroundColor: Color(metadata.backgroundColor),
            accountAddress: AccountAddress(bytes: account.accountAddress),
            authenticationKey: AuthenticationKey(
              bytes: account.authenticationKey,
            ),
            authenticationKeyScheme: AuthenticationKeyScheme.fromByte(
              byte: account.authenticationKeyScheme,
            ),
          );
  @override
  TaskEither<ExceptionWithStackTrace, AptosAccountWithMetadata> createAccount({
    required String label,
    required Uri iconUri,
    required Color backgroundColor,
    required AuthenticatorConfig config,
    Option<AccountAddress> accountAddress = const None(),
  }) => TaskEither<ExceptionWithStackTrace, AptosAccountWithMetadata>(() async {
    try {
      final IOEither<ExceptionWithStackTrace, AptosAccountWithMetadata>
      operation = IOEither<ExceptionWithStackTrace, AptosAccountWithMetadata>(
        () {
          final AuthenticationKeyScheme scheme = config.scheme;
          final Either<ExceptionWithStackTrace, AuthenticationKey>
          authKeyResult = _storeAuthConfig(config: config).run();

          if (authKeyResult.isLeft()) {
            return left(authKeyResult.getLeft().toNullable()!);
          }

          final AuthenticationKey authKey =
              authKeyResult.getRight().toNullable()!;

          final AccountAddress address = accountAddress.getOrElse(
            () => AccountAddress.fromAuthenticationKey(
              authenticationKey: authKey,
            ),
          );

          final Either<ExceptionWithStackTrace, AptosAccountLocalModel>
          accountResult =
              _accountDataSource
                  .store(
                    accountAddress: address.toBytes(),
                    authenticationKey: authKey.toBytes(),
                    authenticationKeyScheme: scheme.toByte(),
                  )
                  .run();

          if (accountResult.isLeft()) {
            return left(accountResult.getLeft().toNullable()!);
          }

          final AptosAccountLocalModel accountModel =
              accountResult.getRight().toNullable()!;

          final Either<ExceptionWithStackTrace, AccountMetadataLocalModel>
          metadataResult =
              _storeMetadata(
                label: label,
                iconUri: iconUri,
                backgroundColor: colorToInt(backgroundColor),
                accountAddress: address.toBytes(),
              ).run();

          if (metadataResult.isLeft()) {
            return left(metadataResult.getLeft().toNullable()!);
          }

          final AccountMetadataLocalModel metadataModel =
              metadataResult.getRight().toNullable()!;

          return right(
            _combineToAccountWithMetadata(
              account: accountModel,
              metadata: metadataModel,
            ),
          );
        },
      );

      return runInsideTransaction(TxMode.write, operation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, AuthenticationKey> _storeAuthConfig({
    required AuthenticatorConfig config,
  }) => IOEither<ExceptionWithStackTrace, AuthenticationKey>(() {
    try {
      switch (config) {
        case Ed25519AuthenticatorConfig(:final Uint8List keyId):
          final Either<ExceptionWithStackTrace, Option<JwkLocalModel>>
          jwkResult = _jwkDataSource.getByKeyId(keyId: keyId).run();

          if (jwkResult.isLeft()) {
            return left(jwkResult.getLeft().toNullable()!);
          }

          final Option<JwkLocalModel> jwkOption =
              jwkResult.getRight().toNullable()!;
          if (jwkOption.isNone()) {
            throw StateError('JWK not found');
          }

          final Jwk jwk = jwkOption.toNullable()!.toDomain();

          final AuthenticationKey authKey =
              AuthenticationKey.ed25519SchemeFromPublicKey(
                publicKeyBytes: jwk.getPublicKeyBytes(),
              );

          final Either<ExceptionWithStackTrace, Ed25519AuthKeyConfigLocalModel>
          configResult =
              _ed25519ConfigDataSource
                  .store(authenticationKey: authKey.toBytes(), keyId: keyId)
                  .run();

          if (configResult.isLeft()) {
            return left(configResult.getLeft().toNullable()!);
          }

          return right(authKey);
      }
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, AccountMetadataLocalModel> _storeMetadata({
    required String label,
    required Uri iconUri,
    required int backgroundColor,
    required Uint8List accountAddress,
  }) => IOEither<ExceptionWithStackTrace, AccountMetadataLocalModel>(() {
    try {
      return _metadataDataSource
          .store(
            label: label,
            iconUri: iconUri.toString(),
            backgroundColor: backgroundColor,
            accountAddress: accountAddress,
          )
          .run();
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
  getByAddress({required AccountAddress accountAddress}) => TaskEither<
    ExceptionWithStackTrace,
    Option<AptosAccountWithMetadata>
  >(() async {
    try {
      final IOEither<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
      operation = IOEither<
        ExceptionWithStackTrace,
        Option<AptosAccountWithMetadata>
      >(() {
        final Either<ExceptionWithStackTrace, Option<AptosAccountLocalModel>>
        accountResult =
            _accountDataSource
                .getByAddress(accountAddress: accountAddress.toBytes())
                .run();

        if (accountResult.isLeft()) {
          return left(accountResult.getLeft().toNullable()!);
        }

        final Option<AptosAccountLocalModel> accountOption =
            accountResult.getRight().toNullable()!;

        if (accountOption.isNone()) {
          return right(none());
        }

        final AptosAccountLocalModel account = accountOption.toNullable()!;

        final Either<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
        metadataResult =
            _metadataDataSource
                .getByAddress(accountAddress: accountAddress.toBytes())
                .run();

        if (metadataResult.isLeft()) {
          return left(metadataResult.getLeft().toNullable()!);
        }

        final Option<AccountMetadataLocalModel> metadataOption =
            metadataResult.getRight().toNullable()!;

        if (metadataOption.isNone()) {
          return right(none());
        }

        final AccountMetadataLocalModel metadata = metadataOption.toNullable()!;

        return right(
          Option<AptosAccountWithMetadata>.of(
            _combineToAccountWithMetadata(account: account, metadata: metadata),
          ),
        );
      });

      return runInsideTransaction(TxMode.read, operation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
  getByAuthKey({required AuthenticationKey authKey}) => TaskEither<
    ExceptionWithStackTrace,
    Set<AptosAccountWithMetadata>
  >(() async {
    try {
      final IOEither<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
      operation =
          IOEither<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>(() {
            final Either<ExceptionWithStackTrace, Set<AptosAccountLocalModel>>
            accountsResult =
                _accountDataSource
                    .getByAuthKey(authenticationKey: authKey.toBytes())
                    .run();

            if (accountsResult.isLeft()) {
              return left(accountsResult.getLeft().toNullable()!);
            }

            final Set<AptosAccountLocalModel> accounts =
                accountsResult.getRight().toNullable()!;
            final Set<AptosAccountWithMetadata> result =
                <AptosAccountWithMetadata>{};

            for (final AptosAccountLocalModel account in accounts) {
              final Either<
                ExceptionWithStackTrace,
                Option<AccountMetadataLocalModel>
              >
              metadataResult =
                  _metadataDataSource
                      .getByAddress(accountAddress: account.accountAddress)
                      .run();

              if (metadataResult.isLeft()) {
                return left(metadataResult.getLeft().toNullable()!);
              }

              final Option<AccountMetadataLocalModel> metadataOption =
                  metadataResult.getRight().toNullable()!;

              if (metadataOption.isNone()) {
                throw StateError('Metadata not found for account');
              }

              final AccountMetadataLocalModel metadata =
                  metadataOption.toNullable()!;

              result.add(
                _combineToAccountWithMetadata(
                  account: account,
                  metadata: metadata,
                ),
              );
            }

            return right(result);
          });

      return runInsideTransaction(TxMode.read, operation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });
  @override
  TaskEither<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
  getByAuthScheme({required AuthenticationKeyScheme scheme}) => TaskEither<
    ExceptionWithStackTrace,
    Set<AptosAccountWithMetadata>
  >(() async {
    try {
      final IOEither<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
      operation =
          IOEither<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>(() {
            final Either<ExceptionWithStackTrace, Set<AptosAccountLocalModel>>
            accountsResult =
                _accountDataSource
                    .getByScheme(authenticationKeyScheme: scheme.toByte())
                    .run();

            if (accountsResult.isLeft()) {
              return left(accountsResult.getLeft().toNullable()!);
            }

            final Set<AptosAccountLocalModel> accounts =
                accountsResult.getRight().toNullable()!;
            final Set<AptosAccountWithMetadata> result =
                <AptosAccountWithMetadata>{};

            for (final AptosAccountLocalModel account in accounts) {
              final Either<
                ExceptionWithStackTrace,
                Option<AccountMetadataLocalModel>
              >
              metadataResult =
                  _metadataDataSource
                      .getByAddress(accountAddress: account.accountAddress)
                      .run();

              if (metadataResult.isLeft()) {
                return left(metadataResult.getLeft().toNullable()!);
              }

              final Option<AccountMetadataLocalModel> metadataOption =
                  metadataResult.getRight().toNullable()!;

              if (metadataOption.isNone()) {
                throw StateError('Metadata not found for account');
              }

              final AccountMetadataLocalModel metadata =
                  metadataOption.toNullable()!;

              result.add(
                _combineToAccountWithMetadata(
                  account: account,
                  metadata: metadata,
                ),
              );
            }

            return right(result);
          });

      return runInsideTransaction(TxMode.read, operation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
  getAll() => TaskEither<
    ExceptionWithStackTrace,
    Set<AptosAccountWithMetadata>
  >(() async {
    try {
      final IOEither<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
      operation = IOEither<
        ExceptionWithStackTrace,
        Set<AptosAccountWithMetadata>
      >(() {
        final Either<ExceptionWithStackTrace, Set<AptosAccountLocalModel>>
        accountsResult = _accountDataSource.getAll().run();

        if (accountsResult.isLeft()) {
          return left(accountsResult.getLeft().toNullable()!);
        }

        final Set<AptosAccountLocalModel> accounts =
            accountsResult.getRight().toNullable()!;

        final Either<ExceptionWithStackTrace, Set<AccountMetadataLocalModel>>
        metadataSetResult = _metadataDataSource.getAll().run();

        if (metadataSetResult.isLeft()) {
          return left(metadataSetResult.getLeft().toNullable()!);
        }

        final Set<AccountMetadataLocalModel> allMetadata =
            metadataSetResult.getRight().toNullable()!;
        final Set<AptosAccountWithMetadata> result =
            <AptosAccountWithMetadata>{};
        for (final AptosAccountLocalModel account in accounts) {
          final Set<AccountMetadataLocalModel> matchingMetadata =
              allMetadata
                  .where(
                    (AccountMetadataLocalModel metadata) => areByteListsEqual(
                      account.accountAddress,
                      metadata.accountAddress,
                    ),
                  )
                  .toSet();

          if (matchingMetadata.isEmpty) {
            throw StateError(
              'Database corruption detected: No metadata found '
              'for account address: ${account.accountAddress}',
            );
          }

          if (matchingMetadata.length > 1) {
            throw StateError(
              'Database corruption detected: Multiple metadata entries '
              'for account address: ${account.accountAddress}',
            );
          }

          final AccountMetadataLocalModel metadata = matchingMetadata.first;

          result.add(
            _combineToAccountWithMetadata(account: account, metadata: metadata),
          );
        }

        return right(result);
      });

      return runInsideTransaction(TxMode.read, operation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  IOEither<ExceptionWithStackTrace, int> count() =>
      IOEither<ExceptionWithStackTrace, int>(() {
        try {
          return _accountDataSource.count().run();
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  @override
  IOEither<ExceptionWithStackTrace, bool> hasAddress({
    required AccountAddress accountAddress,
  }) => IOEither<ExceptionWithStackTrace, bool>(() {
    try {
      return _accountDataSource
          .getByAddress(accountAddress: accountAddress.toBytes())
          .map((Option<AptosAccountLocalModel> resp) => resp.isSome())
          .run();
    } on Exception catch (error, stackTrace) {
      return left(ExceptionWithStackTrace(error, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Option<AuthenticatorConfig>>
  getAuthConfigByAuthKey({required AuthenticationKey authKey}) =>
      TaskEither<ExceptionWithStackTrace, Option<AuthenticatorConfig>>(
        () async {
          try {
            final IOEither<ExceptionWithStackTrace, Option<AuthenticatorConfig>>
            operation =
                IOEither<ExceptionWithStackTrace, Option<AuthenticatorConfig>>(
                  () {
                    final Either<
                      ExceptionWithStackTrace,
                      Option<Ed25519AuthKeyConfigLocalModel>
                    >
                    configResult =
                        _ed25519ConfigDataSource
                            .getByAuthKey(authenticationKey: authKey.toBytes())
                            .run();

                    if (configResult.isLeft()) {
                      return left(configResult.getLeft().toNullable()!);
                    }

                    final Option<Ed25519AuthKeyConfigLocalModel> configOption =
                        configResult.getRight().toNullable()!;

                    if (configOption.isNone()) {
                      return right(none());
                    }

                    final Ed25519AuthKeyConfigLocalModel config =
                        configOption.toNullable()!;

                    return right(
                      Option<AuthenticatorConfig>.of(
                        AuthenticatorConfig.ed25519(keyId: config.jwkKeyId),
                      ),
                    );
                  },
                );

            return runInsideTransaction(TxMode.read, operation).run(_store);
          } on Exception catch (e, stackTrace) {
            return left(ExceptionWithStackTrace(e, stackTrace));
          }
        },
      );

  @override
  TaskEither<ExceptionWithStackTrace, Option<AuthenticatorConfig>>
  getEd25519AuthConfigsByJwkKeyId({required Uint8List keyId}) =>
      TaskEither<ExceptionWithStackTrace, Option<AuthenticatorConfig>>(
        () async {
          try {
            final IOEither<ExceptionWithStackTrace, Option<AuthenticatorConfig>>
            operation =
                IOEither<ExceptionWithStackTrace, Option<AuthenticatorConfig>>(
                  () {
                    final Either<
                      ExceptionWithStackTrace,
                      Option<Ed25519AuthKeyConfigLocalModel>
                    >
                    configResult =
                        _ed25519ConfigDataSource.getByKeyId(keyId: keyId).run();

                    if (configResult.isLeft()) {
                      return left(configResult.getLeft().toNullable()!);
                    }

                    final Option<Ed25519AuthKeyConfigLocalModel> configOption =
                        configResult.getRight().toNullable()!;

                    if (configOption.isNone()) {
                      return right(none());
                    }

                    final Ed25519AuthKeyConfigLocalModel config =
                        configOption.toNullable()!;

                    return right(
                      Option<AuthenticatorConfig>.of(
                        AuthenticatorConfig.ed25519(keyId: config.jwkKeyId),
                      ),
                    );
                  },
                );

            return runInsideTransaction(TxMode.read, operation).run(_store);
          } on Exception catch (e, stackTrace) {
            return left(ExceptionWithStackTrace(e, stackTrace));
          }
        },
      );

  @override
  TaskEither<ExceptionWithStackTrace, Unit> deleteByAddress({
    required AccountAddress accountAddress,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
      final IOEither<ExceptionWithStackTrace, Unit> operation =
          IOEither<ExceptionWithStackTrace, Unit>(
            () => _deleteAddressImpl(accountAddress: accountAddress).run(),
          );

      return runInsideTransaction(TxMode.write, operation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> deleteMany({
    required Set<AccountAddress> accountAddresses,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
      if (accountAddresses.isEmpty) {
        return right(unit);
      }

      final IOEither<ExceptionWithStackTrace, Unit> operation =
          IOEither<ExceptionWithStackTrace, Unit>(() {
            for (final AccountAddress address in accountAddresses) {
              final Either<ExceptionWithStackTrace, Unit> deleteResult =
                  _deleteAddressImpl(accountAddress: address).run();

              if (deleteResult.isLeft()) {
                return deleteResult;
              }
            }

            return right(unit);
          });

      return runInsideTransaction(TxMode.write, operation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> deleteByLabel({
    required String label,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
      final IOEither<ExceptionWithStackTrace, Unit>
      operation = IOEither<ExceptionWithStackTrace, Unit>(() {
        final Either<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
        metadataResult = _metadataDataSource.getByLabel(label: label).run();

        if (metadataResult.isLeft()) {
          return left(metadataResult.getLeft().toNullable()!);
        }

        final Option<AccountMetadataLocalModel> metadataOption =
            metadataResult.getRight().toNullable()!;

        if (metadataOption.isNone()) {
          return right(unit);
        }

        final AccountMetadataLocalModel metadata = metadataOption.toNullable()!;

        return _deleteAddressImpl(
          accountAddress: AccountAddress(bytes: metadata.accountAddress),
        ).run();
      });

      return runInsideTransaction(TxMode.write, operation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  IOEither<ExceptionWithStackTrace, Unit> _deleteAddressImpl({
    required AccountAddress accountAddress,
  }) => IOEither<ExceptionWithStackTrace, Unit>(() {
    final Either<ExceptionWithStackTrace, Option<AptosAccountLocalModel>>
    accountResult =
        _accountDataSource
            .getByAddress(accountAddress: accountAddress.toBytes())
            .run();

    if (accountResult.isLeft()) {
      return left(accountResult.getLeft().toNullable()!);
    }

    final Option<AptosAccountLocalModel> accountOption =
        accountResult.getRight().toNullable()!;

    if (accountOption.isNone()) {
      return right(unit);
    }

    final AptosAccountLocalModel account = accountOption.toNullable()!;

    final Either<ExceptionWithStackTrace, Unit> metadataDeleteResult =
        _metadataDataSource
            .deleteByAddress(accountAddress: accountAddress.toBytes())
            .run();

    if (metadataDeleteResult.isLeft()) {
      return metadataDeleteResult;
    }

    final Either<ExceptionWithStackTrace, Unit> accountDeleteResult =
        _accountDataSource
            .deleteByAddress(accountAddress: accountAddress.toBytes())
            .run();

    if (accountDeleteResult.isLeft()) {
      return accountDeleteResult;
    }

    final Either<ExceptionWithStackTrace, Set<AptosAccountLocalModel>>
    remainingAccountsResult =
        _accountDataSource
            .getByAuthKey(authenticationKey: account.authenticationKey)
            .run();

    if (remainingAccountsResult.isLeft()) {
      return left(remainingAccountsResult.getLeft().toNullable()!);
    }

    final Set<AptosAccountLocalModel> remainingAccounts =
        remainingAccountsResult.getRight().toNullable()!;

    if (remainingAccounts.isEmpty) {
      final Either<
        ExceptionWithStackTrace,
        Option<Ed25519AuthKeyConfigLocalModel>
      >
      configResult =
          _ed25519ConfigDataSource
              .getByAuthKey(authenticationKey: account.authenticationKey)
              .run();

      if (configResult.isLeft()) {
        return left(configResult.getLeft().toNullable()!);
      }

      final Option<Ed25519AuthKeyConfigLocalModel> configOption =
          configResult.getRight().toNullable()!;

      if (configOption.isSome()) {
        final Ed25519AuthKeyConfigLocalModel authConfig =
            configOption.toNullable()!;

        final Either<ExceptionWithStackTrace, Unit> configDeleteResult =
            _ed25519ConfigDataSource
                .deleteByAuthKey(authenticationKey: account.authenticationKey)
                .run();

        if (configDeleteResult.isLeft()) {
          return configDeleteResult;
        }

        final Either<
          ExceptionWithStackTrace,
          Option<Ed25519AuthKeyConfigLocalModel>
        >
        remainingConfigResult =
            _ed25519ConfigDataSource
                .getByKeyId(keyId: authConfig.jwkKeyId)
                .run();

        if (remainingConfigResult.isLeft()) {
          return left(remainingConfigResult.getLeft().toNullable()!);
        }

        if (remainingConfigResult.getRight().toNullable()!.isNone()) {
          final Either<ExceptionWithStackTrace, Unit> jwkDeleteResult =
              _jwkDataSource.deleteByKeyId(keyId: authConfig.jwkKeyId).run();

          if (jwkDeleteResult.isLeft()) {
            return jwkDeleteResult;
          }
        }
      }
    }

    return right(unit);
  });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> clear() =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          final IOEither<ExceptionWithStackTrace, Unit>
          operation = IOEither<ExceptionWithStackTrace, Unit>(() {
            final Either<ExceptionWithStackTrace, Unit> metadataClearResult =
                _metadataDataSource.clear().run();

            if (metadataClearResult.isLeft()) {
              return metadataClearResult;
            }

            final Either<ExceptionWithStackTrace, Unit> accountClearResult =
                _accountDataSource.clear().run();

            if (accountClearResult.isLeft()) {
              return accountClearResult;
            }

            final Either<
              ExceptionWithStackTrace,
              Set<Ed25519AuthKeyConfigLocalModel>
            >
            authConfigsResult = _ed25519ConfigDataSource.getAll().run();

            if (authConfigsResult.isLeft()) {
              return left(authConfigsResult.getLeft().toNullable()!);
            }

            final Set<Ed25519AuthKeyConfigLocalModel> authConfigs =
                authConfigsResult.getRight().toNullable()!;

            for (final Ed25519AuthKeyConfigLocalModel config in authConfigs) {
              final Either<ExceptionWithStackTrace, Set<AptosAccountLocalModel>>
              accountsResult =
                  _accountDataSource
                      .getByAuthKey(authenticationKey: config.authenticationKey)
                      .run();

              if (accountsResult.isLeft()) {
                return left(accountsResult.getLeft().toNullable()!);
              }

              if (accountsResult.getRight().toNullable()!.isNotEmpty) {
                throw StateError(
                  'Cannot clear: auth configs are in use by accounts',
                );
              }
            }

            final Either<ExceptionWithStackTrace, Unit> configClearResult =
                _ed25519ConfigDataSource.clear().run();

            if (configClearResult.isLeft()) {
              return configClearResult;
            }

            final Set<Uint8List> usedJwkIds =
                authConfigs
                    .map(
                      (Ed25519AuthKeyConfigLocalModel config) =>
                          config.jwkKeyId,
                    )
                    .toSet();

            for (final Uint8List jwkId in usedJwkIds) {
              final Either<
                ExceptionWithStackTrace,
                Option<Ed25519AuthKeyConfigLocalModel>
              >
              configResult =
                  _ed25519ConfigDataSource.getByKeyId(keyId: jwkId).run();

              if (configResult.isLeft()) {
                return left(configResult.getLeft().toNullable()!);
              }

              if (configResult.getRight().toNullable()!.isNone()) {
                final Either<ExceptionWithStackTrace, Unit> deleteResult =
                    _jwkDataSource.deleteByKeyId(keyId: jwkId).run();

                if (deleteResult.isLeft()) {
                  return deleteResult;
                }
              }
            }

            return right(unit);
          });

          return runInsideTransaction(TxMode.write, operation).run(_store);
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
  getByLabel({required String label}) => TaskEither<
    ExceptionWithStackTrace,
    Option<AptosAccountWithMetadata>
  >(() async {
    try {
      final IOEither<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
      operation = IOEither<
        ExceptionWithStackTrace,
        Option<AptosAccountWithMetadata>
      >(() {
        final Either<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
        metadataResult = _metadataDataSource.getByLabel(label: label).run();

        if (metadataResult.isLeft()) {
          return left(metadataResult.getLeft().toNullable()!);
        }

        final Option<AccountMetadataLocalModel> metadataOption =
            metadataResult.getRight().toNullable()!;

        if (metadataOption.isNone()) {
          return right(none());
        }

        final AccountMetadataLocalModel metadata = metadataOption.toNullable()!;

        final Either<ExceptionWithStackTrace, Option<AptosAccountLocalModel>>
        accountResult =
            _accountDataSource
                .getByAddress(accountAddress: metadata.accountAddress)
                .run();

        if (accountResult.isLeft()) {
          return left(accountResult.getLeft().toNullable()!);
        }

        final Option<AptosAccountLocalModel> accountOption =
            accountResult.getRight().toNullable()!;

        if (accountOption.isNone()) {
          return right(none());
        }

        final AptosAccountLocalModel account = accountOption.toNullable()!;

        return right(
          Option<AptosAccountWithMetadata>.of(
            _combineToAccountWithMetadata(account: account, metadata: metadata),
          ),
        );
      });

      return runInsideTransaction(TxMode.read, operation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  IOEither<ExceptionWithStackTrace, bool> hasLabel({required String label}) =>
      IOEither<ExceptionWithStackTrace, bool>(() {
        try {
          return _metadataDataSource
              .getByLabel(label: label)
              .map((Option<AccountMetadataLocalModel> resp) => resp.isSome())
              .run();
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> updateIconUri({
    required AccountAddress accountAddress,
    required Uri newIconUri,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
      final IOEither<ExceptionWithStackTrace, Unit>
      updateOperation = IOEither<ExceptionWithStackTrace, Unit>(() {
        final Either<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
        metadataResult =
            _metadataDataSource
                .getByAddress(accountAddress: accountAddress.toBytes())
                .run();

        if (metadataResult.isLeft()) {
          return left(metadataResult.getLeft().toNullable()!);
        }

        final Option<AccountMetadataLocalModel> metadataOption =
            metadataResult.getRight().toNullable()!;
        if (metadataOption.isNone()) {
          throw StateError('Account not found');
        }

        final AccountMetadataLocalModel metadata = metadataOption.toNullable()!;

        return _metadataDataSource
            .update(
              localId: metadata.localId,
              iconUri: Option<String>.of(newIconUri.toString()),
            )
            .run();
      });

      return runInsideTransaction(TxMode.write, updateOperation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> updateLabel({
    required AccountAddress accountAddress,
    required String newLabel,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
      final IOEither<ExceptionWithStackTrace, Unit>
      updateOperation = IOEither<ExceptionWithStackTrace, Unit>(() {
        final Either<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
        metadataResult =
            _metadataDataSource
                .getByAddress(accountAddress: accountAddress.toBytes())
                .run();

        if (metadataResult.isLeft()) {
          return left(metadataResult.getLeft().toNullable()!);
        }

        final Option<AccountMetadataLocalModel> metadataOption =
            metadataResult.getRight().toNullable()!;
        if (metadataOption.isNone()) {
          throw StateError('Account not found');
        }

        final AccountMetadataLocalModel metadata = metadataOption.toNullable()!;

        return _metadataDataSource
            .update(
              localId: metadata.localId,
              label: Option<String>.of(newLabel),
            )
            .run();
      });

      return runInsideTransaction(TxMode.write, updateOperation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> updateBackgroundColor({
    required AccountAddress accountAddress,
    required Color newBackgroundColor,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
      final IOEither<ExceptionWithStackTrace, Unit>
      updateOperation = IOEither<ExceptionWithStackTrace, Unit>(() {
        final Either<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
        metadataResult =
            _metadataDataSource
                .getByAddress(accountAddress: accountAddress.toBytes())
                .run();

        if (metadataResult.isLeft()) {
          return left(metadataResult.getLeft().toNullable()!);
        }

        final Option<AccountMetadataLocalModel> metadataOption =
            metadataResult.getRight().toNullable()!;
        if (metadataOption.isNone()) {
          throw StateError('Account not found');
        }

        final AccountMetadataLocalModel metadata = metadataOption.toNullable()!;

        return _metadataDataSource
            .update(
              localId: metadata.localId,
              backgroundColor: Option<int>.of(colorToInt(newBackgroundColor)),
            )
            .run();
      });

      return runInsideTransaction(TxMode.write, updateOperation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });
}
