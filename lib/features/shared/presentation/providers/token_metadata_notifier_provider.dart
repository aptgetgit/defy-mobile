import 'package:defy/features/shared/domain/entities/token_metadata.dart';
import 'package:defy/features/shared/presentation/providers/graphql_provider.dart';
import 'package:defy/features/shared/presentation/providers/time_provider.dart';
import 'package:defy/features/shared/presentation/providers/token_metadata_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/token_metadata_notifier_provider.g.dart';

@riverpod
class TokenMetaData extends _$TokenMetaData {
  @override
  Future<TokenMetaDataEntity?> build(String? coinId) async {
    _periodicFetch(coinId);
    return _fetchData(coinId);
  }

  Future<TokenMetaDataEntity?> _fetchData(String? coinId) async {
    final defyClient = ref.read(defyGraphQlClientProvider); 
    if(coinId == null) return null;
    final coinMetaData = await ref.read(tokenMetaDataUseCaseProvider).call(defyClient, [coinId]);
    if(coinMetaData == null || coinMetaData.isEmpty){
      return null;
    } else {
      return coinMetaData[0];
    }
  }

  Future<void> _periodicFetch(String? coinId) async {
    ref.listen(tokenMetadataFetchtimerProvider, (_, __) {
      _backgroundFetch(coinId);
    });
  }

  Future<void> _backgroundFetch(String? coinId) async {
    try {
      final newData = await _fetchData(coinId);
      if (!_areListsEqual(newData, state.value)) {
        state = AsyncValue.data(newData);
      }
    } catch (e) {}
  }

  bool _areListsEqual(
      TokenMetaDataEntity? token1, TokenMetaDataEntity? token2) {
    if (token1 == null || token2 == null) return token1 == token2;
    return true;
  }

double? _calculateAmountInUsd(
    double? coinAmount, List<TokenMetaDataEntity>? coinMetaData) {
  if (coinAmount != null && coinMetaData != null && coinMetaData.isNotEmpty) {
    final priceUsd = coinMetaData.first.coinMetric?.priceUsd;
    if (priceUsd != null) {
      final coinAmountInUsd = coinAmount * priceUsd;
      return coinAmountInUsd;
    }
  }
  return null;
}
}