import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../services/shared_preference_service.dart';
import '../services/shared_preference_service_provider.dart';

part 'generated/locale_provider.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  static const String _localeKey = 'app:setting:locale';
  @override
  Locale build() {
    final SharedPreferencesService sharedPreferences =
        ref.watch(sharedPreferencesServiceProvider);
    final String? savedLocale = sharedPreferences.getString(_localeKey);
    return _getLocaleFromString(savedLocale);
  }

  Future<void> setLocale(Locale locale) async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider);
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
AppLocalizations l10n(Ref ref) {
  final Locale locale = ref.watch(localeNotifierProvider);
  return lookupAppLocalizations(locale);
}
