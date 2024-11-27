import 'package:defy/shared/currency/data/models/remote/currency_rate_remote_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'generated/currency_rate_remote_source.g.dart';

@RestApi(
    baseUrl: "https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1")
abstract class CurrencyRateRemoteDataSource {
  factory CurrencyRateRemoteDataSource(Dio dio) = _CurrencyRateRemoteDataSource;

  @GET("/currencies/usd.json")
  Future<CurrencyRateRemoteModel> getCurrencyRates();
}
