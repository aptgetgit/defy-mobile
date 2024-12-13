// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_state_notifier.dart';
import 'package:defy/features/authentication/presentation/helpers/error.dart';
import 'package:defy/features/authentication/presentation/providers/states/authentication_state.dart';
import 'package:defy/features/authentication/presentation/screens/account_creation/account_creation_screen.dart';
import 'package:defy/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:defy/features/authentication/presentation/screens/welcome_back_screen.dart';
import 'package:defy/features/home/presentation/screens/home_screen.dart';
import 'package:defy/features/splash/presentation/screens/splash_screen.dart';
import 'package:defy/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_route.dart';
part 'onboarding_route.dart';
part 'authentication_route.dart';
part 'home_route.dart';

part 'generated/router.g.dart';
part 'generated/router.freezed.dart';

@freezed
class AppRoute with _$AppRoute {
  const factory AppRoute.public({
    String? redirectIfAuthenticated,
    required Widget Function(BuildContext, GoRouterState) builder,
  }) = PublicRoute;
  const factory AppRoute.protected({
    required Widget Function(BuildContext, GoRouterState) builder,
  }) = ProtectedRoute;
}

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authenticationNotifierProvider);
  
  return GoRouter(
    initialLocation: const AuthenticationRoute().location,
    routes: $appRoutes,
    redirect: (BuildContext context, GoRouterState state) {
      final routeData = state.extra as AppRoute?;
      
      return authState.when(
        data: (authenticationState) {
          if (state.fullPath == const SplashRoute().location) {
            return authenticationState.map(
              authenticated: (_) => const HomeRoute().location,
              unauthenticated: (_) => const AuthenticationRoute().location,
              authenticating: (_) => null,
            );
          }

          if(state.fullPath == const AccountCreationRoute().location){
            AppLogger.debug("routeData- ${state.fullPath}");
            return authenticationState.map(
              authenticated: (_) => const HomeRoute().location,
              unauthenticated: (_) => const AuthenticationRoute().location,
              authenticating: (_) => null,
            );
          }

          if(state.fullPath == const AuthenticationRoute().location){
            AppLogger.debug("routeDataAuth- ${state.fullPath}");
            return authenticationState.map(
            authenticated: (_) => const HomeRoute().location,
            unauthenticated: (_) => const AuthenticationRoute().location,
            authenticating: (_) => null, // Don't redirect while authenticating
          );
          }

        },
        loading: () => null, // Stay on current route while loading
        error: (e, st) {
          AppLogger.debug("routeErr- ${state.fullPath}");
          DioException? err;
          if(e is DioException) {
            err = e;
          }
          final authErrorType = AuthErrorHandler.parseAuthError(err?.response);
          switch(authErrorType) {
            case AuthErrorType.missingUsername:
              AppLogger.debug(authErrorType.toString());
              return const AccountCreationRoute().location;
            case AuthErrorType.missingDisplayName:
              AppLogger.debug(authErrorType.toString());
              return const AccountCreationRoute().location;
            case AuthErrorType.generalAuthError:
              AppLogger.debug(authErrorType.toString());
              return const AuthenticationRoute().location;
          }
          },
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
  late final ProviderSubscription<AsyncValue<AuthenticationState>> _subscription;

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}