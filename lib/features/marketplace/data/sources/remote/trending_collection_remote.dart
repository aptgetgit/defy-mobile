import 'dart:convert';

import 'package:defy/features/marketplace/data/models/trending_collection_model.dart';
import 'package:http/http.dart' as http;

abstract class TrendingCollectionRemote {
  Future<List<TrendingCollectionModel>?> getTrendingCollections({required String period,required String trendingBy,required int offset,required int limit,});
}

class TrendingCollectionRemoteImpl extends  TrendingCollectionRemote {
  @override
  Future<List<TrendingCollectionModel>?> getTrendingCollections({required String period,required String trendingBy,required int offset,required int limit,}) async {
    const url = 'https://api.indexer.xyz/graphql';
    final req = http.Request("POST", Uri.parse(url));
    final headers = {
      'content-type': 'application/json',
      'x-api-user': "Defy",
      'x-api-key': "s3Z2Xw1.17c86d6a8315fc025e4a475ffd4c6608",
    };
    const String query = r'''
query FetchTrendingCollections(
  $period: TrendingPeriod!
  $trending_by: TrendingBy!
  $offset: Int = 0
  $limit: Int!
) {
  aptos {
    collections_trending(
      period: $period
      trending_by: $trending_by
      offset: $offset
      limit: $limit
    ) {
      id: collection_id
      current_trades_count
      current_usd_volume
      current_volume
      previous_trades_count
      previous_usd_volume
      previous_volume
      collection {
        id
        slug
        title
        supply
        cover_url
        floor
        usd_volume
        volume
        verified
      }
    }
  }
}

''';
    req.body = jsonEncode({
      'query': query,
      'variables': {
        'period': period,
        'trending_by': trendingBy,
        'offset': offset,
        'limit': limit
        }
    });
    req.headers.addAll(headers);

    try {
      final response = await http.Client().send(req);
      if (response.statusCode == 200) {
        final jsonString = await response.stream.transform(utf8.decoder).join();
        final data = jsonDecode(jsonString) as Map<String, dynamic>;
        final collectionstrending = data['data']['aptos']['collections_trending'];
        final List<TrendingCollectionModel> trendingCollections= [];
        if (collectionstrending != null && collectionstrending.isNotEmpty) {
          for(int i=0;i<collectionstrending.length;i++){
            final collection = TrendingCollectionModel.fromJson(collectionstrending[i]);
            trendingCollections.add(collection);
          } 
        }
        return trendingCollections;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}