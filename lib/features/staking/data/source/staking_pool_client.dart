import 'package:defy/config/env.dart';
import 'package:defy/features/staking/data/models/staking_pool_model.dart';
import 'package:dio/dio.dart';

class StakingPoolClient {
  final Dio _dio;
  final String baseUrl;

  StakingPoolClient({required Dio dio, String? baseUrl})
      : _dio = dio,
        baseUrl = baseUrl ?? Env.stakingLendBorrowBaseUrl {
    // Ensure the base URL is set and formatted correctly
    if (this.baseUrl.isEmpty) {
      throw ArgumentError('Base URL cannot be empty');
    }
    if (!this.baseUrl.startsWith('http://') && !this.baseUrl.startsWith('https://')) {
      throw ArgumentError('Base URL must start with http:// or https://');
    }
  }

  Future<List<StakingPoolModel>> getStakingPools() async {
    try {
      final response = await _dio.get('$baseUrl/all-delegation-pools',
          options: Options(
            receiveTimeout: const Duration(seconds: 30), // Increase timeout
            sendTimeout: const Duration(seconds: 30),
          ));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => StakingPoolModel.fromJson(json)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Failed to load staking pools',
        );
      }
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
      print('Dio error type: ${e.type}');
      print('Dio error response: ${e.response}');
      rethrow;
    } catch (e) {
      print('Error fetching staking pools: $e');
      throw Exception('Failed to load staking pools');
    }
  }
}