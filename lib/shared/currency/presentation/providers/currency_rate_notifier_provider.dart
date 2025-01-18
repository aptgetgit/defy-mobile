import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/currency_rate_repository_implementation.dart';
import '../../domain/entities/currency_rate.dart';
import 'currency_rate_provider.dart';

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
    state = AsyncData<List<CurrencyRate>>(localData);

    try {
      // Sync with remote data
      await _repository.syncCurrencyRates();

      // Get updated local data
      final List<CurrencyRate> updatedData =
          _repository.listLocalCurrencyRates();

      // Update state only if data has changed
      if (!listEquals(localData, updatedData)) {
        state = AsyncData<List<CurrencyRate>>(updatedData);
        localData = updatedData;
      }
    } on Exception catch (e, stack) {
      // Keep showing local data but indicate error state
      state = AsyncError<List<CurrencyRate>>(e, stack);
    }

    return localData;
  }

  Future<void> refresh() async {
    state = const AsyncLoading<List<CurrencyRate>>();
    state = AsyncData<List<CurrencyRate>>(await _fetchRates());
  }

  // Additional utility methods

  double convertCurrency({
    required double amount,
    required String from,
    required String to,
  }) {
    final List<CurrencyRate> rates = state.valueOrNull ?? <CurrencyRate>[];
    if (rates.isEmpty) {
      return amount;
    }

    final CurrencyRate fromRate = rates.firstWhere(
      (CurrencyRate rate) => rate.code.toLowerCase() == from.toLowerCase(),
      orElse: () => CurrencyRate(
        id: 'usd',
        code: 'USD',
        rate: 1,
        lastUpdate: DateTime.now(),
      ),
    );

    final CurrencyRate toRate = rates.firstWhere(
      (CurrencyRate rate) => rate.code.toLowerCase() == to.toLowerCase(),
      orElse: () => fromRate,
    );

    return amount * (toRate.rate / fromRate.rate);
  }

  // Get a specific currency rate
  CurrencyRate? getRateForCurrency(String currencyCode) {
    final List<CurrencyRate>? rates = state.valueOrNull;
    if (rates == null) {
      return null;
    }

    try {
      return rates.firstWhere(
        (CurrencyRate rate) =>
            rate.code.toLowerCase() == currencyCode.toLowerCase(),
      );
    } on Exception catch (_) {
      return null;
    }
  }
}
