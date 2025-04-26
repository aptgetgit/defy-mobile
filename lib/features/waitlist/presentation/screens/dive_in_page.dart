import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/logging/app_logger.dart';
import '../providers/onboarding_provider.dart';

class DiveInPage extends ConsumerStatefulWidget {
  const DiveInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => DiveInPageState();
}

class DiveInPageState extends ConsumerState<DiveInPage> {
  bool _showContent = false;
  bool _showDelayedText = false;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 1), () {
      setState(() => _showContent = true);
    });
  }

  void _triggerExitAnimation() {
    ref.read(exitAnimationProvider.notifier).state = true;

    Future<void>.delayed(const Duration(milliseconds: 500), () {
      setState(() => _showDelayedText = true);
    });

    AppLogger.debug(
      'Exit animation triggered : ${ref.read(exitAnimationProvider)}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool showExitAnimation = ref.watch(exitAnimationProvider);
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: _showContent
            ? Stack(
                children: <Widget>[
                  _buildAnimatedImage(
                    asset: 'assets/images/dive-in-1.png',
                    top: 40,
                    right: 160,
                    width: 72,
                    height: 72,
                    isVertical: true,
                    showExitAnimation: showExitAnimation,
                  ),
                  _buildAnimatedImage(
                    asset: 'assets/images/dive-in-2.png',
                    top: 80,
                    right: -4,
                    width: 64,
                    height: 64,
                    showExitAnimation: showExitAnimation,
                  ),
                  _buildAnimatedImage(
                    asset: 'assets/images/dive-in-3.png',
                    top: 220,
                    right: -10,
                    width: 76,
                    height: 76,
                    showExitAnimation: showExitAnimation,
                  ),
                  _buildAnimatedImage(
                    asset: 'assets/images/dive-in-4.png',
                    bottom: 400,
                    right: 0,
                    width: 62,
                    height: 62,
                    showExitAnimation: showExitAnimation,
                  ),
                  _buildAnimatedImage(
                    asset: 'assets/images/dive-in-5.png',
                    bottom: 40,
                    right: -24,
                    width: 92,
                    height: 92,
                    showExitAnimation: showExitAnimation,
                  ),
                  _buildAnimatedImage(
                    asset: 'assets/images/dive-in-6.png',
                    bottom: 0,
                    left: -10,
                    width: 94,
                    height: 94,
                    slideFromRight: false,
                    showExitAnimation: showExitAnimation,
                  ),
                  _buildAnimatedImage(
                    asset: 'assets/images/dive-in-7.png',
                    bottom: 260,
                    left: -24,
                    width: 102,
                    height: 102,
                    slideFromRight: false,
                    showExitAnimation: showExitAnimation,
                  ),
                  _buildAnimatedImage(
                    asset: 'assets/images/dive-in-8.png',
                    top: 300,
                    left: 0,
                    width: 80,
                    height: 80,
                    slideFromRight: false,
                    showExitAnimation: showExitAnimation,
                  ),
                  _buildAnimatedEmoji(
                    asset: 'assets/images/star-struck.gif',
                    size: 44,
                    backgroundColor: const Color(0xff8B5DFF),
                    bottom: 260,
                    right: -20,
                    padding: const EdgeInsets.all(12),
                    showExitAnimation: showExitAnimation,
                  ),
                  _buildAnimatedEmoji(
                    asset: 'assets/images/grinning-face-with-smiling-eyes.gif',
                    size: 36,
                    backgroundColor: const Color(0xff3282FF),
                    top: 160,
                    left: 10,
                    padding: const EdgeInsets.all(12),
                    slideFromRight: false,
                    showExitAnimation: showExitAnimation,
                  ),
                  _buildAnimatedEmoji(
                    asset: 'assets/images/slightly-smiling-face.gif',
                    size: 28,
                    backgroundColor: const Color(0xffF0B90B),
                    padding: const EdgeInsets.all(6),
                    top: 60,
                    left: 40,
                    slideFromRight: false,
                    showExitAnimation: showExitAnimation,
                  ),
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 320),
                      _buildAnimatedText(
                        "Let's get started",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        showExitAnimation: showExitAnimation,
                      ),
                      const SizedBox(height: 6),
                      _buildAnimatedText(
                        (_showDelayedText && showExitAnimation)
                            ? 'Entering Defy Beta App'
                            : 'Welcome to Defy App',
                        style: const TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        showExitAnimation: showExitAnimation,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(40),
                            onTap: _triggerExitAnimation,
                            child: _buildLoginButton(
                              'Dive In',
                              showExitAnimation: showExitAnimation,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'By continuing, you agree to our User \nAgreement and Privacy Policy ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyLight,
                        ),
                        textAlign: TextAlign.center,
                      )
                          .animate()
                          .fade(
                            duration: 300.ms,
                            delay: 300.ms,
                            curve: Curves.easeInOut,
                          )
                          .animate(target: showExitAnimation ? 1 : 0)
                          .fadeOut(duration: 300.ms),
                      const SizedBox(height: 48),
                    ],
                  ),
                ],
              )
            : Container(color: Colors.white),
      ),
    );
  }

  Widget _buildAnimatedImage({
    required String asset,
    required double width,
    required double height,
    required bool showExitAnimation,
    double? top,
    double? right,
    double? bottom,
    double? left,
    bool isVertical = false,
    bool slideFromRight = true,
  }) =>
      Positioned(
        top: top,
        right: right,
        bottom: bottom,
        left: left,
        child: Image.asset(
          asset,
          width: width,
          height: height,
          fit: BoxFit.contain,
        )
            .animate()
            .custom(
              duration: 1000.ms,
              curve: Curves.easeOutBack,
              begin: 0,
              end: 1,
              builder: (BuildContext context, double value, Widget child) =>
                  Transform.translate(
                offset: isVertical
                    ? Offset(2, -height * (1 - value))
                    : Offset(
                        (slideFromRight ? width : -width) * (1 - value),
                        0,
                      ),
                child: child,
              ),
            )
            .animate(target: showExitAnimation ? 1 : 0)
            .custom(
              duration: 2000.ms,
              curve: Curves.easeOutExpo,
              begin: 0,
              end: 1,
              builder: (BuildContext context, double value, Widget child) =>
                  Transform.translate(
                offset: isVertical
                    ? Offset(0, -height * 2 * value)
                    : Offset(
                        (slideFromRight ? width : -width) * value,
                        0,
                      ),
                child: child,
              ),
            ),
      );

  Widget _buildAnimatedEmoji({
    required String asset,
    required double size,
    required Color backgroundColor,
    required EdgeInsetsGeometry padding,
    required bool showExitAnimation,
    double? top,
    double? right,
    double? bottom,
    double? left,
    bool slideFromRight = true,
  }) =>
      Positioned(
        top: top,
        right: right,
        bottom: bottom,
        left: left,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(size),
          ),
          child: Image.asset(
            asset,
            width: size,
            height: size,
            fit: BoxFit.contain,
          ),
        )
            .animate()
            .custom(
              duration: 1000.ms,
              curve: Curves.easeOutBack,
              begin: 0,
              end: 1,
              builder: (BuildContext context, double value, Widget child) =>
                  Transform.translate(
                offset: Offset(
                  (slideFromRight ? size : -size) * (1 - value),
                  0,
                ),
                child: child,
              ),
            )
            .animate(target: showExitAnimation ? 1 : 0)
            .custom(
              duration: 2000.ms,
              curve: Curves.easeOutExpo,
              begin: 0,
              end: 1,
              builder: (BuildContext context, double value, Widget child) =>
                  Transform.translate(
                offset: Offset(
                  (slideFromRight ? size * 10 : -size * 10) * value,
                  0,
                ),
                child: child,
              ),
            ),
      );

  Widget _buildLoginButton(String text, {required bool showExitAnimation}) =>
      Container(
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: AppColors.greyMedium),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(
          child: GestureDetector(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      )
          .animate()
          .fade(duration: 300.ms, delay: 300.ms, curve: Curves.easeInOut)
          .animate(target: showExitAnimation ? 1 : 0)
          .fadeOut(duration: 300.ms, curve: Curves.easeInOut);

  Widget _buildAnimatedText(
    String text, {
    required TextStyle style,
    required bool showExitAnimation,
  }) =>
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Text(
          text,
          key: ValueKey<String>('text-$text-$_showDelayedText'),
          style: style,
          textAlign: TextAlign.center,
        ),
      )
          .animate(target: _showContent ? 1 : 0)
          .slideY(
            duration: 600.ms,
            begin: 1,
            end: 0,
            curve: Curves.easeOutBack,
          )
          .fadeIn(duration: 300.ms)
          .animate(target: showExitAnimation ? 1 : 0)
          .fadeOut(delay: 1500.ms, duration: 300.ms);
}
