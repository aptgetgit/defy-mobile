

part of 'router.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => CustomTransitionPage(
      key: state.pageKey,
      child: const SplashScreen(),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => ZoomTransition(animation: animation, child: child),
    );

  static final AppRoute route = AppRoute.public(
    redirectIfAuthenticated: const HomeRoute().location,
    builder: (BuildContext context, GoRouterState state) =>
        const SplashScreen(),
  );
}

class ZoomTransition extends StatelessWidget {

  const ZoomTransition({
    required this.child, required this.animation, super.key,
  });

    final Widget child;
  final Animation<double> animation;


  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) => Transform.scale(
          scale: Tween<double>(begin: 0, end: 1)
              .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut))
              .value,
          child: child,
        ),
      child: child,
    );
}
