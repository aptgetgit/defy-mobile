part of 'router.dart';

@TypedGoRoute<LendBorrowViewRoute>(path: '/lend-borrow')
class LendBorrowViewRoute extends GoRouteData {
  const LendBorrowViewRoute();
  @override
  Widget build(context, state) => const LendBorrowView();
}