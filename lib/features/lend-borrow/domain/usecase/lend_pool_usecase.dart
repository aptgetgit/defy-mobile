import 'package:defy/features/lend-borrow/domain/repository/lend_pool_repository.dart';
import '../entities/lend_pool_entity.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class GetLendPoolsUseCase {
  final LendPoolRepository repository;

  GetLendPoolsUseCase(this.repository);

  Future<Either<DioException, Map<String, LendPoolEntity>>> call() async {
    return await repository.getLendPools();
  }
}