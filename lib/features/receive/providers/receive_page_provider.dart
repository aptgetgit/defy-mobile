import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReceivePageNotifier extends StateNotifier<int> {
  ReceivePageNotifier() : super(0);
  final PageController pageController = PageController();
  bool _animating = false; // added flag

  Future<void> nextPage() async {
    debugPrint('nextPage pressed from state: $state');
    if (_animating) {
      debugPrint('Animation already in progress, ignoring nextPage');
      return;
    }
    if (state < 2) {
      _animating = true;
      state++;
      debugPrint('Animating to next page: $state');
      await pageController.animateToPage(
        state,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      debugPrint('Animation complete. Current page: $state');
      _animating = false;
    } else {
      debugPrint('Already at last page');
    }
  }

  void previousPage() {
    debugPrint('previousPage pressed from state: $state');
    if (_animating) {
      return;
    }
    if (state > 0) {
      _animating = true;
      state--;
      debugPrint('Animating to previous page: $state');
      pageController.animateToPage(
        state,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ).whenComplete(() {
        debugPrint('Animation complete. Current page: $state');
        _animating = false;
      });
    }
  }

  void setPage(int index) {
    debugPrint('setPage callback with index: $index');
    state = index;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

final StateNotifierProvider<ReceivePageNotifier, int> receivePageProvider =
    StateNotifierProvider<ReceivePageNotifier, int>(
      (StateNotifierProviderRef<ReceivePageNotifier, int> ref) => ReceivePageNotifier(),
    );
