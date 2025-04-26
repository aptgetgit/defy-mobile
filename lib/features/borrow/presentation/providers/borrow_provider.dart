import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'borrow_state_model.dart';

part 'generated/borrow_provider.g.dart';

@Riverpod(keepAlive: true)
class BorrowNotifier extends _$BorrowNotifier {
  @override
  BorrowState build() => const BorrowState();

  void toggleEMode(bool value) {
    state = state.copyWith(isEMode: value);
  }
  
  void setDisabledCategory(String category) {
    state = state.copyWith(disabledCategory: category);
  }
  
  void setBorrowAmount(String amount) {
    final double numAmount = double.tryParse(amount) ?? 0;
    double projectedFactor = state.currentHealthFactor;
    
    // Calculate projected health factor based on amount (example formula)
    if (numAmount > 0) {
      projectedFactor = state.currentHealthFactor + (numAmount * 0.35);
      projectedFactor = double.parse(projectedFactor.toStringAsFixed(2));
    }
    
    state = state.copyWith(
      borrowAmount: amount,
      projectedHealthFactor: projectedFactor,
    );
  }
  
  void handleKeypadInput(String label) {
    String newAmount = state.borrowAmount;
    
    if (label == 'cancel') {
      if (newAmount.length > 1) {
        newAmount = newAmount.substring(0, newAmount.length - 1);
      } else {
        newAmount = '0';
      }
    } else if (label == '.') {
      // Add decimal point if it doesn't already exist
      if (!newAmount.contains('.')) {
        newAmount += '.';
      }
    } else {
      // Append digit
      if (newAmount == '0') {
        newAmount = label;
      } else {
        newAmount += label;
      }
    }
    
    setBorrowAmount(newAmount);
  }
  
  void setSelectedAsset({
    required String name,
    required String iconPath,
    required String maxAmount,
    required String maxAmountUnit,
    required String apy,
  }) {
    state = state.copyWith(
      selectedAsset: name,
      assetIconPath: iconPath,
      maxAmount: maxAmount,
      maxAmountUnit: maxAmountUnit,
      apy: apy,
    );
  }
  
  void useMaxAmount() {
    setBorrowAmount(state.maxAmount);
  }
  
  void reset() {
    state = const BorrowState();
  }
}
