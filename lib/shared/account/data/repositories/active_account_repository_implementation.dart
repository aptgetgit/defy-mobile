import '../../data/sources/local/aptos_account_local_data_source.dart';
import '../../domain/entities/account_address.dart';
import '../../domain/entities/aptos_account_with_metadata.dart';
import '../../domain/entities/authentication_key.dart';
import '../../domain/entities/authentication_key_scheme.dart';
import '../../domain/repositories/active_account_repository_interface.dart';
import '../models/local/account_metadata_local_model.dart';
import '../models/local/aptos_account_local_model.dart';
import '../sources/local/account_metadata_local_data_source.dart';
import '../sources/local/active_account_local_data_source.dart';

class ActiveAccountRepository implements IActiveAccountRepository {
  const ActiveAccountRepository({
    required ActiveAccountLocalDataSource activeAccountDataSource,
    required AptosAccountDataSource accountDataSource,
    required AccountMetadataDataSource accountMetadataDataSource,
  })  : _activeAccountDataSource = activeAccountDataSource,
        _accountDataSource = accountDataSource,
        _accountMetadataDataSource = accountMetadataDataSource;

  final ActiveAccountLocalDataSource _activeAccountDataSource;
  final AptosAccountDataSource _accountDataSource;
  final AccountMetadataDataSource _accountMetadataDataSource;

  @override
  AptosAccountWithMetadata? getActiveAccount() {
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

    if (aptosAccountMetadata.accountAddress !=
            aptosAccountLocalModel.accountAddress ||
        aptosAccountMetadata.accountAddress != accountAddress.toBytes()) {
      throw StateError('Account address mismatch');
    }

    final AuthenticationKey authenticationKey = AuthenticationKey(
      bytes: aptosAccountLocalModel.authenticationKey,
    );

    final AuthenticationKeyScheme authenticationKeyScheme =
        AuthenticationKeyScheme.fromByte(
      aptosAccountLocalModel.authenticationKeyScheme,
    );

    final Uri iconUri = Uri.parse(aptosAccountMetadata.iconUri);

    return AptosAccountWithMetadata(
      accountAddress: accountAddress,
      authenticationKey: authenticationKey,
      authenticationKeyScheme: authenticationKeyScheme,
      iconUri: iconUri,
      label: aptosAccountMetadata.label,
    );
  }

  @override
  Future<void> setActiveAccount({
    required AccountAddress accountAddress,
  }) async {
    final AptosAccountLocalModel? account = _accountDataSource.getByAddress(
      accountAddress: accountAddress.toBytes(),
    );
    if (account == null) {
      throw ArgumentError('Account does not exist: $accountAddress');
    }

    await _activeAccountDataSource
        .setActiveAccountAddress(accountAddress.toString());
  }

  @override
  Future<void> clearActiveAccount() async {
    await _activeAccountDataSource.removeActiveAccountAddress();
  }

  @override
  Future<bool> hasActiveAccount() async {
    final AptosAccountWithMetadata? activeAccount = getActiveAccount();
    return activeAccount != null;
  }
}
