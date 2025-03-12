// import 'dart:typed_data';

// import 'package:dio/dio.dart' hide Headers;
// import 'package:retrofit/retrofit.dart';

// import '../../models/remote/transaction_remote_model.dart';

// part 'generated/transaction_simulation_remote_data_source.g.dart';

// @RestApi()
// abstract class TransactionSimulationRemoteDataSource {
//   factory TransactionSimulationRemoteDataSource(Dio client) =
//       _TransactionSimulationRemoteDataSource;

//   @POST('transactions/simulate')
//   @Headers(<String, String>{
//     'Content-Type': 'application/x.aptos.signed_transaction+bcs',
//   })
//   Future<HttpResponse<TransactionRemoteModel>> call({
//     @Body() required Uint8List signedTxn,
//     @Query('estimate_gas_unit_price') bool estimateGasUnitPrice = false,
//     @Query('estimate_max_gas_amount') bool estimateMaxGasAmount = false,
//     @Query('estimate_prioritized_gas_unit_price')
//     bool estimatePrioritizedGasUnitPrice = false,
//   });
// }
