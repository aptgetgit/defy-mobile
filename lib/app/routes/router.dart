import 'dart:async';

import 'package:defy/features/authentication/presentation/providers/authentication_state_notifier.dart';
import 'package:defy/features/authentication/presentation/providers/states/authentication_state.dart';
import 'package:defy/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:defy/features/home/presentation/screens/home_screen.dart';
import 'package:defy/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:defy/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_route.dart';
part 'generated/router.freezed.dart';
part 'generated/router.g.dart';
part 'home_route.dart';
part 'onboarding_route.dart';
part 'splash_route.dart';

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
GoRouter router(Ref ref) {
  final authState = ref.watch(authenticationNotifierProvider);

  return GoRouter(
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    redirect: (BuildContext context, GoRouterState state) {
      final routeData = state.extra as AppRoute?;

      return authState.when(
        data: (authenticationState) {
          if (state.fullPath == const SplashRoute().location) {
            return authenticationState.map(
              authenticated: (_) => const HomeRoute().location,
              unauthenticated: (_) => const OnboardingRoute().location,
              authenticating: (_) => null,
            );
          }

          return authenticationState.map(
            authenticated: (_) => routeData?.map(
              public: (route) => route.redirectIfAuthenticated,
              protected: (_) => null,
            ),
            unauthenticated: (_) => routeData?.map(
              public: (_) => null,
              protected: (_) => const AuthenticationRoute().location,
            ),
            authenticating: (_) => null, // Don't redirect while authenticating
          );
        },
        loading: () => null, // Stay on current route while loading
        error: (_, __) => const AuthenticationRoute().location,
      );
    },
    refreshListenable: GoRouterRefreshStream(ref),
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    ),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(this._ref) {
    _subscription = _ref.listen<AsyncValue<AuthenticationState>>(
      authenticationNotifierProvider,
      (_, __) => notifyListeners(),
    );
  }

  final Ref _ref;
  late final ProviderSubscription<AsyncValue<AuthenticationState>>
      _subscription;

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}
