import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/borrow_state_model.freezed.dart';

@freezed
class BorrowState with _$BorrowState {
  const factory BorrowState({
    // E-Mode settings
    @Default(false) bool isEMode,
    @Default('') String disabledCategory,
    
    // Health factor
    @Default(104.05) double currentHealthFactor,
    @Default(140.50) double projectedHealthFactor,
    
    // Borrow amount
    @Default('0') String borrowAmount,
    
    // Selected asset
    @Default('Aptos') String selectedAsset,
    @Default('assets/icons/aptos.png') String assetIconPath,
    @Default('100.21') String maxAmount,
    @Default('APT') String maxAmountUnit,
    @Default('15%') String apy,
  }) = _BorrowState;
}