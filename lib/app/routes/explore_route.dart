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

@TypedGoRoute<ExploreNFTScreenRoute>(path: '/explore-nft')
class ExploreNFTScreenRoute extends GoRouteData {
  const ExploreNFTScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ExploreNFTScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ExploreNFTScreen(),
  );
}

@TypedGoRoute<ExploreDappsScreenRoute>(path: '/explore-dapps')
class ExploreDappsScreenRoute extends GoRouteData {
  const ExploreDappsScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ExploreDappsScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ExploreDappsScreen(),
  );
}

@TypedGoRoute<ExploreCoinsScreenRoute>(path: '/explore-coins')
class ExploreCoinsScreenRoute extends GoRouteData {
  const ExploreCoinsScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ExploreCoinsScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ExploreCoinsScreen(),
  );
}

@TypedGoRoute<ExplorePumpFunScreenRoute>(path: '/explore-pump-fun')
class ExplorePumpFunScreenRoute extends GoRouteData {
  const ExplorePumpFunScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ExplorePumpFunScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ExplorePumpFunScreen(),
  );
}

@TypedGoRoute<ExplorePumpFunTokenTransactionsScreenRoute>(path: '/explore-pump-fun-transactions')
class ExplorePumpFunTokenTransactionsScreenRoute extends GoRouteData {
  const ExplorePumpFunTokenTransactionsScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ExplorePumpFunTokenTransactionsScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ExplorePumpFunTokenTransactionsScreen(),
  );
}

@TypedGoRoute<CreateTokenScreenRoute>(path: '/explore-create-token')
class CreateTokenScreenRoute extends GoRouteData {
  const CreateTokenScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => CreateTokenScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => CreateTokenScreen(),
  );
}

@TypedGoRoute<PumpFunTokenPreviewScreenRoute>(path: '/explore-pump-fun-token-preview')
class PumpFunTokenPreviewScreenRoute extends GoRouteData {
  const PumpFunTokenPreviewScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => PumpFunTokenPreviewScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => PumpFunTokenPreviewScreen(),
  );
}

@TypedGoRoute<ExploreLeaderboardScreenRoute>(path: '/explore-leaderboard')
class ExploreLeaderboardScreenRoute extends GoRouteData {
  const ExploreLeaderboardScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ExploreLeaderboardScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ExploreLeaderboardScreen(),
  );
}