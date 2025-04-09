import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/error/exception_with_stack_trace.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';

final StateProvider<bool> showDeleteConfirmationProvider = StateProvider<bool>((Ref<bool> ref) => false);

final StateProvider<bool> showDialogAndButtonProvider = StateProvider<bool>((Ref<bool> ref) => false);

final StateProvider<bool> isCardRemovingProvider = StateProvider<bool>((Ref<bool> ref) => false);

final StateProvider<bool> isRemovingProvider = StateProvider<bool>((Ref<bool> ref) => false);

final StateProvider<double> cardRotationProvider = StateProvider<double>((Ref<double> ref) => 0.0);



final FutureProviderFamily<AptosAccountWithMetadata?, AptosAccountWithMetadata> accountFutureProvider = FutureProvider.family<AptosAccountWithMetadata?, AptosAccountWithMetadata>((
  Ref ref,
  AptosAccountWithMetadata account,
) async {
  final Either<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>> result = await ref.watch(getAptosAccountUseCaseProvider).call(accountAddress: account.accountAddress);
  return result.fold(
    (ExceptionWithStackTrace error) {
      AppLogger.error('Error fetching account: $error');
      return null;
    },
    (Option<AptosAccountWithMetadata> option) => option.toNullable(),
  );
});
