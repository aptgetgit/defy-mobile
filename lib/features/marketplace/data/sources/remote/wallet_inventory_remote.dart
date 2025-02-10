import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/marketplace/data/models/wallet_inventory_model.dart';

abstract class WalletInventoryRemote {
  Future<WalletInventoryModel?> getWalletInventory({required String owner});
}

class WalletInventoryRemoteImpl implements WalletInventoryRemote {
  @override
  Future<WalletInventoryModel?> getWalletInventory(
      {required String owner}) async {
    const url = 'https://api.indexer.xyz/graphql';
    final req = http.Request("POST", Uri.parse(url));
    final headers = {
      'content-type': 'application/json',
      'x-api-user': "Defy",
      'x-api-key': "s3Z2Xw1.17c86d6a8315fc025e4a475ffd4c6608",
    };
    const String query = r'''
    query fetchWalletInventoryWithListings($owner: String!) {
      aptos {
        collections(
          where: {nfts: {owner: {_eq: $owner}}}
          order_by: {usd_volume: desc_nulls_last, volume: desc_nulls_last}
        ) {
          title
          description
          floor
          usd_volume
          verified
          cover_url
          nfts(where: {owner: {_eq: $owner}}, order_by: {ranking: asc_nulls_last}) {
            media_url
            name
            owner
            collection {
              title
            }
          }
        }
      }
    }
    ''';

    req.body = jsonEncode({
      'query': query,
      'variables': {'owner': owner}
    });
    req.headers.addAll(headers);

    try {
      AppLogger.debug(
          'WalletInventoryRemoteImpl: Executing request for owner: $owner');

      final response = await http.Client().send(req);
      AppLogger.debug(
          'WalletInventoryRemoteImpl: Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final jsonString = await response.stream.transform(utf8.decoder).join();
        final data = jsonDecode(jsonString) as Map<String, dynamic>;
        AppLogger.debug('WalletInventoryRemoteImpl: Raw response: $data');

        if (data['data'] != null && data['data']['aptos'] != null) {
          final aptosData = data['data']['aptos'] as Map<String, dynamic>;
          final collectionsData = aptosData['collections'] as List<dynamic>?;

          if (collectionsData != null) {
            final collections = collectionsData.map((collectionJson) {
              return CollectionModel(
                title: collectionJson['title'] as String? ?? '',
                description: collectionJson['description'] as String?,
                floor: (collectionJson['floor'] as num?)?.toDouble(),
                usdVolume: (collectionJson['usd_volume'] as num?)?.toDouble(),
                verified: collectionJson['verified'] as bool? ?? false,
                coverUrl: collectionJson['cover_url'] as String?,
                nfts: (collectionJson['nfts'] as List<dynamic>?)
                        ?.map((nftJson) {
                      return NFTModel(
                        mediaUrl: nftJson['media_url'] as String? ?? '',
                        name: nftJson['name'] as String? ?? '',
                        owner: nftJson['owner'] as String? ?? '',
                        collection: CollectionTitleModel(
                          title:
                              nftJson['collection']['title'] as String? ?? '',
                        ),
                      );
                    }).toList() ??
                    [],
              );
            }).toList();

            return WalletInventoryModel(
              aptos: AptosModel(collections: collections),
            );
          }
        }
        AppLogger.debug(
            "WalletInventoryRemoteImpl: No valid data in the response");
        return null;
      } else {
        AppLogger.debug(
            'WalletInventoryRemoteImpl: HTTP Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      AppLogger.debug('WalletInventoryRemoteImpl: Error occurred: $e');
      return null;
    }
  }
}
