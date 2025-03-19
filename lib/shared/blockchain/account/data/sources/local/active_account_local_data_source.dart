import 'package:fpdart/fpdart.dart';

import '../../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../../../../../core/services/shared_preference_service.dart';

class ActiveAccountLocalDataSource {
  const ActiveAccountLocalDataSource({
    required SharedPreferencesService sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferencesService _sharedPreferences;
  static const String _activeAccountKey = 'app:state:active_account';

  TaskEither<ExceptionWithStackTrace, Option<String>>
  getActiveAccountAddress() =>
      TaskEither<ExceptionWithStackTrace, Option<String>>(() async {
        try {
          return await _sharedPreferences
              .getString(key: _activeAccountKey)
              .run();
        } on Exception catch (e, stackTrace) {
          AppLogger.error(
            'Failed to retrieve active account address',
            error: e,
            stackTrace: stackTrace,
          );
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });
  TaskEither<ExceptionWithStackTrace, Unit> setActiveAccountAddress({
    required String accountAddress,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    if (accountAddress.trim().isEmpty) {
      throw ArgumentError.value(
        accountAddress,
        'accountAddress',
        'Account address cannot be empty',
      );
    }

    try {
      return await _sharedPreferences
          .set(key: _activeAccountKey, value: accountAddress.trim())
          .run();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to set active account address',
        error: e,
        stackTrace: stackTrace,
      );
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });
  TaskEither<ExceptionWithStackTrace, Unit> removeActiveAccountAddress() =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          final Either<ExceptionWithStackTrace, bool> existsResult =
              await _sharedPreferences
                  .containsKey(key: _activeAccountKey)
                  .run();

          return existsResult.fold(left, (bool exists) async {
            if (!exists) {
              throw StateError('No active account address found to remove');
            }

            final Either<ExceptionWithStackTrace, Unit> removeResult =
                await _sharedPreferences.remove(key: _activeAccountKey).run();

            return removeResult;
          });
        } on Exception catch (e, stackTrace) {
          AppLogger.error(
            'Failed to remove active account address',
            error: e,
            stackTrace: stackTrace,
          );
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  TaskEither<ExceptionWithStackTrace, bool> hasActiveAccount() =>
      TaskEither<ExceptionWithStackTrace, bool>(() async {
        try {
          return await _sharedPreferences
              .containsKey(key: _activeAccountKey)
              .run();
        } on Exception catch (e, stackTrace) {
          AppLogger.error(
            'Failed to check if active account exists',
            error: e,
            stackTrace: stackTrace,
          );
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });
}
