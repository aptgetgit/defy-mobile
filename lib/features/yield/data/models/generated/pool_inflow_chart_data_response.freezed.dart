// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../pool_inflow_chart_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoolInflowChartDataResponse _$PoolInflowChartDataResponseFromJson(
    Map<String, dynamic> json) {
  return _PoolInflowChartDataResponse.fromJson(json);
}

/// @nodoc
mixin _$PoolInflowChartDataResponse {
  String get strategyId => throw _privateConstructorUsedError;
  String get inflow24h => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;

  /// Serializes this PoolInflowChartDataResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoolInflowChartDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoolInflowChartDataResponseCopyWith<PoolInflowChartDataResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoolInflowChartDataResponseCopyWith<$Res> {
  factory $PoolInflowChartDataResponseCopyWith(
          PoolInflowChartDataResponse value,
          $Res Function(PoolInflowChartDataResponse) then) =
      _$PoolInflowChartDataResponseCopyWithImpl<$Res,
          PoolInflowChartDataResponse>;
  @useResult
  $Res call(
      {String strategyId,
      String inflow24h,
      String createdAt,
      String timestamp});
}

/// @nodoc
class _$PoolInflowChartDataResponseCopyWithImpl<$Res,
        $Val extends PoolInflowChartDataResponse>
    implements $PoolInflowChartDataResponseCopyWith<$Res> {
  _$PoolInflowChartDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoolInflowChartDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strategyId = null,
    Object? inflow24h = null,
    Object? createdAt = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      strategyId: null == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String,
      inflow24h: null == inflow24h
          ? _value.inflow24h
          : inflow24h // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoolInflowChartDataResponseImplCopyWith<$Res>
    implements $PoolInflowChartDataResponseCopyWith<$Res> {
  factory _$$PoolInflowChartDataResponseImplCopyWith(
          _$PoolInflowChartDataResponseImpl value,
          $Res Function(_$PoolInflowChartDataResponseImpl) then) =
      __$$PoolInflowChartDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String strategyId,
      String inflow24h,
      String createdAt,
      String timestamp});
}

/// @nodoc
class __$$PoolInflowChartDataResponseImplCopyWithImpl<$Res>
    extends _$PoolInflowChartDataResponseCopyWithImpl<$Res,
        _$PoolInflowChartDataResponseImpl>
    implements _$$PoolInflowChartDataResponseImplCopyWith<$Res> {
  __$$PoolInflowChartDataResponseImplCopyWithImpl(
      _$PoolInflowChartDataResponseImpl _value,
      $Res Function(_$PoolInflowChartDataResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoolInflowChartDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strategyId = null,
    Object? inflow24h = null,
    Object? createdAt = null,
    Object? timestamp = null,
  }) {
    return _then(_$PoolInflowChartDataResponseImpl(
      strategyId: null == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String,
      inflow24h: null == inflow24h
          ? _value.inflow24h
          : inflow24h // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoolInflowChartDataResponseImpl
    implements _PoolInflowChartDataResponse {
  const _$PoolInflowChartDataResponseImpl(
      {required this.strategyId,
      required this.inflow24h,
      required this.createdAt,
      required this.timestamp});

  factory _$PoolInflowChartDataResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PoolInflowChartDataResponseImplFromJson(json);

  @override
  final String strategyId;
  @override
  final String inflow24h;
  @override
  final String createdAt;
  @override
  final String timestamp;

  @override
  String toString() {
    return 'PoolInflowChartDataResponse(strategyId: $strategyId, inflow24h: $inflow24h, createdAt: $createdAt, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoolInflowChartDataResponseImpl &&
            (identical(other.strategyId, strategyId) ||
                other.strategyId == strategyId) &&
            (identical(other.inflow24h, inflow24h) ||
                other.inflow24h == inflow24h) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, strategyId, inflow24h, createdAt, timestamp);

  /// Create a copy of PoolInflowChartDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoolInflowChartDataResponseImplCopyWith<_$PoolInflowChartDataResponseImpl>
      get copyWith => __$$PoolInflowChartDataResponseImplCopyWithImpl<
          _$PoolInflowChartDataResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoolInflowChartDataResponseImplToJson(
      this,
    );
  }
}

abstract class _PoolInflowChartDataResponse
    implements PoolInflowChartDataResponse {
  const factory _PoolInflowChartDataResponse(
      {required final String strategyId,
      required final String inflow24h,
      required final String createdAt,
      required final String timestamp}) = _$PoolInflowChartDataResponseImpl;

  factory _PoolInflowChartDataResponse.fromJson(Map<String, dynamic> json) =
      _$PoolInflowChartDataResponseImpl.fromJson;

  @override
  String get strategyId;
  @override
  String get inflow24h;
  @override
  String get createdAt;
  @override
  String get timestamp;

  /// Create a copy of PoolInflowChartDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoolInflowChartDataResponseImplCopyWith<_$PoolInflowChartDataResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
