import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../logging/app_logger.dart';
import '../../../logging/dio_logger.dart';

part 'generated/dio_init_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dioInitializer(Ref ref, String baseUrl) {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )..interceptors.addAll(<Interceptor>[
      if (kDebugMode)
        DioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          logger: AppLogger().logger,
        ),
    ]);
  return dio;
}
