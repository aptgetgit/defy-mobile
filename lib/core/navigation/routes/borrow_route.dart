part of 'router.dart';

@TypedGoRoute<BorrowRoute>(path: '/borrow')
class BorrowRoute extends GoRouteData {
  const BorrowRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BorrowScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const BorrowScreen(),
  );
}

@TypedGoRoute<BorrowAmountRoute>(path: '/borrow-amount')
class BorrowAmountRoute extends GoRouteData {
  const BorrowAmountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BorrowAmountScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const BorrowAmountScreen(),
  );
}
