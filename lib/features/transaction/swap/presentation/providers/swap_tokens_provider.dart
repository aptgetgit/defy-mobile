// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:defy/features/transaction/swap/domain/entities/swap_token_entity.dart';
import 'package:defy/features/transaction/swap/presentation/providers/tokens_notifier_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/swap_tokens_provider.g.dart';

class SwapAssets {
  final List<SwapTokenEntity> fromTokens;
  final List<SwapTokenEntity> toTokens;
  SwapAssets({
    required this.fromTokens,
    required this.toTokens,
  });

  SwapAssets copyWith({
    List<SwapTokenEntity>? fromTokens,
    List<SwapTokenEntity>? toTokens,
  }) {
    return SwapAssets(
      fromTokens: fromTokens ?? this.fromTokens,
      toTokens: toTokens ?? this.toTokens,
    );
  }
}

@Riverpod(keepAlive: true)
class SwapFrom extends _$SwapFrom {
  @override
  Future<List<SwapTokenEntity>> build() async {
    return _init();
  }

  Future<List<SwapTokenEntity>> _init() async {
    final swapTokens = await ref.read(tokensProvider.future);
    if (swapTokens == null) {
      return [];
    }
    final firstWalletToken = swapTokens[0].copyWith(isSelected: true);
    return [firstWalletToken, ...swapTokens.skip(1)];
  }

  void toggleSwapFromTokens(SwapTokenEntity token) {
    state = AsyncValue.data(state.value?.map((t) {
          if (t.tokenAddress == token.tokenAddress) {
            return t.copyWith(isSelected: !(t.isSelected ?? false));
          }
          return t;
        }).toList() ??
        []);
  }

  void resetTokens() async {
    state = AsyncValue.data(await _init());
  }

  void swapTokens(List<SwapTokenEntity> toTokens) {
    state = AsyncValue.data(state.value!.map((stateToken) {
      final isTokenInToTokens = toTokens.any(
          (fromToken) => fromToken.tokenAddress == stateToken.tokenAddress);

      return stateToken.copyWith(isSelected: isTokenInToTokens);
    }).toList());
  }
}

@Riverpod(keepAlive: true)
class SwapTo extends _$SwapTo {
  @override
  Future<List<SwapTokenEntity>> build() async {
    return _init();
  }

  Future<List<SwapTokenEntity>> _init() async {
    final swapTokens = await ref.read(tokensProvider.future);
    if (swapTokens == null || swapTokens.isEmpty) {
      return [];
    }

    final usdtToken = swapTokens.firstWhere(
      (token) =>
          token.tokenAddress ==
          "0xf22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa::asset::USDT",
      orElse: () => swapTokens[0],
    );

    final otherTokens = swapTokens
        .where((token) => token.tokenAddress != usdtToken.tokenAddress)
        .toList();
    return [
      usdtToken.copyWith(isSelected: true),
      ...otherTokens.map((token) => token.copyWith(isSelected: false)),
    ];
  }

  void toggleSwapToTokens(SwapTokenEntity token) {
    state = AsyncValue.data(state.value?.map((t) {
          if (t.tokenAddress == token.tokenAddress) {
            return t.copyWith(isSelected: !(t.isSelected ?? false));
          }
          return t;
        }).toList() ??
        []);
  }

  void resetTokens() async {
    state = AsyncValue.data(await _init());
  }

  void swapTokens(List<SwapTokenEntity> fromTokens) {
    state = AsyncValue.data(state.value!.map((stateToken) {
      final isTokenInFromTokens = fromTokens.any(
          (fromToken) => fromToken.tokenAddress == stateToken.tokenAddress);

      return stateToken.copyWith(isSelected: isTokenInFromTokens);
    }).toList());
  }
}

@Riverpod(keepAlive: true)
class Swap extends _$Swap {
  @override
  Future<SwapAssets> build() async {
    return _init();
  }

  Future<SwapAssets> _init() async {
    final swapFromTokens = await ref.read(swapFromProvider.future);
    final swapToTokens = await ref.read(swapToProvider.future);
    if (swapFromTokens.isEmpty || swapToTokens.isEmpty) {
      return SwapAssets(
        fromTokens: [],
        toTokens: [],
      );
    }
    return SwapAssets(
      fromTokens: [swapFromTokens[0]],
      toTokens: [swapToTokens[0]],
    );
  }

  void addFromToken(SwapTokenEntity token) {
    ref.read(swapFromProvider.notifier).toggleSwapFromTokens(token);
    state = AsyncValue.data(state.value!.copyWith(
      fromTokens: [...state.value!.fromTokens, token],
    ));
  }

  void removeFromToken(SwapTokenEntity token) {
    ref.read(swapFromProvider.notifier).toggleSwapFromTokens(token);
    final currentTokens = state.value!.fromTokens;
    final index =
        currentTokens.indexWhere((t) => t.tokenAddress == token.tokenAddress);
    if (index != -1) {
      state = AsyncValue.data(state.value!.copyWith(
        fromTokens: [...currentTokens]..removeAt(index),
      ));
    }
  }

  void addToToken(SwapTokenEntity token) {
    ref.read(swapToProvider.notifier).toggleSwapToTokens(token);
    state = AsyncValue.data(state.value!.copyWith(
      toTokens: [...state.value!.toTokens, token],
    ));
  }

  void removeToToken(SwapTokenEntity token) {
    ref.read(swapToProvider.notifier).toggleSwapToTokens(token);
    final currentTokens = state.value!.toTokens;
    final index =
        currentTokens.indexWhere((t) => t.tokenAddress == token.tokenAddress);
    if (index != -1) {
      state = AsyncValue.data(state.value!.copyWith(
        toTokens: [...currentTokens]..removeAt(index),
      ));
    }
  }

  void swapTokens() {
    final fromTokens = state.value!.fromTokens;
    final toTokens = state.value!.toTokens;

    ref.read(swapFromProvider.notifier).swapTokens(toTokens);
    ref.read(swapToProvider.notifier).swapTokens(fromTokens);

    state = AsyncValue.data(state.value!.copyWith(
      fromTokens: toTokens,
      toTokens: fromTokens,
    ));
  }

  void resetTokens(bool isSwapFrom) async {
    if (isSwapFrom) {
      ref.read(swapFromProvider.notifier).resetTokens();
      state = AsyncValue.data(await _init());
    } else {
      ref.read(swapToProvider.notifier).resetTokens();
      state = AsyncValue.data(await _init());
    }
  }
}
