part of 'router.dart';

@TypedGoRoute<TokensInfoRoute>(path: '/token')
class TokensInfoRoute extends GoRouteData {
  const TokensInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TokensInfoScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const TokensInfoScreen(),
  );
}
