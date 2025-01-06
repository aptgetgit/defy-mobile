part of 'router.dart';

@TypedGoRoute<TokensInfoScreenRoute>(
  path: '/token_info',
)
class TokensInfoScreenRoute extends GoRouteData {
  const TokensInfoScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TokensInfoScreen();
  }
}
