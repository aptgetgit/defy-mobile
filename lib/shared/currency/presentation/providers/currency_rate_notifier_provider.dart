import 'package:defy/shared/currency/data/repositories/currency_rate_repository_implementation.dart';
import 'package:defy/shared/currency/presentation/providers/currency_rate_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/currency_rate.dart';

part 'generated/currency_rate_notifier_provider.g.dart';

@riverpod
class CurrencyRateNotifier extends _$CurrencyRateNotifier {
  late final CurrencyRateRepository _repository;

  @override
  FutureOr<List<CurrencyRate>> build() {
    _repository = ref.watch(currencyRateRepositoryProvider);
    return _fetchRates();
  }

  Future<List<CurrencyRate>> _fetchRates() async {
    // Get local data first
    List<CurrencyRate> localData = _repository.listLocalCurrencyRates();
    state = AsyncData(localData);

    try {
      // Sync with remote data
      await _repository.syncCurrencyRates();

      // Get updated local data
      List<CurrencyRate> updatedData = _repository.listLocalCurrencyRates();

      // Update state only if data has changed
      if (!listEquals(localData, updatedData)) {
        state = AsyncData(updatedData);
        localData = updatedData;
      }
    } catch (e, stack) {
      // Keep showing local data but indicate error state
      state = AsyncError(e, stack);
    }

    return localData;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _fetchRates());
  }

  // Additional utility methods

  double convertCurrency({
    required double amount,
    required String from,
    required String to,
  }) {
    final rates = state.valueOrNull ?? [];
    if (rates.isEmpty) return amount;

    final fromRate = rates.firstWhere(
      (rate) => rate.code.toLowerCase() == from.toLowerCase(),
      orElse: () => CurrencyRate(
        id: 'usd',
        code: 'USD',
        rate: 1.0,
        lastUpdate: DateTime.now(),
      ),
    );

    final toRate = rates.firstWhere(
      (rate) => rate.code.toLowerCase() == to.toLowerCase(),
      orElse: () => fromRate,
    );

    return amount * (toRate.rate / fromRate.rate);
  }

  // Get a specific currency rate
  CurrencyRate? getRateForCurrency(String currencyCode) {
    final rates = state.valueOrNull;
    if (rates == null) return null;

    try {
      return rates.firstWhere(
        (rate) => rate.code.toLowerCase() == currencyCode.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }
}
