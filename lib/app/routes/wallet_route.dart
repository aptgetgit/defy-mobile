part of 'router.dart';

@TypedGoRoute<WalletScreenRoute>(path: '/wallet')
class WalletScreenRoute extends GoRouteData {
  const WalletScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => WalletScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => WalletScreen(),
  );
}
@TypedGoRoute<WalletMoreScreenRoute>(path: '/wallet-more')
class WalletMoreScreenRoute extends GoRouteData {
  const WalletMoreScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => WalletMoreScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => WalletMoreScreen(),
  );
}
@TypedGoRoute<WalletSearchScreenRoute>(path: '/wallet-search')
class WalletSearchScreenRoute extends GoRouteData {
  const WalletSearchScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => WalletSearchScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => WalletSearchScreen(),
  );
}
@TypedGoRoute<WalletWatchListScreenRoute>(path: '/wallet-watchlist')
class WalletWatchListScreenRoute extends GoRouteData {
  const WalletWatchListScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => WatchListScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => WatchListScreen(),
  );
}