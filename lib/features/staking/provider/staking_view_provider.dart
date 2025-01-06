import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/staking_view_provider.freezed.dart';
part 'generated/staking_view_provider.g.dart';

@freezed
class StakingViewState with _$StakingViewState {
  const factory StakingViewState({
    @Default('0') String usdAmount,
    @Default('0') String aptosAmount,
    @Default(true) bool isUsdAmount,
  }) = _StakingViewState;
}

@riverpod
class StakingViewController extends _$StakingViewController {
  @override
  StakingViewState build() => const StakingViewState();

  void updateAmount(String value) {
    if (state.isUsdAmount) {
      state = state.copyWith(usdAmount: value);
      // You might want to add logic here to convert USD to APTOS
      // For this example, we'll just use a simple conversion rate
      double aptosAmount = double.parse(value) / 10; // Assuming 1 APTOS = $10
      state = state.copyWith(aptosAmount: aptosAmount.toStringAsFixed(2));
    } else {
      state = state.copyWith(aptosAmount: value);
      // Convert APTOS to USD
      double usdAmount = double.parse(value) * 10;
      state = state.copyWith(usdAmount: usdAmount.toStringAsFixed(2));
    }
  }

  void clearAmount() {
    state = state.copyWith(usdAmount: '', aptosAmount: '');
  }

  void removeLastCharacter() {
    if (state.isUsdAmount) {
      if (state.usdAmount.isNotEmpty) {
        state = state.copyWith(
            usdAmount:
                state.usdAmount.substring(0, state.usdAmount.length - 1));
        // Recalculate APTOS amount
        double aptosAmount =
            double.parse(state.usdAmount.isEmpty ? '0' : state.usdAmount) / 10;
        state = state.copyWith(aptosAmount: aptosAmount.toStringAsFixed(2));
      }
    } else {
      if (state.aptosAmount.isNotEmpty) {
        state = state.copyWith(
            aptosAmount:
                state.aptosAmount.substring(0, state.aptosAmount.length - 1));
        // Recalculate USD amount
        double usdAmount =
            double.parse(state.aptosAmount.isEmpty ? '0' : state.aptosAmount) *
                10;
        state = state.copyWith(usdAmount: usdAmount.toStringAsFixed(2));
      }
    }
  }

bool isAmountExceedingBalance() {
    double enteredAmount = double.tryParse(state.isUsdAmount ? state.usdAmount : state.aptosAmount) ?? 0;
    return enteredAmount > 100.21; // Replace 100.21 with the actual balance
  }

  void handleButtonPress(String label, Function triggerShakeAnimation) {
    if (label == 'Clear') {
      clearAmount();
    } else if (label == 'cancel') {
      removeLastCharacter();
    } else {
      String newAmount = state.isUsdAmount
          ? (state.usdAmount == "0" ? label : state.usdAmount + label)
          : (state.aptosAmount == "0" ? label : state.aptosAmount + label);

      // Update the amount regardless of whether it exceeds the balance
      if (state.isUsdAmount) {
        state = state.copyWith(usdAmount: newAmount);
      } else {
        state = state.copyWith(aptosAmount: newAmount);
      }

      // Trigger shake animation if the amount exceeds the balance
     
    }
  }

  void toggleAmountType() {
    state = state.copyWith(isUsdAmount: !state.isUsdAmount);
  }
}
