import 'package:defy/features/shared/data/models/wallet_assets/token_metadata_remote_model.dart';
import 'package:defy_graphql/defy_graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class TokenMetadataRemoteSource {
  Future<List<TokenMetaDataRemoteModel>?> fetchTokenMetaData(GraphQLClient defyClient,List<String> coinIdList);
}

class TokenMetadataRemoteSourceImpl implements TokenMetadataRemoteSource {
  @override
  Future<List<TokenMetaDataRemoteModel>?> fetchTokenMetaData(GraphQLClient defyClient, List<String> coinIdList) async {
    final QueryOptions options = QueryOptions(
    document: documentNodeQueryFetchCoinMetadata,
    variables: {
      "coin_id_list": coinIdList,
    },
  );
  final QueryResult result = await defyClient.query(options);

  var responseBody = result.data;
  if (responseBody != null) {
    final List<TokenMetaDataRemoteModel> coinMetaData = [];
    for (int i = 0; i < responseBody['coins'].length; i++) {
      final coinMetaDataModel =
          TokenMetaDataRemoteModel.fromJson(responseBody['coins'][i]);
      coinMetaData.add(coinMetaDataModel);
    }
    return coinMetaData;
  } else {
    return null;
  }
  }
}