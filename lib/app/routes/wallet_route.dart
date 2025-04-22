part of 'router.dart';

@TypedGoRoute<WalletScreenRoute>(path: '/wallet')
class WalletScreenRoute extends GoRouteData {
  const WalletScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const WalletScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const WalletScreen(),
  );
}
@TypedGoRoute<WalletMoreScreenRoute>(path: '/wallet-more')
class WalletMoreScreenRoute extends GoRouteData {
  const WalletMoreScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const WalletMoreScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const WalletMoreScreen(),
  );
}
@TypedGoRoute<WalletSearchScreenRoute>(path: '/wallet-search')
class WalletSearchScreenRoute extends GoRouteData {
  const WalletSearchScreenRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return FadeSlideTransition(
      child: const WalletSearchScreen(),
    );
  }

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const WalletSearchScreen(),
  );
}
@TypedGoRoute<WalletWatchListScreenRoute>(path: '/wallet-watchlist')
class WalletWatchListScreenRoute extends GoRouteData {
  const WalletWatchListScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const WatchListScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const WatchListScreen(),
  );
}
@TypedGoRoute<WalletQRScannerRoute>(path: '/wallet-qr-scanner')
class WalletQRScannerRoute extends GoRouteData {
  const WalletQRScannerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const QrScannerScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>  const QrScannerScreen(),
  );
}