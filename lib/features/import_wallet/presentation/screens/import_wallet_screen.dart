import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../shared/account/presentation/providers/generate_account_flow.dart';
import '../../../../shared/account/presentation/states/generate_account_flow_state.dart';
import '../enums/page_type_enum.dart';
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
  final List<String> _words = <String>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleStateChanges();
    });
    AppLogger.debug('ImportWalletScreen initialized');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleStateChanges() {
    ref.listen<GenerateAccountFlowState>(
      generateAccountFlowProvider,
      (previous, next) {
        AppLogger.debug('Previous state: $previous');
        AppLogger.debug('Current state: $next');

        if (next is GenerateAccountFlowStateError) {
          AppLogger.debug('Error state detected: ${next.message}');
          _showErrorSnackBar(next.message);
        } else if (next is GenerateAccountFlowStateWaitingForMetadata) {
          AppLogger.debug('State is waiting for metadata');
          _navigateToPage(PageType.seedPhraseImported);
        } else if (next is GenerateAccountFlowStateImporting) {
          AppLogger.debug('State is importing, showing progress');
          _showImportingProgress();
        } else if (next is GenerateAccountFlowStateReady) {
          AppLogger.debug('Account generated successfully');
          //TODO: Navigate to account screen
        } else {
          AppLogger.debug('Other state: $next');
        }
      },
    );
  }

  void _showErrorSnackBar(String message) {
    AppLogger.debug('Attempting to show error snackbar: $message');
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message.contains('Entropy already exists')
                ? 'This wallet has already been imported'
                : 'Error: $message'),
            duration: const Duration(seconds: 3),
          ),
        );
        AppLogger.debug('Snackbar should be visible now');
      });
    } else {
      AppLogger.debug('Widget is not mounted, cannot show snackbar');
    }
  }

  Future<void> _showImportingProgress() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Importing wallet...'),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToPage(PageType pageType) async {
    switch (pageType) {
      case PageType.seedPhraseImported:
        setState(() {
          _currentPage++;
        });
        AppLogger.debug('Attempting to navigate to page: ${_currentPage + 1}');
        await _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        AppLogger.debug('Navigation completed. Current page: $_currentPage');
      case PageType.accountNameEntered:
        setState(() {
          _currentPage++;
        });
        await _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        AppLogger.debug('Navigated to page: $_currentPage');
      case PageType.accountIconSelected:
        // Handle this case if needed
        break;
    }
  }

  void updateWords(List<String> words) {
    setState(() {
      _words.clear();
      _words.addAll(words);
    });
  }

  Future<void> importMnemonic() async {
    final String mnemonic = _words.join(' ');
    await ref.read(generateAccountFlowProvider.notifier).importMnemonic(mnemonic);
  }

  @override
  Widget build(BuildContext context) {
    AppLogger.debug(
      'Building ImportWalletScreen, current page: $_currentPage',
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                if (_currentPage == 0) {
                  AppLogger.debug('Popping screen');
                  context.pop();
                } else {
                  AppLogger.debug('Moving to previous page');
                  setState(() {
                    _currentPage--;
                  });
                  await _pageController.animateToPage(
                    _currentPage,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  AppLogger.debug('Moved to page: $_currentPage');
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
                ImportWalletImportSeedPhraseScreen(
                  words: _words,
                  onWordsUpdated: updateWords,
                  onImport: importMnemonic,
                ),
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
    AppLogger.debug('Building page: $title');
    return Center(
      child: Text(title, style: const TextStyle(fontSize: 24)),
    );
  }
}