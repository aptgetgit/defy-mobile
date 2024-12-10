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

@TypedGoRoute<AccountCreationRoute>(path: '/account-creation')
class AccountCreationRoute extends GoRouteData {
  const AccountCreationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AccountCreationScreen();

  static final AppRoute route = AppRoute.protected(
    builder: (context, state) => const AccountCreationScreen(),
  );
}

@TypedGoRoute<WelcomeBackScreenRoute>(path: '/welcome-back')
class WelcomeBackScreenRoute extends GoRouteData {
  const WelcomeBackScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const WelcomeBackScreen();

  static final AppRoute route = AppRoute.protected(
    builder: (context, state) => const WelcomeBackScreen(),
  );
}
