import 'package:defy/core/constants/supported_currencies.dart';
import 'package:defy/core/di/providers/currency/preferred_currency_provider.dart';
import 'package:defy/core/di/providers/locale/locale_provider.dart';
import 'package:defy/l10n/generated/app_localizations.dart';
import 'package:defy/shared/currency/presentation/providers/currency_conversion_provider.dart';
import 'package:defy/shared/currency/presentation/providers/currency_rate_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/app/routes/router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  static const _pageCount = 4;
  late final PageController _pageController;
  int _currentPage = 0;

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
    final l10n = ref.watch(l10nProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            children: [
              _buildHeader(context, isDark, l10n),
              // Temporary Switchers
              Column(
                children: [
                  _buildTempLocaleSwitcher(),
                  const Gap(8),
                  _buildTempCurrencySwitcher(),
                ],
              ),
              Expanded(child: _buildPageView(l10n)),
              _buildFooter(context, height, isDark, l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, bool isDark, AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _pageController.animateToPage(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut),
          child: Assets.icons.appIcon.image(width: 50),
        ),
        TextButton.icon(
          icon: const Icon(PhosphorIconsRegular.arrowCircleUpRight, size: 30),
          style: TextButton.styleFrom(
              foregroundColor: isDark ? AppColors.white : AppColors.black,
              textStyle: context.titleLarge),
          onPressed: () => _skipOnboarding(context),
          label: Text(l10n.onboardingSkipButton),
        ),
      ],
    );
  }

  Widget _buildTempLocaleSwitcher() {
    final currentLocale = ref.watch(localeNotifierProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Temp Locale Switcher: '),
        DropdownButton<Locale>(
          value: currentLocale,
          items: AppLocalizations.supportedLocales.map((Locale locale) {
            return DropdownMenuItem<Locale>(
              value: locale,
              child: Text(locale.languageCode),
            );
          }).toList(),
          onChanged: (Locale? newLocale) {
            if (newLocale != null) {
              ref.read(localeNotifierProvider.notifier).setLocale(newLocale);
            }
          },
        ),
      ],
    );
  }

  Widget _buildTempCurrencySwitcher() {
    final currentCurrency = ref.watch(preferredCurrencyNotifierProvider);
    final currencyRatesAsync = ref.watch(currencyRateNotifierProvider);
    final l10n = ref.watch(l10nProvider);

    String getCurrencyName(String code) {
      switch (code.toLowerCase()) {
        case 'btc':
          return l10n.currencyBTC;
        case 'apt':
          return l10n.currencyAPT;
        case 'usd':
          return l10n.currencyUSD;
        case 'eur':
          return l10n.currencyEUR;
        case 'inr':
          return l10n.currencyINR;
        case 'jpy':
          return l10n.currencyJPY;
        default:
          return code.toUpperCase();
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Temp Currency Switcher: '),
            DropdownButton<String>(
              value: currentCurrency.code,
              items: SupportedCurrencies.all.map((currency) {
                return DropdownMenuItem<String>(
                  value: currency.code,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(currency.symbol),
                      const SizedBox(width: 8),
                      Text(currency.code.toUpperCase()),
                      const SizedBox(width: 8),
                      Text(
                        '(${getCurrencyName(currency.code)})',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0XFF646D80),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? newCurrencyCode) {
                if (newCurrencyCode != null) {
                  final newCurrency =
                      SupportedCurrencies.fromCode(newCurrencyCode);
                  if (newCurrency != null) {
                    ref
                        .read(preferredCurrencyNotifierProvider.notifier)
                        .setCurrency(newCurrency);
                  }
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        currencyRatesAsync.when(
          data: (_) => Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFEDF0F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Format Examples:',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                // Using the new conversion provider
                Text('Zero: ${NumberFormat.compactCurrency(
                  locale: l10n.localeName,
                  symbol: currentCurrency.symbol,
                  decimalDigits: 2,
                ).format(
                  ref.watch(
                    convertToPreferredCurrencyProvider(0.1, 'USD'),
                  ),
                )}'),
                Text('Decimal: ${NumberFormat.compactCurrency(
                  locale: l10n.localeName,
                  symbol: currentCurrency.symbol,
                  decimalDigits: 3,
                ).format(
                  ref.watch(
                    convertToPreferredCurrencyProvider(100.5, 'USD'),
                  ),
                )}'),
                Text('Whole: ${NumberFormat.compactCurrency(
                  locale: l10n.localeName,
                  symbol: currentCurrency.symbol,
                  decimalDigits: 2,
                ).format(
                  ref.watch(
                    convertToPreferredCurrencyProvider(1000000, 'USD'),
                  ),
                )}'),
              ],
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, _) => Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFEDF0F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Error loading rates: $error',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageView(AppLocalizations l10n) {
    final content = [
      (l10n.onboardingPage1Title, l10n.onboardingPage1Description),
      (l10n.onboardingPage2Title, l10n.onboardingPage2Description),
      (l10n.onboardingPage3Title, l10n.onboardingPage3Description),
      (l10n.onboardingPage4Title, l10n.onboardingPage4Description),
    ];

    return PageView.builder(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      itemCount: _pageCount,
      itemBuilder: (context, index) {
        final (title, description) = content[index];
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

  Widget _buildFooter(
      BuildContext context, double height, bool isDark, AppLocalizations l10n) {
    return Column(
      children: [
        Gap(height * 0.05),
        if (_currentPage < _pageCount - 1)
          _buildPageIndicator(isDark)
        else
          _buildGetStartedButton(context, l10n),
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

  Widget _buildGetStartedButton(BuildContext context, AppLocalizations l10n) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _finishOnboarding(context),
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(ButtonSize.large.height),
        ),
        child: Text(
          l10n.onboardingGetStartedButton,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    ).animate().slideY(
          begin: 1.0,
          end: 0.0,
          duration: const Duration(milliseconds: 280),
        );
  }
}
