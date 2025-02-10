import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../shared/account/presentation/providers/generate_account_flow.dart';
import '../../../../shared/account/presentation/states/generate_account_flow_state.dart';
import 'import_wallet_import_seed_phrase_screen.dart';

class ImportWalletScreen extends ConsumerStatefulWidget {
  const ImportWalletScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImportWalletScreenState();
}

class _ImportWalletScreenState extends ConsumerState<ImportWalletScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleStateChanges();
    });
    AppLogger.debug('ImportWalletScreen initialized'); // Debug AppLogger.debug
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
    AppLogger.debug('ImportWalletScreen disposed'); // Debug AppLogger.debug
  }

  void _handleStateChanges() {
    ref.listen<GenerateAccountFlowState>(
      generateAccountFlowProvider,
      (GenerateAccountFlowState? previous, GenerateAccountFlowState next) async {
        AppLogger.debug('Previous state: $previous'); // Debug AppLogger.debug
        AppLogger.debug('Current state: $next'); // Debug AppLogger.debug

        switch (next) {
          case GenerateAccountFlowState.generated:
            AppLogger.debug(
                'State is ready, moving to next page',); // Debug AppLogger.debug
            if (mounted) {
              await _nextPage();
            }
          case GenerateAccountFlowState.idle:
            AppLogger.debug('State is idle'); // Debug AppLogger.debug
            if (mounted) {
              // You can add any idle state handling here
            }
          case GenerateAccountFlowState.error:
            AppLogger.debug(
                'State is error, showing snackbar',); // Debug AppLogger.debug
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please Try Again')),
              );
            }
          default:
            AppLogger.debug('Unknown state: $next'); // Debug AppLogger.debug
        }
      },
    );
  }

  Future<void> _nextPage() async {
    AppLogger.debug(
        'Current page before next: $_currentPage',); // Debug AppLogger.debug
    if (_currentPage < 3) {
      setState(() {
        _currentPage++;
      });
      await _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      AppLogger.debug('Moved to page: $_currentPage'); // Debug AppLogger.debug
    } else {
      AppLogger.debug('Already at the last page'); // Debug AppLogger.debug
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLogger.debug(
        'Building ImportWalletScreen, current page: $_currentPage',); // Debug AppLogger.debug
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                if (_currentPage == 0) {
                  AppLogger.debug('Popping screen'); // Debug AppLogger.debug
                  context.pop();
                } else {
                  AppLogger.debug(
                      'Moving to previous page',); // Debug AppLogger.debug
                  setState(() {
                    _currentPage--;
                  });
                  await _pageController.animateToPage(
                    _currentPage,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  AppLogger.debug(
                      'Moved to page: $_currentPage',); // Debug AppLogger.debug
                }
              },
              child: const Icon(PhosphorIconsBold.caretLeft),
            ),
            const Spacer(),
            ...List<Widget>.generate(4, _buildProgressIndicator),
            const Spacer(),
            Container(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, right: 12, left: 4),
              decoration: BoxDecoration(
                color: AppColors.greyVeryLight,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/icons/coins.png',
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '20',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                const ImportWalletImportSeedPhraseScreen(),
                _buildPage('Page 2'),
                _buildPage('Page 3'),
                _buildPage('Page 4'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(int index) => AnimatedContainer(
        height: _currentPage == index ? 6 : 4,
        width: _currentPage == index ? 64 : 42,
        margin: const EdgeInsets.symmetric(horizontal: 1),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _currentPage >= index
              ? AppColors.greenLight
              : AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(40),
        ),
      );

  Widget _buildPage(String title) {
    AppLogger.debug('Building page: $title'); // Debug AppLogger.debug
    return Center(
      child: Text(title, style: const TextStyle(fontSize: 24)),
    );
  }
}
