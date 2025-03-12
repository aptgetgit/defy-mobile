import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/theme/theme.dart';
import '../core/di/providers/locale/locale_provider.dart';
import '../core/di/providers/theme/theme_provider.dart';
import '../features/bootstrap/presentation/widgets/app_bootstrap_widget.dart';
import '../l10n/generated/app_localizations.dart';
import '../shared/connectivity/presentation/widgets/connectivity_overlay.dart';
import 'routes/router.dart';


class DefyApp extends ConsumerWidget {
  const DefyApp({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(routerProvider);
    
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      title: 'Defy',
      builder: (BuildContext context, Widget? child) => AppBootstrapWidget(
          onLoaded: (_) {
            final ThemeMode themeMode = ref.watch(themeNotifierProvider).requireValue;
            final Locale locale = ref.watch(localeNotifierProvider).requireValue;
            
            return MaterialApp.router(
              routerConfig: router,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: locale,
              title: 'Defy',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeMode,
              builder: (BuildContext context, Widget? routerChild) {
                if (routerChild == null) {
                  return const SizedBox.shrink();
                }
                return Overlay(
                  initialEntries: <OverlayEntry>[
                    OverlayEntry(
                      builder: (BuildContext context) =>
                          ConnectivityOverlay(child: routerChild),
                    ),
                  ],
                );
              },
            );
          },
        ),
    );
  }
}

// class DefyApp extends ConsumerWidget {
//   const DefyApp({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final ThemeMode themeMode = ref.watch(themeNotifierProvider);
//     final GoRouter router = ref.watch(routerProvider);
//     final Locale locale = ref.watch(localeNotifierProvider);

//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
//       locale: locale,
//       title: 'Defy',
//       theme: AppTheme.lightTheme,
//       darkTheme: AppTheme.darkTheme,
//       themeMode: themeMode,
//       routerConfig: router,
//       builder: (BuildContext context, Widget? child) {
//         if (child == null) {
//           return const SizedBox.shrink();
//         }
//         return Overlay(
//           initialEntries: <OverlayEntry>[
//             OverlayEntry(
//               builder: (BuildContext context) =>
//                   ConnectivityOverlay(child: child),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
