// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_state_notifier.dart';
import 'package:defy/features/authentication/presentation/helpers/error.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_usecase_provider.dart';
import 'package:defy/features/authentication/presentation/providers/states/authentication_state.dart';
import 'package:defy/features/authentication/presentation/screens/account_creation/account_creation_screen.dart';
import 'package:defy/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:defy/features/authentication/presentation/screens/create_import_wallet_screen.dart';
import 'package:defy/features/authentication/presentation/screens/welcome_back_screen.dart';
import 'package:defy/features/home/presentation/screens/home_screen.dart';
import 'package:defy/features/shared/presentation/providers/user_blockchain_account_group_notifier_provider.dart';
import 'package:defy/features/shared/presentation/providers/user_blockchain_account_notifier_provider.dart';
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

  return GoRouter(
    initialLocation: CreateImportWalletScreenRoute().location,
    routes: $appRoutes,
    redirect: (BuildContext context, GoRouterState state) {
      final routeData = state.extra as AppRoute?;
      final authState = ref.watch(authenticationNotifierProvider);
      AppLogger.debug(state.fullPath);

      return authState.when(
        loading: () {
          AppLogger.debug("loading");
          return null;
        }, // Stay on current route while loading
        error: (e, st) {
           AppLogger.debug("error");
          DioException? err;
          if (e is DioException) {
            err = e;
          }
          final authErrorType = AuthErrorHandler.parseAuthError(err?.response);
          switch (authErrorType) {
            case AuthErrorType.missingUsername:
            case AuthErrorType.missingDisplayName:
              return const AccountCreationRoute().location;
            case AuthErrorType.generalAuthError:
              return const AuthenticationRoute().location;
            default:
              const AuthenticationRoute().location;
          }
        return const AuthenticationRoute().location;
        },
        data: (authenticationState) {

          if (state.fullPath == const AccountCreationRoute().location) {
            return authenticationState.map(
              authenticated: (_) =>
                  const CreateImportWalletScreenRoute().location,
              unauthenticated: (_) => const AuthenticationRoute().location,
              authenticating: (_) => null,
            );
          }

          if (state.fullPath == const AuthenticationRoute().location) {
            return authenticationState.map(
              authenticated: (_) => WelcomeBackScreenRoute().location,
              unauthenticated: (_) => const AuthenticationRoute().location,
              authenticating: (_) =>
                  null, // Don't redirect while authenticating
            );
          }

          if (state.fullPath == SplashRoute().location) {
            return authenticationState.map(
              authenticated: (_) {
                AppLogger.debug("splash screen - home route");
                //if active group then return to homescreen //todo
                // final accountsState =
                //     ref.read(userBlockchainAccountGroupNotifierProvider);
                // return accountsState.when(
                //   data: (accounts) {
                //     if (accounts.isEmpty) {
                //       return const CreateImportWalletScreenRoute().location;
                //     } else {
                //       return WelcomeBackScreenRoute().location;
                //     }
                //   },
                //   error: (e, st) {
                //     AppLogger.debug("error getting accounts so routing to authentication");
                //     return const AuthenticationRoute().location;
                //   },
                //   loading: () => null,
                // );
                return const HomeRoute().location;
              },
              unauthenticated: (_) => const AuthenticationRoute().location,
              authenticating: (_) => null,
            );
          }
        return null;
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
  late final ProviderSubscription<AsyncValue<AuthenticationState>>
      _subscription;

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}
