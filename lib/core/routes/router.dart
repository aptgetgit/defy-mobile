// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_state_notifier.dart';
import 'package:defy/features/authentication/presentation/helpers/error.dart';
import 'package:defy/features/authentication/presentation/providers/states/authentication_state.dart';
import 'package:defy/features/authentication/presentation/screens/account_creation/account_creation_screen.dart';
import 'package:defy/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:defy/features/authentication/presentation/screens/create_import_wallet_screen.dart';
import 'package:defy/features/authentication/presentation/screens/welcome_back_screen.dart';
import 'package:defy/features/blockchain/presentation/screens/account_dashboard/screens/account_dashboard.dart';
import 'package:defy/features/blockchain/presentation/screens/import_wallet/screens/import_private_key_screen.dart';
import 'package:defy/features/blockchain/presentation/screens/import_wallet/screens/import_seed_key_screen.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/screens/seed_selection_screen.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/screens/wallet_creation_screen.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_ui_edit/screens/connection_screen.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_ui_edit/screens/manage_wallet_screen.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_ui_edit/screens/rotate_key_screen.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_ui_edit/screens/security_screen.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_ui_edit/screens/wallet_ui_screen.dart';
import 'package:defy/features/browser/presentation/browser_view.dart';
import 'package:defy/features/home/presentation/screens/home_screen.dart';
import 'package:defy/features/lend-borrow/presentation/lending_view.dart';
import 'package:defy/features/leverage_trading/presentation/screens/leverage_trading_pair_view.dart';
import 'package:defy/features/leverage_trading/presentation/screens/leverage_trading_view.dart';
import 'package:defy/features/marketplace/presentation/screens/nft_marketplace_screen.dart';
import 'package:defy/features/mint/presentation/nft_mint_details_view.dart';
import 'package:defy/features/mint/presentation/nft_mint_view.dart';
import 'package:defy/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:defy/features/splash/presentation/screens/splash_screen.dart';
import 'package:defy/features/staking/presentation/screens/staking_pool_view.dart';
import 'package:defy/features/test/test_screen.dart';
import 'package:defy/features/token_info/presentation/tokens_info_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_route.dart';
part 'browser_route.dart';
part 'blockchain_route.dart';
part 'generated/router.freezed.dart';
part 'generated/router.g.dart';
part 'home_route.dart';
part 'lend_borrow_route.dart';
part 'leverage_trading_route.dart';
part 'nft_marketplace_route.dart';
part 'nft_mint_route.dart';
part 'onboarding_route.dart';
part 'splash_route.dart';
part 'staking_route.dart';
part 'test_route.dart';
part 'tokens_info_route.dart';

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
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    redirect: (BuildContext context, GoRouterState state) {
      final routeData = state.extra as AppRoute?;
      
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
              return const AuthenticationRoute().location;
          }
        },
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
            authenticating: (_) => null,
          );
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