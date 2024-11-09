import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/providers/dio_provider.dart';
import 'package:defy/features/yield/data/models/pool_data_response.dart';
import 'package:defy/features/yield/data/models/pool_response.dart';
import 'package:defy/features/yield/data/repository/pool_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:defy/features/yield/data/source/remote/pool_client.dart';
import 'package:defy/features/yield/domain/repositories/pool_repository.dart';
import 'package:defy/features/yield/domain/usecases/pool_usecase.dart';

part 'generated/yield_pool_provider.g.dart';

@riverpod
PoolRepository poolRepository(PoolRepositoryRef ref) {
  final dio = ref.read(yieldAggregatorDioServiceProvider);
  final poolClient = PoolClient(dio);
  return PoolRepositoryImpl(poolClient);
}

@riverpod
GetAllPoolsUseCase getAllPoolsUseCase(GetAllPoolsUseCaseRef ref) {
  return GetAllPoolsUseCase(ref.read(poolRepositoryProvider));
}

@riverpod
GetPoolUseCase getPoolUseCase(GetPoolUseCaseRef ref) {
  return GetPoolUseCase(ref.read(poolRepositoryProvider));
}

@riverpod
Future<Either<DioException, PoolDataResponse>> getPool(
    GetPoolRef ref, String poolId, String poolName) async {
  try {
    final response = await ref.read(getPoolUseCaseProvider).call(poolId, poolName);

    return response.fold(
      (error) {
        AppLogger.error('Error fetching pool: $error');
        return Left(error);
      },
      (pool) {
        AppLogger.info('Successfully fetched pool: $pool');
        return Right(pool);
      },
    );
  } catch (e, stackTrace) {
   AppLogger.error('Exception: $e', error: e, stackTrace: stackTrace);
    return Left(DioException(requestOptions: RequestOptions(), error: e));
  }
}


@riverpod
Future<Either<DioException, List<PoolResponse>>> getAllPools(
    GetAllPoolsRef ref) async {
  final response = await ref.read(getAllPoolsUseCaseProvider).call();

  return response.fold(
    (error) {
      return Left(error);
    },
    (pools) {
      return Right(pools);
    },
  );
}
