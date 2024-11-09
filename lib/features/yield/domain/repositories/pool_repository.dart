
import 'package:defy/core/api/base_api_repository.dart';
import 'package:defy/features/yield/data/models/pool_data_response.dart';
import 'package:defy/features/yield/data/models/pool_response.dart';

abstract class PoolRepository {
  Future<ApiRes<List<PoolResponse>>> getAllPools();

  Future<ApiRes<PoolDataResponse>> getPool(String poolId, String poolName);
}
