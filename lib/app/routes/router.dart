import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/dive_in/presentation/screens/dive_in_page.dart';
import '../../features/browser/presentation/screens/browser_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/import_wallet/presentation/screens/import_wallet_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/waitlist/presentation/screens/waitlist_screen.dart';
import '../../features/wallet-creation/presentation/screens/wallet_creation_screen.dart';
import '../../features/wallet-creation/presentation/screens/wallet_creation_wallet_background_screen.dart';
import '../../features/wallet-creation/presentation/screens/wallet_creation_wallet_name_screen.dart';

part 'browser_route.dart';
part 'generated/router.freezed.dart';
part 'generated/router.g.dart';
part 'home_route.dart';
part 'onboarding_route.dart';
part 'splash_route.dart';
part 'wallet_creation_route.dart';
part 'waitlist_route.dart';

@freezed
class AppRoute with _$AppRoute {
  const factory AppRoute.public({
    required Widget Function(BuildContext, GoRouterState) builder,
    String? redirectIfAuthenticated,
  }) = PublicRoute;
  const factory AppRoute.protected({
    required Widget Function(BuildContext, GoRouterState) builder,
  }) = ProtectedRoute;
}

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) => GoRouter(
      initialLocation: const SplashRoute().location,
      routes: $appRoutes,
      errorBuilder: (BuildContext context, GoRouterState state) =>
          const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    );
