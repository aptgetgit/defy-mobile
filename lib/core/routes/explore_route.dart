part of 'router.dart';

@TypedGoRoute<ExploreScreenRoute>(path: '/explore')
class ExploreScreenRoute extends GoRouteData {
  const ExploreScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ExploreScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ExploreScreen(),
  );
}

@TypedGoRoute<ExploreSearchScreenRoute>(path: '/explore-search')
class ExploreSearchScreenRoute extends GoRouteData {
  const ExploreSearchScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => SearchScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => SearchScreen(),
  );
}

@TypedGoRoute<ExploreMarketScreenRoute>(path: '/explore-market')
class ExploreMarketScreenRoute extends GoRouteData {
  const ExploreMarketScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ExploreMarketScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ExploreMarketScreen(),
  );
}