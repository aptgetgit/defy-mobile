import 'package:defy/core/logging/app_logger.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:defy/features/marketplace/data/models/wallet_inventory_model.dart';

abstract class WalletInventoryRemote {
  Future<WalletInventoryModel?> getWalletInventory({required String owner});
}

class WalletInventoryRemoteImpl implements WalletInventoryRemote {
  final GraphQLClient _client;

  WalletInventoryRemoteImpl(this._client);

  @override
  Future<WalletInventoryModel?> getWalletInventory(
      {required String owner}) async {
    const String query = r'''
    query fetchWalletInventoryWithListings($owner: String!) {
      aptos {
        collections(
          where: {nfts: {owner: {_eq: $owner}}, floor: {}, volume: {}}
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

    try {
      final QueryOptions options = QueryOptions(
        document: gql(query),
        variables: {'owner': owner},
      );

      AppLogger.debug(
          'WalletInventoryRemoteImpl: Executing query with variables: ${options.variables}');

      final QueryResult result = await _client.query(options);

      AppLogger.debug('WalletInventoryRemoteImpl: Response status: ${result.source}');

      if (result.hasException) {
        AppLogger.debug(
            'WalletInventoryRemoteImpl: GraphQL Errors: ${result.exception.toString()}');
        if (result.exception?.graphqlErrors.isNotEmpty ?? false) {
          for (var error in result.exception!.graphqlErrors) {
            AppLogger.debug('GraphQL Error: ${error.message}');
            AppLogger.debug('Error Location: ${error.locations}');
            AppLogger.debug('Error Path: ${error.path}');
            AppLogger.debug('Error Extensions: ${error.extensions}');
          }
        }
        return null;
      }

      if (result.data != null && result.data!['aptos'] != null) {
        AppLogger.debug('WalletInventoryRemoteImpl: Raw response: ${result.data}');
        return WalletInventoryModel.fromJson(result.data!);
      } else {
        AppLogger
            .debug("WalletInventoryRemoteImpl: No data available in the response");
        return null;
      }
    } catch (e) {
      AppLogger.debug('WalletInventoryRemoteImpl: Error occurred: $e');
      return null;
    }
  }
}
