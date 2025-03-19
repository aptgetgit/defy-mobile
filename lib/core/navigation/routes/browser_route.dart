part of 'router.dart';

@TypedGoRoute<BrowserRoute>(path: '/browser')
class BrowserRoute extends GoRouteData {
  const BrowserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const BrowserScreen();

  static final AppRoute route = AppRoute.protected(
    builder: (BuildContext context, GoRouterState state) => const BrowserScreen(),
  );
}
