import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../error/exception_with_stack_trace.dart';
import '../../logging/app_logger.dart';
import '../../services/shared_preference_service.dart';
import '../services/shared_preferences_service_provider.dart';

part 'generated/locale_provider.g.dart';

class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);
  final void Function(Option<List<Locale>> locales) _didChangeLocales;

  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(Option<List<Locale>>.fromNullable(locales));
  }
}

@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  static const String _localeKey = 'app:setting:locale';

  Option<_LocaleObserver> _observer = const Option<_LocaleObserver>.none();

  Locale get _systemLocale => ui.PlatformDispatcher.instance.locale;

  @override
  Future<Locale> build() async {
    final WidgetsBinding binding = WidgetsBinding.instance;
    final _LocaleObserver observer = _LocaleObserver((
      Option<List<Locale>> locales,
    ) {
      _refreshIfUsingSystemLocale();
    });
    _observer = Option<_LocaleObserver>.of(observer);
    _observer.map(binding.addObserver);

    ref.onDispose(() {
      _observer.map(binding.removeObserver);
      _observer = const Option<_LocaleObserver>.none();
    });

    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;

    final Either<ExceptionWithStackTrace, Option<String>> eitherGetString =
        await sharedPreferences.getString(key: _localeKey).run();
    return await eitherGetString.fold(
      (ExceptionWithStackTrace e) {
        AppLogger.error(e.exception, stackTrace: e.stackTrace);
        return _systemLocale;
      },
      (Option<String> localeString) =>
          localeString.fold(() => _systemLocale, _getLocaleFromString),
    );
  }

  Future<void> setLocale(Locale locale) async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;

    state = const AsyncValue<Locale>.loading();

    final Either<ExceptionWithStackTrace, Unit> eitherSet =
        await sharedPreferences
            .set<String>(key: _localeKey, value: locale.languageCode)
            .run();

    eitherSet.fold(
      (ExceptionWithStackTrace e) =>
          state = AsyncValue<Locale>.error(e.exception, e.stackTrace),
      (_) => state = AsyncValue<Locale>.data(locale),
    );
  }

  Future<void> useSystemLocale() async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;

    state = const AsyncValue<Locale>.loading();

    final Either<ExceptionWithStackTrace, Unit> eitherRemove =
        await sharedPreferences.remove(key: _localeKey).run();

    eitherRemove.fold(
      (ExceptionWithStackTrace e) =>
          state = AsyncValue<Locale>.error(e.exception, e.stackTrace),
      (_) => state = AsyncValue<Locale>.data(_systemLocale),
    );
  }

  Future<void> _refreshIfUsingSystemLocale() async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider).requireValue;

    final Either<ExceptionWithStackTrace, bool> eitherContainsKey =
        await sharedPreferences.containsKey(key: _localeKey).run();

    final bool hasUserPreference = eitherContainsKey.fold((ExceptionWithStackTrace e) {
      AppLogger.error(e.exception, stackTrace: e.stackTrace);
      return false;
    }, (bool existence) => existence);

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
  final Locale locale = ref.watch(localeNotifierProvider).requireValue;
  return lookupAppLocalizations(locale);
}
