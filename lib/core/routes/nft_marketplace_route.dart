part of 'router.dart';

@TypedGoRoute<NFTMarketplaceScreenRoute>(path: '/marketplace')
class NFTMarketplaceScreenRoute extends GoRouteData {
  const NFTMarketplaceScreenRoute();
  @override
  Widget build(context, state) => const NFTMarketplaceScreen();
}