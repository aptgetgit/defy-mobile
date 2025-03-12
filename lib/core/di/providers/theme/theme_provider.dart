import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../error/exception_with_stack_trace.dart';
import '../../../services/shared_preference_service.dart';
import '../services/shared_preferences_service_provider.dart';

part 'generated/theme_provider.g.dart';

class _ThemeObserver extends WidgetsBindingObserver {
  _ThemeObserver(this._didChangePlatformBrightness);
  final void Function() _didChangePlatformBrightness;

  @override
  void didChangePlatformBrightness() {
    _didChangePlatformBrightness();
  }
}

@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  static const String _themeKey = 'app:setting:theme';
  _ThemeObserver? _observer;

  @override
  Future<ThemeMode> build() {
    final WidgetsBinding binding = WidgetsBinding.instance;
    _observer = _ThemeObserver(_refreshIfUsingSystemTheme);
    binding.addObserver(_observer!);

    ref.onDispose(() {
      binding.removeObserver(_observer!);
      _observer = null;
    });
    
    final SharedPreferencesService sharedPreferences =
        ref.watch(sharedPreferencesServiceProvider).requireValue;

    return sharedPreferences
        .getString(key: _themeKey)
        .match(
          (ExceptionWithStackTrace e) => ThemeMode.system,
          (Option<String> optionString) => optionString.match(
            () => ThemeMode.system,
            _getThemeModeFromString,
          ),
        )
        .run();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;
    state = const AsyncValue<ThemeMode>.loading();
    final Either<ExceptionWithStackTrace, Unit> result =
        await sharedPreferences
            .set<String>(key: _themeKey, value: mode.toString())
            .run();
    return result.fold(
      (ExceptionWithStackTrace e) => state = AsyncValue<ThemeMode>.error(e.exception, e.stackTrace),
      (_) => state = AsyncValue<ThemeMode>.data(mode),
    );
  }

  Future<void> useSystemTheme() async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;
    
    state = const AsyncValue<ThemeMode>.loading();
    
    final Either<ExceptionWithStackTrace, Unit> result =
        await sharedPreferences.remove(key: _themeKey).run();
    
    result.fold(
      (ExceptionWithStackTrace e) =>
          state = AsyncValue<ThemeMode>.error(e.exception, e.stackTrace),
      (_) => state = const AsyncValue<ThemeMode>.data(ThemeMode.system),
    );
  }

  Future<void> _refreshIfUsingSystemTheme() async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;

    final bool hasUserPreference =
        await sharedPreferences
            .containsKey(key: _themeKey)
            .match(
              (ExceptionWithStackTrace e) => false,
              (bool existence) => existence,
            )
            .run();

    if (!hasUserPreference) {
      state = const AsyncValue<ThemeMode>.data(ThemeMode.system);
    }
  }

  ThemeMode _getThemeModeFromString(String themeString) {
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


@riverpod
Brightness currentBrightness(Ref ref) {
  final AsyncValue<ThemeMode> themeModeState = ref.watch(themeNotifierProvider);
  
  return themeModeState.maybeWhen(
    data: (ThemeMode themeMode) {
      switch (themeMode) {
        case ThemeMode.light:
          return Brightness.light;
        case ThemeMode.dark:
          return Brightness.dark;
        case ThemeMode.system:
          return ui.PlatformDispatcher.instance.platformBrightness;
      }
    },
    orElse: () => ui.PlatformDispatcher.instance.platformBrightness,
  );
}
