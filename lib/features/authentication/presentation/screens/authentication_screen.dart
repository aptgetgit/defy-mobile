import 'dart:ui';

import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/providers/network_connectivity_provider.dart';
import 'package:defy/features/authentication/presentation/providers/account_data_state_provider.dart';
import 'package:defy/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/routes/router.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_flow_manager.dart';
import 'package:defy/core/providers/credential_manager_provider.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_state_notifier.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthenticationScreen extends ConsumerStatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  ConsumerState<AuthenticationScreen> createState() =>
      _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {
  bool _isAutoSigningIn = false;

  @override
  void initState() {
    super.initState();
    final credentialManager = ref.read(credentialManagerServiceProvider);
    if (credentialManager.isSupportedPlatform) {
      // tryAutoSignIn();
    }
  }

  Future<void> tryAutoSignIn() async {
    final notifier = ref.read(authenticationNotifierProvider.notifier);
    final credentialManager = ref.read(credentialManagerServiceProvider);
    final flowManager = ref.read(authenticationFlowManagerProvider.notifier);
    final isOnline = ref.read(isOnlineProvider).valueOrNull ?? false;

    if (!isOnline) return;

    setState(() => _isAutoSigningIn = true);

    try {
      final credentials = await credentialManager.getCredentials();
      if (credentials.googleIdTokenCredential != null) {
        await notifier.initiateLogin(const InitiateLoginOptions.withOIDC());
        flowManager.updateLoginFlowWithOIDC(
            provider: 'google',
            idToken: credentials.googleIdTokenCredential!.idToken);
        await notifier.completeLogin();
        HomeRoute().replace(context);
      } else {
        AppLogger.info("Auto Sign In failed");
      }
    } catch (e) {
      print('Auto sign-in failed: ${e.toString()}');
    } finally {
      setState(() => _isAutoSigningIn = false);
    }
  }

  Future<void> googleLogin() async {
    ref.read(accountDataStateProvider.notifier).setProvider('google');
    final notifier = ref.read(authenticationNotifierProvider.notifier);
    final credentialManager = ref.read(credentialManagerServiceProvider);
    final flowManager = ref.read(authenticationFlowManagerProvider.notifier);

    try {
      final googleIdTokenCredential =
          await credentialManager.saveGoogleCredential();

      if (googleIdTokenCredential != null) {
        await notifier.initiateLogin(const InitiateLoginOptions.withOIDC());

        flowManager.updateLoginFlowWithOIDC(
          provider: 'google',
          idToken: googleIdTokenCredential.idToken,
        );

        await notifier.completeLogin();
      } else {
        _showErrorSnackBar('Google Sign-In failed');
      }
    } on Exception catch (e) {
      AppLogger.debug("error in google Login");
      _showErrorSnackBar('Error during Google Sign-In: ${e.toString()}');
    }
  }

  Future<void> appleLogin() async {
    ref.read(accountDataStateProvider.notifier).setProvider('apple');
    final notifier = ref.read(authenticationNotifierProvider.notifier);
    final flowManager = ref.read(authenticationFlowManagerProvider.notifier);

    try {
      final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [AppleIDAuthorizationScopes.email], nonce: "testertagger");

      if (credential.identityToken != null) {
        await notifier.initiateLogin(const InitiateLoginOptions.withOIDC());

        flowManager.updateLoginFlowWithOIDC(
          provider: 'apple',
          idToken: credential.identityToken!,
        );

        await notifier.completeLogin();
        HomeRoute().replace(context);
      } else {
        _showErrorSnackBar('Apple Sign-In failed');
      }
    } catch (e) {
      _showErrorSnackBar('Error during Apple Sign-In: ${e.toString()}');
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final (width, height) = (context.screenWidth, context.screenHeight);
    final isDark = context.isDarkMode;
    final isOnline = ref.watch(isOnlineProvider);
    final networkStatus = ref.watch(networkStatusProvider);

    if (_isAutoSigningIn) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0XFF646D80)),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: width * .0943,
              top: height * .1238,
              child: Container(
                height: height * .0481,
                width: width * .1046,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.yellow,
                ),
                child: Assets.gifs.slightlySmilingFace.image(
                  width: width * .0608,
                ),
              ),
            ).animate().scaleXY(
                  duration: Duration(milliseconds: 550),
                  curve: Curves.easeOut,
                ),
            Positioned(
              left: width * .4886,
              top: height * .0560,
              child: Assets.images.onboardingNft1.image(
                width: width * .1148,
                height: height * .0531,
              ),
            ).animate().scale(
                  duration: Duration(milliseconds: 550),
                  curve: Curves.easeOut,
                ),
            Positioned(
              left: width * .3214,
              top: height * .3670,
              child: Assets.images.onboardingNft6.image(
                width: width * .1148,
                height: height * .0531,
              ),
            ).animate().scale(
                  duration: Duration(milliseconds: 550),
                  curve: Curves.easeOut,
                ),
            Positioned(
              left: width * .5785,
              top: height * .4230,
              child: Container(
                height: height * .0543,
                width: width * .1173,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.blueLight,
                ),
                child: Assets.gifs.grinningFaceWithSmilingEyes.image(
                  width: width * .0683,
                ),
              ),
            ).animate().scale(
                  duration: Duration(milliseconds: 550),
                  curve: Curves.easeOut,
                ),
            Positioned(
              right: 12,
              top: height * .2526,
              child: Assets.images.onboardingNft3.image(
                width: width * .1377,
                height: height * .0637,
              ),
            ).animate().scale(
                  duration: Duration(milliseconds: 550),
                  curve: Curves.easeOut,
                ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 3.0,
                  sigmaY: 3.0,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            //------------//
            Positioned(
              right: 5,
              top: height * .0898,
              child: Assets.images.onboardingNft2.image(
                width: width * .1654,
                height: height * .0765,
              ),
            ).animate().slideX(
                  duration: Duration(milliseconds: 550),
                  begin: 1.5,
                  end: 0,
                  curve: Curves.easeOut,
                ),
            Positioned(
              right: 4,
              top: height * .4174,
              child: Assets.icons.coinLogo.image(
                width: width * .16,
                height: height * .0739,
              ),
            ).animate().slideX(
                  duration: Duration(milliseconds: 550),
                  begin: 1.5,
                  end: 0,
                  curve: Curves.easeOut,
                ),
            Positioned(
              left: -(width * .0561),
              top: height * .2594,
              child: Assets.images.aptosLogo.image(
                width: width * .1587,
                height: height * .0732,
              ),
            ).animate().slideX(
                  duration: Duration(milliseconds: 550),
                  begin: -1,
                  end: 0,
                  curve: Curves.easeOut,
                ),
            Positioned(
              left: width * .25,
              top: height * .5430,
              child: Assets.images.onboardingNft4
                  .image(
                    width: width * .2580,
                    height: height * .1192,
                  )
                  .animate()
                  .slideY(
                    duration: Duration(milliseconds: 550),
                    begin: 1,
                    end: 0,
                    curve: Curves.easeOut,
                  ),
            ),
            Positioned(
              right: width * .05,
              top: height * .6011,
              child: Container(
                height: height * .0820,
                width: width * .1770,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF8b5dff),
                ),
                child: Assets.gifs.starStruck.image(
                  width: width * .1031,
                ),
              ),
            ).animate().slideX(
                  duration: Duration(milliseconds: 550),
                  begin: 1.5,
                  end: 0,
                  curve: Curves.easeOut,
                ),
            Positioned(
              left: width * .0408,
              top: height * .5801,
              child: Container(
                height: height * .0513,
                width: width * .1111,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFA7AA2),
                ),
                child: Assets.gifs.smilingFaceWithHearts.image(
                  width: width * .0646,
                ),
              ),
            ).animate().slideX(
                  duration: Duration(milliseconds: 550),
                  begin: -1,
                  end: 0,
                  curve: Curves.easeOut,
                ),
            Positioned(
              left: -(width * .0454),
              top: height * .4078,
              child: Assets.images.onboardingNft5.image(
                width: width * .1940,
                height: height * .0812,
              ),
            ).animate().slideX(
                  duration: Duration(milliseconds: 550),
                  begin: -1,
                  end: 0,
                  curve: Curves.easeOut,
                ),
            Positioned(
              top: height * .1474,
              left: 0,
              right: 0,
              child: SizedBox(
                height: height * .1722,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.appLogoDark
                        .image(width: width * .1589, height: height * .0872),
                    const Gap(4),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Let\'s get started',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        const Gap(4),
                        const Text(
                          'Sign up or recover your account.',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0XFF979DAA),
                          ),
                        ),
                      ],
                    ).animate().slideY(
                          duration: Duration(milliseconds: 500),
                          begin: 3,
                          end: 0,
                          curve: Curves.easeOut,
                        ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer(
                    builder:(ctx,ref,child){
                      final authState = ref.watch(authenticationNotifierProvider);
                      return _SocialSignInButton(
                      onPressed: isOnline.whenOrNull(
                        data: (online) =>
                            online && !authState.isLoading ? googleLogin : null,
                      ),
                      isLoading: authState.isLoading,
                      icon: Assets.icons.google.image(width: 32),
                      label: 'Continue with Google',
                    );
                    }
                  ),
                  Gap(height * 0.03),
                  const _TermsAndPrivacyText(),
                  Gap(height * .0644),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialSignInButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget icon;
  final String label;
  final bool isDark;

  const _SocialSignInButton({
    required this.onPressed,
    required this.isLoading,
    required this.icon,
    required this.label,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: context.screenHeight * 0.0649,
      width: context.screenWidth * .6986,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: isDisabled
              ? Colors.grey.shade100
              : isDark
                  ? Colors.black
                  : Colors.white,
          side: BorderSide(
            color: isDisabled
                ? Colors.grey.shade300
                : isDark
                    ? Colors.black
                    : Colors.grey.shade400,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isDark ? Colors.white : const Color(0XFF646D80),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const Gap(12),
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: isDisabled
                          ? const Color(0XFF646D80).withOpacity(0.5)
                          : isDark
                              ? Colors.white
                              : const Color(0XFF646D80),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _NetworkStatusBanner extends StatelessWidget {
  final String message;
  final Color color;
  final IconData icon;

  const _NetworkStatusBanner({
    required this.message,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withOpacity(0.1),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 16),
              const Gap(8),
              Text(
                message,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TermsAndPrivacyText extends StatelessWidget {
  const _TermsAndPrivacyText();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: " and ",
              style: TextStyle(
                color: AppColors.greyLight,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: "Privacy Policy",
              style: TextStyle(
                color: AppColors.greyDark,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
