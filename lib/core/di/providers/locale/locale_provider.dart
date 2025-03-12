import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../error/exception_with_stack_trace.dart';
import '../../../services/shared_preference_service.dart';
import '../services/shared_preferences_service_provider.dart';

part 'generated/locale_provider.g.dart';

class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;

  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}

@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  static const String _localeKey = 'app:setting:locale';
  _LocaleObserver? _observer;

  Locale get _systemLocale => ui.PlatformDispatcher.instance.locale;

  @override
  Future<Locale> build() {
    final WidgetsBinding binding = WidgetsBinding.instance;
    _observer = _LocaleObserver((List<ui.Locale>? locales) {
      _refreshIfUsingSystemLocale();
    });
    binding.addObserver(_observer!);

    ref.onDispose(() {
      binding.removeObserver(_observer!);
      _observer = null;
    });

    final SharedPreferencesService sharedPreferences =
        ref.watch(sharedPreferencesServiceProvider).requireValue;

    return sharedPreferences
        .getString(key: _localeKey)
        .match(
          (ExceptionWithStackTrace e) => _systemLocale,
          (Option<String> optionString) =>
              optionString.match(() => _systemLocale, _getLocaleFromString),
        )
        .run();
  }

  Future<void> setLocale(Locale locale) async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;

    state = const AsyncValue<Locale>.loading();

    final Either<ExceptionWithStackTrace, Unit> result =
        await sharedPreferences
            .set<String>(key: _localeKey, value: locale.languageCode)
            .run();

    result.fold(
      (ExceptionWithStackTrace e) =>
          state = AsyncValue<Locale>.error(e.exception, e.stackTrace),
      (_) => state = AsyncValue<Locale>.data(locale),
    );
  }

  Future<void> useSystemLocale() async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;

    state = const AsyncValue<Locale>.loading();

    final Either<ExceptionWithStackTrace, Unit> result =
        await sharedPreferences.remove(key: _localeKey).run();

    result.fold(
      (ExceptionWithStackTrace e) =>
          state = AsyncValue<Locale>.error(e.exception, e.stackTrace),
      (_) => state = AsyncValue<Locale>.data(_systemLocale),
    );
  }

  Future<void> _refreshIfUsingSystemLocale() async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;

    final bool hasUserPreference =
        await sharedPreferences
            .containsKey(key: _localeKey)
            .match(
              (ExceptionWithStackTrace e) => false,
              (bool existence) => existence,
            )
            .run();

    if (!hasUserPreference) {
      state = AsyncValue<Locale>.data(_systemLocale);
    }
  }

  Locale _getLocaleFromString(String localeString) {
    switch (localeString) {
      case 'en':
        return const Locale('en');
      case 'ja':
        return const Locale('ja');
      default:
        return const Locale('en');
    }
  }
}

@riverpod
AppLocalizations appLocalization(Ref ref) {
  final AsyncValue<ui.Locale> localeState = ref.watch(localeNotifierProvider);

  return localeState.maybeWhen(
    data: lookupAppLocalizations,
    orElse: () => lookupAppLocalizations(ui.PlatformDispatcher.instance.locale),
  );
}
