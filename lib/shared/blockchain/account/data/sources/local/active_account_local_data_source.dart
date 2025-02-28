import '../../../../../../core/logging/app_logger.dart';
import '../../../../../../core/services/shared_preference_service.dart';

class ActiveAccountLocalDataSource {
  const ActiveAccountLocalDataSource({
    required SharedPreferencesService sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferencesService _sharedPreferences;
  static const String _activeAccountKey = 'app:state:active_account';

  String? getActiveAccountAddress() {
    try {
      return _sharedPreferences.getString(key: _activeAccountKey);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve active account address',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to retrieve active account address: $e');
    }
  }

  Future<void> setActiveAccountAddress({required String accountAddress}) async {
    if (accountAddress.trim().isEmpty) {
      throw ArgumentError.value(
        accountAddress,
        'accountAddress',
        'Account address cannot be empty',
      );
    }

    try {
      await _sharedPreferences.set(
        key: _activeAccountKey,
        value: accountAddress.trim(),
      );
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to set active account address',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to set active account address: $e');
    }
  }

  Future<void> removeActiveAccountAddress() async {
    try {
      final bool exists =
          _sharedPreferences.containsKey(key: _activeAccountKey);

      if (!exists) {
        throw StateError('No active account address found to remove');
      }
      await _sharedPreferences.remove(key: _activeAccountKey);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to remove active account address',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to remove active account address: $e');
    }
  }

  bool hasActiveAccount() {
    try {
      final bool exists =
          _sharedPreferences.containsKey(key: _activeAccountKey);
      return exists;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to check if active account exists',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to check if active account exists: $e');
    }
  }
}
