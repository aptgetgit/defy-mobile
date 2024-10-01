import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _pageCount = 4;
  late final PageController _pageController;
  int _currentPage = 0;

  final List<(String, String)> _content = const [
    (
      "Unified Dapp ☝🏻",
      "Handle all assets, Access different\nDapps in one Dapp"
    ),
    (
      "Community🫂",
      "Follow Friends, Copy Trade, Coinvest\nwith onchain profile avatar"
    ),
    ("Security🔒", "Handle all assets, Access different\nDapps in one Dapp"),
    (
      "Rewards 😉",
      "Follow Friends, Copy Trade, Coinvest\nwith onchain profile avatar"
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  void _skipOnboarding(BuildContext context) {
    AuthenticationRoute().replace(context);
  }

  void _finishOnboarding(BuildContext context) {
    AuthenticationRoute().replace(context);
  }

  @override
  Widget build(BuildContext context) {
    final (width, height) = (context.screenWidth, context.screenHeight);
    final isDark = context.isDarkMode;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            children: [
              _buildHeader(context, isDark),
              Expanded(child: _buildPageView()),
              _buildFooter(context, height, isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _pageController.animateToPage(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut),
          child: isDark
              ? Assets.icons.appIcon.image(width: 50)
              : Assets.icons.appIcon.image(width: 50),
        ),
        TextButton.icon(
          icon: const Icon(PhosphorIconsRegular.arrowCircleUpRight, size: 30),
          style: TextButton.styleFrom(
              foregroundColor: isDark ? AppColors.white : AppColors.black,
              textStyle: context.titleLarge),
          onPressed: () => _skipOnboarding(context),
          label: const Text('Skip'),
        ),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      itemCount: _pageCount,
      itemBuilder: (context, index) {
        final (title, description) = _content[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
        );
      },
    );
  }

  Widget _buildFooter(BuildContext context, double height, bool isDark) {
    return Column(
      children: [
        Gap(height * 0.05),
        if (_currentPage < _pageCount - 1)
          _buildPageIndicator(isDark)
        else
          _buildGetStartedButton(context),
        const Gap(30),
      ],
    );
  }

  Widget _buildPageIndicator(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _pageCount,
          (index) => GestureDetector(
            onTap: () => _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
            child: Container(
              padding: const EdgeInsets.all(1),
              height: 18,
              width: 18,
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: index == _currentPage
                      ? const Color(0XFF646D80)
                      : isDark
                          ? AppColors.black
                          : AppColors.white,
                ),
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: index == _currentPage
                      ? const Color(0XFF646D80)
                      : const Color(0xFFEDF0F5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _finishOnboarding(context),
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(ButtonSize.large.height),
        ),
        child: const Text(
          'Let\'s get started',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    ).animate().slideY(
          begin: 1.0,
          end: 0.0,
          duration: const Duration(milliseconds: 280),
        );
  }
}
