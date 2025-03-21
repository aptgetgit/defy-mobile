import 'package:fpdart/fpdart.dart';

import '../../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../../../core/logging/app_logger.dart';
import '../../../../../../core/services/shared_preference_service.dart';

class ActiveNetworkLocalDataSource {
  const ActiveNetworkLocalDataSource({
    required SharedPreferencesService sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferencesService _sharedPreferences;
  static const String _activeNetworkKey = 'app:state:active_network';

  TaskEither<ExceptionWithStackTrace, Option<String>> getActiveNetwork() =>
      TaskEither<ExceptionWithStackTrace, Option<String>>(() async {
        try {
          return await _sharedPreferences
              .getString(key: _activeNetworkKey)
              .run();
        } on Exception catch (e, stackTrace) {
          AppLogger.error(
            'Failed to retrieve active network',
            error: e,
            stackTrace: stackTrace,
          );
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });
  TaskEither<ExceptionWithStackTrace, Unit> setActiveNetwork({
    required String networkId,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    if (networkId.trim().isEmpty) {
      throw ArgumentError.value(
        networkId,
        'network',
        'Network cannot be empty',
      );
    }

    try {
      return await _sharedPreferences
          .set(key: _activeNetworkKey, value: networkId.trim())
          .run();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to set active network',
        error: e,
        stackTrace: stackTrace,
      );
      return left(ExceptionWithStackTrace(e, stackTrace));
    }
  });
  TaskEither<ExceptionWithStackTrace, Unit> removeActiveNetwork() =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          final Either<ExceptionWithStackTrace, bool> existsResult =
              await _sharedPreferences
                  .containsKey(key: _activeNetworkKey)
                  .run();

          return existsResult.fold(left, (bool exists) async {
            if (!exists) {
              throw StateError('No active network found to remove');
            }

            final Either<ExceptionWithStackTrace, Unit> removeResult =
                await _sharedPreferences.remove(key: _activeNetworkKey).run();

            return removeResult;
          });
        } on Exception catch (e, stackTrace) {
          AppLogger.error(
            'Failed to remove active network',
            error: e,
            stackTrace: stackTrace,
          );
          return left(ExceptionWithStackTrace(e, stackTrace));
        }
      });

  TaskEither<ExceptionWithStackTrace, bool> hasActiveNetwork() =>
      TaskEither<ExceptionWithStackTrace, bool>(() async {
        try {
          return await _sharedPreferences
              .containsKey(key: _activeNetworkKey)
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
