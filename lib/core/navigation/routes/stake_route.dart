part of 'router.dart';

@TypedGoRoute<StakeRoute>(path: '/stake')
class StakeRoute extends GoRouteData {
  const StakeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StakeScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const StakeScreen(),
  );
}

@TypedGoRoute<StakeAmountRoute>(path: '/stake-amount')
class StakeAmountRoute extends GoRouteData {
  const StakeAmountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StakeAmountScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const StakeAmountScreen(),
  );
}

@TypedGoRoute<StakeAmountDelegateRoute>(path: '/stake-amount-delegate')
class StakeAmountDelegateRoute extends GoRouteData {
  const StakeAmountDelegateRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StakeAmountDelegateScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const StakeAmountDelegateScreen(),
  );
}
