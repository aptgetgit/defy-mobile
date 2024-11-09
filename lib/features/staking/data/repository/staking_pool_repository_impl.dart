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
    final response = await getApiResponse<List<dynamic>>(
      request: () => client.getStakingPools(),
    );

    return response.map((list) => list.map((item) {
          if (item is Map<String, dynamic>) {
            return StakingPoolModel.fromJson(item).toEntity();
          } else if (item is StakingPoolModel) {
            return item.toEntity();
          } else {
            throw Exception(
                'Unexpected item type in response: ${item.runtimeType}');
          }
        }).toList());
  }
}
