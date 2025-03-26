part of 'router.dart';

@TypedGoRoute<ReceiveScreenRoute>(path: '/receive')
class ReceiveScreenRoute extends GoRouteData {
  const ReceiveScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ReceiveScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => const ReceiveScreen(),
  );
}

@TypedGoRoute<ReceiveSelectScreenRoute>(path: '/receive-select')
class ReceiveSelectScreenRoute extends GoRouteData {
  const ReceiveSelectScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ReceiveFlowScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => const ReceiveFlowScreen(),
  );
}