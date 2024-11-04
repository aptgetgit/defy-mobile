part of 'router.dart';

@TypedGoRoute<WatchlistRoute>(path: '/watchlist')
class WatchlistRoute extends GoRouteData {
  const WatchlistRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const WatchListScreen();

  static final AppRoute route = AppRoute.protected(
    builder: (context, state) => const WatchListScreen(),
  );
}