import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/logging/dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/dio_init_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dioInitializer(Ref ref, String baseUrl) {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
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
          logger: AppLogger().logger,
        ),
    ]);
  return dio;
}
