// import '../../data/repositories/currency_rate_repository_implementation.dart';
// import '../entities/currency_rate.dart';

// class ListLocalCurrencyRatesUseCase {
//   ListLocalCurrencyRatesUseCase(this._repository);
//   final CurrencyRateRepository _repository;

//   List<CurrencyRate> call() => _repository.listLocalCurrencyRates();
// }

// class GetLocalCurrencyRateUseCase {
//   GetLocalCurrencyRateUseCase(this._repository);
//   final CurrencyRateRepository _repository;

//   CurrencyRate? call(String currencyCode) =>
//       _repository.getLocalCurrencyRate(currencyCode);
// }

// class SaveLocalCurrencyRateUseCase {
//   SaveLocalCurrencyRateUseCase(this._repository);
//   final CurrencyRateRepository _repository;

//   void call(CurrencyRate currencyRate) =>
//       _repository.saveLocalCurrencyRate(currencyRate);
// }

// class DeleteLocalCurrencyRateUseCase {
//   DeleteLocalCurrencyRateUseCase(this._repository);
//   final CurrencyRateRepository _repository;

//   void call(String currencyCode) =>
//       _repository.deleteLocalCurrencyRate(currencyCode);
// }

// class ListRemoteCurrencyRatesUseCase {
//   ListRemoteCurrencyRatesUseCase(this._repository);
//   final CurrencyRateRepository _repository;

//   Future<List<CurrencyRate>> call() => _repository.listRemoteCurrencyRates();
// }

// // class GetRemoteCurrencyRateUseCase {
// //   final CurrencyRateRepository _repository;

// //   GetRemoteCurrencyRateUseCase(this._repository);

// //   Future<CurrencyRate?> call(String currencyCode) {
// //     return _repository.getRemoteCurrencyRate(currencyCode);
// //   }
// // }

// class SyncCurrencyRatesUseCase {
//   SyncCurrencyRatesUseCase(this._repository);
//   final CurrencyRateRepository _repository;

//   Future<void> call() => _repository.syncCurrencyRates();
// }
