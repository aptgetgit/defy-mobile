import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
