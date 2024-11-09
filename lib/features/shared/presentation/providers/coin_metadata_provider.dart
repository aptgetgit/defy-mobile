import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:defy/core/providers/defy_graphql_provider.dart';
import 'package:defy/features/shared/data/sources/remote/coin_metadata_service.dart';

part 'generated/coin_metadata_provider.g.dart';

@riverpod
CoinMetadataService coinMetadataService(CoinMetadataServiceRef ref) {
  final client = ref.read(defyGraphQlClientProvider);
  return CoinMetadataService(client);
}

@riverpod
Future<Map<String, dynamic>?> coinsMetaData(CoinsMetaDataRef ref, List<String> coinIdList) {
  final service = ref.watch(coinMetadataServiceProvider);
  return service.getCoinsMetaData(coinIdList);
}