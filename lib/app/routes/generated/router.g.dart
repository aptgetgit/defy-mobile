// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $browserRoute,
      $homeRoute,
      $onboardingRoute,
      $diveInPageRoute,
      $splashRoute,
      $walletCreationScreenRoute,
      $walletCreationWalletNameScreenRoute,
      $walletCreationWalletBackgroundScreenRoute,
      $importWalletScreenRoute,
      $waitlistScreenRoute,
    ];

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

RouteBase get $diveInPageRoute => GoRouteData.$route(
      path: '/dive-in',
      factory: $DiveInPageRouteExtension._fromState,
    );

extension $DiveInPageRouteExtension on DiveInPageRoute {
  static DiveInPageRoute _fromState(GoRouterState state) =>
      const DiveInPageRoute();

  String get location => GoRouteData.$location(
        '/dive-in',
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

RouteBase get $walletCreationWalletNameScreenRoute => GoRouteData.$route(
      path: '/wallet-creation/wallet-name',
      factory: $WalletCreationWalletNameScreenRouteExtension._fromState,
    );

extension $WalletCreationWalletNameScreenRouteExtension
    on WalletCreationWalletNameScreenRoute {
  static WalletCreationWalletNameScreenRoute _fromState(GoRouterState state) =>
      const WalletCreationWalletNameScreenRoute();

  String get location => GoRouteData.$location(
        '/wallet-creation/wallet-name',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $walletCreationWalletBackgroundScreenRoute => GoRouteData.$route(
      path: '/wallet-creation/wallet-background',
      factory: $WalletCreationWalletBackgroundScreenRouteExtension._fromState,
    );

extension $WalletCreationWalletBackgroundScreenRouteExtension
    on WalletCreationWalletBackgroundScreenRoute {
  static WalletCreationWalletBackgroundScreenRoute _fromState(
          GoRouterState state) =>
      const WalletCreationWalletBackgroundScreenRoute();

  String get location => GoRouteData.$location(
        '/wallet-creation/wallet-background',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $importWalletScreenRoute => GoRouteData.$route(
      path: '/wallet-creation/import-wallet',
      factory: $ImportWalletScreenRouteExtension._fromState,
    );

extension $ImportWalletScreenRouteExtension on ImportWalletScreenRoute {
  static ImportWalletScreenRoute _fromState(GoRouterState state) =>
      const ImportWalletScreenRoute();

  String get location => GoRouteData.$location(
        '/wallet-creation/import-wallet',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waitlistScreenRoute => GoRouteData.$route(
      path: '/waitlist',
      factory: $WaitlistScreenRouteExtension._fromState,
    );

extension $WaitlistScreenRouteExtension on WaitlistScreenRoute {
  static WaitlistScreenRoute _fromState(GoRouterState state) =>
      const WaitlistScreenRoute();

  String get location => GoRouteData.$location(
        '/waitlist',
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

String _$routerHash() => r'5d1c5f20c8d2c83569d438dfa5a67bcaf352af79';

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
