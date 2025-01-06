// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../staking_pool_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StakingPoolModel _$StakingPoolModelFromJson(Map<String, dynamic> json) {
  return _StakingPoolModel.fromJson(json);
}

/// @nodoc
mixin _$StakingPoolModel {
  @JsonKey(name: 'operator_address')
  String? get operatorAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'stake_pool_address')
  String? get stakePoolAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'rewards_growth_percentage')
  num? get rewardsGrowthPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_epoch_performance')
  String? get lastEpochPerformance => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_stats')
  LocationStatsModel? get locationStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_apt_rewards_distributed')
  num? get totalAptRewardsDistributed => throw _privateConstructorUsedError;
  @JsonKey(name: 'voting_power')
  String? get votingPower => throw _privateConstructorUsedError;
  @JsonKey(name: 'commission_rate')
  num? get commissionRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_delegators')
  num? get activeDelegators => throw _privateConstructorUsedError;
  @JsonKey(name: 'operator_aptos_name')
  String? get operatorAptosName => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this StakingPoolModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StakingPoolModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StakingPoolModelCopyWith<StakingPoolModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StakingPoolModelCopyWith<$Res> {
  factory $StakingPoolModelCopyWith(
          StakingPoolModel value, $Res Function(StakingPoolModel) then) =
      _$StakingPoolModelCopyWithImpl<$Res, StakingPoolModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'operator_address') String? operatorAddress,
      @JsonKey(name: 'stake_pool_address') String? stakePoolAddress,
      @JsonKey(name: 'rewards_growth_percentage') num? rewardsGrowthPercentage,
      @JsonKey(name: 'last_epoch_performance') String? lastEpochPerformance,
      @JsonKey(name: 'location_stats') LocationStatsModel? locationStats,
      @JsonKey(name: 'total_apt_rewards_distributed')
      num? totalAptRewardsDistributed,
      @JsonKey(name: 'voting_power') String? votingPower,
      @JsonKey(name: 'commission_rate') num? commissionRate,
      @JsonKey(name: 'active_delegators') num? activeDelegators,
      @JsonKey(name: 'operator_aptos_name') String? operatorAptosName,
      @JsonKey(name: 'state') String? state});

  $LocationStatsModelCopyWith<$Res>? get locationStats;
}

/// @nodoc
class _$StakingPoolModelCopyWithImpl<$Res, $Val extends StakingPoolModel>
    implements $StakingPoolModelCopyWith<$Res> {
  _$StakingPoolModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StakingPoolModel
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
              as LocationStatsModel?,
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

  /// Create a copy of StakingPoolModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationStatsModelCopyWith<$Res>? get locationStats {
    if (_value.locationStats == null) {
      return null;
    }

    return $LocationStatsModelCopyWith<$Res>(_value.locationStats!, (value) {
      return _then(_value.copyWith(locationStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StakingPoolModelImplCopyWith<$Res>
    implements $StakingPoolModelCopyWith<$Res> {
  factory _$$StakingPoolModelImplCopyWith(_$StakingPoolModelImpl value,
          $Res Function(_$StakingPoolModelImpl) then) =
      __$$StakingPoolModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'operator_address') String? operatorAddress,
      @JsonKey(name: 'stake_pool_address') String? stakePoolAddress,
      @JsonKey(name: 'rewards_growth_percentage') num? rewardsGrowthPercentage,
      @JsonKey(name: 'last_epoch_performance') String? lastEpochPerformance,
      @JsonKey(name: 'location_stats') LocationStatsModel? locationStats,
      @JsonKey(name: 'total_apt_rewards_distributed')
      num? totalAptRewardsDistributed,
      @JsonKey(name: 'voting_power') String? votingPower,
      @JsonKey(name: 'commission_rate') num? commissionRate,
      @JsonKey(name: 'active_delegators') num? activeDelegators,
      @JsonKey(name: 'operator_aptos_name') String? operatorAptosName,
      @JsonKey(name: 'state') String? state});

  @override
  $LocationStatsModelCopyWith<$Res>? get locationStats;
}

/// @nodoc
class __$$StakingPoolModelImplCopyWithImpl<$Res>
    extends _$StakingPoolModelCopyWithImpl<$Res, _$StakingPoolModelImpl>
    implements _$$StakingPoolModelImplCopyWith<$Res> {
  __$$StakingPoolModelImplCopyWithImpl(_$StakingPoolModelImpl _value,
      $Res Function(_$StakingPoolModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StakingPoolModel
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
    return _then(_$StakingPoolModelImpl(
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
              as LocationStatsModel?,
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
@JsonSerializable()
class _$StakingPoolModelImpl extends _StakingPoolModel {
  const _$StakingPoolModelImpl(
      {@JsonKey(name: 'operator_address') this.operatorAddress,
      @JsonKey(name: 'stake_pool_address') this.stakePoolAddress,
      @JsonKey(name: 'rewards_growth_percentage') this.rewardsGrowthPercentage,
      @JsonKey(name: 'last_epoch_performance') this.lastEpochPerformance,
      @JsonKey(name: 'location_stats') this.locationStats,
      @JsonKey(name: 'total_apt_rewards_distributed')
      this.totalAptRewardsDistributed,
      @JsonKey(name: 'voting_power') this.votingPower,
      @JsonKey(name: 'commission_rate') this.commissionRate,
      @JsonKey(name: 'active_delegators') this.activeDelegators,
      @JsonKey(name: 'operator_aptos_name') this.operatorAptosName,
      @JsonKey(name: 'state') this.state})
      : super._();

  factory _$StakingPoolModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StakingPoolModelImplFromJson(json);

  @override
  @JsonKey(name: 'operator_address')
  final String? operatorAddress;
  @override
  @JsonKey(name: 'stake_pool_address')
  final String? stakePoolAddress;
  @override
  @JsonKey(name: 'rewards_growth_percentage')
  final num? rewardsGrowthPercentage;
  @override
  @JsonKey(name: 'last_epoch_performance')
  final String? lastEpochPerformance;
  @override
  @JsonKey(name: 'location_stats')
  final LocationStatsModel? locationStats;
  @override
  @JsonKey(name: 'total_apt_rewards_distributed')
  final num? totalAptRewardsDistributed;
  @override
  @JsonKey(name: 'voting_power')
  final String? votingPower;
  @override
  @JsonKey(name: 'commission_rate')
  final num? commissionRate;
  @override
  @JsonKey(name: 'active_delegators')
  final num? activeDelegators;
  @override
  @JsonKey(name: 'operator_aptos_name')
  final String? operatorAptosName;
  @override
  @JsonKey(name: 'state')
  final String? state;

  @override
  String toString() {
    return 'StakingPoolModel(operatorAddress: $operatorAddress, stakePoolAddress: $stakePoolAddress, rewardsGrowthPercentage: $rewardsGrowthPercentage, lastEpochPerformance: $lastEpochPerformance, locationStats: $locationStats, totalAptRewardsDistributed: $totalAptRewardsDistributed, votingPower: $votingPower, commissionRate: $commissionRate, activeDelegators: $activeDelegators, operatorAptosName: $operatorAptosName, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StakingPoolModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of StakingPoolModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StakingPoolModelImplCopyWith<_$StakingPoolModelImpl> get copyWith =>
      __$$StakingPoolModelImplCopyWithImpl<_$StakingPoolModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StakingPoolModelImplToJson(
      this,
    );
  }
}

abstract class _StakingPoolModel extends StakingPoolModel {
  const factory _StakingPoolModel(
      {@JsonKey(name: 'operator_address') final String? operatorAddress,
      @JsonKey(name: 'stake_pool_address') final String? stakePoolAddress,
      @JsonKey(name: 'rewards_growth_percentage')
      final num? rewardsGrowthPercentage,
      @JsonKey(name: 'last_epoch_performance')
      final String? lastEpochPerformance,
      @JsonKey(name: 'location_stats') final LocationStatsModel? locationStats,
      @JsonKey(name: 'total_apt_rewards_distributed')
      final num? totalAptRewardsDistributed,
      @JsonKey(name: 'voting_power') final String? votingPower,
      @JsonKey(name: 'commission_rate') final num? commissionRate,
      @JsonKey(name: 'active_delegators') final num? activeDelegators,
      @JsonKey(name: 'operator_aptos_name') final String? operatorAptosName,
      @JsonKey(name: 'state') final String? state}) = _$StakingPoolModelImpl;
  const _StakingPoolModel._() : super._();

  factory _StakingPoolModel.fromJson(Map<String, dynamic> json) =
      _$StakingPoolModelImpl.fromJson;

  @override
  @JsonKey(name: 'operator_address')
  String? get operatorAddress;
  @override
  @JsonKey(name: 'stake_pool_address')
  String? get stakePoolAddress;
  @override
  @JsonKey(name: 'rewards_growth_percentage')
  num? get rewardsGrowthPercentage;
  @override
  @JsonKey(name: 'last_epoch_performance')
  String? get lastEpochPerformance;
  @override
  @JsonKey(name: 'location_stats')
  LocationStatsModel? get locationStats;
  @override
  @JsonKey(name: 'total_apt_rewards_distributed')
  num? get totalAptRewardsDistributed;
  @override
  @JsonKey(name: 'voting_power')
  String? get votingPower;
  @override
  @JsonKey(name: 'commission_rate')
  num? get commissionRate;
  @override
  @JsonKey(name: 'active_delegators')
  num? get activeDelegators;
  @override
  @JsonKey(name: 'operator_aptos_name')
  String? get operatorAptosName;
  @override
  @JsonKey(name: 'state')
  String? get state;

  /// Create a copy of StakingPoolModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StakingPoolModelImplCopyWith<_$StakingPoolModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationStatsModel _$LocationStatsModelFromJson(Map<String, dynamic> json) {
  return _LocationStatsModel.fromJson(json);
}

/// @nodoc
mixin _$LocationStatsModel {
  @JsonKey(name: 'peer_id')
  String? get peerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'epoch')
  num? get epoch => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'region')
  String? get region => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  num? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  num? get longitude => throw _privateConstructorUsedError;

  /// Serializes this LocationStatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationStatsModelCopyWith<LocationStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStatsModelCopyWith<$Res> {
  factory $LocationStatsModelCopyWith(
          LocationStatsModel value, $Res Function(LocationStatsModel) then) =
      _$LocationStatsModelCopyWithImpl<$Res, LocationStatsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'peer_id') String? peerId,
      @JsonKey(name: 'epoch') num? epoch,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'region') String? region,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'latitude') num? latitude,
      @JsonKey(name: 'longitude') num? longitude});
}

/// @nodoc
class _$LocationStatsModelCopyWithImpl<$Res, $Val extends LocationStatsModel>
    implements $LocationStatsModelCopyWith<$Res> {
  _$LocationStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationStatsModel
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
abstract class _$$LocationStatsModelImplCopyWith<$Res>
    implements $LocationStatsModelCopyWith<$Res> {
  factory _$$LocationStatsModelImplCopyWith(_$LocationStatsModelImpl value,
          $Res Function(_$LocationStatsModelImpl) then) =
      __$$LocationStatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'peer_id') String? peerId,
      @JsonKey(name: 'epoch') num? epoch,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'region') String? region,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'latitude') num? latitude,
      @JsonKey(name: 'longitude') num? longitude});
}

/// @nodoc
class __$$LocationStatsModelImplCopyWithImpl<$Res>
    extends _$LocationStatsModelCopyWithImpl<$Res, _$LocationStatsModelImpl>
    implements _$$LocationStatsModelImplCopyWith<$Res> {
  __$$LocationStatsModelImplCopyWithImpl(_$LocationStatsModelImpl _value,
      $Res Function(_$LocationStatsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationStatsModel
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
    return _then(_$LocationStatsModelImpl(
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
@JsonSerializable()
class _$LocationStatsModelImpl extends _LocationStatsModel {
  const _$LocationStatsModelImpl(
      {@JsonKey(name: 'peer_id') this.peerId,
      @JsonKey(name: 'epoch') this.epoch,
      @JsonKey(name: 'country') this.country,
      @JsonKey(name: 'region') this.region,
      @JsonKey(name: 'city') this.city,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude})
      : super._();

  factory _$LocationStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationStatsModelImplFromJson(json);

  @override
  @JsonKey(name: 'peer_id')
  final String? peerId;
  @override
  @JsonKey(name: 'epoch')
  final num? epoch;
  @override
  @JsonKey(name: 'country')
  final String? country;
  @override
  @JsonKey(name: 'region')
  final String? region;
  @override
  @JsonKey(name: 'city')
  final String? city;
  @override
  @JsonKey(name: 'latitude')
  final num? latitude;
  @override
  @JsonKey(name: 'longitude')
  final num? longitude;

  @override
  String toString() {
    return 'LocationStatsModel(peerId: $peerId, epoch: $epoch, country: $country, region: $region, city: $city, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationStatsModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, peerId, epoch, country, region, city, latitude, longitude);

  /// Create a copy of LocationStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationStatsModelImplCopyWith<_$LocationStatsModelImpl> get copyWith =>
      __$$LocationStatsModelImplCopyWithImpl<_$LocationStatsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationStatsModelImplToJson(
      this,
    );
  }
}

abstract class _LocationStatsModel extends LocationStatsModel {
  const factory _LocationStatsModel(
          {@JsonKey(name: 'peer_id') final String? peerId,
          @JsonKey(name: 'epoch') final num? epoch,
          @JsonKey(name: 'country') final String? country,
          @JsonKey(name: 'region') final String? region,
          @JsonKey(name: 'city') final String? city,
          @JsonKey(name: 'latitude') final num? latitude,
          @JsonKey(name: 'longitude') final num? longitude}) =
      _$LocationStatsModelImpl;
  const _LocationStatsModel._() : super._();

  factory _LocationStatsModel.fromJson(Map<String, dynamic> json) =
      _$LocationStatsModelImpl.fromJson;

  @override
  @JsonKey(name: 'peer_id')
  String? get peerId;
  @override
  @JsonKey(name: 'epoch')
  num? get epoch;
  @override
  @JsonKey(name: 'country')
  String? get country;
  @override
  @JsonKey(name: 'region')
  String? get region;
  @override
  @JsonKey(name: 'city')
  String? get city;
  @override
  @JsonKey(name: 'latitude')
  num? get latitude;
  @override
  @JsonKey(name: 'longitude')
  num? get longitude;

  /// Create a copy of LocationStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationStatsModelImplCopyWith<_$LocationStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
