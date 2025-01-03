import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/leverage_trading/domain/leverage_trading_view_state.dart';
import 'package:defy/features/leverage_trading/domain/trading_pair_model.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/leverage_trading_provider.g.dart';

@Riverpod(keepAlive: true)
class LeverageTrading extends _$LeverageTrading {
  LeverageTradingViewState build() {
    return LeverageTradingViewState(
      selectedPair: TradingPairModel(
          token1: 'ETH',
          token2: 'USDC',
          token1Asset: 'assets/icons/ethereum-circular.png',
          token2Asset: 'assets/icons/usdc.png',
          volume: '\$89M',
          value: '\$14900.84',
          change: '0.12%'),
      sltp: false,
      leverage: 1.0,
      toggleMarketAndLimit: true,
      togglePayMode: true,
      togglePriceMode: false,
      isSwapped: false,
      payAmount: '0',
      priceAmount: '90.02',
      priceInputMode: false,
      priceController: TextEditingController(),
      priceFocusNode: FocusNode(),
      slAmount: '0',
      tpAmount: '0',
      toggleSlMode: false,
      toggleTpMode: false,
      isError: false,
      buttonText: 'Next',
    );
  }

  void increaseLeverage() {
    if (state.leverage < 10) {
      state = state.copyWith(leverage: state.leverage + 1);
    }
  }

  void decreaseLeverage() {
    if (state.leverage > 1) {
      state = state.copyWith(leverage: state.leverage - 1);
    }
  }

  void updateSelectedPair(TradingPairModel tradingPair) {
    state = state.copyWith(selectedPair: tradingPair);
  }

  void toggleSltp() {
    state = state.copyWith(sltp: !state.sltp);
  }

  void toggleMarketAndLimit() {
    state = state.copyWith(
      toggleMarketAndLimit: !state.toggleMarketAndLimit,
      priceAmount: !state.toggleMarketAndLimit ? "0" : state.priceAmount,
    );
  }

  void togglePayMode() {
    if (state.toggleSlMode || state.toggleTpMode) {
      state = state.copyWith(toggleSlMode: false, toggleTpMode: false);
    }
    state = state.copyWith(togglePayMode: !state.togglePayMode);
    print("Toggle Pay Mode : ${state.togglePayMode}");
  }

  void togglePriceMode() {
    state = state.copyWith(togglePriceMode: !state.togglePriceMode);
    print("Toggle Price Mode : ${state.togglePriceMode}");
  }

  void swap() {
    state = state.copyWith(isSwapped: !state.isSwapped);
  }

  void clearPriceAmount() {
    state = state.copyWith(priceAmount: "0");
  }

  void clearPayAmount() {
    state = state.copyWith(payAmount: "0");
  }

  void removeLastCharacterFromPriceAmount() {
    if (state.priceAmount.length > 1) {
      state = state.copyWith(
        priceAmount:
            state.priceAmount.substring(0, state.priceAmount.length - 1),
      );
    } else {
      state = state.copyWith(
        priceAmount: "0",
      );
    }
  }

  void removeLastCharacterFromPayAmount() {
    if (state.payAmount.length > 1) {
      state = state.copyWith(
        payAmount: state.payAmount.substring(0, state.payAmount.length - 1),
      );
    } else {
      state = state.copyWith(
        payAmount: "0",
      );
    }
  }

  void setPriceInputMode(bool priceInputMode) {
    state = state.copyWith(priceInputMode: priceInputMode);

    if (priceInputMode) {
      state.priceFocusNode.requestFocus();
    } else {
      state.priceFocusNode.unfocus();
    }
  }

  void toggleSlMode() {
    state = state.copyWith(
      toggleSlMode: !state.toggleSlMode,
      toggleTpMode: false,
      togglePayMode: false,
      togglePriceMode: false,
    );
  }

  void toggleTpMode() {
    state = state.copyWith(
      toggleTpMode: !state.toggleTpMode,
      toggleSlMode: false,
      togglePayMode: false,
      togglePriceMode: false,
    );
  }

  void updateSlAmount(String amount) {
    state = state.copyWith(slAmount: amount.isEmpty ? "0" : amount);
  }

  void updateTpAmount(String amount) {
    state = state.copyWith(tpAmount: amount.isEmpty ? "0" : amount);
  }

  void clearSlAmount() {
    state = state.copyWith(slAmount: '0');
  }

  void clearTpAmount() {
    state = state.copyWith(tpAmount: '0');
  }

  void removeLastCharacterFromSlAmount() {
    if (state.slAmount.length > 1) {
      state = state.copyWith(
          slAmount: state.slAmount.substring(0, state.slAmount.length - 1));
    } else {
      state = state.copyWith(slAmount: '0');
    }
  }

  void removeLastCharacterFromTpAmount() {
    if (state.tpAmount.length > 1) {
      state = state.copyWith(
          tpAmount: state.tpAmount.substring(0, state.tpAmount.length - 1));
    } else {
      state = state.copyWith(tpAmount: '0');
    }
  }

  bool isKeyboardVisible() =>
      state.togglePayMode ||
      state.togglePriceMode ||
      state.toggleSlMode ||
      state.toggleTpMode;

  void updateButtonText(String text) {
    state = state.copyWith(buttonText: text);
  }

  void toggleError(bool isError) {
    state = state.copyWith(isError: isError);
  }

  void clearAll() {
    state = state.copyWith(
      payAmount: '0',
      priceAmount: '0',
      slAmount: '0',
      tpAmount: '0',
      togglePayMode: true,
      togglePriceMode: false,
      toggleSlMode: false,
      toggleTpMode: false,
      sltp: false,
      buttonText: 'Next',
    );
  }

  void updatePayAmount(String amount) {
    state = state.copyWith(payAmount: amount.isEmpty ? "0" : amount);
    _updateLiquidatesAt();
  }

  void updatePriceAmount(String value) {
    state = state.copyWith(priceAmount: value.isEmpty ? "0" : value);
    _updateLiquidatesAt();
  }

  void updateLeverage(double leverage) {
    state = state.copyWith(leverage: leverage);
    _updateLiquidatesAt();
  }

  void _updateLiquidatesAt() {
    if (showLiquidatesAt()) {
      // Calculate the liquidation price here
      double liquidationPrice = calculateLiquidationPrice();
      updateLiquidatesAt(liquidationPrice.toStringAsFixed(2));
    }
  }

  double calculateLiquidationPrice() {
    // Implement your liquidation price calculation logic here
    // This is a placeholder implementation
    double price = double.tryParse(state.priceAmount) ?? 0;
    double payAmount = double.tryParse(state.payAmount) ?? 0;
    double leverage = state.leverage;

    // Example calculation (adjust according to your specific requirements)
    double liquidationPrice = price * (1 - 1 / leverage);

    return liquidationPrice;
  }

  void updateLiquidatesAt(String liquidatesAt) {
    state = state.copyWith(liquidatesAt: liquidatesAt);
  }

  bool showLiquidatesAt() {
    double? priceAmount = double.tryParse(state.priceAmount);
    double? payAmount = double.tryParse(state.payAmount);

    if ((priceAmount != null &&
            priceAmount > 0 &&
            payAmount != null &&
            payAmount >= 2) ||
        (payAmount != null && payAmount >= 2)) {
      AppLogger.debug('Pay Amount: $payAmount');
      AppLogger.debug('Show Liquidates At');
      return true;
    } else {
      AppLogger.debug('Hide Liquidates At');
      return false;
    }
  }
}
