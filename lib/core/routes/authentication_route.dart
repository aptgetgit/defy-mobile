part of 'router.dart';

@TypedGoRoute<AuthenticationRoute>(path: '/auth')
class AuthenticationRoute extends GoRouteData {
  const AuthenticationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AuthenticationScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => const AuthenticationScreen(),
  );
}
