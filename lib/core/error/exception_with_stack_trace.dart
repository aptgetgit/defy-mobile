/// A class that pairs an exception with its original stack trace.
///
/// This allows propagating both the exception and its stack trace
/// through functional error handling pipelines (like Either/TaskEither),
/// preserving the original error context for proper logging.
class ExceptionWithStackTrace {
  /// Creates a new [ExceptionWithStackTrace] instance.
  ///
  /// @param exception The exception that occurred
  /// @param stackTrace The stack trace where the exception was caught
  const ExceptionWithStackTrace(this.exception, this.stackTrace);

  /// The exception that occurred
  final Exception exception;

  /// The stack trace at the point where the exception was caught
  final StackTrace stackTrace;

  @override
  String toString() => 'Exception: $exception';

  /// Creates a string representation including both exception and stack trace.
  ///
  /// Useful for comprehensive logging or debugging.
  String toStringWithTrace() =>
      'Exception: $exception\nStack trace:\n$stackTrace';
}
