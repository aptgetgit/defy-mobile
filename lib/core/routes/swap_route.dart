part of 'router.dart';

@TypedGoRoute<SingleSwapScreenRoute>(path: '/swap')
class SingleSwapScreenRoute extends GoRouteData {
  const SingleSwapScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => SingleSwapScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (context, state) => SingleSwapScreen(),
  );
}

@TypedGoRoute<SwapTokensRoute>(path: '/swap-tokens')
class SwapTokensRoute extends GoRouteData {
  final bool $extra;
  const SwapTokensRoute({required this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) => TokensScreen(isSwapFrom: $extra);
}