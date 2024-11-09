import 'package:defy/config/env.dart';
import 'package:defy/features/yield/data/models/pool_data_response.dart';
import 'package:defy/features/yield/data/models/pool_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/pool_client.g.dart';

@RestApi()
abstract class PoolClient {
  factory PoolClient(Dio dio) = _PoolClient;

  @GET("/all-pools")
  Future<HttpResponse<List<PoolResponse>>> getPools();

  @GET("/pool-info")
  Future<HttpResponse<PoolDataResponse>> getPool(
      @Query("poolId") String poolId, @Query("poolName") String poolName);
}
