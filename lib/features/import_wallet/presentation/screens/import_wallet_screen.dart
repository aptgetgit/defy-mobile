import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../shared/account/presentation/providers/generate_account_flow.dart';
import '../../../../shared/account/presentation/states/generate_account_flow_state.dart';
import '../enums/page_type_enum.dart';
import '../providers/import_wallet_provider.dart';
import '../state/import_wallet_state.dart';
import 'import_wallet_account_name_screen.dart';
import 'import_wallet_emoji_selection_screen.dart';
import 'import_wallet_import_seed_phrase_screen.dart';
import 'import_wallet_wallet_color_selection_screen.dart';

class ImportWalletScreen extends ConsumerStatefulWidget {
  const ImportWalletScreen({super.key});

  @override
  ConsumerState<ImportWalletScreen> createState() => _ImportWalletScreenState();
}

class _ImportWalletScreenState extends ConsumerState<ImportWalletScreen> {
  final PageController _pageController = PageController();
  GenerateAccountFlowState? _previousState;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
    AppLogger.debug('ImportWalletScreen initialized');
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_onPageChanged)
      ..dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final int currentPage = _pageController.page?.round() ?? 0;
    ref.read(importWalletNotifierProvider.notifier).setCurrentPage(currentPage);
  }

  Future<void> _handleStateChanges(GenerateAccountFlowState state) async {
    if (state == _previousState) return;
    _previousState = state;

    AppLogger.debug('Current state: $state');

    if (state is GenerateAccountFlowStateError) {
      _showErrorSnackBar(state.message);
    } else if (state is GenerateAccountFlowStateWaitingForMetadata) {
      await _navigateToPage(PageType.accountNameEntered);
    } else if (state is GenerateAccountFlowStateImporting) {
    } else if (state is GenerateAccountFlowStateReady) {
      _handleAccountGenerated(state);
    }
  }

  void _handleAccountGenerated(GenerateAccountFlowStateReady state) {
    AppLogger.debug('Account generated successfully');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      const CreatedWalletScreenRoute().go(context);
    });
  }

  void _showErrorSnackBar(String message) {
    AppLogger.debug('Attempting to show error snackbar: $message');
    if (!mounted) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message.contains('Entropy already exists')
                ? 'This wallet has already been imported'
                : 'Error: $message',
          ),
          duration: const Duration(seconds: 3),
        ),
      );
      AppLogger.debug('Snackbar should be visible now');
    });
  }

  Future<void> _navigateToPage(PageType pageType) async {
    final ImportWalletNotifier notifier =
        ref.read(importWalletNotifierProvider.notifier);
    final int currentPage = ref.read(importWalletNotifierProvider).currentPage;

    final int newPage = currentPage + 1;
    notifier.setCurrentPage(newPage);

    AppLogger.debug('Navigated to page: $newPage');
  }

  @override
  Widget build(BuildContext context) {
    final ImportWalletState importWalletState =
        ref.watch(importWalletNotifierProvider);
    final ImportWalletNotifier importWalletNotifier =
        ref.read(importWalletNotifierProvider.notifier);

    final GenerateAccountFlowState generateAccountFlowState =
        ref.watch(generateAccountFlowProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _handleStateChanges(generateAccountFlowState);
    });

    AppLogger.debug(
      'Building ImportWalletScreen, current page: ${importWalletState.currentPage}',
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(importWalletState, importWalletNotifier),
      body: _buildBody(importWalletState, importWalletNotifier),
    );
  }

  Widget _buildBody(ImportWalletState state, ImportWalletNotifier notifier) =>
      Column(
        children: <Widget>[
          Expanded(
            child: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 400),
              reverse: state.currentPage < state.previousPage,
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) =>
                  FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation.drive(
                    Tween<double>(begin: 0.95, end: 1).chain(
                      CurveTween(curve: Curves.easeInOut),
                    ),
                  ),
                  child: child,
                ),
              ),
              child: _buildPage(state, notifier),
            ),
          ),
        ],
      );

  Widget _buildPage(ImportWalletState state, ImportWalletNotifier notifier) {
    switch (state.currentPage) {
      case 0:
        return ImportWalletImportSeedPhraseScreen(
          key: const ValueKey<int>(0),
          words: state.words,
          onWordsUpdated: notifier.updateWords,
          onImport: notifier.importMnemonic,
        );
      case 1:
        return ImportWalletAccountNameScreen(
          onSkip: () async => _navigateToPage(PageType.accountNameEntered),
          key: const ValueKey<int>(1),
          accountName: state.accountName,
          onAccountNameUpdated: notifier.updateAccountName,
          onContinue: () async => _navigateToPage(PageType.accountNameEntered),
        );
      case 2:
        return ImportWalletWalletColorSelectionScreen(
          key: const ValueKey<int>(2),
          onContinue: () async {
            await _navigateToPage(PageType.walletColorSelected);
          },
        );
      case 3:
        return ImportWalletEmojiSelectionScreen(
          key: const ValueKey<int>(3),
          onContinue: () async {
            await ref
                .read(importWalletNotifierProvider.notifier)
                .generateAccount();
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }

  PreferredSizeWidget _buildAppBar(
    ImportWalletState state,
    ImportWalletNotifier notifier,
  ) =>
      AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () async => _handleBackNavigation(state, notifier),
              child: const Icon(PhosphorIconsBold.caretLeft),
            ),
            const Spacer(),
            ..._buildProgressIndicators(state.currentPage),
            const Spacer(),
            _buildCoinIndicator(),
          ],
        ),
      );

  Future<void> _handleBackNavigation(
    ImportWalletState state,
    ImportWalletNotifier notifier,
  ) async {
    if (state.currentPage == 0) {
      AppLogger.debug('Popping screen');
      context.pop();
    } else {
      AppLogger.debug('Moving to previous page');
      final int newPage = state.currentPage - 1;
      notifier.setCurrentPage(newPage);
      await _pageController.animateToPage(
        newPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      AppLogger.debug('Moved to page: $newPage');
    }
  }

  List<Widget> _buildProgressIndicators(int currentPage) =>
      List<Widget>.generate(
        4,
        (int index) => _buildProgressIndicator(index, currentPage),
      );

  Widget _buildProgressIndicator(int index, int currentPage) =>
      AnimatedContainer(
        height: currentPage == index ? 6 : 4,
        width: currentPage == index ? 64 : 42,
        margin: const EdgeInsets.symmetric(horizontal: 1),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: currentPage >= index
              ? AppColors.greenLight
              : AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(40),
        ),
      );

  Widget _buildCoinIndicator() => Container(
        padding: const EdgeInsets.only(top: 4, bottom: 4, right: 12, left: 4),
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Row(
          children: <Widget>[
            Image.asset('assets/icons/coins.png', width: 16, height: 16),
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
      );
}
