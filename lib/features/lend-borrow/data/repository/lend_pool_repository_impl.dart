import 'package:defy/core/api/base_api_repository.dart';
import 'package:defy/features/lend-borrow/data/models/lend_pool_model.dart';
import 'package:defy/features/lend-borrow/data/source/lend_pool_client.dart';
import 'package:defy/features/lend-borrow/domain/repository/lend_pool_repository.dart';
import 'package:defy/features/lend-borrow/domain/entities/lend_pool_entity.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class LendPoolRepositoryImpl extends LendPoolRepository with BaseApiRepository {
  final LendPoolClient client;

  LendPoolRepositoryImpl(this.client);

  @override
  Future<Either<DioException, Map<String, LendPoolEntity>>> getLendPools() async {
    final response = await getApiResponse<Map<String, LendPoolModel>>(
      request: () => client.getLendPools(),
    );

    return response.map((modelMap) => modelMap.map(
      (key, value) => MapEntry(key, value.toEntity()),
    ));
  }
}