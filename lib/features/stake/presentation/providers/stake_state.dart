import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/stake_state.freezed.dart';

@freezed
class StakeState with _$StakeState {
  const factory StakeState({
    // Selected provider information
    @Default('') String providerName,
    @Default('') String providerLogoPath,
    @Default('0%') String apy,
    @Default('') String investors,
    @Default(false) bool isDelegate,
    
    // Amount selection
    @Default('0') String stakeAmount,
    @Default('0') String stakeAmountInAPT,
    @Default('1M') String selectedTimePeriod,
    @Default(10000) double investmentAmount,
    @Default('APT') String selectedAsset,
    
    // UI state
    @Default(0) int currentTabIndex,
    @Default(false) bool isSearchIconVisible,
    
    // Investment calculator
    @Default(0) int calculatorTab,
    
    // Provider filtering
    @Default('') String searchQuery,
    @Default(0) int filterIndex,
  }) = _StakeState;
}
