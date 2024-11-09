// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../pool_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoolResponse _$PoolResponseFromJson(Map<String, dynamic> json) {
  return _PoolResponse.fromJson(json);
}

/// @nodoc
mixin _$PoolResponse {
  String get id => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  List<String> get protocols => throw _privateConstructorUsedError;
  String get apr => throw _privateConstructorUsedError;
  String get nameId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
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
  List<String> get weight => throw _privateConstructorUsedError;
  String get aprAvg => throw _privateConstructorUsedError;
  String get volume24h => throw _privateConstructorUsedError;
  String get fee24h => throw _privateConstructorUsedError;

  /// Serializes this PoolResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoolResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoolResponseCopyWith<PoolResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoolResponseCopyWith<$Res> {
  factory $PoolResponseCopyWith(
          PoolResponse value, $Res Function(PoolResponse) then) =
      _$PoolResponseCopyWithImpl<$Res, PoolResponse>;
  @useResult
  $Res call(
      {String id,
      bool isEnabled,
      List<String> protocols,
      String apr,
      String nameId,
      String description,
      List<String> stakeToken,
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
      List<String> weight,
      String aprAvg,
      String volume24h,
      String fee24h});
}

/// @nodoc
class _$PoolResponseCopyWithImpl<$Res, $Val extends PoolResponse>
    implements $PoolResponseCopyWith<$Res> {
  _$PoolResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoolResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isEnabled = null,
    Object? protocols = null,
    Object? apr = null,
    Object? nameId = null,
    Object? description = null,
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
    Object? volume24h = null,
    Object? fee24h = null,
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
      protocols: null == protocols
          ? _value.protocols
          : protocols // ignore: cast_nullable_to_non_nullable
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
      volume24h: null == volume24h
          ? _value.volume24h
          : volume24h // ignore: cast_nullable_to_non_nullable
              as String,
      fee24h: null == fee24h
          ? _value.fee24h
          : fee24h // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoolResponseImplCopyWith<$Res>
    implements $PoolResponseCopyWith<$Res> {
  factory _$$PoolResponseImplCopyWith(
          _$PoolResponseImpl value, $Res Function(_$PoolResponseImpl) then) =
      __$$PoolResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isEnabled,
      List<String> protocols,
      String apr,
      String nameId,
      String description,
      List<String> stakeToken,
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
      List<String> weight,
      String aprAvg,
      String volume24h,
      String fee24h});
}

/// @nodoc
class __$$PoolResponseImplCopyWithImpl<$Res>
    extends _$PoolResponseCopyWithImpl<$Res, _$PoolResponseImpl>
    implements _$$PoolResponseImplCopyWith<$Res> {
  __$$PoolResponseImplCopyWithImpl(
      _$PoolResponseImpl _value, $Res Function(_$PoolResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoolResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isEnabled = null,
    Object? protocols = null,
    Object? apr = null,
    Object? nameId = null,
    Object? description = null,
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
    Object? volume24h = null,
    Object? fee24h = null,
  }) {
    return _then(_$PoolResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      protocols: null == protocols
          ? _value._protocols
          : protocols // ignore: cast_nullable_to_non_nullable
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
      volume24h: null == volume24h
          ? _value.volume24h
          : volume24h // ignore: cast_nullable_to_non_nullable
              as String,
      fee24h: null == fee24h
          ? _value.fee24h
          : fee24h // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoolResponseImpl implements _PoolResponse {
  const _$PoolResponseImpl(
      {required this.id,
      required this.isEnabled,
      required final List<String> protocols,
      required this.apr,
      required this.nameId,
      required this.description,
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
      required final List<String> weight,
      required this.aprAvg,
      required this.volume24h,
      required this.fee24h})
      : _protocols = protocols,
        _stakeToken = stakeToken,
        _rewardToken = rewardToken,
        _feeToken = feeToken,
        _weight = weight;

  factory _$PoolResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoolResponseImplFromJson(json);

  @override
  final String id;
  @override
  final bool isEnabled;
  final List<String> _protocols;
  @override
  List<String> get protocols {
    if (_protocols is EqualUnmodifiableListView) return _protocols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_protocols);
  }

  @override
  final String apr;
  @override
  final String nameId;
  @override
  final String description;
  final List<String> _stakeToken;
  @override
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
  List<String> get weight {
    if (_weight is EqualUnmodifiableListView) return _weight;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weight);
  }

  @override
  final String aprAvg;
  @override
  final String volume24h;
  @override
  final String fee24h;

  @override
  String toString() {
    return 'PoolResponse(id: $id, isEnabled: $isEnabled, protocols: $protocols, apr: $apr, nameId: $nameId, description: $description, stakeToken: $stakeToken, totalValueLocked: $totalValueLocked, tvlToken: $tvlToken, withdrawalSlippage: $withdrawalSlippage, name: $name, displayName: $displayName, strategyType: $strategyType, rewardToken: $rewardToken, positionToken: $positionToken, feeToken: $feeToken, depositFee: $depositFee, risk: $risk, withdrawalFee: $withdrawalFee, depositSwapFee: $depositSwapFee, withdrawalSwapFee: $withdrawalSwapFee, stakers: $stakers, liquidityType: $liquidityType, weight: $weight, aprAvg: $aprAvg, volume24h: $volume24h, fee24h: $fee24h)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoolResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            const DeepCollectionEquality()
                .equals(other._protocols, _protocols) &&
            (identical(other.apr, apr) || other.apr == apr) &&
            (identical(other.nameId, nameId) || other.nameId == nameId) &&
            (identical(other.description, description) ||
                other.description == description) &&
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
            (identical(other.volume24h, volume24h) ||
                other.volume24h == volume24h) &&
            (identical(other.fee24h, fee24h) || other.fee24h == fee24h));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        isEnabled,
        const DeepCollectionEquality().hash(_protocols),
        apr,
        nameId,
        description,
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
        volume24h,
        fee24h
      ]);

  /// Create a copy of PoolResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoolResponseImplCopyWith<_$PoolResponseImpl> get copyWith =>
      __$$PoolResponseImplCopyWithImpl<_$PoolResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoolResponseImplToJson(
      this,
    );
  }
}

abstract class _PoolResponse implements PoolResponse {
  const factory _PoolResponse(
      {required final String id,
      required final bool isEnabled,
      required final List<String> protocols,
      required final String apr,
      required final String nameId,
      required final String description,
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
      required final List<String> weight,
      required final String aprAvg,
      required final String volume24h,
      required final String fee24h}) = _$PoolResponseImpl;

  factory _PoolResponse.fromJson(Map<String, dynamic> json) =
      _$PoolResponseImpl.fromJson;

  @override
  String get id;
  @override
  bool get isEnabled;
  @override
  List<String> get protocols;
  @override
  String get apr;
  @override
  String get nameId;
  @override
  String get description;
  @override
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
  List<String> get weight;
  @override
  String get aprAvg;
  @override
  String get volume24h;
  @override
  String get fee24h;

  /// Create a copy of PoolResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoolResponseImplCopyWith<_$PoolResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
