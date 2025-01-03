import 'package:defy/core/api/base_api_repository.dart';
import 'package:defy/features/staking/data/models/staking_pool_model.dart';
import 'package:defy/features/staking/data/source/staking_pool_client.dart';
import 'package:defy/features/staking/domain/entities/staking_pool_entity.dart';
import 'package:defy/features/staking/domain/repositories/staking_pool_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class StakingPoolRepositoryImpl extends StakingPoolRepository
    with BaseApiRepository {
  final StakingPoolClient client;

  StakingPoolRepositoryImpl(this.client);

  @override
  Future<Either<DioException, List<StakingPoolEntity>>>
      getStakingPools() async {
    try {
      final List<StakingPoolModel> models = await client.getStakingPools();
      final List<StakingPoolEntity> entities =
          models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on DioException catch (e) {
      print('Dio error in repository: ${e.message}');
      return Left(e);
    } catch (e) {
      print('Unexpected error in repository: $e');
      return Left(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'An unexpected error occurred: $e',
      ));
    }
  }
}
