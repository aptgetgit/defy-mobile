part of 'router.dart';

@TypedGoRoute<ReceiveScreenRoute>(path: '/receive')
class ReceiveScreenRoute extends GoRouteData {
  const ReceiveScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ReceiveScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ReceiveScreen(),
  );
}

@TypedGoRoute<ReceiveSelectScreenRoute>(path: '/receive-select')
class ReceiveSelectScreenRoute extends GoRouteData {
  const ReceiveSelectScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ReceiveSelectScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ReceiveSelectScreen(),
  );
}

@TypedGoRoute<ReceiveAmountScreenRoute>(path: '/receive-amount')
class ReceiveAmountScreenRoute extends GoRouteData {
  const ReceiveAmountScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ReceiveAmountScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ReceiveAmountScreen(),
  );
}

@TypedGoRoute<ReceiveShareScreenRoute>(path: '/receive-share')
class ReceiveShareScreenRoute extends GoRouteData {
  const ReceiveShareScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ReceiveShareScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ReceiveShareScreen(),
  );
}

@TypedGoRoute<ReceiveMethodScreenRoute>(path: '/receive-method')
class ReceiveMethodScreenRoute extends GoRouteData {
  const ReceiveMethodScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => ReceiveAmountScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => ReceiveAmountScreen(),
  );
}