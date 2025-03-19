import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/navigation/routes/router.dart';

class DiveInPage extends ConsumerStatefulWidget {
  const DiveInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => DiveInPageState();
}

class DiveInPageState extends ConsumerState<DiveInPage> {
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 1), () {
      setState(() => _showContent = true);
    });
  }

  @override
  Widget build(BuildContext context) => SafeArea(
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
                    ).animate().slideY(
                        duration: 600.ms, begin: -1, curve: Curves.easeOutBack,),
                    _buildAnimatedImage(
                      asset: 'assets/images/dive-in-2.png',
                      top: 80,
                      right: -4,
                      width: 64,
                      height: 64,
                    ).animate().slideX(
                        duration: 600.ms, begin: 1, curve: Curves.easeOutBack,),
                    _buildAnimatedImage(
                      asset: 'assets/images/dive-in-3.png',
                      top: 220,
                      right: -10,
                      width: 76,
                      height: 76,
                    ).animate().slideX(
                        duration: 600.ms, begin: 1, curve: Curves.easeOutBack,),
                    _buildAnimatedImage(
                      asset: 'assets/images/dive-in-4.png',
                      bottom: 400,
                      right: 0,
                      width: 62,
                      height: 62,
                    ).animate().slideX(
                        duration: 600.ms, begin: 1, curve: Curves.easeOutBack,),
                    _buildAnimatedImage(
                      asset: 'assets/images/dive-in-5.png',
                      bottom: 40,
                      right: -24,
                      width: 92,
                      height: 92,
                    ).animate().slideX(
                        duration: 600.ms, begin: 1, curve: Curves.easeOutBack,),
                    _buildAnimatedImage(
                      asset: 'assets/images/dive-in-6.png',
                      bottom: 0,
                      left: -10,
                      width: 94,
                      height: 94,
                    ).animate().slideX(
                        duration: 600.ms, begin: -1, curve: Curves.easeOutBack,),
                    _buildAnimatedImage(
                      asset: 'assets/images/dive-in-7.png',
                      bottom: 260,
                      left: -24,
                      width: 102,
                      height: 102,
                    ).animate().slideX(
                        duration: 600.ms, begin: -1, curve: Curves.easeOutBack,),
                    _buildAnimatedImage(
                      asset: 'assets/images/dive-in-8.png',
                      top: 300,
                      left: 0,
                      width: 80,
                      height: 80,
                    ).animate().slideX(
                        duration: 600.ms, begin: -1, curve: Curves.easeOutBack,),
                    Positioned(
                      bottom: 260,
                      right: -20,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xff8B5DFF),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Image.asset(
                          'assets/images/star-struck.gif',
                          width: 44,
                          height: 44,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ).animate().slideX(
                        duration: 600.ms, begin: 1, curve: Curves.easeOutBack,),
                    Positioned(
                      top: 160,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xff3282FF),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Image.asset(
                          'assets/images/grinning-face-with-smiling-eyes.gif',
                          width: 36,
                          height: 36,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ).animate().slideX(
                        duration: 600.ms, begin: -1, curve: Curves.easeOutBack,),
                    Positioned(
                      top: 60,
                      left: 40,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xffF0B90B),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Image.asset(
                          'assets/images/slightly-smiling-face.gif',
                          width: 28,
                          height: 28,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ).animate().slideX(
                          duration: 600.ms,
                          begin: -1,
                          curve: Curves.easeOutBack,
                        ),
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 240),
                        Center(
                          child: Image.asset(
                            'assets/icons/app-logo-dark-3d.png',
                            width: 68,
                            height: 68,
                          ).animate().slideY(
                                duration: 600.ms,
                                begin: 1,
                                curve: Curves.easeOutBack,
                              ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Let's get started",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ).animate().slideY(
                              duration: 600.ms,
                              begin: 1,
                              curve: Curves.easeOutBack,
                            ),
                        const SizedBox(height: 6),
                        const Text(
                          'Sign up or recover your account.',
                          style: TextStyle(
                            color: AppColors.greyLight,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ).animate().slideY(
                              duration: 600.ms,
                              begin: 1,
                              curve: Curves.easeOutBack,
                            ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => const WaitlistScreenRoute().go(context),
                          child: _buildLoginButton(
                            'Dive In',
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'By continuing, you agree to our User \nAgreement and Privacy Policy ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyLight,),
                          textAlign: TextAlign.center,
                        ).animate().fade(
                            duration: 300.ms,
                            delay: 300.ms,
                            curve: Curves.easeInOut,),
                        const SizedBox(height: 64),
                      ],
                    ),
                  ],
                )
              : Container(color: Colors.white),
        ),
      );

  Widget _buildAnimatedImage({
    required String asset,
    required double width,
    required double height,
    double? top,
    double? right,
    double? bottom,
    double? left,
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
        ),
      );

  Widget _buildLoginButton(String text) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 64),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: AppColors.greyMedium),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/icons/app-logo-dark-3d.png',
                width: 36, height: 36,),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ).animate().fade(duration: 300.ms, delay: 300.ms);
}
