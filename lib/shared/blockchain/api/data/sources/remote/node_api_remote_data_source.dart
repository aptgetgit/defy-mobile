import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/remote/account_data_remote_model.dart';
import '../../models/remote/gas_price_estimate_remote_model.dart';
import '../../models/remote/ledger_info_remote_model.dart';

part 'generated/node_api_remote_data_source.g.dart';

@RestApi()
abstract class NodeApiRemoteDataSource {
  factory NodeApiRemoteDataSource(Dio client) = _NodeApiRemoteDataSource;

  @GET('accounts/{accountAddress}')
  Future<HttpResponse<AccountDataRemoteModel>> getAccountData({
    @Path('accountAddress') required String accountAddress,
    @Query('ledger_version') String? ledgerVersion,
  });

  @GET('estimate_gas_price')
  Future<HttpResponse<GasPriceEstimateRemoteModel>> getGasPriceEstimate();

  @GET('')
  Future<HttpResponse<LedgerInfoRemoteModel>> getLedgerInfo();
}
