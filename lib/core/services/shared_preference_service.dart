import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesService(this._sharedPreferences);

  T? get<T>(String key) => _sharedPreferences.get(key) as T?;

  Future<bool> set<T>(String key, T value) {
    if (value is String) {
      return _sharedPreferences.setString(key, value);
    } else if (value is int) {
      return _sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      return _sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      return _sharedPreferences.setStringList(key, value);
    } else {
      throw ArgumentError('Unsupported type: ${T.toString()}');
    }
  }

  Future<bool> remove(String key) => _sharedPreferences.remove(key);
  bool containsKey(String key) => _sharedPreferences.containsKey(key);
  Future<bool> clear() => _sharedPreferences.clear();
  Set<String> getKeys() => _sharedPreferences.getKeys();

  // Convenience methods
  String? getString(String key) => get<String>(key);
  int? getInt(String key) => get<int>(key);
  bool? getBool(String key) => get<bool>(key);
  double? getDouble(String key) => get<double>(key);
  List<String>? getStringList(String key) => get<List<String>>(key);
}
