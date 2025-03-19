import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../error/exception_with_stack_trace.dart';
import '../../logging/app_logger.dart';
import '../../services/shared_preference_service.dart';
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

  Option<_ThemeObserver> _observer = const Option<_ThemeObserver>.none();

  @override
  Future<ThemeMode> build() async {
    final WidgetsBinding binding = WidgetsBinding.instance;
    final _ThemeObserver observer = _ThemeObserver(_refreshIfUsingSystemTheme);
    _observer = Option<_ThemeObserver>.of(observer);
    _observer.map(binding.addObserver);

    ref.onDispose(() {
      _observer.map(binding.removeObserver);
      _observer = const Option<_ThemeObserver>.none();
    });

    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;

    final Either<ExceptionWithStackTrace, Option<String>> eitherGetString =
        await sharedPreferences.getString(key: _themeKey).run();
    return eitherGetString.fold(
      (ExceptionWithStackTrace e) {
        AppLogger.error(e.exception, stackTrace: e.stackTrace);
        return ThemeMode.system;
      },
      (Option<String> themeString) =>
          themeString.match(() => ThemeMode.system, _getThemeModeFromString),
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;
    state = const AsyncValue<ThemeMode>.loading();
    final Either<ExceptionWithStackTrace, Unit> eitherSet =
        await sharedPreferences
            .set<String>(key: _themeKey, value: mode.toString())
            .run();
    eitherSet.fold(
      (ExceptionWithStackTrace e) =>
          state = AsyncValue<ThemeMode>.error(e.exception, e.stackTrace),
      (_) => state = AsyncValue<ThemeMode>.data(mode),
    );
  }

  Future<void> useSystemTheme() async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;

    state = const AsyncValue<ThemeMode>.loading();

    final Either<ExceptionWithStackTrace, Unit> eitherRemove =
        await sharedPreferences.remove(key: _themeKey).run();

    eitherRemove.fold(
      (ExceptionWithStackTrace e) =>
          state = AsyncValue<ThemeMode>.error(e.exception, e.stackTrace),
      (_) => state = const AsyncValue<ThemeMode>.data(ThemeMode.system),
    );
  }

  Future<void> _refreshIfUsingSystemTheme() async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;

    final Either<ExceptionWithStackTrace, bool> eitherContainsKey =
        await sharedPreferences.containsKey(key: _themeKey).run();

    final bool hasUserPreference = eitherContainsKey.fold((
      ExceptionWithStackTrace e,
    ) {
      AppLogger.error(e.exception, stackTrace: e.stackTrace);
      return false;
    }, (bool existence) => existence);
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
  final ThemeMode themeMode = ref.watch(themeNotifierProvider).requireValue;

  switch (themeMode) {
    case ThemeMode.light:
      return Brightness.light;
    case ThemeMode.dark:
      return Brightness.dark;
    case ThemeMode.system:
      return ui.PlatformDispatcher.instance.platformBrightness;
  }
}
