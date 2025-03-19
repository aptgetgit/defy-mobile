import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../config/theme/colors.dart';

part 'generated/customize_wallet_state.freezed.dart';

@freezed
class CustomizeWalletState with _$CustomizeWalletState {
  const factory CustomizeWalletState({
    @Default(false) bool showEmojiSection,
    @Default(false) bool showNameSection,
    @Default(true) bool showColorSection,
    @Default(AppColors.blue) Color selectedWalletColor,
    @Default('') String selectedEmoji,
    @Default('') String selectedWalletName,
    @Default(0.0) double walletColorSliderPosition,
    @Default(0) int walletColorSelectedIndex,
    
  }) = _CustomizeWalletState;
}
