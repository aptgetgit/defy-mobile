import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../config/theme/colors.dart';

part 'generated/create_wallet_state.freezed.dart';

@freezed
class CreateWalletState with _$CreateWalletState {
  const factory CreateWalletState({
    @Default(0) int currentStep,
    @Default(<String>[]) List<String> words,
    @Default(false) bool isAccountGenerated,
    @Default('Business') String accountName,
    @Default('') String? error,
    @Default(AppColors.blue) Color selectedWalletColor,
    @Default(0.0) double walletColorSliderPosition,
    @Default(0) int walletColorSelectedIndex,
    @Default(-1) int selectedEmojiIndex,
    @Default(false) bool isWalletNameEntered,
  }) = _CreateWalletState;
}
