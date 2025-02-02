
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/wallet_creation_wallet_background_state.dart';

part 'generated/wallet_creation_wallet_background_provider.g.dart';
@riverpod
class WalletBackground extends _$WalletBackground {
  @override
  WalletBackgroundState build() => const WalletBackgroundState();

  void updateColor(Color color) {
    state = state.copyWith(selectedColor: color);
  }

  void updateSliderPosition(double position) {
    state = state.copyWith(sliderPosition: position);
  }

  void updateSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}
