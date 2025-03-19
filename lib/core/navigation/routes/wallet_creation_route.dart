part of 'router.dart';

@TypedGoRoute<WalletCreationScreenRoute>(path: '/wallet-creation')
class WalletCreationScreenRoute extends GoRouteData {
  const WalletCreationScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WalletCreationScreen();

  static final AppRoute route = AppRoute.public(
    builder: (BuildContext context, GoRouterState state) =>
        const WalletCreationScreen(),
  );
}



@TypedGoRoute<WalletCreationWalletNameScreenRoute>(
  path: '/wallet-creation/wallet-name',
)
class WalletCreationWalletNameScreenRoute extends GoRouteData {
  const WalletCreationWalletNameScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WalletCreationWalletNameScreen();

  static final AppRoute route = AppRoute.public(
    builder: (BuildContext context, GoRouterState state) =>
        const WalletCreationWalletNameScreen(),
  );
}

@TypedGoRoute<WalletCreationWalletBackgroundScreenRoute>(
  path: '/wallet-creation/wallet-background',
)
class WalletCreationWalletBackgroundScreenRoute extends GoRouteData {
  const WalletCreationWalletBackgroundScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WalletCreationWalletBackgroundScreen();

  static final AppRoute route = AppRoute.public(
    builder: (BuildContext context, GoRouterState state) =>
        const WalletCreationWalletBackgroundScreen(),
  );
}

@TypedGoRoute<ImportWalletScreenRoute>(path: '/wallet-creation/import-wallet')
class ImportWalletScreenRoute extends GoRouteData {
  const ImportWalletScreenRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage<void>(
        key: state.pageKey,
        child: const ImportWalletScreen(),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) =>
            SmoothBottomUpTransition(
          animation: animation,
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 1000),
        reverseTransitionDuration: const Duration(milliseconds: 400),
      );

  static final AppRoute route = AppRoute.protected(
    builder: (BuildContext context, GoRouterState state) =>
        const ImportWalletScreen(),
  );
}

@TypedGoRoute<CreatedWalletScreenRoute>(path: '/wallet-creation/created-wallet')
class CreatedWalletScreenRoute extends GoRouteData {
  const CreatedWalletScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CreatedWalletScreen();

  static final AppRoute route = AppRoute.protected(
    builder: (BuildContext context, GoRouterState state) =>
        const CreatedWalletScreen(),
  );
}
