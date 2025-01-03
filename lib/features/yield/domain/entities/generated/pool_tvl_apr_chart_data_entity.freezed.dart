// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../pool_tvl_apr_chart_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PoolTvlAprChartDataEntity {
  String get apr => throw _privateConstructorUsedError;
  String get strategyId => throw _privateConstructorUsedError;
  String get totalValueLocked => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;

  /// Create a copy of PoolTvlAprChartDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoolTvlAprChartDataEntityCopyWith<PoolTvlAprChartDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoolTvlAprChartDataEntityCopyWith<$Res> {
  factory $PoolTvlAprChartDataEntityCopyWith(PoolTvlAprChartDataEntity value,
          $Res Function(PoolTvlAprChartDataEntity) then) =
      _$PoolTvlAprChartDataEntityCopyWithImpl<$Res, PoolTvlAprChartDataEntity>;
  @useResult
  $Res call(
      {String apr,
      String strategyId,
      String totalValueLocked,
      String createdAt,
      String timestamp});
}

/// @nodoc
class _$PoolTvlAprChartDataEntityCopyWithImpl<$Res,
        $Val extends PoolTvlAprChartDataEntity>
    implements $PoolTvlAprChartDataEntityCopyWith<$Res> {
  _$PoolTvlAprChartDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoolTvlAprChartDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apr = null,
    Object? strategyId = null,
    Object? totalValueLocked = null,
    Object? createdAt = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      apr: null == apr
          ? _value.apr
          : apr // ignore: cast_nullable_to_non_nullable
              as String,
      strategyId: null == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String,
      totalValueLocked: null == totalValueLocked
          ? _value.totalValueLocked
          : totalValueLocked // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PoolTvlAprChartDataEntityImplCopyWith<$Res>
    implements $PoolTvlAprChartDataEntityCopyWith<$Res> {
  factory _$$PoolTvlAprChartDataEntityImplCopyWith(
          _$PoolTvlAprChartDataEntityImpl value,
          $Res Function(_$PoolTvlAprChartDataEntityImpl) then) =
      __$$PoolTvlAprChartDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String apr,
      String strategyId,
      String totalValueLocked,
      String createdAt,
      String timestamp});
}

/// @nodoc
class __$$PoolTvlAprChartDataEntityImplCopyWithImpl<$Res>
    extends _$PoolTvlAprChartDataEntityCopyWithImpl<$Res,
        _$PoolTvlAprChartDataEntityImpl>
    implements _$$PoolTvlAprChartDataEntityImplCopyWith<$Res> {
  __$$PoolTvlAprChartDataEntityImplCopyWithImpl(
      _$PoolTvlAprChartDataEntityImpl _value,
      $Res Function(_$PoolTvlAprChartDataEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoolTvlAprChartDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apr = null,
    Object? strategyId = null,
    Object? totalValueLocked = null,
    Object? createdAt = null,
    Object? timestamp = null,
  }) {
    return _then(_$PoolTvlAprChartDataEntityImpl(
      apr: null == apr
          ? _value.apr
          : apr // ignore: cast_nullable_to_non_nullable
              as String,
      strategyId: null == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String,
      totalValueLocked: null == totalValueLocked
          ? _value.totalValueLocked
          : totalValueLocked // ignore: cast_nullable_to_non_nullable
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

class _$PoolTvlAprChartDataEntityImpl implements _PoolTvlAprChartDataEntity {
  const _$PoolTvlAprChartDataEntityImpl(
      {required this.apr,
      required this.strategyId,
      required this.totalValueLocked,
      required this.createdAt,
      required this.timestamp});

  @override
  final String apr;
  @override
  final String strategyId;
  @override
  final String totalValueLocked;
  @override
  final String createdAt;
  @override
  final String timestamp;

  @override
  String toString() {
    return 'PoolTvlAprChartDataEntity(apr: $apr, strategyId: $strategyId, totalValueLocked: $totalValueLocked, createdAt: $createdAt, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoolTvlAprChartDataEntityImpl &&
            (identical(other.apr, apr) || other.apr == apr) &&
            (identical(other.strategyId, strategyId) ||
                other.strategyId == strategyId) &&
            (identical(other.totalValueLocked, totalValueLocked) ||
                other.totalValueLocked == totalValueLocked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, apr, strategyId, totalValueLocked, createdAt, timestamp);

  /// Create a copy of PoolTvlAprChartDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoolTvlAprChartDataEntityImplCopyWith<_$PoolTvlAprChartDataEntityImpl>
      get copyWith => __$$PoolTvlAprChartDataEntityImplCopyWithImpl<
          _$PoolTvlAprChartDataEntityImpl>(this, _$identity);
}

abstract class _PoolTvlAprChartDataEntity implements PoolTvlAprChartDataEntity {
  const factory _PoolTvlAprChartDataEntity(
      {required final String apr,
      required final String strategyId,
      required final String totalValueLocked,
      required final String createdAt,
      required final String timestamp}) = _$PoolTvlAprChartDataEntityImpl;

  @override
  String get apr;
  @override
  String get strategyId;
  @override
  String get totalValueLocked;
  @override
  String get createdAt;
  @override
  String get timestamp;

  /// Create a copy of PoolTvlAprChartDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoolTvlAprChartDataEntityImplCopyWith<_$PoolTvlAprChartDataEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
