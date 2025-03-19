part of 'router.dart';

@TypedGoRoute<WaitlistScreenRoute>(path: '/waitlist')
class WaitlistScreenRoute extends GoRouteData {
  const WaitlistScreenRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage<void>(
        key: state.pageKey,
        child: const WaitlistScreen(),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) =>
            SmoothBottomUpTransition(
          animation: animation,
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
      );

  static final AppRoute route = AppRoute.protected(
    builder: (BuildContext context, GoRouterState state) =>
        const WaitlistScreen(),
  );
}
