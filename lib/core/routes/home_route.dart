part of 'router.dart';

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();

  static final AppRoute route = AppRoute.protected(
    builder: (context, state) => const HomeScreen(),
  );
}
