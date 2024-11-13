import 'package:defy/features/shared/domain/entities/user_wallet_token.dart';
import 'package:defy/features/shared/presentation/providers/user_wallet_tokens_notifier_provider.dart';
import 'package:defy/features/transaction/swap/domain/entities/swap_token_entity.dart';
import 'package:defy/features/transaction/swap/domain/entities/tokens_entity.dart';
import 'package:defy/features/transaction/swap/presentation/providers/tokens_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/tokens_notifier_provider.g.dart';

@riverpod
class Tokens extends _$Tokens {
  @override
  FutureOr<List<SwapTokenEntity>?> build() async {
    return await _getSwapTokensList();
  }

  //sTokens = tokens which the app supports currently to perform swap

  //sTokens
  Future<List<TokenEntity>?> _getTokens() async {
    final tokens = await ref.read(tokensUsecaseProvider).call();
    return tokens;
  }

  //the tokens from user wallet
  Future<List<UserWalletToken>?> _getUserWalletTokens() async {
    final tokens = await ref.watch(userWalletTokensProvider.future);
    return tokens;
  }

  //sorting the user tokens and sTokens to show user wallet tokens first followed by sTokens
  Future<List<SwapTokenEntity>?> _getSwapTokensList() async {
    final userWalletTokens = await _getUserWalletTokens();
    final tokens = await _getTokens();

    if (tokens == null || tokens.isEmpty) {
      return null;
    } else if (userWalletTokens == null || userWalletTokens.isEmpty) {
      return tokens
          .map((token) => SwapTokenEntity(
                tokenAddress: token.tokenAddress,
                name: token.name,
                symbol: token.symbol,
                logoUrl: token.logoUrl,
                decimal: token.decimals,
                amount: null,
              ))
          .toList();
    }

    //temp. user wallet tokens stored in map
    final userWalletTokenMap = {
      for (var token in userWalletTokens) token.assetType: token
    };

    final walletTokens = <SwapTokenEntity>[];
    final otherSwapTokens = <SwapTokenEntity>[];

    for (var token in tokens) {
      final walletToken = userWalletTokenMap[token.tokenAddress];
      final swapToken = SwapTokenEntity(
        tokenAddress: token.tokenAddress,
        name: token.name,
        symbol: token.symbol,
        logoUrl: token.logoUrl,
        decimal: token.decimals,
        amount: walletToken?.amount,
      );

      if (walletToken != null) {
        walletTokens.add(swapToken);
      } else {
        otherSwapTokens.add(swapToken);
      }
    }

    return [...walletTokens, ...otherSwapTokens];
  }
}
