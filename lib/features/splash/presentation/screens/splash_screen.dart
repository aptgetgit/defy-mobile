import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/routes/router.dart';
import 'package:defy/features/authentication/presentation/provider/authentication_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );
    final sizeAnimation = Tween<double>(begin: 50, end: 300).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
    final opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1, curve: Curves.easeIn),
      ),
    );

    useEffect(() {
      animationController.forward();
      _handleStartup(ref, context);
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Opacity(
              opacity: opacityAnimation.value,
              child: Assets.icons.appIcon.image(width: sizeAnimation.value),
            );
          },
        ),
      ),
    );
  }

  Future<void> _handleStartup(WidgetRef ref, BuildContext context) async {
    try {
      await Future.delayed(const Duration(milliseconds: 2000));
      if (!context.mounted) return;

      final authState = await ref.read(authenticationNotifierProvider.future);
      if (!context.mounted) return;

      final isLoggedIn = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );

      _navigateToNextScreen(context, isLoggedIn);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
      }
    }
  }

  void _navigateToNextScreen(BuildContext context, bool isLoggedIn) {
    if (isLoggedIn) {
      HomeRoute().pushReplacement(context);
    } else {
      OnboardingRoute().pushReplacement(context);
    }
  }
}