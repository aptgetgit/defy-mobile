// import 'package:defy/core/logging/app_logger.dart';
// import 'package:defy/features/authentication/presentation/providers/authentication_state_notifier.dart';
// import 'package:defy/features/authentication/presentation/providers/authentication_usecase_provider.dart';
// import 'package:dio/dio.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'generated/session_interceptor_provider.g.dart';

// @Riverpod(keepAlive: true)
// SessionTokenInterceptor sessionTokenInterceptor(Ref ref) {
//   return SessionTokenInterceptor(ref);
// }

// class SessionTokenInterceptor extends Interceptor {
//   final Ref ref;

//   SessionTokenInterceptor(this.ref);

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final authState = ref.read(authenticationNotifierProvider);

//     if (authState case AsyncData(value: _)) {
//       final activeIdentityId = ref.read(getActiveIdentityUseCaseProvider)();
//       if (activeIdentityId != null) {
//         try {
//           final sessionToken =
//               await ref.read(getSessionTokenUseCaseProvider)(activeIdentityId);
//           options.headers['Authorization'] = 'Bearer $sessionToken';
//         } catch (e) {
//           AppLogger.error('Failed to get session token: $e');
//         }
//       }
//     }

//     handler.next(options);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       // Token might be expired, log out the user
//       final authNotifier = ref.read(authenticationNotifierProvider.notifier);
//       await authNotifier.logout();
//     }

//     handler.next(err);
//   }
// }
