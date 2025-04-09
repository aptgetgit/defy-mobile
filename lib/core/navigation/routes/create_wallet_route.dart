part of 'router.dart';


// @TypedGoRoute<CreateWalletScreenRoute>(path: '/create-wallet')
// class CreateWalletScreenRoute extends GoRouteData {
//   const CreateWalletScreenRoute();

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const CreateWalletScreen();

//   static final AppRoute route = AppRoute.public(
//     builder: (BuildContext context, GoRouterState state) =>
//         const CreateWalletScreen(),
//   );
// }

@TypedGoRoute<CreateWalletSelectSeedPhraseScreenRoute>( path: '/create-wallet-select-seed-phrase')
class CreateWalletSelectSeedPhraseScreenRoute extends GoRouteData {
  const CreateWalletSelectSeedPhraseScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CreateWalletSelectSeedPhraseScreen();

  static final AppRoute route = AppRoute.public(
    builder: (BuildContext context, GoRouterState state) =>
        const CreateWalletSelectSeedPhraseScreen(),
  );
}
