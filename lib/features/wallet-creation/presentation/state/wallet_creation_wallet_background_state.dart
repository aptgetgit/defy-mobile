// wallet_background_state.dart
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../config/theme/colors.dart';

part 'generated/wallet_creation_wallet_background_state.freezed.dart';
@freezed
class WalletBackgroundState with _$WalletBackgroundState {
  const factory WalletBackgroundState({
    @Default(AppColors.blue) Color selectedColor,
    @Default(0.0) double sliderPosition,
    @Default(0) int selectedIndex,
  }) = _WalletBackgroundState;
}
