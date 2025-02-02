part of 'router.dart';

@TypedGoRoute<OnboardingRoute>(path: '/onboarding')
class OnboardingRoute extends GoRouteData {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const OnboardingScreen(),
  );
}

@TypedGoRoute<LoginPageRoute>(path: '/login')
class LoginPageRoute extends GoRouteData {
  const LoginPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      ZoomInFadeTransition(
        context: context,
        state: state,
        child: const LoginPage(),
      );

  static final AppRoute route = AppRoute.public(
    builder: (BuildContext context, GoRouterState state) => const LoginPage(),
  );
}

@TypedGoRoute<AccountSetUpFullNameScreenRoute>(
    path: '/account-set-up-full-name')
class AccountSetUpFullNameScreenRoute extends GoRouteData {
  const AccountSetUpFullNameScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AccountSetUpFullNameScreen();

  static final AppRoute route = AppRoute.protected(
    builder: (BuildContext context, GoRouterState state) =>
        const AccountSetUpFullNameScreen(),
  );
}

@TypedGoRoute<AccountSetUpUsernameScreenRoute>(path: '/account-set-up-username')
class AccountSetUpUsernameScreenRoute extends GoRouteData {
  const AccountSetUpUsernameScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AccountSetUpUserNameScreen();

  static final AppRoute route = AppRoute.protected(
    builder: (BuildContext context, GoRouterState state) =>
        const AccountSetUpUserNameScreen(),
  );
}
