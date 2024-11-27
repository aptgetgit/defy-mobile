import 'package:defy/config/theme/theme.dart';
import 'package:defy/app/routes/router.dart';
import 'package:defy/core/di/providers/locale/locale_provider.dart';
import 'package:defy/core/di/providers/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:defy/l10n/generated/app_localizations.dart';

class DefyApp extends ConsumerWidget {
  const DefyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final router = ref.watch(routerProvider);
    final locale = ref.watch(localeNotifierProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      title: 'Defy',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
