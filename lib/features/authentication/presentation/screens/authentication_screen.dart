import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:defy/features/authentication/presentation/provider/authentication_flow_manager.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/authentication/presentation/provider/authentication_notifier.dart';


class AuthenticationScreen extends ConsumerStatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  ConsumerState<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  Future<void> googleLogin() async {
    final notifier = ref.read(authenticationNotifierProvider.notifier);
    
    final idToken = await notifier.signInWithGoogle();
    
    if (idToken != null) {
      await notifier.initiateLogin(const InitiateLoginOptions.withOIDC());
      
      await notifier.completeLogin(
        CompleteLoginOptions.withOIDC(
          flowId: ref.read(authenticationFlowManagerProvider)!.flowId,
          provider: 'google',
          idToken: idToken,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Google Sign-In failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final (width, height) = (context.screenWidth, context.screenHeight);
    final isDark = context.isDarkMode;
    final authState = ref.watch(authenticationNotifierProvider);

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,
          top: height * 0.08,
          bottom: height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDark
                    ? Assets.icons.appLogoLight.image(width: 50)
                    : Assets.icons.appLogoDark.image(width: 50),
              ],
            ),
            Gap(height * 0.04),
            const Text(
              'Let\'s get started',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Gap(height * 0.008),
            const Text(
              'Sign up or recover your wallet by entering your\nemail below',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color(0XFF979DAA),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: height * 0.065,
              child: OutlinedButton(
                onPressed: authState.isLoading ? null : googleLogin,
                child: authState.isLoading
                  ? const CircularProgressIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.icons.google.image(width: 32),
                        const Gap(12),
                        const Text('Login with Google',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0XFF646D80),
                          )),
                      ],
                    ),
              ),
            ),
            Gap(height * 0.03),
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "By continuing, you agree to our ",
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: "User\nAgreement",
                      style: TextStyle(
                          color: AppColors.greyDark,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: " and ",
                      style: TextStyle(
                          color: AppColors.greyLight, fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                          color: AppColors.greyDark,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}