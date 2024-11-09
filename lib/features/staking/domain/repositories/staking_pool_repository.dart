import 'package:defy/features/staking/domain/entities/staking_pool_entity.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

abstract class StakingPoolRepository {
  Future<Either<DioException, List<StakingPoolEntity>>> getStakingPools();
}
