part of 'router.dart';

@TypedGoRoute<WelcomeAgainScreenRoute>(path: '/welcome-again')
class WelcomeAgainScreenRoute extends GoRouteData {
  const WelcomeAgainScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WelcomeAgainScreen();

  static final AppRoute route = AppRoute.public(
    builder: (BuildContext context, GoRouterState state) =>
        const WelcomeAgainScreen(),
  );
}

@TypedGoRoute<ChooseWalletScreenRoute>(path: '/choose-wallet')
class ChooseWalletScreenRoute extends GoRouteData {
  const ChooseWalletScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ChooseWalletScreen();

  static final AppRoute route = AppRoute.public(
    builder: (BuildContext context, GoRouterState state) =>
        const ChooseWalletScreen(),
  );
}

@TypedGoRoute<ChooseWalletUserScreenRoute>(path: '/choose-wallet-user')
class ChooseWalletUserScreenRoute extends GoRouteData {
  const ChooseWalletUserScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ChooseWalletUserScreen();

  static final AppRoute route = AppRoute.public(
    builder: (BuildContext context, GoRouterState state) =>
        const ChooseWalletUserScreen(),
  );
}

// @TypedGoRoute<WalletSettingsScreenRoute>(path: '/wallet-settings')
// class WalletSettingsScreenRoute extends GoRouteData {
//   const WalletSettingsScreenRoute({required this.walletCard});
//   final Widget walletCard;

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       WalletSettingsScreen(walletCard: walletCard);

//   static final AppRoute route = AppRoute.public(
//     builder: (BuildContext context, GoRouterState state) {
//       final Widget walletCard = state.extra! as Widget;
//       return WalletSettingsScreen(walletCard: walletCard);
//     },
//   );
// }

// @TypedGoRoute<WalletSettingsSecurityScreenRoute>(
//     path: '/wallet-settings/security')
// class WalletSettingsSecurityScreenRoute extends GoRouteData {
//   const WalletSettingsSecurityScreenRoute();

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const WalletSettingsSecurityScreen();

//   static final AppRoute route = AppRoute.public(
//     builder: (BuildContext context, GoRouterState state) =>
//         const WalletSettingsSecurityScreen(),
//   );
// }


