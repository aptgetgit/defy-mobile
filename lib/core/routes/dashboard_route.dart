part of 'router.dart';

@TypedGoRoute<DashboardRoute>(path: '/dashboard')
class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const DashboardScreen();

  static final AppRoute route = AppRoute.protected(
    builder: (context, state) => const DashboardScreen(),
  );
}