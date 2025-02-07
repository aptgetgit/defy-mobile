import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../account/presentation/providers/account_generation_flow_manager.dart';
import '../../../account/presentation/states/account_generation_flow_state.dart';
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 3) {
      setState(() {
        _currentPage++;
      });
      unawaited(
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(accountGenerationFlowManagerProvider);

      switch (state) {
        case AccountGenerationFlowState.ready:
          if (mounted) {
            Navigator.pushReplacementNamed(context, '/nextScreen');
          }
          break;
        case AccountGenerationFlowState.idle:
          if (mounted) {
            _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.bounceInOut);
          }
          break;
        case AccountGenerationFlowState.error:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please Try Again ')),
          );
          break;
        default:
          break;
      }
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (_currentPage == 0) {
                  context.pop();
                } else {
                  setState(() {
                    _currentPage--;
                  });
                  unawaited(
                    _pageController.animateToPage(
                      _currentPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                  );
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
          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   child: ElevatedButton(
          //     onPressed: _nextPage,
          //     child: Text(_currentPage == 3 ? 'Finish' : 'Next'),
          //   ),
          // ),
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

  Widget _buildPage(String title) => Center(
        child: Text(title, style: const TextStyle(fontSize: 24)),
      );
}
