// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../pool_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoolDataResponse _$PoolDataResponseFromJson(Map<String, dynamic> json) {
  return _PoolDataResponse.fromJson(json);
}

/// @nodoc
mixin _$PoolDataResponse {
  String get id => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseProtocols)
  List<String> get poolProtocols => throw _privateConstructorUsedError;
  String get apr => throw _privateConstructorUsedError;
  String get nameId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get pid => throw _privateConstructorUsedError;
  String get poolType => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseStakeToken)
  List<String> get stakeToken => throw _privateConstructorUsedError;
  String get totalValueLocked => throw _privateConstructorUsedError;
  String get tvlToken => throw _privateConstructorUsedError;
  String get withdrawalSlippage => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get strategyType => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseRewardToken)
  List<String> get rewardToken => throw _privateConstructorUsedError;
  String get positionToken => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseFeeToken)
  List<String> get feeToken => throw _privateConstructorUsedError;
  String get depositFee => throw _privateConstructorUsedError;
  String get risk => throw _privateConstructorUsedError;
  String get withdrawalFee => throw _privateConstructorUsedError;
  String get depositSwapFee => throw _privateConstructorUsedError;
  String get withdrawalSwapFee => throw _privateConstructorUsedError;
  String get stakers => throw _privateConstructorUsedError;
  String get liquidityType => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseWeight)
  List<String> get weight => throw _privateConstructorUsedError;
  String get aprAvg => throw _privateConstructorUsedError;
  String get vibrantFee => throw _privateConstructorUsedError;
  String get volume24h => throw _privateConstructorUsedError;
  String get fee24h => throw _privateConstructorUsedError;
  String get inflow24h => throw _privateConstructorUsedError;
  String get minApr => throw _privateConstructorUsedError;
  String get maxApr => throw _privateConstructorUsedError;
  String get maxLeverage => throw _privateConstructorUsedError;
  String get borrowApr => throw _privateConstructorUsedError;
  String get airdropPoint => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parsePoolInflowChartData)
  List<PoolInflowChartDataResponse> get inflowChartData =>
      throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseTvlAprChartData)
  List<PoolTvlAprChartData> get tvlAprChartData =>
      throw _privateConstructorUsedError;
  String? get ariesDetail => throw _privateConstructorUsedError;
  String? get echelonDetail => throw _privateConstructorUsedError;
  String? get leverageResponseDto => throw _privateConstructorUsedError;
  PoolPayloadData get payload => throw _privateConstructorUsedError;

  /// Serializes this PoolDataResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoolDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoolDataResponseCopyWith<PoolDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoolDataResponseCopyWith<$Res> {
  factory $PoolDataResponseCopyWith(
          PoolDataResponse value, $Res Function(PoolDataResponse) then) =
      _$PoolDataResponseCopyWithImpl<$Res, PoolDataResponse>;
  @useResult
  $Res call(
      {String id,
      bool isEnabled,
      @JsonKey(fromJson: parseProtocols) List<String> poolProtocols,
      String apr,
      String nameId,
      String description,
      String pid,
      String poolType,
      @JsonKey(fromJson: parseStakeToken) List<String> stakeToken,
      String totalValueLocked,
      String tvlToken,
      String withdrawalSlippage,
      String name,
      String displayName,
      String strategyType,
      @JsonKey(fromJson: parseRewardToken) List<String> rewardToken,
      String positionToken,
      @JsonKey(fromJson: parseFeeToken) List<String> feeToken,
      String depositFee,
      String risk,
      String withdrawalFee,
      String depositSwapFee,
      String withdrawalSwapFee,
      String stakers,
      String liquidityType,
      @JsonKey(fromJson: parseWeight) List<String> weight,
      String aprAvg,
      String vibrantFee,
      String volume24h,
      String fee24h,
      String inflow24h,
      String minApr,
      String maxApr,
      String maxLeverage,
      String borrowApr,
      String airdropPoint,
      @JsonKey(fromJson: parsePoolInflowChartData)
      List<PoolInflowChartDataResponse> inflowChartData,
      @JsonKey(fromJson: parseTvlAprChartData)
      List<PoolTvlAprChartData> tvlAprChartData,
      String? ariesDetail,
      String? echelonDetail,
      String? leverageResponseDto,
      PoolPayloadData payload});

  $PoolPayloadDataCopyWith<$Res> get payload;
}

/// @nodoc
class _$PoolDataResponseCopyWithImpl<$Res, $Val extends PoolDataResponse>
    implements $PoolDataResponseCopyWith<$Res> {
  _$PoolDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoolDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isEnabled = null,
    Object? poolProtocols = null,
    Object? apr = null,
    Object? nameId = null,
    Object? description = null,
    Object? pid = null,
    Object? poolType = null,
    Object? stakeToken = null,
    Object? totalValueLocked = null,
    Object? tvlToken = null,
    Object? withdrawalSlippage = null,
    Object? name = null,
    Object? displayName = null,
    Object? strategyType = null,
    Object? rewardToken = null,
    Object? positionToken = null,
    Object? feeToken = null,
    Object? depositFee = null,
    Object? risk = null,
    Object? withdrawalFee = null,
    Object? depositSwapFee = null,
    Object? withdrawalSwapFee = null,
    Object? stakers = null,
    Object? liquidityType = null,
    Object? weight = null,
    Object? aprAvg = null,
    Object? vibrantFee = null,
    Object? volume24h = null,
    Object? fee24h = null,
    Object? inflow24h = null,
    Object? minApr = null,
    Object? maxApr = null,
    Object? maxLeverage = null,
    Object? borrowApr = null,
    Object? airdropPoint = null,
    Object? inflowChartData = null,
    Object? tvlAprChartData = null,
    Object? ariesDetail = freezed,
    Object? echelonDetail = freezed,
    Object? leverageResponseDto = freezed,
    Object? payload = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      poolProtocols: null == poolProtocols
          ? _value.poolProtocols
          : poolProtocols // ignore: cast_nullable_to_non_nullable
              as List<String>,
      apr: null == apr
          ? _value.apr
          : apr // ignore: cast_nullable_to_non_nullable
              as String,
      nameId: null == nameId
          ? _value.nameId
          : nameId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      poolType: null == poolType
          ? _value.poolType
          : poolType // ignore: cast_nullable_to_non_nullable
              as String,
      stakeToken: null == stakeToken
          ? _value.stakeToken
          : stakeToken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalValueLocked: null == totalValueLocked
          ? _value.totalValueLocked
          : totalValueLocked // ignore: cast_nullable_to_non_nullable
              as String,
      tvlToken: null == tvlToken
          ? _value.tvlToken
          : tvlToken // ignore: cast_nullable_to_non_nullable
              as String,
      withdrawalSlippage: null == withdrawalSlippage
          ? _value.withdrawalSlippage
          : withdrawalSlippage // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      strategyType: null == strategyType
          ? _value.strategyType
          : strategyType // ignore: cast_nullable_to_non_nullable
              as String,
      rewardToken: null == rewardToken
          ? _value.rewardToken
          : rewardToken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      positionToken: null == positionToken
          ? _value.positionToken
          : positionToken // ignore: cast_nullable_to_non_nullable
              as String,
      feeToken: null == feeToken
          ? _value.feeToken
          : feeToken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      depositFee: null == depositFee
          ? _value.depositFee
          : depositFee // ignore: cast_nullable_to_non_nullable
              as String,
      risk: null == risk
          ? _value.risk
          : risk // ignore: cast_nullable_to_non_nullable
              as String,
      withdrawalFee: null == withdrawalFee
          ? _value.withdrawalFee
          : withdrawalFee // ignore: cast_nullable_to_non_nullable
              as String,
      depositSwapFee: null == depositSwapFee
          ? _value.depositSwapFee
          : depositSwapFee // ignore: cast_nullable_to_non_nullable
              as String,
      withdrawalSwapFee: null == withdrawalSwapFee
          ? _value.withdrawalSwapFee
          : withdrawalSwapFee // ignore: cast_nullable_to_non_nullable
              as String,
      stakers: null == stakers
          ? _value.stakers
          : stakers // ignore: cast_nullable_to_non_nullable
              as String,
      liquidityType: null == liquidityType
          ? _value.liquidityType
          : liquidityType // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as List<String>,
      aprAvg: null == aprAvg
          ? _value.aprAvg
          : aprAvg // ignore: cast_nullable_to_non_nullable
              as String,
      vibrantFee: null == vibrantFee
          ? _value.vibrantFee
          : vibrantFee // ignore: cast_nullable_to_non_nullable
              as String,
      volume24h: null == volume24h
          ? _value.volume24h
          : volume24h // ignore: cast_nullable_to_non_nullable
              as String,
      fee24h: null == fee24h
          ? _value.fee24h
          : fee24h // ignore: cast_nullable_to_non_nullable
              as String,
      inflow24h: null == inflow24h
          ? _value.inflow24h
          : inflow24h // ignore: cast_nullable_to_non_nullable
              as String,
      minApr: null == minApr
          ? _value.minApr
          : minApr // ignore: cast_nullable_to_non_nullable
              as String,
      maxApr: null == maxApr
          ? _value.maxApr
          : maxApr // ignore: cast_nullable_to_non_nullable
              as String,
      maxLeverage: null == maxLeverage
          ? _value.maxLeverage
          : maxLeverage // ignore: cast_nullable_to_non_nullable
              as String,
      borrowApr: null == borrowApr
          ? _value.borrowApr
          : borrowApr // ignore: cast_nullable_to_non_nullable
              as String,
      airdropPoint: null == airdropPoint
          ? _value.airdropPoint
          : airdropPoint // ignore: cast_nullable_to_non_nullable
              as String,
      inflowChartData: null == inflowChartData
          ? _value.inflowChartData
          : inflowChartData // ignore: cast_nullable_to_non_nullable
              as List<PoolInflowChartDataResponse>,
      tvlAprChartData: null == tvlAprChartData
          ? _value.tvlAprChartData
          : tvlAprChartData // ignore: cast_nullable_to_non_nullable
              as List<PoolTvlAprChartData>,
      ariesDetail: freezed == ariesDetail
          ? _value.ariesDetail
          : ariesDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      echelonDetail: freezed == echelonDetail
          ? _value.echelonDetail
          : echelonDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      leverageResponseDto: freezed == leverageResponseDto
          ? _value.leverageResponseDto
          : leverageResponseDto // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as PoolPayloadData,
    ) as $Val);
  }

  /// Create a copy of PoolDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PoolPayloadDataCopyWith<$Res> get payload {
    return $PoolPayloadDataCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PoolDataResponseImplCopyWith<$Res>
    implements $PoolDataResponseCopyWith<$Res> {
  factory _$$PoolDataResponseImplCopyWith(_$PoolDataResponseImpl value,
          $Res Function(_$PoolDataResponseImpl) then) =
      __$$PoolDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isEnabled,
      @JsonKey(fromJson: parseProtocols) List<String> poolProtocols,
      String apr,
      String nameId,
      String description,
      String pid,
      String poolType,
      @JsonKey(fromJson: parseStakeToken) List<String> stakeToken,
      String totalValueLocked,
      String tvlToken,
      String withdrawalSlippage,
      String name,
      String displayName,
      String strategyType,
      @JsonKey(fromJson: parseRewardToken) List<String> rewardToken,
      String positionToken,
      @JsonKey(fromJson: parseFeeToken) List<String> feeToken,
      String depositFee,
      String risk,
      String withdrawalFee,
      String depositSwapFee,
      String withdrawalSwapFee,
      String stakers,
      String liquidityType,
      @JsonKey(fromJson: parseWeight) List<String> weight,
      String aprAvg,
      String vibrantFee,
      String volume24h,
      String fee24h,
      String inflow24h,
      String minApr,
      String maxApr,
      String maxLeverage,
      String borrowApr,
      String airdropPoint,
      @JsonKey(fromJson: parsePoolInflowChartData)
      List<PoolInflowChartDataResponse> inflowChartData,
      @JsonKey(fromJson: parseTvlAprChartData)
      List<PoolTvlAprChartData> tvlAprChartData,
      String? ariesDetail,
      String? echelonDetail,
      String? leverageResponseDto,
      PoolPayloadData payload});

  @override
  $PoolPayloadDataCopyWith<$Res> get payload;
}

/// @nodoc
class __$$PoolDataResponseImplCopyWithImpl<$Res>
    extends _$PoolDataResponseCopyWithImpl<$Res, _$PoolDataResponseImpl>
    implements _$$PoolDataResponseImplCopyWith<$Res> {
  __$$PoolDataResponseImplCopyWithImpl(_$PoolDataResponseImpl _value,
      $Res Function(_$PoolDataResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoolDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isEnabled = null,
    Object? poolProtocols = null,
    Object? apr = null,
    Object? nameId = null,
    Object? description = null,
    Object? pid = null,
    Object? poolType = null,
    Object? stakeToken = null,
    Object? totalValueLocked = null,
    Object? tvlToken = null,
    Object? withdrawalSlippage = null,
    Object? name = null,
    Object? displayName = null,
    Object? strategyType = null,
    Object? rewardToken = null,
    Object? positionToken = null,
    Object? feeToken = null,
    Object? depositFee = null,
    Object? risk = null,
    Object? withdrawalFee = null,
    Object? depositSwapFee = null,
    Object? withdrawalSwapFee = null,
    Object? stakers = null,
    Object? liquidityType = null,
    Object? weight = null,
    Object? aprAvg = null,
    Object? vibrantFee = null,
    Object? volume24h = null,
    Object? fee24h = null,
    Object? inflow24h = null,
    Object? minApr = null,
    Object? maxApr = null,
    Object? maxLeverage = null,
    Object? borrowApr = null,
    Object? airdropPoint = null,
    Object? inflowChartData = null,
    Object? tvlAprChartData = null,
    Object? ariesDetail = freezed,
    Object? echelonDetail = freezed,
    Object? leverageResponseDto = freezed,
    Object? payload = null,
  }) {
    return _then(_$PoolDataResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      poolProtocols: null == poolProtocols
          ? _value._poolProtocols
          : poolProtocols // ignore: cast_nullable_to_non_nullable
              as List<String>,
      apr: null == apr
          ? _value.apr
          : apr // ignore: cast_nullable_to_non_nullable
              as String,
      nameId: null == nameId
          ? _value.nameId
          : nameId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      poolType: null == poolType
          ? _value.poolType
          : poolType // ignore: cast_nullable_to_non_nullable
              as String,
      stakeToken: null == stakeToken
          ? _value._stakeToken
          : stakeToken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalValueLocked: null == totalValueLocked
          ? _value.totalValueLocked
          : totalValueLocked // ignore: cast_nullable_to_non_nullable
              as String,
      tvlToken: null == tvlToken
          ? _value.tvlToken
          : tvlToken // ignore: cast_nullable_to_non_nullable
              as String,
      withdrawalSlippage: null == withdrawalSlippage
          ? _value.withdrawalSlippage
          : withdrawalSlippage // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      strategyType: null == strategyType
          ? _value.strategyType
          : strategyType // ignore: cast_nullable_to_non_nullable
              as String,
      rewardToken: null == rewardToken
          ? _value._rewardToken
          : rewardToken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      positionToken: null == positionToken
          ? _value.positionToken
          : positionToken // ignore: cast_nullable_to_non_nullable
              as String,
      feeToken: null == feeToken
          ? _value._feeToken
          : feeToken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      depositFee: null == depositFee
          ? _value.depositFee
          : depositFee // ignore: cast_nullable_to_non_nullable
              as String,
      risk: null == risk
          ? _value.risk
          : risk // ignore: cast_nullable_to_non_nullable
              as String,
      withdrawalFee: null == withdrawalFee
          ? _value.withdrawalFee
          : withdrawalFee // ignore: cast_nullable_to_non_nullable
              as String,
      depositSwapFee: null == depositSwapFee
          ? _value.depositSwapFee
          : depositSwapFee // ignore: cast_nullable_to_non_nullable
              as String,
      withdrawalSwapFee: null == withdrawalSwapFee
          ? _value.withdrawalSwapFee
          : withdrawalSwapFee // ignore: cast_nullable_to_non_nullable
              as String,
      stakers: null == stakers
          ? _value.stakers
          : stakers // ignore: cast_nullable_to_non_nullable
              as String,
      liquidityType: null == liquidityType
          ? _value.liquidityType
          : liquidityType // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value._weight
          : weight // ignore: cast_nullable_to_non_nullable
              as List<String>,
      aprAvg: null == aprAvg
          ? _value.aprAvg
          : aprAvg // ignore: cast_nullable_to_non_nullable
              as String,
      vibrantFee: null == vibrantFee
          ? _value.vibrantFee
          : vibrantFee // ignore: cast_nullable_to_non_nullable
              as String,
      volume24h: null == volume24h
          ? _value.volume24h
          : volume24h // ignore: cast_nullable_to_non_nullable
              as String,
      fee24h: null == fee24h
          ? _value.fee24h
          : fee24h // ignore: cast_nullable_to_non_nullable
              as String,
      inflow24h: null == inflow24h
          ? _value.inflow24h
          : inflow24h // ignore: cast_nullable_to_non_nullable
              as String,
      minApr: null == minApr
          ? _value.minApr
          : minApr // ignore: cast_nullable_to_non_nullable
              as String,
      maxApr: null == maxApr
          ? _value.maxApr
          : maxApr // ignore: cast_nullable_to_non_nullable
              as String,
      maxLeverage: null == maxLeverage
          ? _value.maxLeverage
          : maxLeverage // ignore: cast_nullable_to_non_nullable
              as String,
      borrowApr: null == borrowApr
          ? _value.borrowApr
          : borrowApr // ignore: cast_nullable_to_non_nullable
              as String,
      airdropPoint: null == airdropPoint
          ? _value.airdropPoint
          : airdropPoint // ignore: cast_nullable_to_non_nullable
              as String,
      inflowChartData: null == inflowChartData
          ? _value._inflowChartData
          : inflowChartData // ignore: cast_nullable_to_non_nullable
              as List<PoolInflowChartDataResponse>,
      tvlAprChartData: null == tvlAprChartData
          ? _value._tvlAprChartData
          : tvlAprChartData // ignore: cast_nullable_to_non_nullable
              as List<PoolTvlAprChartData>,
      ariesDetail: freezed == ariesDetail
          ? _value.ariesDetail
          : ariesDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      echelonDetail: freezed == echelonDetail
          ? _value.echelonDetail
          : echelonDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      leverageResponseDto: freezed == leverageResponseDto
          ? _value.leverageResponseDto
          : leverageResponseDto // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as PoolPayloadData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoolDataResponseImpl implements _PoolDataResponse {
  _$PoolDataResponseImpl(
      {required this.id,
      required this.isEnabled,
      @JsonKey(fromJson: parseProtocols)
      required final List<String> poolProtocols,
      required this.apr,
      required this.nameId,
      required this.description,
      required this.pid,
      required this.poolType,
      @JsonKey(fromJson: parseStakeToken)
      required final List<String> stakeToken,
      required this.totalValueLocked,
      required this.tvlToken,
      required this.withdrawalSlippage,
      required this.name,
      required this.displayName,
      required this.strategyType,
      @JsonKey(fromJson: parseRewardToken)
      required final List<String> rewardToken,
      required this.positionToken,
      @JsonKey(fromJson: parseFeeToken) required final List<String> feeToken,
      required this.depositFee,
      required this.risk,
      required this.withdrawalFee,
      required this.depositSwapFee,
      required this.withdrawalSwapFee,
      required this.stakers,
      required this.liquidityType,
      @JsonKey(fromJson: parseWeight) required final List<String> weight,
      required this.aprAvg,
      required this.vibrantFee,
      required this.volume24h,
      required this.fee24h,
      required this.inflow24h,
      required this.minApr,
      required this.maxApr,
      required this.maxLeverage,
      required this.borrowApr,
      required this.airdropPoint,
      @JsonKey(fromJson: parsePoolInflowChartData)
      required final List<PoolInflowChartDataResponse> inflowChartData,
      @JsonKey(fromJson: parseTvlAprChartData)
      required final List<PoolTvlAprChartData> tvlAprChartData,
      this.ariesDetail,
      this.echelonDetail,
      this.leverageResponseDto,
      required this.payload})
      : _poolProtocols = poolProtocols,
        _stakeToken = stakeToken,
        _rewardToken = rewardToken,
        _feeToken = feeToken,
        _weight = weight,
        _inflowChartData = inflowChartData,
        _tvlAprChartData = tvlAprChartData;

  factory _$PoolDataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoolDataResponseImplFromJson(json);

  @override
  final String id;
  @override
  final bool isEnabled;
  final List<String> _poolProtocols;
  @override
  @JsonKey(fromJson: parseProtocols)
  List<String> get poolProtocols {
    if (_poolProtocols is EqualUnmodifiableListView) return _poolProtocols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poolProtocols);
  }

  @override
  final String apr;
  @override
  final String nameId;
  @override
  final String description;
  @override
  final String pid;
  @override
  final String poolType;
  final List<String> _stakeToken;
  @override
  @JsonKey(fromJson: parseStakeToken)
  List<String> get stakeToken {
    if (_stakeToken is EqualUnmodifiableListView) return _stakeToken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stakeToken);
  }

  @override
  final String totalValueLocked;
  @override
  final String tvlToken;
  @override
  final String withdrawalSlippage;
  @override
  final String name;
  @override
  final String displayName;
  @override
  final String strategyType;
  final List<String> _rewardToken;
  @override
  @JsonKey(fromJson: parseRewardToken)
  List<String> get rewardToken {
    if (_rewardToken is EqualUnmodifiableListView) return _rewardToken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rewardToken);
  }

  @override
  final String positionToken;
  final List<String> _feeToken;
  @override
  @JsonKey(fromJson: parseFeeToken)
  List<String> get feeToken {
    if (_feeToken is EqualUnmodifiableListView) return _feeToken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feeToken);
  }

  @override
  final String depositFee;
  @override
  final String risk;
  @override
  final String withdrawalFee;
  @override
  final String depositSwapFee;
  @override
  final String withdrawalSwapFee;
  @override
  final String stakers;
  @override
  final String liquidityType;
  final List<String> _weight;
  @override
  @JsonKey(fromJson: parseWeight)
  List<String> get weight {
    if (_weight is EqualUnmodifiableListView) return _weight;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weight);
  }

  @override
  final String aprAvg;
  @override
  final String vibrantFee;
  @override
  final String volume24h;
  @override
  final String fee24h;
  @override
  final String inflow24h;
  @override
  final String minApr;
  @override
  final String maxApr;
  @override
  final String maxLeverage;
  @override
  final String borrowApr;
  @override
  final String airdropPoint;
  final List<PoolInflowChartDataResponse> _inflowChartData;
  @override
  @JsonKey(fromJson: parsePoolInflowChartData)
  List<PoolInflowChartDataResponse> get inflowChartData {
    if (_inflowChartData is EqualUnmodifiableListView) return _inflowChartData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inflowChartData);
  }

  final List<PoolTvlAprChartData> _tvlAprChartData;
  @override
  @JsonKey(fromJson: parseTvlAprChartData)
  List<PoolTvlAprChartData> get tvlAprChartData {
    if (_tvlAprChartData is EqualUnmodifiableListView) return _tvlAprChartData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tvlAprChartData);
  }

  @override
  final String? ariesDetail;
  @override
  final String? echelonDetail;
  @override
  final String? leverageResponseDto;
  @override
  final PoolPayloadData payload;

  @override
  String toString() {
    return 'PoolDataResponse(id: $id, isEnabled: $isEnabled, poolProtocols: $poolProtocols, apr: $apr, nameId: $nameId, description: $description, pid: $pid, poolType: $poolType, stakeToken: $stakeToken, totalValueLocked: $totalValueLocked, tvlToken: $tvlToken, withdrawalSlippage: $withdrawalSlippage, name: $name, displayName: $displayName, strategyType: $strategyType, rewardToken: $rewardToken, positionToken: $positionToken, feeToken: $feeToken, depositFee: $depositFee, risk: $risk, withdrawalFee: $withdrawalFee, depositSwapFee: $depositSwapFee, withdrawalSwapFee: $withdrawalSwapFee, stakers: $stakers, liquidityType: $liquidityType, weight: $weight, aprAvg: $aprAvg, vibrantFee: $vibrantFee, volume24h: $volume24h, fee24h: $fee24h, inflow24h: $inflow24h, minApr: $minApr, maxApr: $maxApr, maxLeverage: $maxLeverage, borrowApr: $borrowApr, airdropPoint: $airdropPoint, inflowChartData: $inflowChartData, tvlAprChartData: $tvlAprChartData, ariesDetail: $ariesDetail, echelonDetail: $echelonDetail, leverageResponseDto: $leverageResponseDto, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoolDataResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            const DeepCollectionEquality()
                .equals(other._poolProtocols, _poolProtocols) &&
            (identical(other.apr, apr) || other.apr == apr) &&
            (identical(other.nameId, nameId) || other.nameId == nameId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.poolType, poolType) ||
                other.poolType == poolType) &&
            const DeepCollectionEquality()
                .equals(other._stakeToken, _stakeToken) &&
            (identical(other.totalValueLocked, totalValueLocked) ||
                other.totalValueLocked == totalValueLocked) &&
            (identical(other.tvlToken, tvlToken) ||
                other.tvlToken == tvlToken) &&
            (identical(other.withdrawalSlippage, withdrawalSlippage) ||
                other.withdrawalSlippage == withdrawalSlippage) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.strategyType, strategyType) ||
                other.strategyType == strategyType) &&
            const DeepCollectionEquality()
                .equals(other._rewardToken, _rewardToken) &&
            (identical(other.positionToken, positionToken) ||
                other.positionToken == positionToken) &&
            const DeepCollectionEquality().equals(other._feeToken, _feeToken) &&
            (identical(other.depositFee, depositFee) ||
                other.depositFee == depositFee) &&
            (identical(other.risk, risk) || other.risk == risk) &&
            (identical(other.withdrawalFee, withdrawalFee) ||
                other.withdrawalFee == withdrawalFee) &&
            (identical(other.depositSwapFee, depositSwapFee) ||
                other.depositSwapFee == depositSwapFee) &&
            (identical(other.withdrawalSwapFee, withdrawalSwapFee) ||
                other.withdrawalSwapFee == withdrawalSwapFee) &&
            (identical(other.stakers, stakers) || other.stakers == stakers) &&
            (identical(other.liquidityType, liquidityType) ||
                other.liquidityType == liquidityType) &&
            const DeepCollectionEquality().equals(other._weight, _weight) &&
            (identical(other.aprAvg, aprAvg) || other.aprAvg == aprAvg) &&
            (identical(other.vibrantFee, vibrantFee) ||
                other.vibrantFee == vibrantFee) &&
            (identical(other.volume24h, volume24h) ||
                other.volume24h == volume24h) &&
            (identical(other.fee24h, fee24h) || other.fee24h == fee24h) &&
            (identical(other.inflow24h, inflow24h) ||
                other.inflow24h == inflow24h) &&
            (identical(other.minApr, minApr) || other.minApr == minApr) &&
            (identical(other.maxApr, maxApr) || other.maxApr == maxApr) &&
            (identical(other.maxLeverage, maxLeverage) ||
                other.maxLeverage == maxLeverage) &&
            (identical(other.borrowApr, borrowApr) ||
                other.borrowApr == borrowApr) &&
            (identical(other.airdropPoint, airdropPoint) ||
                other.airdropPoint == airdropPoint) &&
            const DeepCollectionEquality()
                .equals(other._inflowChartData, _inflowChartData) &&
            const DeepCollectionEquality()
                .equals(other._tvlAprChartData, _tvlAprChartData) &&
            (identical(other.ariesDetail, ariesDetail) ||
                other.ariesDetail == ariesDetail) &&
            (identical(other.echelonDetail, echelonDetail) ||
                other.echelonDetail == echelonDetail) &&
            (identical(other.leverageResponseDto, leverageResponseDto) ||
                other.leverageResponseDto == leverageResponseDto) &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        isEnabled,
        const DeepCollectionEquality().hash(_poolProtocols),
        apr,
        nameId,
        description,
        pid,
        poolType,
        const DeepCollectionEquality().hash(_stakeToken),
        totalValueLocked,
        tvlToken,
        withdrawalSlippage,
        name,
        displayName,
        strategyType,
        const DeepCollectionEquality().hash(_rewardToken),
        positionToken,
        const DeepCollectionEquality().hash(_feeToken),
        depositFee,
        risk,
        withdrawalFee,
        depositSwapFee,
        withdrawalSwapFee,
        stakers,
        liquidityType,
        const DeepCollectionEquality().hash(_weight),
        aprAvg,
        vibrantFee,
        volume24h,
        fee24h,
        inflow24h,
        minApr,
        maxApr,
        maxLeverage,
        borrowApr,
        airdropPoint,
        const DeepCollectionEquality().hash(_inflowChartData),
        const DeepCollectionEquality().hash(_tvlAprChartData),
        ariesDetail,
        echelonDetail,
        leverageResponseDto,
        payload
      ]);

  /// Create a copy of PoolDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoolDataResponseImplCopyWith<_$PoolDataResponseImpl> get copyWith =>
      __$$PoolDataResponseImplCopyWithImpl<_$PoolDataResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoolDataResponseImplToJson(
      this,
    );
  }
}

abstract class _PoolDataResponse implements PoolDataResponse {
  factory _PoolDataResponse(
      {required final String id,
      required final bool isEnabled,
      @JsonKey(fromJson: parseProtocols)
      required final List<String> poolProtocols,
      required final String apr,
      required final String nameId,
      required final String description,
      required final String pid,
      required final String poolType,
      @JsonKey(fromJson: parseStakeToken)
      required final List<String> stakeToken,
      required final String totalValueLocked,
      required final String tvlToken,
      required final String withdrawalSlippage,
      required final String name,
      required final String displayName,
      required final String strategyType,
      @JsonKey(fromJson: parseRewardToken)
      required final List<String> rewardToken,
      required final String positionToken,
      @JsonKey(fromJson: parseFeeToken) required final List<String> feeToken,
      required final String depositFee,
      required final String risk,
      required final String withdrawalFee,
      required final String depositSwapFee,
      required final String withdrawalSwapFee,
      required final String stakers,
      required final String liquidityType,
      @JsonKey(fromJson: parseWeight) required final List<String> weight,
      required final String aprAvg,
      required final String vibrantFee,
      required final String volume24h,
      required final String fee24h,
      required final String inflow24h,
      required final String minApr,
      required final String maxApr,
      required final String maxLeverage,
      required final String borrowApr,
      required final String airdropPoint,
      @JsonKey(fromJson: parsePoolInflowChartData)
      required final List<PoolInflowChartDataResponse> inflowChartData,
      @JsonKey(fromJson: parseTvlAprChartData)
      required final List<PoolTvlAprChartData> tvlAprChartData,
      final String? ariesDetail,
      final String? echelonDetail,
      final String? leverageResponseDto,
      required final PoolPayloadData payload}) = _$PoolDataResponseImpl;

  factory _PoolDataResponse.fromJson(Map<String, dynamic> json) =
      _$PoolDataResponseImpl.fromJson;

  @override
  String get id;
  @override
  bool get isEnabled;
  @override
  @JsonKey(fromJson: parseProtocols)
  List<String> get poolProtocols;
  @override
  String get apr;
  @override
  String get nameId;
  @override
  String get description;
  @override
  String get pid;
  @override
  String get poolType;
  @override
  @JsonKey(fromJson: parseStakeToken)
  List<String> get stakeToken;
  @override
  String get totalValueLocked;
  @override
  String get tvlToken;
  @override
  String get withdrawalSlippage;
  @override
  String get name;
  @override
  String get displayName;
  @override
  String get strategyType;
  @override
  @JsonKey(fromJson: parseRewardToken)
  List<String> get rewardToken;
  @override
  String get positionToken;
  @override
  @JsonKey(fromJson: parseFeeToken)
  List<String> get feeToken;
  @override
  String get depositFee;
  @override
  String get risk;
  @override
  String get withdrawalFee;
  @override
  String get depositSwapFee;
  @override
  String get withdrawalSwapFee;
  @override
  String get stakers;
  @override
  String get liquidityType;
  @override
  @JsonKey(fromJson: parseWeight)
  List<String> get weight;
  @override
  String get aprAvg;
  @override
  String get vibrantFee;
  @override
  String get volume24h;
  @override
  String get fee24h;
  @override
  String get inflow24h;
  @override
  String get minApr;
  @override
  String get maxApr;
  @override
  String get maxLeverage;
  @override
  String get borrowApr;
  @override
  String get airdropPoint;
  @override
  @JsonKey(fromJson: parsePoolInflowChartData)
  List<PoolInflowChartDataResponse> get inflowChartData;
  @override
  @JsonKey(fromJson: parseTvlAprChartData)
  List<PoolTvlAprChartData> get tvlAprChartData;
  @override
  String? get ariesDetail;
  @override
  String? get echelonDetail;
  @override
  String? get leverageResponseDto;
  @override
  PoolPayloadData get payload;

  /// Create a copy of PoolDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoolDataResponseImplCopyWith<_$PoolDataResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
