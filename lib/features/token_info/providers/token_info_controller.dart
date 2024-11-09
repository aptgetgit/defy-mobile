import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/token_info_controller.g.dart';

class TokensState {
  final bool isSecondPage;
  final int selectedTab;

  TokensState({
    this.isSecondPage = false,
    this.selectedTab = 0,
  });

  TokensState copyWith({
    bool? isSecondPage,
    int? selectedTab,
  }) {
    return TokensState(
      isSecondPage: isSecondPage ?? this.isSecondPage,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}

@riverpod
class TokensController extends _$TokensController {
  late final PageController verticalPageController;
  late final PageController horizontalPageController;

  @override
  TokensState build() {
    verticalPageController = PageController();
    horizontalPageController = PageController();

    return TokensState();
  }

  void goToFirstPage() {
    state = state.copyWith(isSecondPage: false);
    verticalPageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int index) {
    state = state.copyWith(
      isSecondPage: index == 1,
    );
  }

  void selectTab(int index) {
    state = state.copyWith(selectedTab: index);
    horizontalPageController.jumpToPage(index);
  }

  void disposeControllers() {
    verticalPageController.dispose();
    horizontalPageController.dispose();
  }
}
