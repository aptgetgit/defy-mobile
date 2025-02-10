import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/theme/theme.dart';
import '../core/dio/providers/locale/locale_provider.dart';
import '../core/dio/providers/theme/theme_provider.dart';
import '../l10n/generated/app_localizations.dart';
import '../shared/network/presentation/widgets/network_status_overlay.dart';
import 'routes/router.dart';

class DefyApp extends ConsumerWidget {
  const DefyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeNotifierProvider);
    final GoRouter router = ref.watch(routerProvider);
    final Locale locale = ref.watch(localeNotifierProvider);

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
      builder: (BuildContext context, Widget? child) {
        if (child == null) {
          return const SizedBox.shrink();
        }
        return NetworkStatusOverlay(child: child);
      },
    );
  }
}
