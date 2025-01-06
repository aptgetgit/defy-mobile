// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:defy/features/leverage_trading/domain/trading_pair_model.dart';

class LeverageTradingViewState {
  final TradingPairModel selectedPair;
  final bool sltp;
  final double leverage;
  final bool toggleMarketAndLimit;
  final bool togglePayMode;
  final bool togglePriceMode;
  final bool isSwapped;
  final String payAmount;
  final String priceAmount;
  final bool priceInputMode;
  final TextEditingController priceController;
  final FocusNode priceFocusNode;
  final String slAmount;
  final String tpAmount;
  final bool toggleSlMode;
  final bool toggleTpMode;
  final bool isError;
  final String buttonText;
  final String liquidatesAt;
  LeverageTradingViewState({
    required this.selectedPair,
    required this.sltp,
    required this.leverage,
    required this.toggleMarketAndLimit,
    required this.togglePayMode,
    required this.togglePriceMode,
    required this.isSwapped,
    required this.payAmount,
    required this.priceAmount,
    required this.priceInputMode,
    required this.priceController,
    required this.priceFocusNode,
    this.slAmount = '0',
    this.tpAmount = '0',
    this.toggleSlMode = false,
    this.toggleTpMode = false,
    required this.isError,
    required this.buttonText,
    this.liquidatesAt = '',
  });

  LeverageTradingViewState copyWith({
    TradingPairModel? selectedPair,
    bool? sltp,
    double? leverage,
    bool? toggleMarketAndLimit,
    bool? togglePayMode,
    bool? togglePriceMode,
    bool? isSwapped,
    String? payAmount,
    String? priceAmount,
    bool? priceInputMode,
    TextEditingController? priceController,
    FocusNode? priceFocusNode,
    String? slAmount,
    String? tpAmount,
    bool? toggleSlMode,
    bool? toggleTpMode,
    bool? isError,
    String? buttonText,
    String? liquidatesAt,
  }) {
    return LeverageTradingViewState(
      selectedPair: selectedPair ?? this.selectedPair,
      sltp: sltp ?? this.sltp,
      leverage: leverage ?? this.leverage,
      toggleMarketAndLimit: toggleMarketAndLimit ?? this.toggleMarketAndLimit,
      togglePayMode: togglePayMode ?? this.togglePayMode,
      togglePriceMode: togglePriceMode ?? this.togglePriceMode,
      isSwapped: isSwapped ?? this.isSwapped,
      payAmount: payAmount ?? this.payAmount,
      priceAmount: priceAmount ?? this.priceAmount,
      priceInputMode: priceInputMode ?? this.priceInputMode,
      priceController: priceController ?? this.priceController,
      priceFocusNode: priceFocusNode ?? this.priceFocusNode,
      slAmount: slAmount ?? this.slAmount,
      tpAmount: tpAmount ?? this.tpAmount,
      toggleSlMode: toggleSlMode ?? this.toggleSlMode,
      toggleTpMode: toggleTpMode ?? this.toggleTpMode,
      isError: isError ?? this.isError,
      buttonText: buttonText ?? this.buttonText,
      liquidatesAt: liquidatesAt ?? this.liquidatesAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedPair': selectedPair.toMap(),
      'sltp': sltp,
      'leverage': leverage,
      'toggleMarketAndLimit': toggleMarketAndLimit,
      'togglePayMode': togglePayMode,
      'togglePriceMode': togglePriceMode,
      'isSwapped': isSwapped,
      'payAmount': payAmount,
      'priceAmount': priceAmount,
      'priceInputMode': priceInputMode,
      'priceController': priceController.text,
      'priceFocusNode': priceFocusNode.hasFocus,
      'slAmount': slAmount,
      'tpAmount': tpAmount,
      'toggleSlMode': toggleSlMode,
      'toggleTpMode': toggleTpMode,
      'isError': isError,
      'buttonText': buttonText,
      'liquidatesAt': liquidatesAt,
    };
  }

  factory LeverageTradingViewState.fromMap(Map<String, dynamic> map) {
    return LeverageTradingViewState(
      selectedPair:
          TradingPairModel.fromMap(map['selectedPair'] as Map<String, dynamic>),
      sltp: map['sltp'] as bool,
      leverage: map['leverage'] as double,
      toggleMarketAndLimit: map['toggleMarketAndLimit'] as bool,
      togglePayMode: map['togglePayMode'] as bool,
      togglePriceMode: map['togglePriceMode'] as bool,
      isSwapped: map['isSwapped'] as bool,
      payAmount: map['payAmount'] as String,
      priceAmount: map['priceAmount'] as String,
      priceInputMode: map['priceInputMode'] as bool,
      priceController: TextEditingController(text: map['priceController']),
      priceFocusNode: FocusNode(),
      slAmount: map['slAmount'] as String,
      tpAmount: map['tpAmount'] as String,
      toggleSlMode: map['toggleSlMode'] as bool,
      toggleTpMode: map['toggleTpMode'] as bool,
      isError: map['isError'] as bool,
      buttonText: map['buttonText'] as String,
      liquidatesAt: map['liquidatesAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LeverageTradingViewState.fromJson(String source) =>
      LeverageTradingViewState.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LeverageTradingViewState(selectedPair: $selectedPair, sltp: $sltp, leverage: $leverage, toggleMarketAndLimit: $toggleMarketAndLimit, togglePayMode: $togglePayMode, togglePriceMode: $togglePriceMode, isSwapped: $isSwapped, payAmount: $payAmount, priceAmount: $priceAmount, priceInputMode: $priceInputMode, priceController: $priceController, priceFocusNode: $priceFocusNode, slAmount: $slAmount, tpAmount: $tpAmount, toggleSlMode: $toggleSlMode, toggleTpMode: $toggleTpMode, isError: $isError, buttonText: $buttonText, liquidatesAt: $liquidatesAt)';
  }

  @override
  bool operator ==(covariant LeverageTradingViewState other) {
    if (identical(this, other)) return true;

    return other.selectedPair == selectedPair &&
        other.sltp == sltp &&
        other.leverage == leverage &&
        other.toggleMarketAndLimit == toggleMarketAndLimit &&
        other.togglePayMode == togglePayMode &&
        other.togglePriceMode == togglePriceMode &&
        other.isSwapped == isSwapped &&
        other.payAmount == payAmount &&
        other.priceAmount == priceAmount &&
        other.priceInputMode == priceInputMode &&
        other.priceController == priceController &&
        other.priceFocusNode == priceFocusNode &&
        other.slAmount == slAmount &&
        other.tpAmount == tpAmount &&
        other.toggleSlMode == toggleSlMode &&
        other.toggleTpMode == toggleTpMode &&
        other.isError == isError &&
        other.buttonText == buttonText &&
        other.liquidatesAt == liquidatesAt;
  }

  @override
  int get hashCode {
    return selectedPair.hashCode ^
        sltp.hashCode ^
        leverage.hashCode ^
        toggleMarketAndLimit.hashCode ^
        togglePayMode.hashCode ^
        togglePriceMode.hashCode ^
        isSwapped.hashCode ^
        payAmount.hashCode ^
        priceAmount.hashCode ^
        priceInputMode.hashCode ^
        priceController.hashCode ^
        priceFocusNode.hashCode ^
        slAmount.hashCode ^
        tpAmount.hashCode ^
        toggleSlMode.hashCode ^
        toggleTpMode.hashCode ^
        isError.hashCode ^
        buttonText.hashCode ^
        liquidatesAt.hashCode;
  }
}
