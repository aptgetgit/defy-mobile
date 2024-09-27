import 'package:defy/config/env.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/logging/dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dioInitializer(DioInitializerRef ref,String baseUrl) {
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

@Riverpod(keepAlive: true)
Dio baseDioService(BaseDioServiceRef ref) {
  final dio = ref.watch(dioInitializerProvider(Env.apiBaseUrl));
  return dio;
}

@Riverpod(keepAlive: true)
Dio kratosDioService(KratosDioServiceRef ref) {
  final dio = ref.watch(dioInitializerProvider(Env.oryKratosEndpoint));
  return dio;
}


// class SessionTokenInterceptor extends Interceptor {
//   final Ref ref;

//   SessionTokenInterceptor(this.ref);

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final authState = ref.read(authNotifierProvider);
//     authState.maybeWhen(
//       authenticated: (sessionToken) {
//         options.headers['Authorization'] = 'Bearer $sessionToken';
//       },
//       initial: () async {
//         await ref.read(authNotifierProvider.notifier).checkSession();
//       },
//       orElse: () => {},
//     );
//     return handler.next(options);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       // Clear the token and redirect to login
//       await ref.read(authNotifierProvider.notifier).logout();

//       // Optionally, you can handle navigation to the login screen here
//       // Note: Make sure this runs in a context where navigation is possible
//       // Navigator.of(context).pushReplacementNamed('/login');
//     }
//     return handler.next(err);
//   }
// }
