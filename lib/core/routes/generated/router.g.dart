// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $authenticationRoute,
      $browserRoute,
      $homeRoute,
      $lendBorrowViewRoute,
      $leverageTradingViewRoute,
      $leverageTradingPairViewRoute,
      $nFTMarketplaceScreenRoute,
      $nFTMintViewRoute,
      $nFTMintDetailsViewRoute,
      $onboardingRoute,
      $splashRoute,
      $stakingPoolViewRoute,
      $testRoute,
      $tokensInfoScreenRoute,
    ];

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

RouteBase get $browserRoute => GoRouteData.$route(
      path: '/browser',
      factory: $BrowserRouteExtension._fromState,
    );

extension $BrowserRouteExtension on BrowserRoute {
  static BrowserRoute _fromState(GoRouterState state) => const BrowserRoute();

  String get location => GoRouteData.$location(
        '/browser',
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

RouteBase get $lendBorrowViewRoute => GoRouteData.$route(
      path: '/lend-borrow',
      factory: $LendBorrowViewRouteExtension._fromState,
    );

extension $LendBorrowViewRouteExtension on LendBorrowViewRoute {
  static LendBorrowViewRoute _fromState(GoRouterState state) =>
      const LendBorrowViewRoute();

  String get location => GoRouteData.$location(
        '/lend-borrow',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $leverageTradingViewRoute => GoRouteData.$route(
      path: '/leverage-trading',
      factory: $LeverageTradingViewRouteExtension._fromState,
    );

extension $LeverageTradingViewRouteExtension on LeverageTradingViewRoute {
  static LeverageTradingViewRoute _fromState(GoRouterState state) =>
      const LeverageTradingViewRoute();

  String get location => GoRouteData.$location(
        '/leverage-trading',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $leverageTradingPairViewRoute => GoRouteData.$route(
      path: '/leverage-trading-pair',
      factory: $LeverageTradingPairViewRouteExtension._fromState,
    );

extension $LeverageTradingPairViewRouteExtension
    on LeverageTradingPairViewRoute {
  static LeverageTradingPairViewRoute _fromState(GoRouterState state) =>
      const LeverageTradingPairViewRoute();

  String get location => GoRouteData.$location(
        '/leverage-trading-pair',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $nFTMarketplaceScreenRoute => GoRouteData.$route(
      path: '/marketplace',
      factory: $NFTMarketplaceScreenRouteExtension._fromState,
    );

extension $NFTMarketplaceScreenRouteExtension on NFTMarketplaceScreenRoute {
  static NFTMarketplaceScreenRoute _fromState(GoRouterState state) =>
      const NFTMarketplaceScreenRoute();

  String get location => GoRouteData.$location(
        '/marketplace',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $nFTMintViewRoute => GoRouteData.$route(
      path: '/nft-mint',
      factory: $NFTMintViewRouteExtension._fromState,
    );

extension $NFTMintViewRouteExtension on NFTMintViewRoute {
  static NFTMintViewRoute _fromState(GoRouterState state) =>
      const NFTMintViewRoute();

  String get location => GoRouteData.$location(
        '/nft-mint',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $nFTMintDetailsViewRoute => GoRouteData.$route(
      path: '/nft-mint-details',
      factory: $NFTMintDetailsViewRouteExtension._fromState,
    );

extension $NFTMintDetailsViewRouteExtension on NFTMintDetailsViewRoute {
  static NFTMintDetailsViewRoute _fromState(GoRouterState state) =>
      const NFTMintDetailsViewRoute();

  String get location => GoRouteData.$location(
        '/nft-mint-details',
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

RouteBase get $stakingPoolViewRoute => GoRouteData.$route(
      path: '/staking-pool',
      factory: $StakingPoolViewRouteExtension._fromState,
    );

extension $StakingPoolViewRouteExtension on StakingPoolViewRoute {
  static StakingPoolViewRoute _fromState(GoRouterState state) =>
      const StakingPoolViewRoute();

  String get location => GoRouteData.$location(
        '/staking-pool',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $testRoute => GoRouteData.$route(
      path: '/test',
      factory: $TestRouteExtension._fromState,
    );

extension $TestRouteExtension on TestRoute {
  static TestRoute _fromState(GoRouterState state) => const TestRoute();

  String get location => GoRouteData.$location(
        '/test',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $tokensInfoScreenRoute => GoRouteData.$route(
      path: '/token_info',
      factory: $TokensInfoScreenRouteExtension._fromState,
    );

extension $TokensInfoScreenRouteExtension on TokensInfoScreenRoute {
  static TokensInfoScreenRoute _fromState(GoRouterState state) =>
      const TokensInfoScreenRoute();

  String get location => GoRouteData.$location(
        '/token_info',
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

String _$routerHash() => r'811dff58f330aeff3b412163685b4a7d7a572164';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RouterRef = ProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
