part of 'router.dart';


@TypedGoRoute<BrowserRoute>(
  path: '/browser',
)
class BrowserRoute extends GoRouteData {
  const BrowserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BrowserView();
  }
}
