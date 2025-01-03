// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../lend_pool_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LendPoolEntity {
  String? get id => throw _privateConstructorUsedError;
  String? get marketCoin => throw _privateConstructorUsedError;
  double? get borrowApr => throw _privateConstructorUsedError;
  double? get supplyApr => throw _privateConstructorUsedError;
  String? get assetMantissa => throw _privateConstructorUsedError;
  String? get assetName => throw _privateConstructorUsedError;
  String? get assetType => throw _privateConstructorUsedError;
  String? get borrowCap => throw _privateConstructorUsedError;
  String? get collateralFactorBps => throw _privateConstructorUsedError;
  int? get efficiencyModeId => throw _privateConstructorUsedError;
  String? get initialLiquidity => throw _privateConstructorUsedError;
  bool? get paused => throw _privateConstructorUsedError;
  String? get supplyCap => throw _privateConstructorUsedError;
  String? get totalCash => throw _privateConstructorUsedError;
  String? get totalLiability => throw _privateConstructorUsedError;
  String? get totalReserve => throw _privateConstructorUsedError;
  String? get totalShares => throw _privateConstructorUsedError;
  ExtendRefEntity? get extendRef => throw _privateConstructorUsedError;
  InterestRateIndexEntity? get interestRateIndex =>
      throw _privateConstructorUsedError;

  /// Create a copy of LendPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LendPoolEntityCopyWith<LendPoolEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LendPoolEntityCopyWith<$Res> {
  factory $LendPoolEntityCopyWith(
          LendPoolEntity value, $Res Function(LendPoolEntity) then) =
      _$LendPoolEntityCopyWithImpl<$Res, LendPoolEntity>;
  @useResult
  $Res call(
      {String? id,
      String? marketCoin,
      double? borrowApr,
      double? supplyApr,
      String? assetMantissa,
      String? assetName,
      String? assetType,
      String? borrowCap,
      String? collateralFactorBps,
      int? efficiencyModeId,
      String? initialLiquidity,
      bool? paused,
      String? supplyCap,
      String? totalCash,
      String? totalLiability,
      String? totalReserve,
      String? totalShares,
      ExtendRefEntity? extendRef,
      InterestRateIndexEntity? interestRateIndex});

  $ExtendRefEntityCopyWith<$Res>? get extendRef;
  $InterestRateIndexEntityCopyWith<$Res>? get interestRateIndex;
}

/// @nodoc
class _$LendPoolEntityCopyWithImpl<$Res, $Val extends LendPoolEntity>
    implements $LendPoolEntityCopyWith<$Res> {
  _$LendPoolEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LendPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? marketCoin = freezed,
    Object? borrowApr = freezed,
    Object? supplyApr = freezed,
    Object? assetMantissa = freezed,
    Object? assetName = freezed,
    Object? assetType = freezed,
    Object? borrowCap = freezed,
    Object? collateralFactorBps = freezed,
    Object? efficiencyModeId = freezed,
    Object? initialLiquidity = freezed,
    Object? paused = freezed,
    Object? supplyCap = freezed,
    Object? totalCash = freezed,
    Object? totalLiability = freezed,
    Object? totalReserve = freezed,
    Object? totalShares = freezed,
    Object? extendRef = freezed,
    Object? interestRateIndex = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      marketCoin: freezed == marketCoin
          ? _value.marketCoin
          : marketCoin // ignore: cast_nullable_to_non_nullable
              as String?,
      borrowApr: freezed == borrowApr
          ? _value.borrowApr
          : borrowApr // ignore: cast_nullable_to_non_nullable
              as double?,
      supplyApr: freezed == supplyApr
          ? _value.supplyApr
          : supplyApr // ignore: cast_nullable_to_non_nullable
              as double?,
      assetMantissa: freezed == assetMantissa
          ? _value.assetMantissa
          : assetMantissa // ignore: cast_nullable_to_non_nullable
              as String?,
      assetName: freezed == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String?,
      assetType: freezed == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String?,
      borrowCap: freezed == borrowCap
          ? _value.borrowCap
          : borrowCap // ignore: cast_nullable_to_non_nullable
              as String?,
      collateralFactorBps: freezed == collateralFactorBps
          ? _value.collateralFactorBps
          : collateralFactorBps // ignore: cast_nullable_to_non_nullable
              as String?,
      efficiencyModeId: freezed == efficiencyModeId
          ? _value.efficiencyModeId
          : efficiencyModeId // ignore: cast_nullable_to_non_nullable
              as int?,
      initialLiquidity: freezed == initialLiquidity
          ? _value.initialLiquidity
          : initialLiquidity // ignore: cast_nullable_to_non_nullable
              as String?,
      paused: freezed == paused
          ? _value.paused
          : paused // ignore: cast_nullable_to_non_nullable
              as bool?,
      supplyCap: freezed == supplyCap
          ? _value.supplyCap
          : supplyCap // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCash: freezed == totalCash
          ? _value.totalCash
          : totalCash // ignore: cast_nullable_to_non_nullable
              as String?,
      totalLiability: freezed == totalLiability
          ? _value.totalLiability
          : totalLiability // ignore: cast_nullable_to_non_nullable
              as String?,
      totalReserve: freezed == totalReserve
          ? _value.totalReserve
          : totalReserve // ignore: cast_nullable_to_non_nullable
              as String?,
      totalShares: freezed == totalShares
          ? _value.totalShares
          : totalShares // ignore: cast_nullable_to_non_nullable
              as String?,
      extendRef: freezed == extendRef
          ? _value.extendRef
          : extendRef // ignore: cast_nullable_to_non_nullable
              as ExtendRefEntity?,
      interestRateIndex: freezed == interestRateIndex
          ? _value.interestRateIndex
          : interestRateIndex // ignore: cast_nullable_to_non_nullable
              as InterestRateIndexEntity?,
    ) as $Val);
  }

  /// Create a copy of LendPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExtendRefEntityCopyWith<$Res>? get extendRef {
    if (_value.extendRef == null) {
      return null;
    }

    return $ExtendRefEntityCopyWith<$Res>(_value.extendRef!, (value) {
      return _then(_value.copyWith(extendRef: value) as $Val);
    });
  }

  /// Create a copy of LendPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InterestRateIndexEntityCopyWith<$Res>? get interestRateIndex {
    if (_value.interestRateIndex == null) {
      return null;
    }

    return $InterestRateIndexEntityCopyWith<$Res>(_value.interestRateIndex!,
        (value) {
      return _then(_value.copyWith(interestRateIndex: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LendPoolEntityImplCopyWith<$Res>
    implements $LendPoolEntityCopyWith<$Res> {
  factory _$$LendPoolEntityImplCopyWith(_$LendPoolEntityImpl value,
          $Res Function(_$LendPoolEntityImpl) then) =
      __$$LendPoolEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? marketCoin,
      double? borrowApr,
      double? supplyApr,
      String? assetMantissa,
      String? assetName,
      String? assetType,
      String? borrowCap,
      String? collateralFactorBps,
      int? efficiencyModeId,
      String? initialLiquidity,
      bool? paused,
      String? supplyCap,
      String? totalCash,
      String? totalLiability,
      String? totalReserve,
      String? totalShares,
      ExtendRefEntity? extendRef,
      InterestRateIndexEntity? interestRateIndex});

  @override
  $ExtendRefEntityCopyWith<$Res>? get extendRef;
  @override
  $InterestRateIndexEntityCopyWith<$Res>? get interestRateIndex;
}

/// @nodoc
class __$$LendPoolEntityImplCopyWithImpl<$Res>
    extends _$LendPoolEntityCopyWithImpl<$Res, _$LendPoolEntityImpl>
    implements _$$LendPoolEntityImplCopyWith<$Res> {
  __$$LendPoolEntityImplCopyWithImpl(
      _$LendPoolEntityImpl _value, $Res Function(_$LendPoolEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LendPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? marketCoin = freezed,
    Object? borrowApr = freezed,
    Object? supplyApr = freezed,
    Object? assetMantissa = freezed,
    Object? assetName = freezed,
    Object? assetType = freezed,
    Object? borrowCap = freezed,
    Object? collateralFactorBps = freezed,
    Object? efficiencyModeId = freezed,
    Object? initialLiquidity = freezed,
    Object? paused = freezed,
    Object? supplyCap = freezed,
    Object? totalCash = freezed,
    Object? totalLiability = freezed,
    Object? totalReserve = freezed,
    Object? totalShares = freezed,
    Object? extendRef = freezed,
    Object? interestRateIndex = freezed,
  }) {
    return _then(_$LendPoolEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      marketCoin: freezed == marketCoin
          ? _value.marketCoin
          : marketCoin // ignore: cast_nullable_to_non_nullable
              as String?,
      borrowApr: freezed == borrowApr
          ? _value.borrowApr
          : borrowApr // ignore: cast_nullable_to_non_nullable
              as double?,
      supplyApr: freezed == supplyApr
          ? _value.supplyApr
          : supplyApr // ignore: cast_nullable_to_non_nullable
              as double?,
      assetMantissa: freezed == assetMantissa
          ? _value.assetMantissa
          : assetMantissa // ignore: cast_nullable_to_non_nullable
              as String?,
      assetName: freezed == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String?,
      assetType: freezed == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String?,
      borrowCap: freezed == borrowCap
          ? _value.borrowCap
          : borrowCap // ignore: cast_nullable_to_non_nullable
              as String?,
      collateralFactorBps: freezed == collateralFactorBps
          ? _value.collateralFactorBps
          : collateralFactorBps // ignore: cast_nullable_to_non_nullable
              as String?,
      efficiencyModeId: freezed == efficiencyModeId
          ? _value.efficiencyModeId
          : efficiencyModeId // ignore: cast_nullable_to_non_nullable
              as int?,
      initialLiquidity: freezed == initialLiquidity
          ? _value.initialLiquidity
          : initialLiquidity // ignore: cast_nullable_to_non_nullable
              as String?,
      paused: freezed == paused
          ? _value.paused
          : paused // ignore: cast_nullable_to_non_nullable
              as bool?,
      supplyCap: freezed == supplyCap
          ? _value.supplyCap
          : supplyCap // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCash: freezed == totalCash
          ? _value.totalCash
          : totalCash // ignore: cast_nullable_to_non_nullable
              as String?,
      totalLiability: freezed == totalLiability
          ? _value.totalLiability
          : totalLiability // ignore: cast_nullable_to_non_nullable
              as String?,
      totalReserve: freezed == totalReserve
          ? _value.totalReserve
          : totalReserve // ignore: cast_nullable_to_non_nullable
              as String?,
      totalShares: freezed == totalShares
          ? _value.totalShares
          : totalShares // ignore: cast_nullable_to_non_nullable
              as String?,
      extendRef: freezed == extendRef
          ? _value.extendRef
          : extendRef // ignore: cast_nullable_to_non_nullable
              as ExtendRefEntity?,
      interestRateIndex: freezed == interestRateIndex
          ? _value.interestRateIndex
          : interestRateIndex // ignore: cast_nullable_to_non_nullable
              as InterestRateIndexEntity?,
    ));
  }
}

/// @nodoc

class _$LendPoolEntityImpl implements _LendPoolEntity {
  const _$LendPoolEntityImpl(
      {this.id,
      this.marketCoin,
      this.borrowApr,
      this.supplyApr,
      this.assetMantissa,
      this.assetName,
      this.assetType,
      this.borrowCap,
      this.collateralFactorBps,
      this.efficiencyModeId,
      this.initialLiquidity,
      this.paused,
      this.supplyCap,
      this.totalCash,
      this.totalLiability,
      this.totalReserve,
      this.totalShares,
      this.extendRef,
      this.interestRateIndex});

  @override
  final String? id;
  @override
  final String? marketCoin;
  @override
  final double? borrowApr;
  @override
  final double? supplyApr;
  @override
  final String? assetMantissa;
  @override
  final String? assetName;
  @override
  final String? assetType;
  @override
  final String? borrowCap;
  @override
  final String? collateralFactorBps;
  @override
  final int? efficiencyModeId;
  @override
  final String? initialLiquidity;
  @override
  final bool? paused;
  @override
  final String? supplyCap;
  @override
  final String? totalCash;
  @override
  final String? totalLiability;
  @override
  final String? totalReserve;
  @override
  final String? totalShares;
  @override
  final ExtendRefEntity? extendRef;
  @override
  final InterestRateIndexEntity? interestRateIndex;

  @override
  String toString() {
    return 'LendPoolEntity(id: $id, marketCoin: $marketCoin, borrowApr: $borrowApr, supplyApr: $supplyApr, assetMantissa: $assetMantissa, assetName: $assetName, assetType: $assetType, borrowCap: $borrowCap, collateralFactorBps: $collateralFactorBps, efficiencyModeId: $efficiencyModeId, initialLiquidity: $initialLiquidity, paused: $paused, supplyCap: $supplyCap, totalCash: $totalCash, totalLiability: $totalLiability, totalReserve: $totalReserve, totalShares: $totalShares, extendRef: $extendRef, interestRateIndex: $interestRateIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LendPoolEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.marketCoin, marketCoin) ||
                other.marketCoin == marketCoin) &&
            (identical(other.borrowApr, borrowApr) ||
                other.borrowApr == borrowApr) &&
            (identical(other.supplyApr, supplyApr) ||
                other.supplyApr == supplyApr) &&
            (identical(other.assetMantissa, assetMantissa) ||
                other.assetMantissa == assetMantissa) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.borrowCap, borrowCap) ||
                other.borrowCap == borrowCap) &&
            (identical(other.collateralFactorBps, collateralFactorBps) ||
                other.collateralFactorBps == collateralFactorBps) &&
            (identical(other.efficiencyModeId, efficiencyModeId) ||
                other.efficiencyModeId == efficiencyModeId) &&
            (identical(other.initialLiquidity, initialLiquidity) ||
                other.initialLiquidity == initialLiquidity) &&
            (identical(other.paused, paused) || other.paused == paused) &&
            (identical(other.supplyCap, supplyCap) ||
                other.supplyCap == supplyCap) &&
            (identical(other.totalCash, totalCash) ||
                other.totalCash == totalCash) &&
            (identical(other.totalLiability, totalLiability) ||
                other.totalLiability == totalLiability) &&
            (identical(other.totalReserve, totalReserve) ||
                other.totalReserve == totalReserve) &&
            (identical(other.totalShares, totalShares) ||
                other.totalShares == totalShares) &&
            (identical(other.extendRef, extendRef) ||
                other.extendRef == extendRef) &&
            (identical(other.interestRateIndex, interestRateIndex) ||
                other.interestRateIndex == interestRateIndex));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        marketCoin,
        borrowApr,
        supplyApr,
        assetMantissa,
        assetName,
        assetType,
        borrowCap,
        collateralFactorBps,
        efficiencyModeId,
        initialLiquidity,
        paused,
        supplyCap,
        totalCash,
        totalLiability,
        totalReserve,
        totalShares,
        extendRef,
        interestRateIndex
      ]);

  /// Create a copy of LendPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LendPoolEntityImplCopyWith<_$LendPoolEntityImpl> get copyWith =>
      __$$LendPoolEntityImplCopyWithImpl<_$LendPoolEntityImpl>(
          this, _$identity);
}

abstract class _LendPoolEntity implements LendPoolEntity {
  const factory _LendPoolEntity(
      {final String? id,
      final String? marketCoin,
      final double? borrowApr,
      final double? supplyApr,
      final String? assetMantissa,
      final String? assetName,
      final String? assetType,
      final String? borrowCap,
      final String? collateralFactorBps,
      final int? efficiencyModeId,
      final String? initialLiquidity,
      final bool? paused,
      final String? supplyCap,
      final String? totalCash,
      final String? totalLiability,
      final String? totalReserve,
      final String? totalShares,
      final ExtendRefEntity? extendRef,
      final InterestRateIndexEntity? interestRateIndex}) = _$LendPoolEntityImpl;

  @override
  String? get id;
  @override
  String? get marketCoin;
  @override
  double? get borrowApr;
  @override
  double? get supplyApr;
  @override
  String? get assetMantissa;
  @override
  String? get assetName;
  @override
  String? get assetType;
  @override
  String? get borrowCap;
  @override
  String? get collateralFactorBps;
  @override
  int? get efficiencyModeId;
  @override
  String? get initialLiquidity;
  @override
  bool? get paused;
  @override
  String? get supplyCap;
  @override
  String? get totalCash;
  @override
  String? get totalLiability;
  @override
  String? get totalReserve;
  @override
  String? get totalShares;
  @override
  ExtendRefEntity? get extendRef;
  @override
  InterestRateIndexEntity? get interestRateIndex;

  /// Create a copy of LendPoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LendPoolEntityImplCopyWith<_$LendPoolEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExtendRefEntity {
  String? get self => throw _privateConstructorUsedError;

  /// Create a copy of ExtendRefEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtendRefEntityCopyWith<ExtendRefEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtendRefEntityCopyWith<$Res> {
  factory $ExtendRefEntityCopyWith(
          ExtendRefEntity value, $Res Function(ExtendRefEntity) then) =
      _$ExtendRefEntityCopyWithImpl<$Res, ExtendRefEntity>;
  @useResult
  $Res call({String? self});
}

/// @nodoc
class _$ExtendRefEntityCopyWithImpl<$Res, $Val extends ExtendRefEntity>
    implements $ExtendRefEntityCopyWith<$Res> {
  _$ExtendRefEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtendRefEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? self = freezed,
  }) {
    return _then(_value.copyWith(
      self: freezed == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExtendRefEntityImplCopyWith<$Res>
    implements $ExtendRefEntityCopyWith<$Res> {
  factory _$$ExtendRefEntityImplCopyWith(_$ExtendRefEntityImpl value,
          $Res Function(_$ExtendRefEntityImpl) then) =
      __$$ExtendRefEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? self});
}

/// @nodoc
class __$$ExtendRefEntityImplCopyWithImpl<$Res>
    extends _$ExtendRefEntityCopyWithImpl<$Res, _$ExtendRefEntityImpl>
    implements _$$ExtendRefEntityImplCopyWith<$Res> {
  __$$ExtendRefEntityImplCopyWithImpl(
      _$ExtendRefEntityImpl _value, $Res Function(_$ExtendRefEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtendRefEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? self = freezed,
  }) {
    return _then(_$ExtendRefEntityImpl(
      self: freezed == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ExtendRefEntityImpl implements _ExtendRefEntity {
  const _$ExtendRefEntityImpl({this.self});

  @override
  final String? self;

  @override
  String toString() {
    return 'ExtendRefEntity(self: $self)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtendRefEntityImpl &&
            (identical(other.self, self) || other.self == self));
  }

  @override
  int get hashCode => Object.hash(runtimeType, self);

  /// Create a copy of ExtendRefEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtendRefEntityImplCopyWith<_$ExtendRefEntityImpl> get copyWith =>
      __$$ExtendRefEntityImplCopyWithImpl<_$ExtendRefEntityImpl>(
          this, _$identity);
}

abstract class _ExtendRefEntity implements ExtendRefEntity {
  const factory _ExtendRefEntity({final String? self}) = _$ExtendRefEntityImpl;

  @override
  String? get self;

  /// Create a copy of ExtendRefEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtendRefEntityImplCopyWith<_$ExtendRefEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InterestRateIndexEntity {
  String? get v => throw _privateConstructorUsedError;

  /// Create a copy of InterestRateIndexEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterestRateIndexEntityCopyWith<InterestRateIndexEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterestRateIndexEntityCopyWith<$Res> {
  factory $InterestRateIndexEntityCopyWith(InterestRateIndexEntity value,
          $Res Function(InterestRateIndexEntity) then) =
      _$InterestRateIndexEntityCopyWithImpl<$Res, InterestRateIndexEntity>;
  @useResult
  $Res call({String? v});
}

/// @nodoc
class _$InterestRateIndexEntityCopyWithImpl<$Res,
        $Val extends InterestRateIndexEntity>
    implements $InterestRateIndexEntityCopyWith<$Res> {
  _$InterestRateIndexEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InterestRateIndexEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = freezed,
  }) {
    return _then(_value.copyWith(
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterestRateIndexEntityImplCopyWith<$Res>
    implements $InterestRateIndexEntityCopyWith<$Res> {
  factory _$$InterestRateIndexEntityImplCopyWith(
          _$InterestRateIndexEntityImpl value,
          $Res Function(_$InterestRateIndexEntityImpl) then) =
      __$$InterestRateIndexEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? v});
}

/// @nodoc
class __$$InterestRateIndexEntityImplCopyWithImpl<$Res>
    extends _$InterestRateIndexEntityCopyWithImpl<$Res,
        _$InterestRateIndexEntityImpl>
    implements _$$InterestRateIndexEntityImplCopyWith<$Res> {
  __$$InterestRateIndexEntityImplCopyWithImpl(
      _$InterestRateIndexEntityImpl _value,
      $Res Function(_$InterestRateIndexEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of InterestRateIndexEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = freezed,
  }) {
    return _then(_$InterestRateIndexEntityImpl(
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InterestRateIndexEntityImpl implements _InterestRateIndexEntity {
  const _$InterestRateIndexEntityImpl({this.v});

  @override
  final String? v;

  @override
  String toString() {
    return 'InterestRateIndexEntity(v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterestRateIndexEntityImpl &&
            (identical(other.v, v) || other.v == v));
  }

  @override
  int get hashCode => Object.hash(runtimeType, v);

  /// Create a copy of InterestRateIndexEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterestRateIndexEntityImplCopyWith<_$InterestRateIndexEntityImpl>
      get copyWith => __$$InterestRateIndexEntityImplCopyWithImpl<
          _$InterestRateIndexEntityImpl>(this, _$identity);
}

abstract class _InterestRateIndexEntity implements InterestRateIndexEntity {
  const factory _InterestRateIndexEntity({final String? v}) =
      _$InterestRateIndexEntityImpl;

  @override
  String? get v;

  /// Create a copy of InterestRateIndexEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterestRateIndexEntityImplCopyWith<_$InterestRateIndexEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
