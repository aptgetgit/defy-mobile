// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl<T> _$$ApiResponseImplFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    $checkedCreate(
      r'_$ApiResponseImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['data', 'error'],
        );
        final val = _$ApiResponseImpl<T>(
          data: $checkedConvert(
              'data', (v) => _$nullableGenericFromJson(v, fromJsonT)),
          error: $checkedConvert(
              'error',
              (v) => v == null
                  ? null
                  : ErrorResponse.fromJson(
                      Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

const _$$ApiResponseImplFieldMap = <String, String>{
  'data': 'data',
  'error': 'error',
};

abstract final class _$$ApiResponseImplJsonKeys {
  static const String data = 'data';
  static const String error = 'error';
}

// ignore: unused_element
abstract class _$$ApiResponseImplPerFieldToJson {
  // ignore: unused_element
  static Object? data<T>(
    T? instance,
    Object? Function(T value) toJsonT,
  ) =>
      _$nullableGenericToJson(instance, toJsonT);
  // ignore: unused_element
  static Object? error<T>(
    ErrorResponse? instance,
    Object? Function(T value) toJsonT,
  ) =>
      instance?.toJson();
}

Map<String, dynamic> _$$ApiResponseImplToJson<T>(
  _$ApiResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      if (_$nullableGenericToJson(instance.data, toJsonT) case final value?)
        'data': value,
      if (instance.error?.toJson() case final value?) 'error': value,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

_$ErrorResponseImpl _$$ErrorResponseImplFromJson(Map json) => $checkedCreate(
      r'_$ErrorResponseImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['code', 'message'],
        );
        final val = _$ErrorResponseImpl(
          code: $checkedConvert('code', (v) => (v as num).toInt()),
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

const _$$ErrorResponseImplFieldMap = <String, String>{
  'code': 'code',
  'message': 'message',
};

abstract final class _$$ErrorResponseImplJsonKeys {
  static const String code = 'code';
  static const String message = 'message';
}

// ignore: unused_element
abstract class _$$ErrorResponseImplPerFieldToJson {
  // ignore: unused_element
  static Object? code(int instance) => instance;
  // ignore: unused_element
  static Object? message(String instance) => instance;
}

Map<String, dynamic> _$$ErrorResponseImplToJson(_$ErrorResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
