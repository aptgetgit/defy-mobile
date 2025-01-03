part of 'router.dart';


@TypedGoRoute<StakingPoolViewRoute>(path: '/staking-pool')
class StakingPoolViewRoute extends GoRouteData {
  const StakingPoolViewRoute();
  @override
  Widget build(context, state) => const StakingPoolView();
}