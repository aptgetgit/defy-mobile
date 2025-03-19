// ignore_for_file: only_throw_errors

import 'package:fpdart/fpdart.dart';
import '../../../../../core/database/objectbox/objectbox.g.dart';

import '../../core/error/exception_with_stack_trace.dart';
import '../../core/logging/app_logger.dart';

ReaderTaskEither<Store, ExceptionWithStackTrace, A> runInsideTransaction<A>(
  TxMode mode,
  IOEither<ExceptionWithStackTrace, A> computation,
) => ReaderTaskEither<Store, ExceptionWithStackTrace, A>((Store store) async {
  try {
    return store.runInTransaction(
      mode,
      () => computation.run().fold(
        (ExceptionWithStackTrace e) => throw e,
        right,
      ),
    );
  } on ExceptionWithStackTrace catch (e) {
    return left(e);
  } on Exception catch (e, stackTrace) {
    AppLogger.error(
      'Failed to run transaction',
      error: e,
      stackTrace: stackTrace,
    );
    return left(ExceptionWithStackTrace(e, stackTrace));
  }
});
