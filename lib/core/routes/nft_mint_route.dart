part of 'router.dart';


@TypedGoRoute<NFTMintViewRoute>(path: '/nft-mint')
class NFTMintViewRoute extends GoRouteData {
  const NFTMintViewRoute();
  @override
  Widget build(context, state) => const NFTMintView();
}

@TypedGoRoute<NFTMintDetailsViewRoute>(path: '/nft-mint-details')
class NFTMintDetailsViewRoute extends GoRouteData {
  const NFTMintDetailsViewRoute();
  @override
  Widget build(context, state) => const NFTMintDetailsView();
}