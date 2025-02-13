

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/choose_wallet_state.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    @Default(0) int currentIndex,
  }) = _WalletState;
}
