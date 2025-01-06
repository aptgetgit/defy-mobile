import 'package:defy/features/shared/domain/entities/token_metadata.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class TokenMetaDataRepository {
  Future<List<TokenMetaDataEntity>?> fetchCoinMetaData(GraphQLClient defyClient,List<String> coinId);
}