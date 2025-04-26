import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/lend_state_model.freezed.dart';

@freezed
class LendState with _$LendState {
  const factory LendState({
    // E-Mode settings
    @Default(false) bool isEMode,
    @Default('') String disabledCategory,
    
    // Health factor
    @Default(104.05) double currentHealthFactor,
    @Default(140.50) double projectedHealthFactor,
    
    // Lend amount
    @Default('0') String lendAmount,
    
    // Selected asset
    @Default('Aptos') String selectedAsset,
    @Default('assets/icons/aptos.png') String assetIconPath,
    @Default('100.21') String maxAmount,
    @Default('APT') String maxAmountUnit,
    @Default('15%') String apy,
    
    // Net statistics
    @Default(12121.21) double netAssets,
    @Default(107.55) double healthFactor,
    @Default(5.23) double netApy,
  }) = _LendState;
}
