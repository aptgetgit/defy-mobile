import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/price_alert_controller.g.dart';

class PriceAlertState {
  final String priceValue;
  final TextEditingController priceController = TextEditingController();
  final FocusNode priceFocusNode = FocusNode();
  final TextEditingController notesController = TextEditingController();
  final FocusNode notesFocusNode = FocusNode();
  final String alertType;

  PriceAlertState({
    this.priceValue = '',
    this.alertType = 'Goes Over',
  });

  PriceAlertState copyWith({
    String? priceValue,
    String? alertType,
  }) {
    return PriceAlertState(
      priceValue: priceValue ?? this.priceValue,
      alertType: alertType ?? this.alertType,
    );
  }
}

@Riverpod(keepAlive: true)
class PriceAlertController extends _$PriceAlertController {
  @override
  PriceAlertState build() {
    ref.onDispose(() {
      state.priceController.dispose();
      state.priceFocusNode.dispose();
      state.notesController.dispose();
      state.notesFocusNode.dispose();
    });

    return PriceAlertState();
  }

  void setPriceValue(String value) {
    state = state.copyWith(priceValue: value);
  }

  void setAlertType(String value) {
    state = state.copyWith(alertType: value);
  }
}
