// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:defy/features/transaction/swap/presentation/providers/swap_data_provider.dart';
import 'package:defy/features/transaction/swap/presentation/providers/swap_tokens_provider.dart';

part 'generated/swap_ui_provider.g.dart';

@riverpod
class SwapFromTokenTextConroller extends _$SwapFromTokenTextConroller {
  @override
  double build() {
    return 0.0;
  }

  void setAmount(double amount) {
    state = amount;
  }
}

class SwapToDataEntity {
  final List<String>? platform;
  final double? price;
  SwapToDataEntity({
    required this.platform,
    required this.price,
  });
}

@riverpod
class SwapToData extends _$SwapToData {
  @override
  Future<SwapToDataEntity?> build() async {
    final amount = ref.watch(swapFromTokenTextConrollerProvider);
    final swapAssets = await ref.watch(swapProvider.future);
    final swapFromTokens = swapAssets.fromTokens;
    final swapToTokens = swapAssets.toTokens;
    final swapToAmount = amount * math.pow(10, swapFromTokens[0].decimal!);
    final fromToken = swapFromTokens[0];
    final toToken = swapToTokens[0];
    final swapData = await ref.read(swapDataProvider(
            fromToken: fromToken.tokenAddress!,
            toToken: toToken.tokenAddress!,
            amount: swapToAmount.toInt())
        .future);
    if (swapData == null) {
      return null;
    }
    final dstAmount = swapData.data?.dstAmount;
    if (dstAmount == null) return null;
    final swapAmount =
        int.parse(dstAmount) / math.pow(10, swapToTokens[0].decimal!);
    final paths = swapData.data?.paths;
    return SwapToDataEntity(
      platform : [], //add paths in it
      price : swapAmount,
    );
  }
}
