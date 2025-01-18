import '../entities/currency_rate.dart';

abstract class ICurrencyRateRepository {
  // Local operations
  List<CurrencyRate> listLocalCurrencyRates();
  CurrencyRate? getLocalCurrencyRate(String currencyCode);
  void saveLocalCurrencyRate(CurrencyRate currencyRate);
  void deleteLocalCurrencyRate(String currencyCode);

  // Remote operations
  Future<List<CurrencyRate>> listRemoteCurrencyRates();
  // Future<CurrencyRate?> getRemoteCurrencyRate(String currencyCode);

  // Sync operation
  Future<void> syncCurrencyRates();
}
