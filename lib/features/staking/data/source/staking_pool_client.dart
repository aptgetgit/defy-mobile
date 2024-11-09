import 'package:defy/config/env.dart';
import 'package:defy/features/staking/data/models/staking_pool_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'generated/staking_pool_client.g.dart';

@RestApi(baseUrl: Env.stakingLendBorrowBaseUrl)
abstract class StakingPoolClient {
  factory StakingPoolClient(Dio dio, {String baseUrl}) = _StakingPoolClient;

  @GET("/all-delegation-pools")
  Future<HttpResponse<List<StakingPoolModel>>> getStakingPools();
}
