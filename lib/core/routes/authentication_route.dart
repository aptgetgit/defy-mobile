part of 'router.dart';

@TypedGoRoute<AuthenticationRoute>(
  path: '/authentication',
)
class AuthenticationRoute extends GoRouteData {
  const AuthenticationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthenticationScreen();
  }
}
