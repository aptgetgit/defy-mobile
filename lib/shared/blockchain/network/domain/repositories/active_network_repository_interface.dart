import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/aptos_network.dart';

abstract class IActiveNetworkRepository {
  TaskEither<ExceptionWithStackTrace, Option<AptosNetwork>> getActiveNetwork();

  TaskEither<ExceptionWithStackTrace, Unit> setActiveNetwork({
    required AptosNetwork network,
  });

  TaskEither<ExceptionWithStackTrace, Unit> clearActiveNetwork();

  TaskEither<ExceptionWithStackTrace, bool> hasActiveNetwork();
}
