// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../config/theme/theme.dart';
// import '../core/di/providers/locale/locale_provider.dart';
// import '../core/di/providers/theme/theme_provider.dart';
// import '../l10n/generated/app_localizations.dart';
// import 'routes/router.dart';

// class DefyApp extends ConsumerWidget {
//   const DefyApp({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final ThemeMode themeMode = ref.watch(themeNotifierProvider);
//     final GoRouter router = ref.watch(routerProvider);
//     final Locale locale = ref.watch(localeNotifierProvider);

//     return ScreenUtilInit(
//       designSize: const Size(393, 853), 
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (BuildContext context, Widget? child) => MaterialApp.router(
//           debugShowCheckedModeBanner: false,
//           localizationsDelegates: AppLocalizations.localizationsDelegates,
//           supportedLocales: AppLocalizations.supportedLocales,
//           locale: locale,
//           title: 'Defy',
//           theme: AppTheme.lightTheme,
//           darkTheme: AppTheme.darkTheme,
//           themeMode: themeMode,
//           routerConfig: router,
//           builder: (BuildContext context, Widget? child) => child!,
//         ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/theme/theme.dart';
import '../core/di/providers/locale/locale_provider.dart';
import '../core/di/providers/theme/theme_provider.dart';
import '../l10n/generated/app_localizations.dart';
import 'routes/router.dart';

class DefyApp extends ConsumerWidget {
  const DefyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeNotifierProvider);
    final GoRouter router = ref.watch(routerProvider);
    final Locale locale = ref.watch(localeNotifierProvider);
    
    // Set the system UI to be edge-to-edge
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    ));

    return ScreenUtilInit(
      designSize: const Size(393, 853), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale,
          title: 'Defy',
          theme: AppTheme.lightTheme.copyWith(
            scaffoldBackgroundColor: Colors.white, // Ensure full white background
          ),
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          routerConfig: router,
          builder: (BuildContext context, Widget? child) => child!,
        ),
    );
  }
}