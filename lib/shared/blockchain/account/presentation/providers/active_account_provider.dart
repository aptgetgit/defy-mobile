import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/account_address.dart';
import '../../domain/entities/aptos_account_with_metadata.dart';
import '../../domain/usecases/clear_active_account_usecase.dart';
import '../../domain/usecases/get_active_account_usecase.dart';
import '../../domain/usecases/list_aptos_account_usecase.dart';
import '../../domain/usecases/set_active_account_usecase.dart';
import 'usecase_provider.dart';

part 'generated/active_account_provider.g.dart';

@riverpod
class ActiveAccount extends _$ActiveAccount {
  @override
  Future<AptosAccountWithMetadata?> build() async {
    final GetActiveAccountUseCase getActiveAccount =
        ref.read(getActiveAccountUseCaseProvider);
    final ListAptosAccountsUseCase listAccounts =
        ref.read(listAptosAccountsUseCaseProvider);
    final SetActiveAccountUseCase setActiveAccount =
        ref.read(setActiveAccountUseCaseProvider);


    final AptosAccountWithMetadata? activeAccount = getActiveAccount.call();
    if (activeAccount != null) {
      return activeAccount;
    }

    final List<AptosAccountWithMetadata> accounts = await listAccounts.call();
    if (accounts.isNotEmpty) {
      await setActiveAccount.call(
        accountAddress: accounts.first.accountAddress,
      );
      return accounts.first;
    }

    return null;
  }

  Future<void> setActiveAccount(AccountAddress accountAddress) async {
    final SetActiveAccountUseCase setActiveAccount =
        ref.read(setActiveAccountUseCaseProvider);
    await setActiveAccount.call(accountAddress: accountAddress);
    ref.invalidateSelf();
  }

  Future<void> clearActiveAccount() async {
    final ClearActiveAccountUseCase clearActiveAccount =
        ref.read(clearActiveAccountUseCaseProvider);
    await clearActiveAccount.call();
    ref.invalidateSelf();
  }
}

@riverpod
AptosAccountWithMetadata? currentAccount(Ref ref) =>
    ref.watch(activeAccountProvider).valueOrNull;
