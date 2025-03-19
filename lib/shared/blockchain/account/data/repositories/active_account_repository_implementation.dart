import 'dart:ui';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/comparison_utils.dart';
import '../../../../utils/db_utils.dart';
import '../../domain/entities/account_address.dart';
import '../../domain/entities/aptos_account_with_metadata.dart';
import '../../domain/entities/authentication_key.dart';
import '../../domain/entities/authentication_key_scheme.dart';
import '../../domain/repositories/active_account_repository_interface.dart';
import '../models/local/account_metadata_local_model.dart';
import '../models/local/aptos_account_local_model.dart';
import '../sources/local/account_metadata_local_data_source.dart';
import '../sources/local/active_account_local_data_source.dart';
import '../sources/local/aptos_account_local_data_source.dart';

class ActiveAccountRepository implements IActiveAccountRepository {
  const ActiveAccountRepository({
    required Store store,
    required ActiveAccountLocalDataSource activeAccountDataSource,
    required AptosAccountLocalDataSource accountDataSource,
    required AccountMetadataLocalDataSource accountMetadataDataSource,
  }) : _store = store,
       _activeAccountDataSource = activeAccountDataSource,
       _accountDataSource = accountDataSource,
       _accountMetadataDataSource = accountMetadataDataSource;

  final Store _store;
  final ActiveAccountLocalDataSource _activeAccountDataSource;
  final AptosAccountLocalDataSource _accountDataSource;
  final AccountMetadataLocalDataSource _accountMetadataDataSource;

  @override
  TaskEither<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
  getActiveAccount() => TaskEither<
    ExceptionWithStackTrace,
    Option<AptosAccountWithMetadata>
  >(() async {
    try {
      final Either<ExceptionWithStackTrace, Option<String>> addressResult =
          await _activeAccountDataSource.getActiveAccountAddress().run();

      if (addressResult.isLeft()) {
        return left(addressResult.getLeft().toNullable()!);
      }

      final Option<String> addressOption =
          addressResult.getRight().toNullable()!;

      if (addressOption.isNone()) {
        return right(none());
      }

      final String savedAddress = addressOption.toNullable()!;
      final AccountAddress accountAddress = AccountAddress.fromHex(
        accountAddress: savedAddress,
      );

      final IOEither<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
      dbOperation = IOEither<
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

        final AptosAccountLocalModel aptosAccountLocalModel =
            accountOption.toNullable()!;

        final Either<ExceptionWithStackTrace, Option<AccountMetadataLocalModel>>
        metadataResult =
            _accountMetadataDataSource
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

        final AccountMetadataLocalModel aptosAccountMetadata =
            metadataOption.toNullable()!;

        if (!areByteListsEqual(
              accountAddress.toBytes(),
              aptosAccountLocalModel.accountAddress,
            ) ||
            !areByteListsEqual(
              aptosAccountMetadata.accountAddress,
              accountAddress.toBytes(),
            )) {
          throw StateError('Account address mismatch');
        }

        final AuthenticationKey authenticationKey = AuthenticationKey(
          bytes: aptosAccountLocalModel.authenticationKey,
        );

        final AuthenticationKeyScheme authenticationKeyScheme =
            AuthenticationKeyScheme.fromByte(
              byte: aptosAccountLocalModel.authenticationKeyScheme,
            );

        final Uri iconUri = Uri.parse(aptosAccountMetadata.iconUri);

        return right(
          Option<AptosAccountWithMetadata>.of(
            AptosAccountWithMetadata(
              accountAddress: accountAddress,
              authenticationKey: authenticationKey,
              authenticationKeyScheme: authenticationKeyScheme,
              iconUri: iconUri,
              label: aptosAccountMetadata.label,
              backgroundColor: Color(aptosAccountMetadata.backgroundColor),
            ),
          ),
        );
      });

      return runInsideTransaction(TxMode.read, dbOperation).run(_store);
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> setActiveAccount({
    required AccountAddress accountAddress,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
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
        throw ArgumentError('Account does not exist: $accountAddress');
      }

      return await _activeAccountDataSource
          .setActiveAccountAddress(accountAddress: accountAddress.toHex())
          .run();
    } on Exception catch (e, stackTrace) {
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> clearActiveAccount() =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          return await _activeAccountDataSource
              .removeActiveAccountAddress()
              .run();
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, bool> hasActiveAccount() =>
      TaskEither<ExceptionWithStackTrace, bool>(() async {
        try {
          final Either<ExceptionWithStackTrace, Option<String>> addressResult =
              await _activeAccountDataSource.getActiveAccountAddress().run();
          return addressResult.fold(
            left,
            (Option<String> addressOption) => right(addressOption.isSome()),
          );
        } on Exception catch (e, stackTrace) {
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });
}
