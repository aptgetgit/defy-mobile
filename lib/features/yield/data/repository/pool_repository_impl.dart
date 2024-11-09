import 'package:defy/core/api/base_api_repository.dart';
import 'package:defy/features/yield/data/models/pool_data_response.dart';
import 'package:defy/features/yield/data/models/pool_response.dart';
import 'package:defy/features/yield/data/source/remote/pool_client.dart';
import 'package:defy/features/yield/domain/repositories/pool_repository.dart';

class PoolRepositoryImpl extends PoolRepository with BaseApiRepository {
  final PoolClient client;

  PoolRepositoryImpl(this.client);

  @override
  Future<ApiRes<List<PoolResponse>>> getAllPools() {
    return getApiResponse<List<PoolResponse>>(
      request: () => client.getPools(),
    );
  }

  @override
  Future<ApiRes<PoolDataResponse>> getPool(String poolId, String poolName) {
    return getApiResponse<PoolDataResponse>(
      request: () => client.getPool(poolId, poolName),
    );
  }
}
