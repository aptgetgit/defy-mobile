part of 'router.dart';

@TypedGoRoute<HomeRoute>(
  path: '/home',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}
