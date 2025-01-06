part of 'router.dart';

@TypedGoRoute<TestRoute>(
  path: '/test',
)
class TestRoute extends GoRouteData {
  const TestRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TestScreen();
  }
}
