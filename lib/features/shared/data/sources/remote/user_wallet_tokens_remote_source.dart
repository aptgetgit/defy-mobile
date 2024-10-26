import 'package:defy/features/shared/data/models/tokens/user_wallet_token_remote_model.dart';
import 'package:defy_graphql/aptos_graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class UserWalletTokensRemoteSource {
  Future<List<UserWalletTokenRemoteModel>?> fetchUserWalletTokens(
      String ownerAddress, GraphQLClient aptosClient);
}

class UserWalletTokensRemoteSourceImpl implements UserWalletTokensRemoteSource {
  @override
  Future<List<UserWalletTokenRemoteModel>?> fetchUserWalletTokens(
      String ownerAddress, GraphQLClient aptosClient) async {
    final QueryOptions options = QueryOptions(
      document: documentNodeQueryFungibleAssetBalanceQuery,
      variables: {
        "owner_address_list": [ownerAddress],
      },
    );
    final QueryResult result = await aptosClient.query(options);
    var responseBody = result.data;

    if (responseBody != null) {
      final tokenHoldingsMap = responseBody["current_fungible_asset_balances"];
      List<UserWalletTokenRemoteModel> walletTokenHoldings = [];

      //converting data from res to model
      for (int i = 0; i < tokenHoldingsMap.length; i++) {
        final token = UserWalletTokenRemoteModel.fromJson(tokenHoldingsMap[i]);
        walletTokenHoldings.add(token);
      }

      return walletTokenHoldings;
    }
    return null;
  }
}
