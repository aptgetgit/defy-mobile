import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/dio/providers/services/shared_preference_service_provider.dart';
import '../../../../core/services/shared_preference_service.dart';
import '../../../../shared/currency/domain/entities/currency.dart';
import '../../data/models/local/supported_currencies.dart';

part 'generated/preferred_currency_provider.g.dart';

@riverpod
class PreferredCurrencyNotifier extends _$PreferredCurrencyNotifier {
  static const String _currencyKey = 'app:setting:currency';

  @override
  Currency build() {
    final SharedPreferencesService sharedPreferences =
        ref.watch(sharedPreferencesServiceProvider);
    final String? savedCurrency = sharedPreferences.getString(_currencyKey);
    return _getCurrencyFromString(savedCurrency);
  }

  Future<void> setCurrency(Currency currency) async {
    final SharedPreferencesService sharedPreferences =
        ref.read(sharedPreferencesServiceProvider);
    await sharedPreferences.set<String>(_currencyKey, currency.code);
    state = currency;
  }

  Currency _getCurrencyFromString(String? currencyString) {
    switch (currencyString) {
      case 'btc':
        return SupportedCurrencies.btc;
      case 'apt':
        return SupportedCurrencies.apt;
      case 'usd':
        return SupportedCurrencies.usd;
      case 'eur':
        return SupportedCurrencies.eur;
      case 'inr':
        return SupportedCurrencies.inr;
      case 'jpy':
        return SupportedCurrencies.jpy;
      default:
        return SupportedCurrencies.usd;
    }
  }
}

@riverpod
Currency preferredCurrency(Ref ref) {
  final Currency currency = ref.watch(preferredCurrencyNotifierProvider);
  return currency;
}
