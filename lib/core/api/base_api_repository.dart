import 'dart:io' show HttpStatus;

import 'package:defy/core/logging/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:retrofit/retrofit.dart';


export 'data_state.dart';

typedef ApiRes<T> = Either<DioException, T>;

mixin BaseApiRepository {
  // @Deprecated('Use [getApiResponse]')
  // @protected
  // Future<DataState<T>> getStateOf<T>({
  //   required Future<HttpResponse<T>> Function() request,
  // }) async {
  //   try {
  //     final httpResponse = await request();
  //     final status = httpResponse.response.statusCode ?? 400;
  //     if (status < HttpStatus.badRequest) {
  //       return DataSuccess(httpResponse.data);
  //     } else {
  //       return DataFailed(
  //         DioException(
  //           error: httpResponse.response.statusMessage,
  //           response: httpResponse.response,
  //           type: DioExceptionType.badResponse,
  //           requestOptions: httpResponse.response.requestOptions,
  //         ),
  //       );
  //     }
  //   } on DioException catch (error) {
  //     return DataFailed(error);
  //   }
  // }

  @protected
  Future<ApiRes<T>> getApiResponse<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      AppLogger.debug('Response Data: ${httpResponse.data}');
      final status = httpResponse.response.statusCode ?? 400;
     AppLogger.debug('Status Code: $status');

      if (status < HttpStatus.badRequest) {
        return Right(httpResponse.data);
      } else {
        final error = httpResponse.response.data;
        final errorMessage = error['error'] ??
            httpResponse.response.statusMessage ??
            'Unknown error';
        return Left(
          DioException(
            error: errorMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (error) {
      AppLogger.error('DioException: ${error.message}');
      return Left(error);
    } catch (e) {
      AppLogger.error('Unexpected error: $e');
      return Left(DioException(
        error: 'Unexpected error',
        response: null,
        type: DioExceptionType.unknown,
        requestOptions: RequestOptions(),
      ));
    }
  }
}
