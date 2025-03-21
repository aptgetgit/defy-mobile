// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/token.dart';

part 'generated/swap_provider.g.dart';

@riverpod
class Swap extends _$Swap {
  @override
  SwapState build() => SwapState(
      tokens: <Token>[
        Token(name: 'Aptos', symbol: 'APT', icon: 'assets/icons/aptos.png', amount: 117.8, usdValue: 142.39),
        Token(name: 'Gui Inu', symbol: 'GUI', icon: 'assets/icons/gui-inu.png', amount: 10000200.10, usdValue: 142.39),
        Token(name: 'Bluemove', symbol: 'MOVE', icon: 'assets/icons/bluemove.png', amount: 12760.34, usdValue: 142.39),
        Token(name: 'Pancake', symbol: 'CAKE', icon: 'assets/icons/pancake.png', amount: 3758.00, usdValue: 142.39),
        Token(name: 'Thala', symbol: 'THL', icon: 'assets/icons/thala.png', amount: 3758.00, usdValue: 142.39),
        Token(name: 'Aptos', symbol: 'APT', icon: 'assets/icons/aptos.png', amount: 117.8, usdValue: 142.39),
        Token(name: 'Gui Inu', symbol: 'GUI', icon: 'assets/icons/gui-inu.png', amount: 10000200.10, usdValue: 142.39),
      ],
      fromAmount: '0.00',
      toAmount: '0.00',
      fromToken: null,
      toToken: null,
      isFromLarge: true,
      isLimit: false,
    );

  void setFromToken(Token token) {
    state = state.copyWith(fromToken: token);
  }

  void setToToken(Token token) {
    state = state.copyWith(toToken: token);
  }

  void setActiveBox(String? box) {
    state = state.copyWith(activeBox: box);
  }

  void swapContainerSizes() {
    state = state.copyWith(isFromLarge: !state.isFromLarge);
  }

  void toggleLimit() {
    state = state.copyWith(isLimit: !state.isLimit);
  }
  
  // The setAmount method should be removed or replaced
  void setFromAmount(String amount) {
    state = state.copyWith(fromAmount: amount);
    
    // Only update toAmount if conversion is enabled
    if (state.convertAmounts && state.fromToken != null && state.toToken != null) {
      final double ratio = state.toToken!.usdValue / state.fromToken!.usdValue;
      final double fromAmountValue = double.tryParse(amount) ?? 0;
      final String calculatedToAmount = (fromAmountValue * ratio).toStringAsFixed(2);
      state = state.copyWith(toAmount: calculatedToAmount);
    }
  }
  
  void setToAmount(String amount) {
    state = state.copyWith(toAmount: amount);
    
    // Only update fromAmount if conversion is enabled
    if (state.convertAmounts && state.fromToken != null && state.toToken != null) {
      final double ratio = state.fromToken!.usdValue / state.toToken!.usdValue;
      final double toAmountValue = double.tryParse(amount) ?? 0;
      final String calculatedFromAmount = (toAmountValue * ratio).toStringAsFixed(2);
      state = state.copyWith(fromAmount: calculatedFromAmount);
    }
  }
  
  // Add a flag to control whether amounts should convert automatically
  void setConvertAmounts(bool convert) {
    state = state.copyWith(convertAmounts: convert);
  }
}

class SwapState {
  const SwapState({
    required this.tokens,
    required this.fromAmount,
    required this.toAmount,
    required this.fromToken,
    required this.toToken,
    required this.isFromLarge,
    required this.isLimit,
    this.activeBox,
    this.convertAmounts = false,
  });
  final List<Token> tokens;
  final String fromAmount;
  final String toAmount;
  final Token? fromToken;
  final Token? toToken;
  final String? activeBox;
  final bool isFromLarge;
  final bool isLimit;
  final bool convertAmounts;

  SwapState copyWith({
    List<Token>? tokens,
    String? fromAmount,
    String? toAmount,
    Token? fromToken,
    Token? toToken,
    String? activeBox,
    bool? isFromLarge,
    bool? isLimit,
    bool? convertAmounts,
  }) => SwapState(
      tokens: tokens ?? this.tokens,
      fromAmount: fromAmount ?? this.fromAmount,
      toAmount: toAmount ?? this.toAmount,
      fromToken: fromToken ?? this.fromToken,
      toToken: toToken ?? this.toToken,
      activeBox: activeBox ?? this.activeBox,
      isFromLarge: isFromLarge ?? this.isFromLarge,
      isLimit: isLimit ?? this.isLimit,
      convertAmounts: convertAmounts ?? this.convertAmounts,
    );
}