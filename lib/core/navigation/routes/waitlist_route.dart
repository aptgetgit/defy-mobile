part of 'router.dart';

@TypedGoRoute<WaitlistPrimaryScreenRoute>(path: '/waitlist')

class WaitlistPrimaryScreenRoute extends GoRouteData {
  const WaitlistPrimaryScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WaitlistPrimaryScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const WaitlistPrimaryScreen(),
  );
}



