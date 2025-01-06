import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/providers/dio_provider.dart';
import 'package:defy/features/lend-borrow/domain/repository/lend_pool_repository.dart';
import 'package:defy/features/lend-borrow/domain/usecase/lend_pool_usecase.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:defy/features/lend-borrow/data/source/lend_pool_client.dart';
import 'package:defy/features/lend-borrow/data/repository/lend_pool_repository_impl.dart';
import 'package:defy/features/lend-borrow/domain/entities/lend_pool_entity.dart';

part 'generated/lend_pool_provider.g.dart';

@riverpod
LendPoolRepository lendPoolRepository(LendPoolRepositoryRef ref) {
  final dio = ref.read(lendBorrowDioServiceProvider);
  final lendPoolClient = LendPoolClient(dio);
  return LendPoolRepositoryImpl(lendPoolClient);
}

@riverpod
GetLendPoolsUseCase getLendPoolsUseCase(GetLendPoolsUseCaseRef ref) {
  return GetLendPoolsUseCase(ref.read(lendPoolRepositoryProvider));
}

@riverpod
Future<Either<DioException, Map<String, LendPoolEntity>>> getLendPools(
    GetLendPoolsRef ref) async {
  try {
    final response = await ref.read(getLendPoolsUseCaseProvider).call();

    return response.fold(
      (error) {
        AppLogger.error('Error fetching lend pools: $error');
        return Left(error);
      },
      (pools) {
        AppLogger.info('Successfully fetched lend pools: $pools');
        return Right(pools);
      },
    );
  } catch (e, stackTrace) {
    AppLogger.error('Exception: $e', error: e, stackTrace: stackTrace);
    return Left(DioException(requestOptions: RequestOptions(), error: e));
  }
}