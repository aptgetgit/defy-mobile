import 'package:defy/core/api/base_api_repository.dart';
import 'package:defy/features/yield/data/models/pool_data_response.dart';
import 'package:defy/features/yield/domain/repositories/pool_repository.dart';
import 'package:defy/features/yield/data/models/pool_response.dart';

class GetAllPoolsUseCase {
  final PoolRepository poolRepository;

  GetAllPoolsUseCase(this.poolRepository);

  Future<ApiRes<List<PoolResponse>>> call() async {
    return await poolRepository.getAllPools();
  }
}

class GetPoolUseCase {
  final PoolRepository poolRepository;

  GetPoolUseCase(this.poolRepository);

  Future<ApiRes<PoolDataResponse>> call(String poolId, String poolName) async {
    return await poolRepository.getPool(poolId, poolName);
  }
}
