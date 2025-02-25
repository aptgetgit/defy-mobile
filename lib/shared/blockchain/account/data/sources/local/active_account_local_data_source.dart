import '../../../../../../core/services/shared_preference_service.dart';

class ActiveAccountLocalDataSource {
  const ActiveAccountLocalDataSource({
    required SharedPreferencesService sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferencesService _sharedPreferences;
  static const String _activeAccountKey = 'app:state:active_account';

  String? getActiveAccountAddress() =>
      _sharedPreferences.getString(_activeAccountKey);

  Future<void> setActiveAccountAddress({required String accountAddress}) async {
    await _sharedPreferences.set(_activeAccountKey, accountAddress);
  }

  Future<void> removeActiveAccountAddress() async {
    await _sharedPreferences.remove(_activeAccountKey);
  }
}
