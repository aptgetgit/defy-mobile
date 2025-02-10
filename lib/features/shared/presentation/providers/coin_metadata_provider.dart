import 'package:graphql/src/graphql_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/defy-graphql/defy_graphql_provider.dart';
import '../../data/sources/remote/coin_metadata_service.dart';

part 'generated/coin_metadata_provider.g.dart';

@riverpod
CoinMetadataService coinMetadataService(Ref ref) {
  final GraphQLClient client = ref.read(defyGraphQlClientProvider);
  return CoinMetadataService(client);
}

@riverpod
Future<Map<String, dynamic>?> coinsMetaData(Ref ref, List<String> coinIdList) {
  final CoinMetadataService service = ref.watch(coinMetadataServiceProvider);
  return service.getCoinsMetaData(coinIdList);
}
