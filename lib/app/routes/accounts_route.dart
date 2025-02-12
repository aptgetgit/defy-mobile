part of 'router.dart';


@TypedGoRoute<WelcomeAgainScreenRoute>(path: '/welcome-again')
class WelcomeAgainScreenRoute extends GoRouteData {
  const WelcomeAgainScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WelcomeAgainScreen();

  static final AppRoute route = AppRoute.public(
    builder: (BuildContext context, GoRouterState state) =>
        const WelcomeAgainScreen(),
  );
}

@TypedGoRoute<ChooseWalletScreenRoute>(path: '/choose-wallet') 
class ChooseWalletScreenRoute extends GoRouteData {
  const ChooseWalletScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ChooseWalletScreen();

  static final AppRoute route = AppRoute.public(
    builder: (BuildContext context, GoRouterState state) =>
        const ChooseWalletScreen(),
  );
}
