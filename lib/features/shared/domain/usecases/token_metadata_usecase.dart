import 'package:defy/features/shared/domain/entities/token_metadata.dart';
import 'package:defy/features/shared/domain/repositories/token_metadata_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TokenMetadataUseCase {
  final TokenMetaDataRepository _repository;

  TokenMetadataUseCase(this._repository);

  Future<List<TokenMetaDataEntity>?> call(GraphQLClient defyClient,List<String> coinId) {
    return _repository.fetchCoinMetaData(defyClient, coinId);
  }
}