import '../../../../../core/database/objectbox/objectbox.g.dart';
import '../../models/local/currency_rate_local_model.dart';

class CurrencyRateLocalDataSource {
  CurrencyRateLocalDataSource(this._store);
  final Store _store;

  List<CurrencyRateLocalModel> listCurrencyRates() =>
      _store.box<CurrencyRateLocalModel>().getAll();

  CurrencyRateLocalModel? getCurrencyRate(String currencyCode) => _store
      .box<CurrencyRateLocalModel>()
      .query(CurrencyRateLocalModel_.remoteId.equals(currencyCode))
      .build()
      .findFirst();

  void saveCurrencyRate(CurrencyRateLocalModel currencyRate) {
    _store.box<CurrencyRateLocalModel>().put(currencyRate);
  }

  void deleteCurrencyRate(String currencyCode) {
    final Box<CurrencyRateLocalModel> box =
        _store.box<CurrencyRateLocalModel>();
    final CurrencyRateLocalModel? model = box
        .query(CurrencyRateLocalModel_.remoteId.equals(currencyCode))
        .build()
        .findFirst();
    if (model != null) {
      box.remove(model.localId);
    }
  }
}
