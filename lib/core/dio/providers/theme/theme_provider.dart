import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/shared_preference_service.dart';
import '../services/shared_preference_service_provider.dart';

part 'generated/theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  static const String _themeKey = 'app:setting:theme';

  @override
  ThemeMode build() {
    final SharedPreferencesService sharedPreferences =
        ref.watch(sharedPreferencesServiceProvider);
    final String? savedTheme = sharedPreferences.getString(_themeKey);
    return _getThemeModeFromString(savedTheme);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider);
    await sharedPreferences.set<String>(_themeKey, mode.toString());
    state = mode;
  }

  ThemeMode _getThemeModeFromString(String? themeString) {
    switch (themeString) {
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
