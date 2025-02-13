import '../../../../../core/services/shared_preference_service.dart';

class ActiveNetworkLocalDataSource {
  const ActiveNetworkLocalDataSource({
    required SharedPreferencesService sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferencesService _sharedPreferences;
  static const String _networkKey = 'app:state:network';

  String? getActiveNetworkId() => 
      _sharedPreferences.getString(_networkKey);

  Future<void> setActiveNetworkId({
    required String networkId,
  }) async {
    await _sharedPreferences.set(_networkKey, networkId);
  }

  Future<void> removeActiveNetworkId() async {
    await _sharedPreferences.remove(_networkKey);
  }

  Future<bool> hasActiveNetworkId() async {
    final String? networkId = _sharedPreferences.getString(_networkKey);
    return networkId != null;
  }
}
