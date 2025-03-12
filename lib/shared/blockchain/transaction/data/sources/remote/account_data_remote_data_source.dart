// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';

// import '../../models/remote/account_data_remote_model.dart';

// part 'generated/account_data_remote_data_source.g.dart';

// @RestApi()
// abstract class AccountDataRemoteDataSource {
//   factory AccountDataRemoteDataSource(Dio client) = _AccountDataRemoteDataSource;

//   @GET('accounts/{accountAddress}')
//   @NoBody()
//   Future<HttpResponse<AccountDataRemoteModel>> call({
//     @Path('accountAddress') required String accountAddress,
//     @Query('ledger_version') String? ledgerVersion,
//   });
// }
