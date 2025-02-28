import 'dart:ui';

import '../../../../../core/logging/app_logger.dart';
import '../../../../utils/comparison_utils.dart';
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
    required ActiveAccountLocalDataSource activeAccountDataSource,
    required AptosAccountLocalDataSource accountDataSource,
    required AccountMetadataLocalDataSource accountMetadataDataSource,
  })  : _activeAccountDataSource = activeAccountDataSource,
        _accountDataSource = accountDataSource,
        _accountMetadataDataSource = accountMetadataDataSource;

  final ActiveAccountLocalDataSource _activeAccountDataSource;
  final AptosAccountLocalDataSource _accountDataSource;
  final AccountMetadataLocalDataSource _accountMetadataDataSource;

  @override
  AptosAccountWithMetadata? getActiveAccount() {
    try {
      final String? savedAddress =
          _activeAccountDataSource.getActiveAccountAddress();
      if (savedAddress == null) {
        return null;
      }

      final AccountAddress accountAddress =
          AccountAddress.fromHex(accountAddress: savedAddress);

      final AptosAccountLocalModel? aptosAccountLocalModel = _accountDataSource
          .getByAddress(accountAddress: accountAddress.toBytes());
      final AccountMetadataLocalModel? aptosAccountMetadata =
          _accountMetadataDataSource.getByAddress(
        accountAddress: accountAddress.toBytes(),
      );

      if (aptosAccountLocalModel == null || aptosAccountMetadata == null) {
        return null;
      }

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

      return AptosAccountWithMetadata(
        accountAddress: accountAddress,
        authenticationKey: authenticationKey,
        authenticationKeyScheme: authenticationKeyScheme,
        iconUri: iconUri,
        label: aptosAccountMetadata.label,
        backgroundColor: Color(aptosAccountMetadata.backgroundColor),
      );
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get active account',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> setActiveAccount({
    required AccountAddress accountAddress,
  }) async {
    try {
      final AptosAccountLocalModel? account = _accountDataSource.getByAddress(
        accountAddress: accountAddress.toBytes(),
      );
      if (account == null) {
        throw ArgumentError('Account does not exist: $accountAddress');
      }

      await _activeAccountDataSource.setActiveAccountAddress(
        accountAddress: accountAddress.toHex(),
      );
    } on ArgumentError {
      rethrow;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to set active account',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> clearActiveAccount() async {
    try {
      await _activeAccountDataSource.removeActiveAccountAddress();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear active account',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  bool hasActiveAccount() {
    try {
      return getActiveAccount() != null;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to check if active account exists',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
