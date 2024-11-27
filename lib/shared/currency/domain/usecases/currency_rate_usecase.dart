import 'package:defy/shared/currency/data/repositories/currency_rate_repository_implementation.dart';
import 'package:defy/shared/currency/domain/entities/currency_rate.dart';

class ListLocalCurrencyRatesUseCase {
  final CurrencyRateRepository _repository;

  ListLocalCurrencyRatesUseCase(this._repository);

  List<CurrencyRate> call() {
    return _repository.listLocalCurrencyRates();
  }
}

class GetLocalCurrencyRateUseCase {
  final CurrencyRateRepository _repository;

  GetLocalCurrencyRateUseCase(this._repository);

  CurrencyRate? call(String currencyCode) {
    return _repository.getLocalCurrencyRate(currencyCode);
  }
}

class SaveLocalCurrencyRateUseCase {
  final CurrencyRateRepository _repository;

  SaveLocalCurrencyRateUseCase(this._repository);

  void call(CurrencyRate currencyRate) {
    return _repository.saveLocalCurrencyRate(currencyRate);
  }
}

class DeleteLocalCurrencyRateUseCase {
  final CurrencyRateRepository _repository;

  DeleteLocalCurrencyRateUseCase(this._repository);

  void call(String currencyCode) {
    return _repository.deleteLocalCurrencyRate(currencyCode);
  }
}

class ListRemoteCurrencyRatesUseCase {
  final CurrencyRateRepository _repository;

  ListRemoteCurrencyRatesUseCase(this._repository);

  Future<List<CurrencyRate>> call() {
    return _repository.listRemoteCurrencyRates();
  }
}

// class GetRemoteCurrencyRateUseCase {
//   final CurrencyRateRepository _repository;

//   GetRemoteCurrencyRateUseCase(this._repository);

//   Future<CurrencyRate?> call(String currencyCode) {
//     return _repository.getRemoteCurrencyRate(currencyCode);
//   }
// }

class SyncCurrencyRatesUseCase {
  final CurrencyRateRepository _repository;

  SyncCurrencyRatesUseCase(this._repository);

  Future<void> call() {
    return _repository.syncCurrencyRates();
  }
}
