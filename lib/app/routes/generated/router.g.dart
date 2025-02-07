// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $browserRoute,
      $homeRoute,
      $onboardingRoute,
      $loginPageRoute,
      $accountSetUpFullNameScreenRoute,
      $accountSetUpUsernameScreenRoute,
      $sendScreenRoute,
      $sendToSelfScreenRoute,
      $sendToContactsScreenRoute,
      $sendToFriendsScreenRoute,
      $splashRoute,
      $waitlistScreenRoute,
      $walletCreationScreenRoute,
      $walletCreationWalletNameScreenRoute,
      $walletCreationWalletBackgroundScreenRoute,
      $importWalletScreenRoute,
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

RouteBase get $loginPageRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginPageRouteExtension._fromState,
    );

extension $LoginPageRouteExtension on LoginPageRoute {
  static LoginPageRoute _fromState(GoRouterState state) =>
      const LoginPageRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $accountSetUpFullNameScreenRoute => GoRouteData.$route(
      path: '/account-set-up-full-name',
      factory: $AccountSetUpFullNameScreenRouteExtension._fromState,
    );

extension $AccountSetUpFullNameScreenRouteExtension
    on AccountSetUpFullNameScreenRoute {
  static AccountSetUpFullNameScreenRoute _fromState(GoRouterState state) =>
      const AccountSetUpFullNameScreenRoute();

  String get location => GoRouteData.$location(
        '/account-set-up-full-name',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $accountSetUpUsernameScreenRoute => GoRouteData.$route(
      path: '/account-set-up-username',
      factory: $AccountSetUpUsernameScreenRouteExtension._fromState,
    );

extension $AccountSetUpUsernameScreenRouteExtension
    on AccountSetUpUsernameScreenRoute {
  static AccountSetUpUsernameScreenRoute _fromState(GoRouterState state) =>
      const AccountSetUpUsernameScreenRoute();

  String get location => GoRouteData.$location(
        '/account-set-up-username',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $sendScreenRoute => GoRouteData.$route(
      path: '/send',
      factory: $SendScreenRouteExtension._fromState,
    );

extension $SendScreenRouteExtension on SendScreenRoute {
  static SendScreenRoute _fromState(GoRouterState state) =>
      const SendScreenRoute();

  String get location => GoRouteData.$location(
        '/send',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $sendToSelfScreenRoute => GoRouteData.$route(
      path: '/send/send-to-self',
      factory: $SendToSelfScreenRouteExtension._fromState,
    );

extension $SendToSelfScreenRouteExtension on SendToSelfScreenRoute {
  static SendToSelfScreenRoute _fromState(GoRouterState state) =>
      const SendToSelfScreenRoute();

  String get location => GoRouteData.$location(
        '/send/send-to-self',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $sendToContactsScreenRoute => GoRouteData.$route(
      path: '/send/send-to-contacts',
      factory: $SendToContactsScreenRouteExtension._fromState,
    );

extension $SendToContactsScreenRouteExtension on SendToContactsScreenRoute {
  static SendToContactsScreenRoute _fromState(GoRouterState state) =>
      const SendToContactsScreenRoute();

  String get location => GoRouteData.$location(
        '/send/send-to-contacts',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $sendToFriendsScreenRoute => GoRouteData.$route(
      path: '/send/send-to-friends',
      factory: $SendToFriendsScreenRouteExtension._fromState,
    );

extension $SendToFriendsScreenRouteExtension on SendToFriendsScreenRoute {
  static SendToFriendsScreenRoute _fromState(GoRouterState state) =>
      const SendToFriendsScreenRoute();

  String get location => GoRouteData.$location(
        '/send/send-to-friends',
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

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'd32b4645cc9face3189ef9483abc209a92c13192';

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
