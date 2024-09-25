import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'shared_preferences_provider.dart';

part 'generated/theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  static const _themeKey = 'appTheme';

  @override
  ThemeMode build() {
    final sharedPreferences = ref.watch(sharedPreferencesServiceProvider);
    final savedTheme = sharedPreferences.getString(_themeKey);
    return _getThemeModeFromString(savedTheme);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final sharedPreferences = ref.read(sharedPreferencesServiceProvider);
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