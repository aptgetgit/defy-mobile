import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
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
    print('ImportWalletScreen initialized'); // Debug print
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
    print('ImportWalletScreen disposed'); // Debug print
  }

  void _handleStateChanges() {
    ref.listen<GenerateAccountFlowState>(
      generateAccountFlowProvider,
      (GenerateAccountFlowState? previous, GenerateAccountFlowState next) {
        print('Previous state: $previous'); // Debug print
        print('Current state: $next'); // Debug print

        switch (next) {
          case GenerateAccountFlowState.generated:
            print('State is ready, moving to next page'); // Debug print
            if (mounted) {
              _nextPage();
            }
            break;
          case GenerateAccountFlowState.idle:
            print('State is idle'); // Debug print
            if (mounted) {
              // You can add any idle state handling here
            }
            break;
          case GenerateAccountFlowState.error:
            print('State is error, showing snackbar'); // Debug print
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please Try Again')),
              );
            }
            break;
          default:
            print('Unknown state: $next'); // Debug print
            break;
        }
      },
    );
  }

  void _nextPage() {
    print('Current page before next: $_currentPage'); // Debug print
    if (_currentPage < 3) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      print('Moved to page: $_currentPage'); // Debug print
    } else {
      print('Already at the last page'); // Debug print
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        'Building ImportWalletScreen, current page: $_currentPage'); // Debug print
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                if (_currentPage == 0) {
                  print('Popping screen'); // Debug print
                  context.pop();
                } else {
                  print('Moving to previous page'); // Debug print
                  setState(() {
                    _currentPage--;
                  });
                  await _pageController.animateToPage(
                    _currentPage,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  print('Moved to page: $_currentPage'); // Debug print
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
    print('Building page: $title'); // Debug print
    return Center(
      child: Text(title, style: const TextStyle(fontSize: 24)),
    );
  }
}
