import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../entities/lend_pool_entity.dart';

abstract class LendPoolRepository {
  Future<Either<DioException, Map<String, LendPoolEntity>>> getLendPools();
}