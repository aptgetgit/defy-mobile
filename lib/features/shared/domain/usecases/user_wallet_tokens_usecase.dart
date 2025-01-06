// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:defy/features/shared/domain/entities/user_wallet_token.dart';
import 'package:defy/features/shared/domain/repositories/user_wallet_tokens_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserWalletTokensUseCase {
  final UserWalletTokensRepository _repository;
  UserWalletTokensUseCase(this._repository,);

  Future<List<UserWalletToken>?> call(String ownerAddress,GraphQLClient aptosClient) {
      return _repository.fetchUserWalletTokens(ownerAddress, aptosClient);
  }
}
