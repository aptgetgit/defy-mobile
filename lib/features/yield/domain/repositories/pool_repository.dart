
import 'package:defy/core/api/base_api_repository.dart';
import 'package:defy/features/yield/domain/entities/pool_data_entity.dart';
import 'package:defy/features/yield/domain/entities/pool_response_entity.dart';


abstract class PoolRepository {
  Future<ApiRes<List<PoolResponseEntity>>> getAllPools();

  Future<ApiRes<PoolDataEntity>> getPool(String poolId, String poolName);
}