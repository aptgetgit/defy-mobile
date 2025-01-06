import 'package:defy/config/env.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/logging/dio_logger.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_state_notifier.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_usecase_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dioInitializer(DioInitializerRef ref, String baseUrl) {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 30),
    sendTimeout: Duration(seconds: 30),
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
          // logPrint: (object) {
          //   if (object is String) {
          //     if (object.startsWith('DioError')) {
          //       AppLogger.error(object);
          //     } else {
          //       AppLogger.debug(object);
          //     }
          //   } else {
          //     AppLogger.debug(object.toString());
          //   }
          // },
        ),
    ]);
  return dio;
}

@Riverpod(keepAlive: true)
SessionTokenInterceptor sessionTokenInterceptor(
    SessionTokenInterceptorRef ref) {
  return SessionTokenInterceptor(ref);
}

class SessionTokenInterceptor extends Interceptor {
  final Ref ref;

  SessionTokenInterceptor(this.ref);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authState = ref.read(authenticationNotifierProvider);

    if (authState case AsyncData(value: _)) {
      final activeIdentityId = ref.read(getActiveIdentityUseCaseProvider)();
      if (activeIdentityId != null) {
        try {
          final sessionToken =
              await ref.read(getSessionTokenUseCaseProvider)(activeIdentityId);
          options.headers['Authorization'] = 'Bearer $sessionToken';
        } catch (e) {
          AppLogger.error('Failed to get session token: $e');
        }
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Token might be expired, log out the user
      final authNotifier = ref.read(authenticationNotifierProvider.notifier);
      await authNotifier.logout();
    }

    handler.next(err);
  }
}

@Riverpod(keepAlive: true)
Dio baseDioService(BaseDioServiceRef ref) {
  final dio = ref.watch(dioInitializerProvider(Env.apiBaseUrl));
  dio.interceptors.add(ref.watch(sessionTokenInterceptorProvider));
  return dio;
}

@Riverpod(keepAlive: true)
Dio kratosDioService(KratosDioServiceRef ref) {
  final dio = ref.watch(dioInitializerProvider(Env.oryKratosEndpoint));
  dio.interceptors.add(ref.watch(sessionTokenInterceptorProvider));
  return dio;
}

@Riverpod(keepAlive: true)
Dio yieldAggregatorDioService(YieldAggregatorDioServiceRef ref) {
  final dio = ref.watch(dioInitializerProvider(Env.yieldAggregatorBaseUrl));
  dio.interceptors.add(ref.watch(sessionTokenInterceptorProvider));
  return dio;
}

@Riverpod(keepAlive: true)
Dio stakingDioService(StakingDioServiceRef ref) {
  final dio = ref.watch(dioInitializerProvider(Env.stakingLendBorrowBaseUrl));
  dio.interceptors.add(ref.watch(sessionTokenInterceptorProvider));
  return dio;
}

@Riverpod(keepAlive: true)
Dio lendBorrowDioService(LendBorrowDioServiceRef ref) {
  final dio = ref.watch(dioInitializerProvider(Env.stakingLendBorrowBaseUrl));
  dio.interceptors.add(ref.watch(sessionTokenInterceptorProvider));
  return dio;
}
