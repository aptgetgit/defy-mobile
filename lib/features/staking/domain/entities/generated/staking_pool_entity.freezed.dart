// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../staking_pool_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StakingPoolEntity {
  String? get operatorAddress => throw _privateConstructorUsedError;
  String? get stakePoolAddress => throw _privateConstructorUsedError;
  num? get rewardsGrowthPercentage => throw _privateConstructorUsedError;
  String? get lastEpochPerformance => throw _privateConstructorUsedError;
  LocationStatsEntity? get locationStats => throw _privateConstructorUsedError;
  num? get totalAptRewardsDistributed => throw _privateConstructorUsedError;
  String? get votingPower => throw _privateConstructorUsedError;
  num? get commissionRate => throw _privateConstructorUsedError;
  num? get activeDelegators => throw _privateConstructorUsedError;
  String? get operatorAptosName => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;

  /// Create a copy of StakingPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StakingPoolEntityCopyWith<StakingPoolEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StakingPoolEntityCopyWith<$Res> {
  factory $StakingPoolEntityCopyWith(
          StakingPoolEntity value, $Res Function(StakingPoolEntity) then) =
      _$StakingPoolEntityCopyWithImpl<$Res, StakingPoolEntity>;
  @useResult
  $Res call(
      {String? operatorAddress,
      String? stakePoolAddress,
      num? rewardsGrowthPercentage,
      String? lastEpochPerformance,
      LocationStatsEntity? locationStats,
      num? totalAptRewardsDistributed,
      String? votingPower,
      num? commissionRate,
      num? activeDelegators,
      String? operatorAptosName,
      String? state});

  $LocationStatsEntityCopyWith<$Res>? get locationStats;
}

/// @nodoc
class _$StakingPoolEntityCopyWithImpl<$Res, $Val extends StakingPoolEntity>
    implements $StakingPoolEntityCopyWith<$Res> {
  _$StakingPoolEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StakingPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operatorAddress = freezed,
    Object? stakePoolAddress = freezed,
    Object? rewardsGrowthPercentage = freezed,
    Object? lastEpochPerformance = freezed,
    Object? locationStats = freezed,
    Object? totalAptRewardsDistributed = freezed,
    Object? votingPower = freezed,
    Object? commissionRate = freezed,
    Object? activeDelegators = freezed,
    Object? operatorAptosName = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      operatorAddress: freezed == operatorAddress
          ? _value.operatorAddress
          : operatorAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      stakePoolAddress: freezed == stakePoolAddress
          ? _value.stakePoolAddress
          : stakePoolAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardsGrowthPercentage: freezed == rewardsGrowthPercentage
          ? _value.rewardsGrowthPercentage
          : rewardsGrowthPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      lastEpochPerformance: freezed == lastEpochPerformance
          ? _value.lastEpochPerformance
          : lastEpochPerformance // ignore: cast_nullable_to_non_nullable
              as String?,
      locationStats: freezed == locationStats
          ? _value.locationStats
          : locationStats // ignore: cast_nullable_to_non_nullable
              as LocationStatsEntity?,
      totalAptRewardsDistributed: freezed == totalAptRewardsDistributed
          ? _value.totalAptRewardsDistributed
          : totalAptRewardsDistributed // ignore: cast_nullable_to_non_nullable
              as num?,
      votingPower: freezed == votingPower
          ? _value.votingPower
          : votingPower // ignore: cast_nullable_to_non_nullable
              as String?,
      commissionRate: freezed == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as num?,
      activeDelegators: freezed == activeDelegators
          ? _value.activeDelegators
          : activeDelegators // ignore: cast_nullable_to_non_nullable
              as num?,
      operatorAptosName: freezed == operatorAptosName
          ? _value.operatorAptosName
          : operatorAptosName // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of StakingPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationStatsEntityCopyWith<$Res>? get locationStats {
    if (_value.locationStats == null) {
      return null;
    }

    return $LocationStatsEntityCopyWith<$Res>(_value.locationStats!, (value) {
      return _then(_value.copyWith(locationStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StakingPoolEntityImplCopyWith<$Res>
    implements $StakingPoolEntityCopyWith<$Res> {
  factory _$$StakingPoolEntityImplCopyWith(_$StakingPoolEntityImpl value,
          $Res Function(_$StakingPoolEntityImpl) then) =
      __$$StakingPoolEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? operatorAddress,
      String? stakePoolAddress,
      num? rewardsGrowthPercentage,
      String? lastEpochPerformance,
      LocationStatsEntity? locationStats,
      num? totalAptRewardsDistributed,
      String? votingPower,
      num? commissionRate,
      num? activeDelegators,
      String? operatorAptosName,
      String? state});

  @override
  $LocationStatsEntityCopyWith<$Res>? get locationStats;
}

/// @nodoc
class __$$StakingPoolEntityImplCopyWithImpl<$Res>
    extends _$StakingPoolEntityCopyWithImpl<$Res, _$StakingPoolEntityImpl>
    implements _$$StakingPoolEntityImplCopyWith<$Res> {
  __$$StakingPoolEntityImplCopyWithImpl(_$StakingPoolEntityImpl _value,
      $Res Function(_$StakingPoolEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of StakingPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operatorAddress = freezed,
    Object? stakePoolAddress = freezed,
    Object? rewardsGrowthPercentage = freezed,
    Object? lastEpochPerformance = freezed,
    Object? locationStats = freezed,
    Object? totalAptRewardsDistributed = freezed,
    Object? votingPower = freezed,
    Object? commissionRate = freezed,
    Object? activeDelegators = freezed,
    Object? operatorAptosName = freezed,
    Object? state = freezed,
  }) {
    return _then(_$StakingPoolEntityImpl(
      operatorAddress: freezed == operatorAddress
          ? _value.operatorAddress
          : operatorAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      stakePoolAddress: freezed == stakePoolAddress
          ? _value.stakePoolAddress
          : stakePoolAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardsGrowthPercentage: freezed == rewardsGrowthPercentage
          ? _value.rewardsGrowthPercentage
          : rewardsGrowthPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      lastEpochPerformance: freezed == lastEpochPerformance
          ? _value.lastEpochPerformance
          : lastEpochPerformance // ignore: cast_nullable_to_non_nullable
              as String?,
      locationStats: freezed == locationStats
          ? _value.locationStats
          : locationStats // ignore: cast_nullable_to_non_nullable
              as LocationStatsEntity?,
      totalAptRewardsDistributed: freezed == totalAptRewardsDistributed
          ? _value.totalAptRewardsDistributed
          : totalAptRewardsDistributed // ignore: cast_nullable_to_non_nullable
              as num?,
      votingPower: freezed == votingPower
          ? _value.votingPower
          : votingPower // ignore: cast_nullable_to_non_nullable
              as String?,
      commissionRate: freezed == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as num?,
      activeDelegators: freezed == activeDelegators
          ? _value.activeDelegators
          : activeDelegators // ignore: cast_nullable_to_non_nullable
              as num?,
      operatorAptosName: freezed == operatorAptosName
          ? _value.operatorAptosName
          : operatorAptosName // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StakingPoolEntityImpl implements _StakingPoolEntity {
  const _$StakingPoolEntityImpl(
      {this.operatorAddress,
      this.stakePoolAddress,
      this.rewardsGrowthPercentage,
      this.lastEpochPerformance,
      this.locationStats,
      this.totalAptRewardsDistributed,
      this.votingPower,
      this.commissionRate,
      this.activeDelegators,
      this.operatorAptosName,
      this.state});

  @override
  final String? operatorAddress;
  @override
  final String? stakePoolAddress;
  @override
  final num? rewardsGrowthPercentage;
  @override
  final String? lastEpochPerformance;
  @override
  final LocationStatsEntity? locationStats;
  @override
  final num? totalAptRewardsDistributed;
  @override
  final String? votingPower;
  @override
  final num? commissionRate;
  @override
  final num? activeDelegators;
  @override
  final String? operatorAptosName;
  @override
  final String? state;

  @override
  String toString() {
    return 'StakingPoolEntity(operatorAddress: $operatorAddress, stakePoolAddress: $stakePoolAddress, rewardsGrowthPercentage: $rewardsGrowthPercentage, lastEpochPerformance: $lastEpochPerformance, locationStats: $locationStats, totalAptRewardsDistributed: $totalAptRewardsDistributed, votingPower: $votingPower, commissionRate: $commissionRate, activeDelegators: $activeDelegators, operatorAptosName: $operatorAptosName, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StakingPoolEntityImpl &&
            (identical(other.operatorAddress, operatorAddress) ||
                other.operatorAddress == operatorAddress) &&
            (identical(other.stakePoolAddress, stakePoolAddress) ||
                other.stakePoolAddress == stakePoolAddress) &&
            (identical(
                    other.rewardsGrowthPercentage, rewardsGrowthPercentage) ||
                other.rewardsGrowthPercentage == rewardsGrowthPercentage) &&
            (identical(other.lastEpochPerformance, lastEpochPerformance) ||
                other.lastEpochPerformance == lastEpochPerformance) &&
            (identical(other.locationStats, locationStats) ||
                other.locationStats == locationStats) &&
            (identical(other.totalAptRewardsDistributed,
                    totalAptRewardsDistributed) ||
                other.totalAptRewardsDistributed ==
                    totalAptRewardsDistributed) &&
            (identical(other.votingPower, votingPower) ||
                other.votingPower == votingPower) &&
            (identical(other.commissionRate, commissionRate) ||
                other.commissionRate == commissionRate) &&
            (identical(other.activeDelegators, activeDelegators) ||
                other.activeDelegators == activeDelegators) &&
            (identical(other.operatorAptosName, operatorAptosName) ||
                other.operatorAptosName == operatorAptosName) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      operatorAddress,
      stakePoolAddress,
      rewardsGrowthPercentage,
      lastEpochPerformance,
      locationStats,
      totalAptRewardsDistributed,
      votingPower,
      commissionRate,
      activeDelegators,
      operatorAptosName,
      state);

  /// Create a copy of StakingPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StakingPoolEntityImplCopyWith<_$StakingPoolEntityImpl> get copyWith =>
      __$$StakingPoolEntityImplCopyWithImpl<_$StakingPoolEntityImpl>(
          this, _$identity);
}

abstract class _StakingPoolEntity implements StakingPoolEntity {
  const factory _StakingPoolEntity(
      {final String? operatorAddress,
      final String? stakePoolAddress,
      final num? rewardsGrowthPercentage,
      final String? lastEpochPerformance,
      final LocationStatsEntity? locationStats,
      final num? totalAptRewardsDistributed,
      final String? votingPower,
      final num? commissionRate,
      final num? activeDelegators,
      final String? operatorAptosName,
      final String? state}) = _$StakingPoolEntityImpl;

  @override
  String? get operatorAddress;
  @override
  String? get stakePoolAddress;
  @override
  num? get rewardsGrowthPercentage;
  @override
  String? get lastEpochPerformance;
  @override
  LocationStatsEntity? get locationStats;
  @override
  num? get totalAptRewardsDistributed;
  @override
  String? get votingPower;
  @override
  num? get commissionRate;
  @override
  num? get activeDelegators;
  @override
  String? get operatorAptosName;
  @override
  String? get state;

  /// Create a copy of StakingPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StakingPoolEntityImplCopyWith<_$StakingPoolEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocationStatsEntity {
  String? get peerId => throw _privateConstructorUsedError;
  num? get epoch => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  num? get latitude => throw _privateConstructorUsedError;
  num? get longitude => throw _privateConstructorUsedError;

  /// Create a copy of LocationStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationStatsEntityCopyWith<LocationStatsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStatsEntityCopyWith<$Res> {
  factory $LocationStatsEntityCopyWith(
          LocationStatsEntity value, $Res Function(LocationStatsEntity) then) =
      _$LocationStatsEntityCopyWithImpl<$Res, LocationStatsEntity>;
  @useResult
  $Res call(
      {String? peerId,
      num? epoch,
      String? country,
      String? region,
      String? city,
      num? latitude,
      num? longitude});
}

/// @nodoc
class _$LocationStatsEntityCopyWithImpl<$Res, $Val extends LocationStatsEntity>
    implements $LocationStatsEntityCopyWith<$Res> {
  _$LocationStatsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? peerId = freezed,
    Object? epoch = freezed,
    Object? country = freezed,
    Object? region = freezed,
    Object? city = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      peerId: freezed == peerId
          ? _value.peerId
          : peerId // ignore: cast_nullable_to_non_nullable
              as String?,
      epoch: freezed == epoch
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as num?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationStatsEntityImplCopyWith<$Res>
    implements $LocationStatsEntityCopyWith<$Res> {
  factory _$$LocationStatsEntityImplCopyWith(_$LocationStatsEntityImpl value,
          $Res Function(_$LocationStatsEntityImpl) then) =
      __$$LocationStatsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? peerId,
      num? epoch,
      String? country,
      String? region,
      String? city,
      num? latitude,
      num? longitude});
}

/// @nodoc
class __$$LocationStatsEntityImplCopyWithImpl<$Res>
    extends _$LocationStatsEntityCopyWithImpl<$Res, _$LocationStatsEntityImpl>
    implements _$$LocationStatsEntityImplCopyWith<$Res> {
  __$$LocationStatsEntityImplCopyWithImpl(_$LocationStatsEntityImpl _value,
      $Res Function(_$LocationStatsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? peerId = freezed,
    Object? epoch = freezed,
    Object? country = freezed,
    Object? region = freezed,
    Object? city = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$LocationStatsEntityImpl(
      peerId: freezed == peerId
          ? _value.peerId
          : peerId // ignore: cast_nullable_to_non_nullable
              as String?,
      epoch: freezed == epoch
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as num?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc

class _$LocationStatsEntityImpl implements _LocationStatsEntity {
  const _$LocationStatsEntityImpl(
      {this.peerId,
      this.epoch,
      this.country,
      this.region,
      this.city,
      this.latitude,
      this.longitude});

  @override
  final String? peerId;
  @override
  final num? epoch;
  @override
  final String? country;
  @override
  final String? region;
  @override
  final String? city;
  @override
  final num? latitude;
  @override
  final num? longitude;

  @override
  String toString() {
    return 'LocationStatsEntity(peerId: $peerId, epoch: $epoch, country: $country, region: $region, city: $city, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationStatsEntityImpl &&
            (identical(other.peerId, peerId) || other.peerId == peerId) &&
            (identical(other.epoch, epoch) || other.epoch == epoch) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, peerId, epoch, country, region, city, latitude, longitude);

  /// Create a copy of LocationStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationStatsEntityImplCopyWith<_$LocationStatsEntityImpl> get copyWith =>
      __$$LocationStatsEntityImplCopyWithImpl<_$LocationStatsEntityImpl>(
          this, _$identity);
}

abstract class _LocationStatsEntity implements LocationStatsEntity {
  const factory _LocationStatsEntity(
      {final String? peerId,
      final num? epoch,
      final String? country,
      final String? region,
      final String? city,
      final num? latitude,
      final num? longitude}) = _$LocationStatsEntityImpl;

  @override
  String? get peerId;
  @override
  num? get epoch;
  @override
  String? get country;
  @override
  String? get region;
  @override
  String? get city;
  @override
  num? get latitude;
  @override
  num? get longitude;

  /// Create a copy of LocationStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationStatsEntityImplCopyWith<_$LocationStatsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
