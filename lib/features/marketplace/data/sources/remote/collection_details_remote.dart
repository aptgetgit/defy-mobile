import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../config/environment/env.dart';
import '../../models/collection_details_model.dart';

abstract class CollectionDetailsRemote {
  Future<List<CollectionDetailsModel>?> getCollectionDetails({
    required String id,
    required String slug,
    required int offsetListings,
    required int limitListings,
    required int offsetActivity,
    required int limitActivity,
  });
}

class CollectionDetailsRemoteImpl extends CollectionDetailsRemote {
  @override
  Future<List<CollectionDetailsModel>?> getCollectionDetails({
    required String id,
    required String slug,
    required int offsetListings,
    required int limitListings,
    required int offsetActivity,
    required int limitActivity,
  }) async {
    const url = 'https://api.indexer.xyz/graphql';

    final Map<String, String> headers = {
      'content-type': 'application/json',
      'x-api-user': 'Defy',
      'x-api-key': Env.tradePortApiKey,
    };

    const String query = r'''
    query CombinedCollectionDetails(
  $slug: String!,
  $where_listings: listings_bool_exp!,
  $order_by_listings: [listings_order_by!],
  $offset_listings: Int,
  $limit_listings: Int!,
  $where_activity: recent_actions_bool_exp,
  $offset_activity: Int,
  $limit_activity: Int!
) {
  aptos {
    collections: collections(
      where: {
        _or: [{ semantic_slug: { _eq: $slug } }, { slug: { _eq: $slug } }]
      }
    ) {
      id
      title
      slug
      semantic_slug
      description
      floor
      volume
      usd_volume
      cover_url
      supply
      verified
      discord
      twitter
      website
    }
    listings(
      where: $where_listings
      order_by: $order_by_listings
      offset: $offset_listings
      limit: $limit_listings
    ) {
      id
      price
      block_time
      seller
      nft {
        id
        name
        media_url
        media_type
        ranking
      }
      contract {
        key
      }
    }
    collection_stats(slug: $slug) {
      total_mint_volume
      total_mint_usd_volume
      total_sales
      total_usd_volume
      total_volume
      day_volume
      day_sales
      day_usd_volume
    }
    actions: recent_actions(
      where: $where_activity
      order_by: [{block_time: desc}, {tx_index: desc}]
      offset: $offset_activity
      limit: $limit_activity
    ) {
      id
      type
      price
      usd_price
      sender
      receiver
      block_time
      nft {
        id
        name
        media_url
        ranking
      }
    }
  }
}
    ''';

    final Map<String, Object> variables = {
      'slug': slug,
      'where_listings': {
        'collection_id': {'_eq': id},
        'listed': {'_eq': true}
      },
      'order_by_listings': {'price': 'asc_nulls_last'},
      'offset_listings': offsetListings,
      'limit_listings': limitListings,
      'where_activity': {
        'collection_id': {'_eq': id},
        'type': {
          '_in': [
            'list',
            'relist',
            'unlist',
            'buy',
            'collection-bid',
            'bid',
            'solo-bid',
            'multi-collection-bid',
            'unlist-bid',
            'unlist-collection-bid',
            'cancel-collection-bid',
            'accept-bid',
            'accept-collection-bid',
            'accept-attribute-bid',
            'create-long',
            'buy-short',
            'cancel-short',
            'exercise-long',
            'cancel-long',
            'buy-long',
            'create-short',
            'exercise-short',
            'transfer',
            'transfer-hold',
            'mint',
            'stake',
            'unstake',
            'trade-hold',
            'burn'
          ]
        }
      },
      'offset_activity': offsetActivity,
      'limit_activity': limitActivity,
    };

    final req = http.Request('POST', Uri.parse(url))
      ..body = jsonEncode({
        'query': query,
        'variables': variables,
      })
      ..headers.addAll(headers);

    try {
      final http.StreamedResponse res = await http.Client().send(req);

      if (res.statusCode == 200) {
        final String jsonString = await res.stream.transform(utf8.decoder).join();
        final data = jsonDecode(jsonString) as Map<String, dynamic>;

        if (data['data'] != null && data['data']['aptos'] != null) {
          final collectionData = data['data']['aptos'];
          final CollectionDetailsModel collectionDetails =
              CollectionDetailsModel.fromJson(collectionData as Map<String, dynamic>);

          return [collectionDetails];
        } else {
          print('No data available in the response');
          return null;
        }
      } else {
        print('Failed to fetch collection details: ${res.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
}
