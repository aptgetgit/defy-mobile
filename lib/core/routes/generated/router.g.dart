// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $authenticationRoute,
      $accountCreationRoute,
      $welcomeBackScreenRoute,
      $createImportWalletScreenRoute,
      $browserRoute,
      $accountDashboardScreenRoute,
      $walletCreationScreenRoute,
      $seedSelectionScreenRoute,
      $importPrivateKeyScreenRoute,
      $importSeedKeyScreenRoute,
      $walletUiScreenRoute,
      $securityScreenRoute,
      $manageWalletScreenRoute,
      $rotateKeyScreenRoute,
      $connectionScreenRoute,
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

RouteBase get $accountCreationRoute => GoRouteData.$route(
      path: '/account-creation',
      factory: $AccountCreationRouteExtension._fromState,
    );

extension $AccountCreationRouteExtension on AccountCreationRoute {
  static AccountCreationRoute _fromState(GoRouterState state) =>
      const AccountCreationRoute();

  String get location => GoRouteData.$location(
        '/account-creation',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $welcomeBackScreenRoute => GoRouteData.$route(
      path: '/welcome-back',
      factory: $WelcomeBackScreenRouteExtension._fromState,
    );

extension $WelcomeBackScreenRouteExtension on WelcomeBackScreenRoute {
  static WelcomeBackScreenRoute _fromState(GoRouterState state) =>
      const WelcomeBackScreenRoute();

  String get location => GoRouteData.$location(
        '/welcome-back',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $createImportWalletScreenRoute => GoRouteData.$route(
      path: '/create-import',
      factory: $CreateImportWalletScreenRouteExtension._fromState,
    );

extension $CreateImportWalletScreenRouteExtension
    on CreateImportWalletScreenRoute {
  static CreateImportWalletScreenRoute _fromState(GoRouterState state) =>
      const CreateImportWalletScreenRoute();

  String get location => GoRouteData.$location(
        '/create-import',
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

RouteBase get $accountDashboardScreenRoute => GoRouteData.$route(
      path: '/account',
      factory: $AccountDashboardScreenRouteExtension._fromState,
    );

extension $AccountDashboardScreenRouteExtension on AccountDashboardScreenRoute {
  static AccountDashboardScreenRoute _fromState(GoRouterState state) =>
      const AccountDashboardScreenRoute();

  String get location => GoRouteData.$location(
        '/account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $walletCreationScreenRoute => GoRouteData.$route(
      path: '/wallet-creation',
      factory: $WalletCreationScreenRouteExtension._fromState,
    );

extension $WalletCreationScreenRouteExtension on WalletCreationScreenRoute {
  static WalletCreationScreenRoute _fromState(GoRouterState state) =>
      const WalletCreationScreenRoute();

  String get location => GoRouteData.$location(
        '/wallet-creation',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $seedSelectionScreenRoute => GoRouteData.$route(
      path: '/seed-selection',
      factory: $SeedSelectionScreenRouteExtension._fromState,
    );

extension $SeedSelectionScreenRouteExtension on SeedSelectionScreenRoute {
  static SeedSelectionScreenRoute _fromState(GoRouterState state) =>
      const SeedSelectionScreenRoute();

  String get location => GoRouteData.$location(
        '/seed-selection',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $importPrivateKeyScreenRoute => GoRouteData.$route(
      path: '/import-private-key',
      factory: $ImportPrivateKeyScreenRouteExtension._fromState,
    );

extension $ImportPrivateKeyScreenRouteExtension on ImportPrivateKeyScreenRoute {
  static ImportPrivateKeyScreenRoute _fromState(GoRouterState state) =>
      const ImportPrivateKeyScreenRoute();

  String get location => GoRouteData.$location(
        '/import-private-key',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $importSeedKeyScreenRoute => GoRouteData.$route(
      path: '/import-seed-key',
      factory: $ImportSeedKeyScreenRouteExtension._fromState,
    );

extension $ImportSeedKeyScreenRouteExtension on ImportSeedKeyScreenRoute {
  static ImportSeedKeyScreenRoute _fromState(GoRouterState state) =>
      const ImportSeedKeyScreenRoute();

  String get location => GoRouteData.$location(
        '/import-seed-key',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $walletUiScreenRoute => GoRouteData.$route(
      path: '/wallet',
      factory: $WalletUiScreenRouteExtension._fromState,
    );

extension $WalletUiScreenRouteExtension on WalletUiScreenRoute {
  static WalletUiScreenRoute _fromState(GoRouterState state) =>
      WalletUiScreenRoute();

  String get location => GoRouteData.$location(
        '/wallet',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $securityScreenRoute => GoRouteData.$route(
      path: '/security',
      factory: $SecurityScreenRouteExtension._fromState,
    );

extension $SecurityScreenRouteExtension on SecurityScreenRoute {
  static SecurityScreenRoute _fromState(GoRouterState state) =>
      SecurityScreenRoute();

  String get location => GoRouteData.$location(
        '/security',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $manageWalletScreenRoute => GoRouteData.$route(
      path: '/manage',
      factory: $ManageWalletScreenRouteExtension._fromState,
    );

extension $ManageWalletScreenRouteExtension on ManageWalletScreenRoute {
  static ManageWalletScreenRoute _fromState(GoRouterState state) =>
      ManageWalletScreenRoute();

  String get location => GoRouteData.$location(
        '/manage',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $rotateKeyScreenRoute => GoRouteData.$route(
      path: '/rotate-key',
      factory: $RotateKeyScreenRouteExtension._fromState,
    );

extension $RotateKeyScreenRouteExtension on RotateKeyScreenRoute {
  static RotateKeyScreenRoute _fromState(GoRouterState state) =>
      RotateKeyScreenRoute();

  String get location => GoRouteData.$location(
        '/rotate-key',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $connectionScreenRoute => GoRouteData.$route(
      path: '/connections',
      factory: $ConnectionScreenRouteExtension._fromState,
    );

extension $ConnectionScreenRouteExtension on ConnectionScreenRoute {
  static ConnectionScreenRoute _fromState(GoRouterState state) =>
      ConnectionScreenRoute();

  String get location => GoRouteData.$location(
        '/connections',
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

String _$routerHash() => r'7a1cb8b564180f5c28640736137e94f0ecacad80';

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
