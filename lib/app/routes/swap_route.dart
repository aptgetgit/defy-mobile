part of 'router.dart';

@TypedGoRoute<SwapRoute>(path: '/swap')
class SwapRoute extends GoRouteData {
  const SwapRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SwapScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const SwapScreen(),
  );
}

@TypedGoRoute<SwapAmountRoute>(path: '/swap-amount')
class SwapAmountRoute extends GoRouteData {
  const SwapAmountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SwapAmountScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const SwapAmountScreen(),
  );
}