// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:defy/features/shared/data/sources/remote/user_wallet_tokens_remote_source.dart';
import 'package:defy/features/shared/domain/entities/user_wallet_token.dart';
import 'package:defy/features/shared/domain/repositories/user_wallet_tokens_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserWalletTokensRepositoryImplementation implements UserWalletTokensRepository {
  final UserWalletTokensRemoteSource _remoteDataSource;
  UserWalletTokensRepositoryImplementation(this._remoteDataSource);
  @override
  Future<List<UserWalletToken>?> fetchUserWalletTokens(String ownerAddress, GraphQLClient aptosClient) async {
    final response = await _remoteDataSource.fetchUserWalletTokens(ownerAddress, aptosClient);
    final userWalletTokens = response?.map((token) => token.toDomain()).toList();
    return userWalletTokens;
  }
}
