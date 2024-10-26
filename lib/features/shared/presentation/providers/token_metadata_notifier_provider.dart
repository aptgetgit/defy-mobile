import 'package:defy/features/shared/domain/entities/token_metadata.dart';
import 'package:defy/features/shared/presentation/providers/graphql_provider.dart';
import 'package:defy/features/shared/presentation/providers/time_provider.dart';
import 'package:defy/features/shared/presentation/providers/token_metadata_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/token_metadata_notifier_provider.g.dart';

@riverpod
class TokenMetaData extends _$TokenMetaData {
  @override
  Future<double?> build(String coinId,double amount) async {
    _periodicFetch();
    return _fetchPrice(coinId,amount);
  }

  Future<double?> _fetchPrice(String coinId,double amount) async {
    final defyClient = ref.read(defyGraphQlClientProvider); 
    final coinMetaData = await ref.read(tokenMetaDataUseCaseProvider).call(defyClient, [coinId]);
    final priceInUsd = _calculateAmountInUsd(amount,coinMetaData);
    return priceInUsd;
  }

  Future<void> _periodicFetch() async {
    ref.listen(tokenMetadataFetchtimerProvider, (_, __) {
      _backgroundFetch();
    });
  }

  Future<void> _backgroundFetch() async {
    try {
      final newPrice = await _fetchPrice(coinId,amount);
      state = AsyncValue.data(newPrice);
    } catch (e) {}
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