import 'package:defy/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/locale_provider.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() => const Locale('en');

  void setLocale(Locale locale) {
    state = locale;
  }
}

@riverpod
AppLocalizations l10n(L10nRef ref) {
  final locale = ref.watch(localeNotifierProvider);
  return lookupAppLocalizations(locale);
}
