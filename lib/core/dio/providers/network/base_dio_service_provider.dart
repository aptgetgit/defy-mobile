// import 'package:defy/core/di/providers/network/interceptors/session_interceptor_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../config/environment/env.dart';
import 'dio_init_provider.dart';

part 'generated/base_dio_service_provider.g.dart';

@Riverpod(keepAlive: true)
Dio baseDioService(Ref ref) {
  final Dio dio = ref.watch(dioInitializerProvider(Env.apiBaseUrl));
  // dio.interceptors.add(ref.watch(sessionTokenInterceptorProvider));
  return dio;
}
