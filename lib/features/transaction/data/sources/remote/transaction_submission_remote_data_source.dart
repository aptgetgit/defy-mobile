import 'dart:typed_data';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/remote/transaction_remote_model.dart';

part 'generated/transaction_submission_remote_data_source.g.dart';

@RestApi()
abstract class TransactionSubmissionRemoteDataSource {
  factory TransactionSubmissionRemoteDataSource(Dio client) =
      _TransactionSubmissionRemoteDataSource;

  @POST('transactions')
  @Headers(<String, String>{
    'Content-Type': 'application/x.aptos.signed_transaction+bcs',
  })
  Future<HttpResponse<TransactionRemoteModel>> call({
    @Body() required Uint8List signedTxn,
  });
}
