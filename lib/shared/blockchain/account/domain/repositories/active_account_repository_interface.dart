import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';

abstract class IActiveAccountRepository {
  TaskEither<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
  getActiveAccount();

  TaskEither<ExceptionWithStackTrace, Unit> setActiveAccount({
    required AccountAddress accountAddress,
  });

  TaskEither<ExceptionWithStackTrace, Unit> clearActiveAccount();

  TaskEither<ExceptionWithStackTrace, bool> hasActiveAccount();
}
