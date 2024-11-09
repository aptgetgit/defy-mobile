import 'package:defy/core/providers/shared_preferences_provider.dart';
import 'package:defy/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/locale_provider.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  static const _localeKey = 'app:setting:locale';
  @override
  Locale build() {
    final sharedPreferences = ref.watch(sharedPreferencesServiceProvider);
    final savedLocale = sharedPreferences.getString(_localeKey);
    return _getLocaleFromString(savedLocale);
  }

  Future<void> setLocale(Locale locale) async {
    final sharedPreferences = ref.read(sharedPreferencesServiceProvider);
    await sharedPreferences.set<String>(_localeKey, locale.languageCode);
    state = locale;
  }

  Locale _getLocaleFromString(String? localeString) {
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
AppLocalizations l10n(L10nRef ref) {
  final locale = ref.watch(localeNotifierProvider);
  return lookupAppLocalizations(locale);
}
