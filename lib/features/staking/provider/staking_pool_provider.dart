import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/providers/dio_provider.dart';
import 'package:defy/features/staking/data/repository/staking_pool_repository_impl.dart';
import 'package:defy/features/staking/data/source/staking_pool_client.dart';
import 'package:defy/features/staking/domain/entities/staking_pool_entity.dart';
import 'package:defy/features/staking/domain/repositories/staking_pool_repository.dart';
import 'package:defy/features/staking/domain/usecases/staking_pool_usecase.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/staking_pool_provider.g.dart';

@riverpod
StakingPoolRepository stakingPoolRepository(StakingPoolRepositoryRef ref) {
  final dio = ref.read(stakingDioServiceProvider);
  final stakingPoolClient = StakingPoolClient(dio);
  return StakingPoolRepositoryImpl(stakingPoolClient);
}

@riverpod
StakingPoolsUseCase stakingPoolsUseCase(StakingPoolsUseCaseRef ref) {
  return StakingPoolsUseCase(ref.watch(stakingPoolRepositoryProvider));
}

@riverpod
Future<Either<DioException, List<StakingPoolEntity>>> getStakingPools(
    GetStakingPoolsRef ref) async {
  try {
    final useCase = ref.watch(stakingPoolsUseCaseProvider);
    final response = await useCase();

    return response.fold(
      (error) {
        AppLogger.error('Error fetching staking pools: $error');
        return Left(error);
      },
      (pools) {
        AppLogger.info('Successfully fetched staking pools: $pools');
        return Right(pools);
      },
    );
  } catch (e, stackTrace) {
    AppLogger.error('Exception: $e', error: e, stackTrace: stackTrace);
    return Left(DioException(requestOptions: RequestOptions(), error: e));
  }
}
