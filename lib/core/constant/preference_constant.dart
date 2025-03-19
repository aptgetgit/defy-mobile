class PreferenceConstant {
  PreferenceConstant._();

  // Base app identifier
  static const String appId = 'id.defy';

  // Prefix for shared preferences
  static const String sharedPreferencesPrefix = '$appId.';

  // Allow list for specific preferences if needed
  static const Set<String>? sharedPreferencesAllowList =
      null; // Or specific keys if needed
}
