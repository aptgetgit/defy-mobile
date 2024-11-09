import 'package:defy/features/staking/domain/entities/staking_pool_entity.dart';
import 'package:defy/features/staking/domain/repositories/staking_pool_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class StakingPoolsUseCase {
  final StakingPoolRepository repository;

  StakingPoolsUseCase(this.repository);

  Future<Either<DioException, List<StakingPoolEntity>>> call() async {
    return await repository.getStakingPools();
  }
}
