import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../config/theme/colors.dart';

part 'generated/import_wallet_state.freezed.dart';

@freezed
class ImportWalletState with _$ImportWalletState {
  const factory ImportWalletState({
    @Default(0) int currentPage,
    @Default(0) int previousPage,
    @Default(<String>[]) List<String> words,
    @Default(false) bool isImporting,
    @Default(false) bool isGenerating,
    @Default(false) bool isAccountGenerated,
    @Default('Business') String accountName,
    @Default('') String? error,
    @Default(AppColors.blue) Color selectedWalletColor,
    @Default(0.0) double walletColorSliderPosition,
    @Default(0) int walletColorSelectedIndex,
    @Default(-1) int selectedEmojiIndex,
  }) = _ImportWalletState;
}
