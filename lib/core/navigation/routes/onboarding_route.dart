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

@TypedGoRoute<DiveInPageRoute>(path: '/dive-in')
class DiveInPageRoute extends GoRouteData {
  const DiveInPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DiveInPage();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) => const DiveInPage(),
  );
}
