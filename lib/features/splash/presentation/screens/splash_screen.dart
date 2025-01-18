import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AnimationController animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final Animation<double> sizeAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    final Animation<double> opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1, curve: Curves.easeIn),
      ),
    );

    useEffect(
      () {
        animationController.forward();

        void handleAnimationComplete(AnimationStatus status) {
          if (status == AnimationStatus.completed && context.mounted) {
            const OnboardingRoute().go(context);
          }
        }

        animationController.addStatusListener(handleAnimationComplete);

        return () {
          animationController.removeStatusListener(handleAnimationComplete);
        };
      },
      const <Object?>[],
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) => Opacity(
            opacity: opacityAnimation.value,
            child: Transform.scale(
              scale: sizeAnimation.value,
              child: Assets.icons.appIcon.image(
                width: 300,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace,) {
                  debugPrint('Image error: $error');
                  return const SizedBox(width: 300, height: 300);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
