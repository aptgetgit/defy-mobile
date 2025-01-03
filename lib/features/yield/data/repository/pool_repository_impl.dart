import 'package:defy/core/api/base_api_repository.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/yield/data/models/pool_data_response.dart';
import 'package:defy/features/yield/data/models/pool_response.dart';
import 'package:defy/features/yield/data/source/remote/pool_client.dart';
import 'package:defy/features/yield/domain/entities/pool_data_entity.dart';
import 'package:defy/features/yield/domain/entities/pool_response_entity.dart';
import 'package:defy/features/yield/domain/repositories/pool_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class PoolRepositoryImpl extends PoolRepository with BaseApiRepository {
  final PoolClient client;

  PoolRepositoryImpl(this.client);

  @override
  Future<Either<DioException, List<PoolResponseEntity>>> getAllPools() async {
    try {
      final List<PoolResponseModel> poolModels = await client.getPools();
      final List<PoolResponseEntity> poolEntities = poolModels.map((model) => model.toEntity()).toList();
      AppLogger.info('Successfully fetched ${poolEntities.length} pools');
      return Right(poolEntities);
    } on DioException catch (e) {
      AppLogger.error('Dio error in getAllPools: ${e.message}');
      return Left(e);
    } catch (e) {
      AppLogger.error('Unexpected error in getAllPools: $e');
      return Left(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'An unexpected error occurred: $e',
      ));
    }
  }

@override
Future<Either<DioException, PoolDataEntity>> getPool(String poolId, String poolName) async {
  try {
    final PoolDataModel poolDataModel = await client.getPool(poolId, poolName);
    final PoolDataEntity poolDataEntity = poolDataModel.toEntity();
    return Right(poolDataEntity);
  } on DioException catch (e) {
    AppLogger.error('Dio error in getPool: ${e.message}');
    return Left(e);
  } catch (e) {
    AppLogger.error('Unexpected error in getPool: $e');
    return Left(DioException(
      requestOptions: RequestOptions(path: ''),
      error: 'An unexpected error occurred: $e',
    ));
  }
}
}