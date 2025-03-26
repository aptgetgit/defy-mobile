import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Custom page transition that fades and slides up
class FadeSlideTransition extends CustomTransitionPage<void> {
  FadeSlideTransition({
    required Widget child,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    Key? key,
  }) : super(
          
          child: child,
          transitionDuration: transitionDuration,
          reverseTransitionDuration: reverseTransitionDuration,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            const begin = Offset(0.0, 0.1);
            const end = Offset.zero;
            
            // Create curve animations
            final tween = Tween(begin: begin, end: end);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            );
            
            // Combine slide and fade transitions
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: tween.animate(curvedAnimation),
                child: child,
              ),
            );
          },
        );
}