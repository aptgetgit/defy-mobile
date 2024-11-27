import 'package:defy/core/database/objectbox/objectbox.g.dart';
import 'package:defy/shared/currency/data/models/local/currency_rate_local_model.dart';

class CurrencyRateLocalDataSource {
  final Store _store;

  CurrencyRateLocalDataSource(this._store);

  List<CurrencyRateLocalModel> listCurrencyRates() {
    return _store.box<CurrencyRateLocalModel>().getAll();
  }

  CurrencyRateLocalModel? getCurrencyRate(String currencyCode) {
    return _store
        .box<CurrencyRateLocalModel>()
        .query(CurrencyRateLocalModel_.remoteId.equals(currencyCode))
        .build()
        .findFirst();
  }

  void saveCurrencyRate(CurrencyRateLocalModel currencyRate) {
    _store.box<CurrencyRateLocalModel>().put(currencyRate);
  }

  void deleteCurrencyRate(String currencyCode) {
    final box = _store.box<CurrencyRateLocalModel>();
    final model = box
        .query(CurrencyRateLocalModel_.remoteId.equals(currencyCode))
        .build()
        .findFirst();
    if (model != null) {
      box.remove(model.localId);
    }
  }
}
