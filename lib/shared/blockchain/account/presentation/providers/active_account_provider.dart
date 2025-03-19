import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
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
  Future<Option<AptosAccountWithMetadata>> build() async {
    final GetActiveAccountUseCase getActiveAccount = ref.read(
      getActiveAccountUseCaseProvider,
    );
    final ListAptosAccountsUseCase listAccounts = ref.read(
      listAptosAccountsUseCaseProvider,
    );
    final SetActiveAccountUseCase setActiveAccount = ref.read(
      setActiveAccountUseCaseProvider,
    );

    final Either<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
    activeAccount = await getActiveAccount.call();

    if (activeAccount.isLeft()) {
      final ExceptionWithStackTrace left =
          activeAccount.getLeft().toNullable()!;
      return Future<Option<AptosAccountWithMetadata>>.error(
        left.exception,
        left.stackTrace,
      );
    }

    if (activeAccount.isRight() && activeAccount.getRight().isSome()) {
      return activeAccount.getRight().toNullable()!;
    }

    final Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
    accounts = await listAccounts.call();

    if (accounts.isLeft()) {
      final ExceptionWithStackTrace left = accounts.getLeft().toNullable()!;
      return Future<Option<AptosAccountWithMetadata>>.error(
        left.exception,
        left.stackTrace,
      );
    }

    final Set<AptosAccountWithMetadata> accountsSet =
        accounts.getRight().toNullable()!;

    if (accountsSet.isNotEmpty) {
      await setActiveAccount
          .call(accountAddress: accountsSet.first.accountAddress);
      return Option<AptosAccountWithMetadata>.of(accountsSet.first);
    }

    return const Option<AptosAccountWithMetadata>.none();
  }

  Future<void> setActiveAccount(AccountAddress accountAddress) async {
    final SetActiveAccountUseCase setActiveAccount = ref.read(
      setActiveAccountUseCaseProvider,
    );
    state = const AsyncValue<Option<AptosAccountWithMetadata>>.loading();
    final Either<ExceptionWithStackTrace, Unit> result =
        await setActiveAccount.call(accountAddress: accountAddress);

    state = result.fold(
      (ExceptionWithStackTrace left) =>
          AsyncValue<Option<AptosAccountWithMetadata>>.error(
            left.exception,
            left.stackTrace,
          ),
      (_) => const AsyncValue<Option<AptosAccountWithMetadata>>.data(
        Option<AptosAccountWithMetadata>.none(),
      ),
    );
  }

  Future<void> clearActiveAccount() async {
    final ClearActiveAccountUseCase clearActiveAccount = ref.read(
      clearActiveAccountUseCaseProvider,
    );
    state = const AsyncValue<Option<AptosAccountWithMetadata>>.loading();
    final Either<ExceptionWithStackTrace, Unit> result =
        await clearActiveAccount.call();

    state = result.fold(
      (ExceptionWithStackTrace left) =>
          AsyncValue<Option<AptosAccountWithMetadata>>.error(
            left.exception,
            left.stackTrace,
          ),
      (_) => const AsyncValue<Option<AptosAccountWithMetadata>>.data(
        Option<AptosAccountWithMetadata>.none(),
      ),
    );
  }
}

// @riverpod
// Option<AptosAccountWithMetadata> currentAccount(Ref ref) {
//   final ActiveAccount activeAccount = ref.read(activeAccountProvider);
//   return activeAccount.state.maybeWhen(
//     data: (Option<AptosAccountWithMetadata> account) => account,
//     orElse: () => const Option<AptosAccountWithMetadata>.none(),
//   );
// }
