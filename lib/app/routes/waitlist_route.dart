// ignore_for_file: prefer_expression_function_bodies

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
        ) {
          return SmoothBottomUpTransition(
            animation: animation,
            child: child,
          );
        },
      );

  static final AppRoute route = AppRoute.protected(
    builder: (BuildContext context, GoRouterState state) =>
        const WaitlistScreen(),
  );
}

class SmoothBottomUpTransition extends StatelessWidget {
  const SmoothBottomUpTransition({
    required this.animation,
    required this.child,
    super.key,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.15), // Start slightly below
              end: Offset.zero, // End at the top
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              ),
            ),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
