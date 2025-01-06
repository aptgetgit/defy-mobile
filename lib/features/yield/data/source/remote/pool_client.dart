import 'package:defy/config/env.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/yield/data/models/pool_data_response.dart';
import 'package:defy/features/yield/data/models/pool_response.dart';
import 'package:dio/dio.dart';

class PoolClient {
  final Dio _dio;
  final String baseUrl;

  PoolClient({required Dio dio, String? baseUrl})
      : _dio = dio,
        baseUrl = baseUrl ?? Env.yieldAggregatorBaseUrl {
    AppLogger.debug('PoolClient initialized with baseUrl: $baseUrl');
    if (this.baseUrl.isEmpty) {
      throw ArgumentError('Base URL cannot be empty');
    }
    if (!this.baseUrl.startsWith('http://') &&
        !this.baseUrl.startsWith('https://')) {
      throw ArgumentError('Base URL must start with http:// or https://');
    }
  }

  Future<List<PoolResponseModel>> getPools() async {
    try {
      AppLogger.debug('Fetching pools from: $baseUrl/all-pools');
      final response = await _dio.get('$baseUrl/all-pools');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final pools = data
            .map((json) {
              try {
                final pool = PoolResponseModel.fromJson(json);
                AppLogger.debug(
                    'Parsed pool: ${pool.id}, name: ${pool.name}, apr: ${pool.apr}, tvl: ${pool.totalValueLocked}');
                return pool;
              } catch (e) {
                AppLogger.error('Error parsing pool: $e');
                AppLogger.error('Problematic JSON: $json');
                return null;
              }
            })
            .whereType<PoolResponseModel>()
            .toList();

        AppLogger.info('Successfully parsed ${pools.length} pools');
        return pools;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Failed to load pools',
        );
      }
    } on DioException catch (e) {
      AppLogger.error('Dio error in getPools: ${e.message}');
      rethrow;
    } catch (e) {
      AppLogger.error('Unexpected error fetching pools: $e');
      throw Exception('Failed to load pools: $e');
    }
  }

  Future<PoolDataModel> getPool(String poolId, String poolName) async {
    try {
      AppLogger.debug(
          'Fetching pool info for poolId: $poolId, poolName: $poolName');
      final response = await _dio.get(
        '$baseUrl/pool-info',
        queryParameters: {
          'poolId': poolId,
          'poolName': poolName,
        },
      );

      AppLogger.debug('Response status code: ${response.statusCode}');
      AppLogger.debug('Response data: ${response.data}');

      if (response.statusCode == 200) {
        if (response.data == null) {
          throw Exception('API returned null data');
        }

        if (response.data is! Map<String, dynamic>) {
          throw Exception(
              'API returned unexpected data type: ${response.data.runtimeType}');
        }

        try {
          final pool =
              PoolDataModel.fromJson(response.data as Map<String, dynamic>);
          AppLogger.debug(
              'Parsed pool: ${pool.id}, name: ${pool.name}, apr: ${pool.apr}, tvl: ${pool.totalValueLocked}');
          return pool;
        } catch (e, stackTrace) {
          AppLogger.error('Error parsing pool data: $e');
          AppLogger.error('Stack trace: $stackTrace');
          throw Exception('Failed to parse pool data: $e');
        }
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error:
              'Failed to load pool data. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      AppLogger.error('Dio error in getPool: ${e.message}');
      AppLogger.error('Dio error type: ${e.type}');
      AppLogger.error('Dio error response: ${e.response}');
      rethrow;
    } catch (e, stackTrace) {
      AppLogger.error('Error fetching pool data: $e');
      AppLogger.error('Stack trace: $stackTrace');
      throw Exception('Failed to load pool data: $e');
    }
  }
}
