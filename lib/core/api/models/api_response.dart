// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'generated/api_response.freezed.dart';

// @Freezed(genericArgumentFactories: true)
// sealed class ApiResponse<T> with _$ApiResponse<T> {
//   const ApiResponse._();

//   const factory ApiResponse.success({
//     required T data,
//   }) = SuccessResponse<T>;

//   const factory ApiResponse.error(
//     int code,
//     String message,
//   ) = ErrorResponse<T>;

//   factory ApiResponse.fromJson(
//     Map<String, dynamic> json,
//     T Function(Object?) fromJsonT,
//   ) {
//     if (json['data'] != null) {
//       return ApiResponse<T>.success(data: fromJsonT(json['data'])!);
//     } 
//     if (json['error'] != null) {
//       final Map<String, dynamic> error = json['error'] as Map<String, dynamic>;
//       return ApiResponse<T>.error(
//         error['code'] as int,
//         error['message'] as String,
//       );
//     }
//     throw const FormatException('Invalid JSON: must contain either data or error');
//   }

//   Map<String, dynamic> toJson(Object? Function(T) toJsonT) => switch (this) {
//     SuccessResponse<T>(data: final T data) => <String, dynamic>{
//       'data': toJsonT(data),
//     },
//     ErrorResponse<T>(code: final int code, message: final String message) => <String, dynamic>{
//       'error': <String, Object>{
//         'code': code,
//         'message': message,
//       },
//     },
//   };

//   bool get isSuccess => this is SuccessResponse<T>;
//   bool get isError => this is ErrorResponse<T>;
// }
