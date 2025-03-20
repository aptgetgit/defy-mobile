

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/choose_wallet_screen_state.freezed.dart';

@freezed
class ChooseWalletScreenState with _$ChooseWalletScreenState {
  const factory ChooseWalletScreenState({
    @Default(0) int currentIndex,
    @Default(false) bool isUpdated,
  }) = _ChooseWalletScreenState;
}
