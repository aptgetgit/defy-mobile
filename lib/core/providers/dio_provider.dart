import 'package:defy/config/env.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/logging/dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dioInitializer(DioInitializerRef ref) {
  final dio = Dio(BaseOptions(
    baseUrl: Env.apiBaseUrl,
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
  ))
    ..interceptors.addAll([
      if (kDebugMode)
        DioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 90,
          logTime: true,
          logPrint: (object) {
            if (object is String) {
              if (object.startsWith('DioError')) {
                AppLogger.error(object);
              } else {
                AppLogger.debug(object);
              }
            } else {
              AppLogger.debug(object.toString());
            }
          },
        ),
    ]);
  return dio;
}
