// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $onboardingRoute,
      $authenticationRoute,
      $homeRoute,
      $dashboardRoute,
      $watchlistRoute,
      $singleSwapScreenRoute,
      $swapTokensRoute,
      $exploreScreenRoute,
      $exploreSearchScreenRoute,
      $exploreMarketScreenRoute,
      $exploreNFTScreenRoute,
      $exploreDappsScreenRoute,
      $exploreCoinsScreenRoute,
      $explorePumpFunScreenRoute,
      $explorePumpFunTokenTransactionsScreenRoute,
      $createTokenScreenRoute,
      $pumpFunTokenPreviewScreenRoute,
      $exploreLeaderboardScreenRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboardingRoute => GoRouteData.$route(
      path: '/onboarding',
      factory: $OnboardingRouteExtension._fromState,
    );

extension $OnboardingRouteExtension on OnboardingRoute {
  static OnboardingRoute _fromState(GoRouterState state) =>
      const OnboardingRoute();

  String get location => GoRouteData.$location(
        '/onboarding',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $authenticationRoute => GoRouteData.$route(
      path: '/auth',
      factory: $AuthenticationRouteExtension._fromState,
    );

extension $AuthenticationRouteExtension on AuthenticationRoute {
  static AuthenticationRoute _fromState(GoRouterState state) =>
      const AuthenticationRoute();

  String get location => GoRouteData.$location(
        '/auth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $dashboardRoute => GoRouteData.$route(
      path: '/dashboard',
      factory: $DashboardRouteExtension._fromState,
    );

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  String get location => GoRouteData.$location(
        '/dashboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $watchlistRoute => GoRouteData.$route(
      path: '/watchlist',
      factory: $WatchlistRouteExtension._fromState,
    );

extension $WatchlistRouteExtension on WatchlistRoute {
  static WatchlistRoute _fromState(GoRouterState state) =>
      const WatchlistRoute();

  String get location => GoRouteData.$location(
        '/watchlist',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $singleSwapScreenRoute => GoRouteData.$route(
      path: '/swap',
      factory: $SingleSwapScreenRouteExtension._fromState,
    );

extension $SingleSwapScreenRouteExtension on SingleSwapScreenRoute {
  static SingleSwapScreenRoute _fromState(GoRouterState state) =>
      const SingleSwapScreenRoute();

  String get location => GoRouteData.$location(
        '/swap',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $swapTokensRoute => GoRouteData.$route(
      path: '/swap-tokens',
      factory: $SwapTokensRouteExtension._fromState,
    );

extension $SwapTokensRouteExtension on SwapTokensRoute {
  static SwapTokensRoute _fromState(GoRouterState state) => SwapTokensRoute(
        $extra: state.extra as bool,
      );

  String get location => GoRouteData.$location(
        '/swap-tokens',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $exploreScreenRoute => GoRouteData.$route(
      path: '/explore',
      factory: $ExploreScreenRouteExtension._fromState,
    );

extension $ExploreScreenRouteExtension on ExploreScreenRoute {
  static ExploreScreenRoute _fromState(GoRouterState state) =>
      const ExploreScreenRoute();

  String get location => GoRouteData.$location(
        '/explore',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $exploreSearchScreenRoute => GoRouteData.$route(
      path: '/explore-search',
      factory: $ExploreSearchScreenRouteExtension._fromState,
    );

extension $ExploreSearchScreenRouteExtension on ExploreSearchScreenRoute {
  static ExploreSearchScreenRoute _fromState(GoRouterState state) =>
      const ExploreSearchScreenRoute();

  String get location => GoRouteData.$location(
        '/explore-search',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $exploreMarketScreenRoute => GoRouteData.$route(
      path: '/explore-market',
      factory: $ExploreMarketScreenRouteExtension._fromState,
    );

extension $ExploreMarketScreenRouteExtension on ExploreMarketScreenRoute {
  static ExploreMarketScreenRoute _fromState(GoRouterState state) =>
      const ExploreMarketScreenRoute();

  String get location => GoRouteData.$location(
        '/explore-market',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $exploreNFTScreenRoute => GoRouteData.$route(
      path: '/explore-nft',
      factory: $ExploreNFTScreenRouteExtension._fromState,
    );

extension $ExploreNFTScreenRouteExtension on ExploreNFTScreenRoute {
  static ExploreNFTScreenRoute _fromState(GoRouterState state) =>
      const ExploreNFTScreenRoute();

  String get location => GoRouteData.$location(
        '/explore-nft',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $exploreDappsScreenRoute => GoRouteData.$route(
      path: '/explore-dapps',
      factory: $ExploreDappsScreenRouteExtension._fromState,
    );

extension $ExploreDappsScreenRouteExtension on ExploreDappsScreenRoute {
  static ExploreDappsScreenRoute _fromState(GoRouterState state) =>
      const ExploreDappsScreenRoute();

  String get location => GoRouteData.$location(
        '/explore-dapps',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $exploreCoinsScreenRoute => GoRouteData.$route(
      path: '/explore-coins',
      factory: $ExploreCoinsScreenRouteExtension._fromState,
    );

extension $ExploreCoinsScreenRouteExtension on ExploreCoinsScreenRoute {
  static ExploreCoinsScreenRoute _fromState(GoRouterState state) =>
      const ExploreCoinsScreenRoute();

  String get location => GoRouteData.$location(
        '/explore-coins',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $explorePumpFunScreenRoute => GoRouteData.$route(
      path: '/explore-pump-fun',
      factory: $ExplorePumpFunScreenRouteExtension._fromState,
    );

extension $ExplorePumpFunScreenRouteExtension on ExplorePumpFunScreenRoute {
  static ExplorePumpFunScreenRoute _fromState(GoRouterState state) =>
      const ExplorePumpFunScreenRoute();

  String get location => GoRouteData.$location(
        '/explore-pump-fun',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $explorePumpFunTokenTransactionsScreenRoute => GoRouteData.$route(
      path: '/explore-pump-fun-transactions',
      factory: $ExplorePumpFunTokenTransactionsScreenRouteExtension._fromState,
    );

extension $ExplorePumpFunTokenTransactionsScreenRouteExtension
    on ExplorePumpFunTokenTransactionsScreenRoute {
  static ExplorePumpFunTokenTransactionsScreenRoute _fromState(
          GoRouterState state) =>
      const ExplorePumpFunTokenTransactionsScreenRoute();

  String get location => GoRouteData.$location(
        '/explore-pump-fun-transactions',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $createTokenScreenRoute => GoRouteData.$route(
      path: '/explore-create-token',
      factory: $CreateTokenScreenRouteExtension._fromState,
    );

extension $CreateTokenScreenRouteExtension on CreateTokenScreenRoute {
  static CreateTokenScreenRoute _fromState(GoRouterState state) =>
      const CreateTokenScreenRoute();

  String get location => GoRouteData.$location(
        '/explore-create-token',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $pumpFunTokenPreviewScreenRoute => GoRouteData.$route(
      path: '/explore-pump-fun-token-preview',
      factory: $PumpFunTokenPreviewScreenRouteExtension._fromState,
    );

extension $PumpFunTokenPreviewScreenRouteExtension
    on PumpFunTokenPreviewScreenRoute {
  static PumpFunTokenPreviewScreenRoute _fromState(GoRouterState state) =>
      const PumpFunTokenPreviewScreenRoute();

  String get location => GoRouteData.$location(
        '/explore-pump-fun-token-preview',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $exploreLeaderboardScreenRoute => GoRouteData.$route(
      path: '/explore-leaderboard',
      factory: $ExploreLeaderboardScreenRouteExtension._fromState,
    );

extension $ExploreLeaderboardScreenRouteExtension
    on ExploreLeaderboardScreenRoute {
  static ExploreLeaderboardScreenRoute _fromState(GoRouterState state) =>
      const ExploreLeaderboardScreenRoute();

  String get location => GoRouteData.$location(
        '/explore-leaderboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'747008450ef2ca349e010a19cb921a9077aeac64';

/// See also [router].
@ProviderFor(router)
final routerProvider = Provider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = ProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
