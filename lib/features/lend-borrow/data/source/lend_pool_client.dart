import 'package:defy/config/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/lend_pool_model.dart';

part 'generated/lend_pool_client.g.dart';

@RestApi(baseUrl: Env.stakingLendBorrowBaseUrl)
abstract class LendPoolClient {
  factory LendPoolClient(Dio dio, {String baseUrl}) = _LendPoolClient;

  @GET("/all-lending-pools")
  Future<HttpResponse<Map<String, LendPoolModel>>> getLendPools();
}
