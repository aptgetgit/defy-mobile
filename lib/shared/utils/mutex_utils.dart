import 'package:fpdart/fpdart.dart';
import 'package:mutex/mutex.dart';

import '../../core/error/exception_with_stack_trace.dart';
import '../../core/logging/app_logger.dart';

ReaderTaskEither<ReadWriteMutex, ExceptionWithStackTrace, A> _protect<A>(
  TaskEither<ExceptionWithStackTrace, A> computation,
  Future<void> Function(ReadWriteMutex) acquireLock,
  String errorMessage,
) => ReaderTaskEither<ReadWriteMutex, ExceptionWithStackTrace, A>((
  ReadWriteMutex mutex,
) async {
  try {
    await acquireLock(mutex);
    return await computation.run();
  } on Exception catch (e, stackTrace) {
    AppLogger.error(errorMessage, error: e, stackTrace: stackTrace);
    return left(ExceptionWithStackTrace(e, stackTrace));
  } finally {
    mutex.release();
  }
});

ReaderTaskEither<ReadWriteMutex, ExceptionWithStackTrace, A> protectRead<A>(
  TaskEither<ExceptionWithStackTrace, A> computation,
) => _protect(
  computation,
  (ReadWriteMutex mutex) => mutex.acquireRead(),
  'Failed to read',
);

ReaderTaskEither<ReadWriteMutex, ExceptionWithStackTrace, A> protectWrite<A>(
  TaskEither<ExceptionWithStackTrace, A> computation,
) => _protect(
  computation,
  (ReadWriteMutex mutex) => mutex.acquireWrite(),
  'Failed to write',
);
