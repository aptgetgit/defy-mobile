part of 'router.dart';


@TypedGoRoute<LeverageTradingViewRoute>(path: '/leverage-trading')
class LeverageTradingViewRoute extends GoRouteData {
  const LeverageTradingViewRoute();
  @override
  Widget build(context, state) => const LeverageTradingView();
}


@TypedGoRoute<LeverageTradingPairViewRoute>(path: '/leverage-trading-pair')
class LeverageTradingPairViewRoute extends GoRouteData {
  const LeverageTradingPairViewRoute();
  @override
  Widget build(context, state) => LeverageTradingPairView();
}