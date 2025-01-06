import 'package:defy/features/shared/data/sources/remote/token_metadata_remote_source.dart';
import 'package:defy/features/shared/domain/entities/token_metadata.dart';
import 'package:defy/features/shared/domain/repositories/token_metadata_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TokenMetadataRepositoryImplementation implements TokenMetaDataRepository{
  final TokenMetadataRemoteSource _remoteSource;

  TokenMetadataRepositoryImplementation(this._remoteSource);
  @override
  Future<List<TokenMetaDataEntity>?> fetchCoinMetaData(GraphQLClient defyClient, List<String> coinId) async {
    final response = await _remoteSource.fetchTokenMetaData(defyClient, coinId);
    final tokens = response?.map((token) => token.toDomain()).toList();
    return tokens;
  }
}