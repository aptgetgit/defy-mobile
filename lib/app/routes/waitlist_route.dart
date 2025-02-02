part of 'router.dart';

@TypedGoRoute<WaitlistScreenRoute>(path: '/waitlist')
class WaitlistScreenRoute extends GoRouteData {
  const WaitlistScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WaitlistScreen();

  static final AppRoute route = AppRoute.protected(
    builder: (BuildContext context, GoRouterState state) =>
        const WaitlistScreen(),
  );
}
