import 'package:defy/shared/currency/data/models/local/currency_rate_local_model.dart';
import 'package:defy/shared/currency/data/sources/local/currency_rate_local_source.dart';
import 'package:defy/shared/currency/data/sources/remote/currency_rate_remote_source.dart';
import 'package:defy/shared/currency/domain/entities/currency_rate.dart';

import '../../domain/repositories/currency_rate_repository.dart';

class CurrencyRateRepository implements ICurrencyRateRepository {
  final CurrencyRateLocalDataSource _localDataSource;
  final CurrencyRateRemoteDataSource _remoteDataSource;

  CurrencyRateRepository(this._localDataSource, this._remoteDataSource);

  @override
  List<CurrencyRate> listLocalCurrencyRates() {
    return _localDataSource
        .listCurrencyRates()
        .map((model) => model.toDomain())
        .toList();
  }

  @override
  CurrencyRate? getLocalCurrencyRate(String currencyCode) {
    final model = _localDataSource.getCurrencyRate(currencyCode);
    return model?.toDomain();
  }

  @override
  void saveLocalCurrencyRate(CurrencyRate currencyRate) {
    final existingRate = _localDataSource.getCurrencyRate(currencyRate.code);
    if (existingRate == null) {
      _localDataSource
          .saveCurrencyRate(CurrencyRateLocalModel.fromDomain(currencyRate));
    }
  }

  @override
  void deleteLocalCurrencyRate(String currencyCode) {
    _localDataSource.deleteCurrencyRate(currencyCode);
  }

  @override
  Future<List<CurrencyRate>> listRemoteCurrencyRates() async {
    final response = await _remoteDataSource.getCurrencyRates();
    return response.toDomain();
  }

  @override
  Future<void> syncCurrencyRates() async {
    final remoteRates = await listRemoteCurrencyRates();
    for (final rate in remoteRates) {
      saveLocalCurrencyRate(rate);
    }
  }
}
