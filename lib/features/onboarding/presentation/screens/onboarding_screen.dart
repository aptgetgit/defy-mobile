import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';

import '../../../../core/dio/providers/locale/locale_provider.dart';
import '../../../../core/extensions/button_size_extension.dart';
import '../../../../core/extensions/context_extensions.dart';

import '../../../../l10n/generated/app_localizations.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  static const int _pageCount = 4;
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController()..addListener(_handlePageChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(precacheImage(Assets.icons.appIcon.provider(), context));
    });
  }

  void _handlePageChange() {
    if (!mounted) {
      return;
    }
    final int page = _pageController.page?.round() ?? 0;
    if (_currentPage != page) {
      setState(() => _currentPage = page);
    }
  }

  void _onPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_handlePageChange)
      ..dispose();
    super.dispose();
  }

  void _skipOnboarding(BuildContext context) {
    const LoginPageRoute().pushReplacement(context);
  }

  void _finishOnboarding(BuildContext context) {
    const LoginPageRoute().pushReplacement(context);
  }

  @override
  Widget build(BuildContext context) {
    final (double width, double height) =
        (context.screenWidth, context.screenHeight);
    final bool isDark = context.isDarkMode;
    final AppLocalizations l10n = ref.watch(l10nProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            children: <Widget>[
              _buildHeader(context, isDark, l10n),
              Expanded(child: _buildPageView(l10n)),
              _buildFooter(context, height, isDark, l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    bool isDark,
    AppLocalizations l10n,
  ) =>
      RepaintBoundary(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => unawaited(
                _pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              ),
              child: Assets.icons.appIcon.image(
                width: 50,
                frameBuilder: (
                  BuildContext context,
                  Widget child,
                  int? frame,
                  bool wasSynchronouslyLoaded,
                ) =>
                    child,
                errorBuilder: (
                  BuildContext context,
                  Object error,
                  StackTrace? stackTrace,
                ) =>
                    const SizedBox(width: 50, height: 50),
              ),
            ),
            TextButton.icon(
              icon:
                  const Icon(PhosphorIconsRegular.arrowCircleUpRight, size: 30),
              style: TextButton.styleFrom(
                foregroundColor: isDark ? AppColors.white : AppColors.black,
                textStyle: context.titleLarge,
              ),
              onPressed: () => _skipOnboarding(context),
              label: Text(l10n.onboardingSkipButton),
            ),
          ],
        ),
      );

  Widget _buildPageView(AppLocalizations l10n) {
    final List<(String, String)> content = <(String, String)>[
      (l10n.onboardingPage1Title, l10n.onboardingPage1Description),
      (l10n.onboardingPage2Title, l10n.onboardingPage2Description),
      (l10n.onboardingPage3Title, l10n.onboardingPage3Description),
      (l10n.onboardingPage4Title, l10n.onboardingPage4Description),
    ];

    return PageView.builder(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      itemCount: _pageCount,
      pageSnapping: true,
      padEnds: false,
      clipBehavior: Clip.none,
      itemBuilder: (BuildContext context, int index) {
        final (String title, String description) = content[index];
        return RepaintBoundary(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Image.asset(
                getImagePath(index),
                width: index == 1
                    ? context.screenWidth * 0.8
                    : context.screenWidth * 0.9,
                height: index == 1
                    ? context.screenHeight * 0.3
                    : context.screenHeight * 0.4,
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const Gap(8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color(0XFF646D80),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFooter(
    BuildContext context,
    double height,
    bool isDark,
    AppLocalizations l10n,
  ) =>
      Column(
        children: <Widget>[
          Gap(height * 0.05),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _currentPage < _pageCount - 1
                ? _buildPageIndicator(isDark)
                : _buildGetStartedButton(context, l10n),
          ),
          const Gap(30),
        ],
      );

  Widget _buildPageIndicator(bool isDark) => RepaintBoundary(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              _pageCount,
              (int index) => Padding(
                padding: const EdgeInsets.only(left: 5),
                child: _PageDot(
                  isActive: index == _currentPage,
                  isDark: isDark,
                  onTap: () => unawaited(
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  Widget _buildGetStartedButton(BuildContext context, AppLocalizations l10n) =>
      RepaintBoundary(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _finishOnboarding(context),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(ButtonSize.large.height),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              l10n.onboardingGetStartedButton,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        )
            .animate(
              target: _currentPage == _pageCount - 1 ? 1 : 0,
            )
            .slideY(
              begin: 1,
              end: 0,
              duration: const Duration(milliseconds: 280),
            ),
      );

  String getImagePath(int index) {
    if (index == 0) {
      return Assets.images.onboarding1.path;
    } else if (index == 1) {
      return Assets.images.onboarding2.path;
    } else if (index == 2) {
      return Assets.images.onboarding3.path;
    } else {
      return Assets.images.onboarding4.path;
    }
  }
}

class _PageDot extends StatelessWidget {
  const _PageDot({
    required this.isActive,
    required this.isDark,
    required this.onTap,
  });

  final bool isActive;
  final bool isDark;
  final VoidCallback onTap;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isActive', isActive))
      ..add(DiagnosticsProperty<bool>('isDark', isDark))
      ..add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap));
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(1),
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            border: Border.all(
              color: isActive
                  ? const Color(0XFF646D80)
                  : isDark
                      ? AppColors.black
                      : AppColors.white,
            ),
            shape: BoxShape.circle,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color:
                  isActive ? const Color(0XFF646D80) : const Color(0xFFEDF0F5),
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
}
