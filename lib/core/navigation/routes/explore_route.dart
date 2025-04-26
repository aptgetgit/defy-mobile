part of 'router.dart';

@TypedGoRoute<ExploreScreenRoute>(path: '/explore')
class ExploreScreenRoute extends GoRouteData {
  const ExploreScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ExploreScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const ExploreScreen(),
  );
}



@TypedGoRoute<ExploreSearchScreenRoute>(path: '/explore-search')
class ExploreSearchScreenRoute extends GoRouteData {
  const ExploreSearchScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SearchScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const SearchScreen(),
  );
}

@TypedGoRoute<ExploreMarketScreenRoute>(path: '/explore-market')
class ExploreMarketScreenRoute extends GoRouteData {
  const ExploreMarketScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ExploreMarketScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const ExploreMarketScreen(),
  );
}

@TypedGoRoute<ExploreNFTScreenRoute>(path: '/explore-nft')
class ExploreNFTScreenRoute extends GoRouteData {
  const ExploreNFTScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ExploreNFTScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const ExploreNFTScreen(),
  );
}

@TypedGoRoute<ExploreDappsScreenRoute>(path: '/explore-dapps')
class ExploreDappsScreenRoute extends GoRouteData {
  const ExploreDappsScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ExploreDappsScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const ExploreDappsScreen(),
  );
}


@TypedGoRoute<ExplorePumpFunScreenRoute>(path: '/explore-pump-fun')
class ExplorePumpFunScreenRoute extends GoRouteData {
  const ExplorePumpFunScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ExplorePumpFunScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const ExplorePumpFunScreen(),
  );
}

@TypedGoRoute<ExplorePumpFunTokenTransactionsScreenRoute>(path: '/explore-pump-fun-transactions')
class ExplorePumpFunTokenTransactionsScreenRoute extends GoRouteData {
  const ExplorePumpFunTokenTransactionsScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ExplorePumpFunTokenTransactionsScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const ExplorePumpFunTokenTransactionsScreen(),
  );
}

@TypedGoRoute<CreateTokenScreenRoute>(path: '/explore-create-token')
class CreateTokenScreenRoute extends GoRouteData {
  const CreateTokenScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CreateTokenScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const CreateTokenScreen(),
  );
}

@TypedGoRoute<PumpFunTokenPreviewScreenRoute>(path: '/explore-pump-fun-token-preview')
class PumpFunTokenPreviewScreenRoute extends GoRouteData {
  const PumpFunTokenPreviewScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const PumpFunTokenPreviewScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const PumpFunTokenPreviewScreen(),
  );
}

@TypedGoRoute<ExploreLeaderboardScreenRoute>(path: '/explore-leaderboard')
class ExploreLeaderboardScreenRoute extends GoRouteData {
  const ExploreLeaderboardScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ExploreLeaderboardScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const ExploreLeaderboardScreen(),
  );
}

@TypedGoRoute<ExploreCoinsScreenRoute>(path: '/explore-coins')
class ExploreCoinsScreenRoute extends GoRouteData {
  const ExploreCoinsScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ExploreCoinsScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const ExploreCoinsScreen(),
  );
}

@TypedGoRoute<ExploreTokensScreenRoute>(path: '/explore-tokens')
class ExploreTokensScreenRoute extends GoRouteData {
  const ExploreTokensScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ExploreTokensScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const ExploreTokensScreen(),
  );
}
