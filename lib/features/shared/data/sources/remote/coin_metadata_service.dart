import 'package:defy_graphql/defy_graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:defy/core/logging/app_logger.dart';


class CoinMetadataService {
  final GraphQLClient _client;

  CoinMetadataService(this._client);

  Future<Map<String, dynamic>?> getCoinsMetaData(List<String> coinIdList) async {
    final QueryOptions options = QueryOptions(
      document: documentNodeQueryFetchCoinMetadata,
      variables: {
        "coin_id_list": coinIdList,
      },
    );
    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      AppLogger.error('GraphQL error: ${result.exception}');
      return null;
    }

    return result.data;
  }
}