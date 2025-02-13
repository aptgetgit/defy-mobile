// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiResponse<T> {}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SuccessResponseImplCopyWith<T, $Res> {
  factory _$$SuccessResponseImplCopyWith(_$SuccessResponseImpl<T> value,
          $Res Function(_$SuccessResponseImpl<T>) then) =
      __$$SuccessResponseImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$SuccessResponseImpl<T>>
    implements _$$SuccessResponseImplCopyWith<T, $Res> {
  __$$SuccessResponseImplCopyWithImpl(_$SuccessResponseImpl<T> _value,
      $Res Function(_$SuccessResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessResponseImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessResponseImpl<T> extends SuccessResponse<T> {
  const _$SuccessResponseImpl({required this.data}) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'ApiResponse<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessResponseImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessResponseImplCopyWith<T, _$SuccessResponseImpl<T>> get copyWith =>
      __$$SuccessResponseImplCopyWithImpl<T, _$SuccessResponseImpl<T>>(
          this, _$identity);
}

abstract class SuccessResponse<T> extends ApiResponse<T> {
  const factory SuccessResponse({required final T data}) =
      _$SuccessResponseImpl<T>;
  const SuccessResponse._() : super._();

  T get data;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessResponseImplCopyWith<T, _$SuccessResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorResponseImplCopyWith<T, $Res> {
  factory _$$ErrorResponseImplCopyWith(_$ErrorResponseImpl<T> value,
          $Res Function(_$ErrorResponseImpl<T>) then) =
      __$$ErrorResponseImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({int code, String message});
}

/// @nodoc
class __$$ErrorResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ErrorResponseImpl<T>>
    implements _$$ErrorResponseImplCopyWith<T, $Res> {
  __$$ErrorResponseImplCopyWithImpl(_$ErrorResponseImpl<T> _value,
      $Res Function(_$ErrorResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_$ErrorResponseImpl<T>(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorResponseImpl<T> extends ErrorResponse<T> {
  const _$ErrorResponseImpl(this.code, this.message) : super._();

  @override
  final int code;
  @override
  final String message;

  @override
  String toString() {
    return 'ApiResponse<$T>.error(code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorResponseImpl<T> &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorResponseImplCopyWith<T, _$ErrorResponseImpl<T>> get copyWith =>
      __$$ErrorResponseImplCopyWithImpl<T, _$ErrorResponseImpl<T>>(
          this, _$identity);
}

abstract class ErrorResponse<T> extends ApiResponse<T> {
  const factory ErrorResponse(final int code, final String message) =
      _$ErrorResponseImpl<T>;
  const ErrorResponse._() : super._();

  int get code;
  String get message;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorResponseImplCopyWith<T, _$ErrorResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
