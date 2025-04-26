part of 'router.dart';



@TypedGoRoute<LendRoute>(path: '/lend')
class LendRoute extends GoRouteData {
  const LendRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LendScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const LendScreen(),
  );
}
@TypedGoRoute<LendAmountRoute>(path: '/lend-amount')
class LendAmountRoute extends GoRouteData {
  const LendAmountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LendAmountScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const LendAmountScreen(),
  );
}
