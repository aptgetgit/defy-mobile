import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/create_wallet_state.freezed.dart';

@freezed
class CreateWalletState with _$CreateWalletState {
  const factory CreateWalletState({
    @Default(0) int currentStep,
    @Default(<String>[]) List<String> words,
    @Default(false) bool isAccountGenerated,
    @Default('Business') String accountName,
    @Default('') String? error,
    @Default(LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: <Color>[
        Color(0xff2071EE),
        Color(0xff0051CF),
      ],
    ),)
    LinearGradient selectedWalletColor,
    @Default(0.0) double walletColorSliderPosition,
    @Default(0) int walletColorSelectedIndex,
    @Default(-1) int selectedEmojiIndex,
    @Default(false) bool isWalletNameEntered,
  }) = _CreateWalletState;
}
