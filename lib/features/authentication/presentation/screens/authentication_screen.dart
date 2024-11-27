import 'package:defy/core/di/providers/network/network_connectivity_provider.dart';
import 'package:defy/core/di/providers/services/credential_manager_service_provider.dart';
import 'package:defy/core/logging/app_logger.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/app/routes/router.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_flow_manager.dart';

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
      tryAutoSignIn();
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
        HomeRoute().replace(context);
      } else {
        _showErrorSnackBar('Google Sign-In failed');
      }
    } catch (e) {
      _showErrorSnackBar('Error during Google Sign-In: ${e.toString()}');
    }
  }

  Future<void> appleLogin() async {
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
    final authState = ref.watch(authenticationNotifierProvider);
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
      body: Column(
        children: [
          networkStatus.when(
            data: (status) => status.when(
              online: () => const SizedBox.shrink(),
              limited: () => _NetworkStatusBanner(
                message: 'Limited Connection',
                color: Colors.orange,
                icon: Icons.wifi_off,
              ),
              offline: () => _NetworkStatusBanner(
                message: 'No Internet Connection',
                color: Colors.red,
                icon: Icons.signal_wifi_off,
              ),
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          Expanded(
            child: Container(
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
                  _SocialSignInButton(
                    onPressed: isOnline.whenOrNull(
                      data: (online) =>
                          online && !authState.isLoading ? googleLogin : null,
                    ),
                    isLoading: authState.isLoading,
                    icon: Assets.icons.google.image(width: 32),
                    label: 'Continue with Google',
                  ),
                  Gap(height * 0.02),
                  FutureBuilder<bool>(
                    future: SignInWithApple.isAvailable(),
                    builder: (context, snapshot) {
                      final isAppleSignInAvailable = snapshot.data ?? false;

                      return isAppleSignInAvailable
                          ? _SocialSignInButton(
                              onPressed: isOnline.whenOrNull(
                                data: (online) => online && !authState.isLoading
                                    ? appleLogin
                                    : null,
                              ),
                              isLoading: authState.isLoading,
                              icon: const Icon(
                                Icons.apple,
                                size: 32,
                                color: Colors.white,
                              ),
                              label: 'Continue with Apple',
                              isDark: true,
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                  Gap(height * 0.03),
                  const _TermsAndPrivacyText(),
                ],
              ),
            ),
          ),
        ],
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
      height: context.screenHeight * 0.065,
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
            borderRadius: BorderRadius.circular(8),
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
