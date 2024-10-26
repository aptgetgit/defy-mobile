import 'package:defy/features/shared/domain/entities/user_wallet_token.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class UserWalletTokensRepository {
  Future<List<UserWalletToken>?> fetchUserWalletTokens(String ownerAddress,GraphQLClient aptosClient);
}