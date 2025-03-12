// import '../../domain/entities/currency_rate.dart';
// import '../../domain/repositories/currency_rate_repository.dart';
// import '../models/local/currency_rate_local_model.dart';
// import '../models/remote/currency_rate_remote_model.dart';
// import '../sources/local/currency_rate_local_source.dart';
// import '../sources/remote/currency_rate_remote_source.dart';

// class CurrencyRateRepository implements ICurrencyRateRepository {
//   CurrencyRateRepository(this._localDataSource, this._remoteDataSource);
//   final CurrencyRateLocalDataSource _localDataSource;
//   final CurrencyRateRemoteDataSource _remoteDataSource;

//   @override
//   List<CurrencyRate> listLocalCurrencyRates() => _localDataSource
//       .listCurrencyRates()
//       .map((CurrencyRateLocalModel model) => model.toDomain())
//       .toList();

//   @override
//   CurrencyRate? getLocalCurrencyRate(String currencyCode) {
//     final CurrencyRateLocalModel? model =
//         _localDataSource.getCurrencyRate(currencyCode);
//     return model?.toDomain();
//   }

//   @override
//   void saveLocalCurrencyRate(CurrencyRate currencyRate) {
//     final CurrencyRateLocalModel? existingRate =
//         _localDataSource.getCurrencyRate(currencyRate.code);
//     if (existingRate == null) {
//       _localDataSource
//           .saveCurrencyRate(CurrencyRateLocalModel.fromDomain(currencyRate));
//     }
//   }

//   @override
//   void deleteLocalCurrencyRate(String currencyCode) {
//     _localDataSource.deleteCurrencyRate(currencyCode);
//   }

//   @override
//   Future<List<CurrencyRate>> listRemoteCurrencyRates() async {
//     final CurrencyRateRemoteModel response =
//         await _remoteDataSource.getCurrencyRates();
//     return response.toDomain();
//   }

//   @override
//   Future<void> syncCurrencyRates() async {
//     final List<CurrencyRate> remoteRates = await listRemoteCurrencyRates();
//     for (final CurrencyRate rate in remoteRates) {
//       saveLocalCurrencyRate(rate);
//     }
//   }
// }
