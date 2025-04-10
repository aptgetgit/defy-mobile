import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/accounts/presentation/screens/choose_wallet_screen.dart';
import '../../../features/accounts/presentation/screens/choose_wallet_user_screen.dart';
import '../../../features/accounts/presentation/screens/welcome_again_screen.dart';
import '../../../features/create_wallet/presentation/screens/create_wallet_select_seed_phrase_screen.dart';
import '../../../features/home/presentation/screens/home_screen.dart';
import '../../../features/import_wallet/presentation/screens/created_wallet_screen.dart';
import '../../../features/import_wallet/presentation/screens/import_wallet_screen_primary.dart';
import '../../../features/waitlist/presentation/screens/dive_in_page.dart';
import '../../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../../features/splash/presentation/screens/splash_screen.dart';
import '../../../features/waitlist/presentation/screens/waitlist_primary_screen.dart';
import '../../../features/wallet-creation/presentation/screens/wallet_creation_screen.dart';
import '../../../features/wallet-creation/presentation/screens/wallet_creation_wallet_background_screen.dart';
import '../../../features/wallet-creation/presentation/screens/wallet_creation_wallet_name_screen.dart';
import '../transitions.dart';

part 'accounts_route.dart';
part 'generated/router.freezed.dart';
part 'generated/router.g.dart';
part 'home_route.dart';
part 'onboarding_route.dart';
part 'waitlist_route.dart';
part 'wallet_creation_route.dart';
part 'create_wallet_route.dart';

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
      initialLocation: const WaitlistPrimaryScreenRoute().location,
      routes: $appRoutes,
      redirectLimit: 0,
      errorBuilder: (BuildContext context, GoRouterState state) =>
          const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    );
