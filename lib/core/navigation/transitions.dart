import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadeTransitionPage<T> extends CustomTransitionPage<T> {
  FadeTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SmoothFadeTransition(
            animation: animation,
            child: child,
          ),
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
        );
}

class SmoothFadeTransition extends StatelessWidget {
  const SmoothFadeTransition({
    required this.animation,
    required this.child,
    super.key,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const double begin = 0;
    const double end = 1;
    const Cubic curve = Curves.easeInOutQuad;

    final Animatable<double> opacityTween =
        Tween<double>(begin: begin, end: end).chain(CurveTween(curve: curve));

    final Animatable<double> scaleTween =
        Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: curve));

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) => Opacity(
        opacity: opacityTween.evaluate(animation),
        child: Transform.scale(
          scale: scaleTween.evaluate(animation),
          child: child,
        ),
      ),
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Animation<double>>('animation', animation));
  }
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
    const Offset begin = Offset(0, 1);
    const Offset end = Offset.zero;
    const Cubic curve = Curves.easeInOutQuart;

    final Animatable<Offset> tween =
        Tween<Offset>(begin: begin, end: end).chain(CurveTween(curve: curve));

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) => SlideTransition(
        position: animation.drive(tween),
        child: child,
      ),
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<Animation<double>>('animation', animation));
  }
}
