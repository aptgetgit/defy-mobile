part of 'router.dart';

@TypedGoRoute<NftInfoRoute>(path: '/nft-info')
class NftInfoRoute extends GoRouteData {
  const NftInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NftInfoScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const NftInfoScreen(),
  );
}

@TypedGoRoute<NftInfoAudioRoute>(path: '/nft-info-audio')
class NftInfoAudioRoute extends GoRouteData {
  const NftInfoAudioRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NftAudioScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const NftAudioScreen(),
  );
}

@TypedGoRoute<NftInfoVideoRoute>(path: '/nft-info-video')
class NftInfoVideoRoute extends GoRouteData {
  const NftInfoVideoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NftVideoScreen();

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const NftVideoScreen(),
  );
}