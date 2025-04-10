// lib/app/app.dart
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/theme/theme.dart';
import '../core/constant/app_constant.dart';
import '../core/logging/app_logger.dart';
import '../core/navigation/routes/router.dart';
import '../core/providers/device/device_info_provider.dart';
import '../core/providers/locale/locale_provider.dart';
import '../core/providers/theme/theme_provider.dart';
import '../features/startup/presentation/widgets/startup_handler_widget.dart';
import '../l10n/generated/app_localizations.dart';
import '../shared/connectivity/presentation/widgets/connectivity_overlay.dart';

class DefyApp extends ConsumerWidget {
  const DefyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => StartupHandlerWidget(
    onStartupComplete: (BuildContext context) {
      final GoRouter router = ref.watch(routerProvider);
      final ThemeMode themeMode = ref.watch(themeNotifierProvider).requireValue;
      final Locale locale = ref.watch(localeNotifierProvider).requireValue;
      final AndroidDeviceInfo androidDeviceInfo =
          ref.watch(androidDeviceInfoProvider).requireValue;
      AppLogger.info('Android Device Info: ${androidDeviceInfo.id}');

      return MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        title: AppConstant.appName,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeMode,
        builder: (BuildContext context, Widget? child) {
          if (child == null) {
            return const SizedBox.shrink();
          }
          return Overlay(
            initialEntries: <OverlayEntry>[
              OverlayEntry(
                builder:
                    (BuildContext context) => ConnectivityOverlay(child: child),
              ),
            ],
          );
        },
      );
    },
  );
}
