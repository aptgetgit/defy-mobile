// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../token_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenMetaDataEntity _$TokenMetaDataEntityFromJson(Map<String, dynamic> json) {
  return _TokenMetaDataEntity.fromJson(json);
}

/// @nodoc
mixin _$TokenMetaDataEntity {
  String? get coinId => throw _privateConstructorUsedError;
  String? get coinName => throw _privateConstructorUsedError;
  int? get coinDecimals => throw _privateConstructorUsedError;
  String? get coinDefyappSymbol => throw _privateConstructorUsedError;
  String? get coinDescription => throw _privateConstructorUsedError;
  String? get coinLogoUrl => throw _privateConstructorUsedError;
  CoinMetricEntity? get coinMetric => throw _privateConstructorUsedError;

  /// Serializes this TokenMetaDataEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenMetaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenMetaDataEntityCopyWith<TokenMetaDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenMetaDataEntityCopyWith<$Res> {
  factory $TokenMetaDataEntityCopyWith(
          TokenMetaDataEntity value, $Res Function(TokenMetaDataEntity) then) =
      _$TokenMetaDataEntityCopyWithImpl<$Res, TokenMetaDataEntity>;
  @useResult
  $Res call(
      {String? coinId,
      String? coinName,
      int? coinDecimals,
      String? coinDefyappSymbol,
      String? coinDescription,
      String? coinLogoUrl,
      CoinMetricEntity? coinMetric});

  $CoinMetricEntityCopyWith<$Res>? get coinMetric;
}

/// @nodoc
class _$TokenMetaDataEntityCopyWithImpl<$Res, $Val extends TokenMetaDataEntity>
    implements $TokenMetaDataEntityCopyWith<$Res> {
  _$TokenMetaDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenMetaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coinId = freezed,
    Object? coinName = freezed,
    Object? coinDecimals = freezed,
    Object? coinDefyappSymbol = freezed,
    Object? coinDescription = freezed,
    Object? coinLogoUrl = freezed,
    Object? coinMetric = freezed,
  }) {
    return _then(_value.copyWith(
      coinId: freezed == coinId
          ? _value.coinId
          : coinId // ignore: cast_nullable_to_non_nullable
              as String?,
      coinName: freezed == coinName
          ? _value.coinName
          : coinName // ignore: cast_nullable_to_non_nullable
              as String?,
      coinDecimals: freezed == coinDecimals
          ? _value.coinDecimals
          : coinDecimals // ignore: cast_nullable_to_non_nullable
              as int?,
      coinDefyappSymbol: freezed == coinDefyappSymbol
          ? _value.coinDefyappSymbol
          : coinDefyappSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      coinDescription: freezed == coinDescription
          ? _value.coinDescription
          : coinDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      coinLogoUrl: freezed == coinLogoUrl
          ? _value.coinLogoUrl
          : coinLogoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coinMetric: freezed == coinMetric
          ? _value.coinMetric
          : coinMetric // ignore: cast_nullable_to_non_nullable
              as CoinMetricEntity?,
    ) as $Val);
  }

  /// Create a copy of TokenMetaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoinMetricEntityCopyWith<$Res>? get coinMetric {
    if (_value.coinMetric == null) {
      return null;
    }

    return $CoinMetricEntityCopyWith<$Res>(_value.coinMetric!, (value) {
      return _then(_value.copyWith(coinMetric: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TokenMetaDataEntityImplCopyWith<$Res>
    implements $TokenMetaDataEntityCopyWith<$Res> {
  factory _$$TokenMetaDataEntityImplCopyWith(_$TokenMetaDataEntityImpl value,
          $Res Function(_$TokenMetaDataEntityImpl) then) =
      __$$TokenMetaDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? coinId,
      String? coinName,
      int? coinDecimals,
      String? coinDefyappSymbol,
      String? coinDescription,
      String? coinLogoUrl,
      CoinMetricEntity? coinMetric});

  @override
  $CoinMetricEntityCopyWith<$Res>? get coinMetric;
}

/// @nodoc
class __$$TokenMetaDataEntityImplCopyWithImpl<$Res>
    extends _$TokenMetaDataEntityCopyWithImpl<$Res, _$TokenMetaDataEntityImpl>
    implements _$$TokenMetaDataEntityImplCopyWith<$Res> {
  __$$TokenMetaDataEntityImplCopyWithImpl(_$TokenMetaDataEntityImpl _value,
      $Res Function(_$TokenMetaDataEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenMetaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coinId = freezed,
    Object? coinName = freezed,
    Object? coinDecimals = freezed,
    Object? coinDefyappSymbol = freezed,
    Object? coinDescription = freezed,
    Object? coinLogoUrl = freezed,
    Object? coinMetric = freezed,
  }) {
    return _then(_$TokenMetaDataEntityImpl(
      coinId: freezed == coinId
          ? _value.coinId
          : coinId // ignore: cast_nullable_to_non_nullable
              as String?,
      coinName: freezed == coinName
          ? _value.coinName
          : coinName // ignore: cast_nullable_to_non_nullable
              as String?,
      coinDecimals: freezed == coinDecimals
          ? _value.coinDecimals
          : coinDecimals // ignore: cast_nullable_to_non_nullable
              as int?,
      coinDefyappSymbol: freezed == coinDefyappSymbol
          ? _value.coinDefyappSymbol
          : coinDefyappSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      coinDescription: freezed == coinDescription
          ? _value.coinDescription
          : coinDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      coinLogoUrl: freezed == coinLogoUrl
          ? _value.coinLogoUrl
          : coinLogoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coinMetric: freezed == coinMetric
          ? _value.coinMetric
          : coinMetric // ignore: cast_nullable_to_non_nullable
              as CoinMetricEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenMetaDataEntityImpl extends _TokenMetaDataEntity {
  const _$TokenMetaDataEntityImpl(
      {required this.coinId,
      required this.coinName,
      required this.coinDecimals,
      required this.coinDefyappSymbol,
      required this.coinDescription,
      required this.coinLogoUrl,
      required this.coinMetric})
      : super._();

  factory _$TokenMetaDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenMetaDataEntityImplFromJson(json);

  @override
  final String? coinId;
  @override
  final String? coinName;
  @override
  final int? coinDecimals;
  @override
  final String? coinDefyappSymbol;
  @override
  final String? coinDescription;
  @override
  final String? coinLogoUrl;
  @override
  final CoinMetricEntity? coinMetric;

  @override
  String toString() {
    return 'TokenMetaDataEntity(coinId: $coinId, coinName: $coinName, coinDecimals: $coinDecimals, coinDefyappSymbol: $coinDefyappSymbol, coinDescription: $coinDescription, coinLogoUrl: $coinLogoUrl, coinMetric: $coinMetric)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenMetaDataEntityImpl &&
            (identical(other.coinId, coinId) || other.coinId == coinId) &&
            (identical(other.coinName, coinName) ||
                other.coinName == coinName) &&
            (identical(other.coinDecimals, coinDecimals) ||
                other.coinDecimals == coinDecimals) &&
            (identical(other.coinDefyappSymbol, coinDefyappSymbol) ||
                other.coinDefyappSymbol == coinDefyappSymbol) &&
            (identical(other.coinDescription, coinDescription) ||
                other.coinDescription == coinDescription) &&
            (identical(other.coinLogoUrl, coinLogoUrl) ||
                other.coinLogoUrl == coinLogoUrl) &&
            (identical(other.coinMetric, coinMetric) ||
                other.coinMetric == coinMetric));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, coinId, coinName, coinDecimals,
      coinDefyappSymbol, coinDescription, coinLogoUrl, coinMetric);

  /// Create a copy of TokenMetaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenMetaDataEntityImplCopyWith<_$TokenMetaDataEntityImpl> get copyWith =>
      __$$TokenMetaDataEntityImplCopyWithImpl<_$TokenMetaDataEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenMetaDataEntityImplToJson(
      this,
    );
  }
}

abstract class _TokenMetaDataEntity extends TokenMetaDataEntity {
  const factory _TokenMetaDataEntity(
      {required final String? coinId,
      required final String? coinName,
      required final int? coinDecimals,
      required final String? coinDefyappSymbol,
      required final String? coinDescription,
      required final String? coinLogoUrl,
      required final CoinMetricEntity? coinMetric}) = _$TokenMetaDataEntityImpl;
  const _TokenMetaDataEntity._() : super._();

  factory _TokenMetaDataEntity.fromJson(Map<String, dynamic> json) =
      _$TokenMetaDataEntityImpl.fromJson;

  @override
  String? get coinId;
  @override
  String? get coinName;
  @override
  int? get coinDecimals;
  @override
  String? get coinDefyappSymbol;
  @override
  String? get coinDescription;
  @override
  String? get coinLogoUrl;
  @override
  CoinMetricEntity? get coinMetric;

  /// Create a copy of TokenMetaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenMetaDataEntityImplCopyWith<_$TokenMetaDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CoinMetricEntity _$CoinMetricEntityFromJson(Map<String, dynamic> json) {
  return _CoinMetricEntity.fromJson(json);
}

/// @nodoc
mixin _$CoinMetricEntity {
  double? get priceChange1hr => throw _privateConstructorUsedError;
  double? get priceChange24hr => throw _privateConstructorUsedError;
  double? get priceChange30d => throw _privateConstructorUsedError;
  double? get priceChange5m => throw _privateConstructorUsedError;
  double? get priceChange6hr => throw _privateConstructorUsedError;
  double? get priceChange7d => throw _privateConstructorUsedError;
  double? get priceUsd => throw _privateConstructorUsedError;
  double? get volume24hr => throw _privateConstructorUsedError;
  double? get volume30d => throw _privateConstructorUsedError;
  double? get volume7d => throw _privateConstructorUsedError;
  double? get volumeChange24hr => throw _privateConstructorUsedError;
  int? get totalSupply => throw _privateConstructorUsedError;
  num? get marketCap => throw _privateConstructorUsedError;
  num? get selfReportedCirculatingSupply => throw _privateConstructorUsedError;
  num? get selfReportedMarketCap => throw _privateConstructorUsedError;
  num? get maxSupply => throw _privateConstructorUsedError;
  num? get fullyDilutedMarketCap => throw _privateConstructorUsedError;
  num? get tvl => throw _privateConstructorUsedError;
  num? get circulatingSupply => throw _privateConstructorUsedError;

  /// Serializes this CoinMetricEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoinMetricEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinMetricEntityCopyWith<CoinMetricEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinMetricEntityCopyWith<$Res> {
  factory $CoinMetricEntityCopyWith(
          CoinMetricEntity value, $Res Function(CoinMetricEntity) then) =
      _$CoinMetricEntityCopyWithImpl<$Res, CoinMetricEntity>;
  @useResult
  $Res call(
      {double? priceChange1hr,
      double? priceChange24hr,
      double? priceChange30d,
      double? priceChange5m,
      double? priceChange6hr,
      double? priceChange7d,
      double? priceUsd,
      double? volume24hr,
      double? volume30d,
      double? volume7d,
      double? volumeChange24hr,
      int? totalSupply,
      num? marketCap,
      num? selfReportedCirculatingSupply,
      num? selfReportedMarketCap,
      num? maxSupply,
      num? fullyDilutedMarketCap,
      num? tvl,
      num? circulatingSupply});
}

/// @nodoc
class _$CoinMetricEntityCopyWithImpl<$Res, $Val extends CoinMetricEntity>
    implements $CoinMetricEntityCopyWith<$Res> {
  _$CoinMetricEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinMetricEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceChange1hr = freezed,
    Object? priceChange24hr = freezed,
    Object? priceChange30d = freezed,
    Object? priceChange5m = freezed,
    Object? priceChange6hr = freezed,
    Object? priceChange7d = freezed,
    Object? priceUsd = freezed,
    Object? volume24hr = freezed,
    Object? volume30d = freezed,
    Object? volume7d = freezed,
    Object? volumeChange24hr = freezed,
    Object? totalSupply = freezed,
    Object? marketCap = freezed,
    Object? selfReportedCirculatingSupply = freezed,
    Object? selfReportedMarketCap = freezed,
    Object? maxSupply = freezed,
    Object? fullyDilutedMarketCap = freezed,
    Object? tvl = freezed,
    Object? circulatingSupply = freezed,
  }) {
    return _then(_value.copyWith(
      priceChange1hr: freezed == priceChange1hr
          ? _value.priceChange1hr
          : priceChange1hr // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange24hr: freezed == priceChange24hr
          ? _value.priceChange24hr
          : priceChange24hr // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange30d: freezed == priceChange30d
          ? _value.priceChange30d
          : priceChange30d // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange5m: freezed == priceChange5m
          ? _value.priceChange5m
          : priceChange5m // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange6hr: freezed == priceChange6hr
          ? _value.priceChange6hr
          : priceChange6hr // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange7d: freezed == priceChange7d
          ? _value.priceChange7d
          : priceChange7d // ignore: cast_nullable_to_non_nullable
              as double?,
      priceUsd: freezed == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as double?,
      volume24hr: freezed == volume24hr
          ? _value.volume24hr
          : volume24hr // ignore: cast_nullable_to_non_nullable
              as double?,
      volume30d: freezed == volume30d
          ? _value.volume30d
          : volume30d // ignore: cast_nullable_to_non_nullable
              as double?,
      volume7d: freezed == volume7d
          ? _value.volume7d
          : volume7d // ignore: cast_nullable_to_non_nullable
              as double?,
      volumeChange24hr: freezed == volumeChange24hr
          ? _value.volumeChange24hr
          : volumeChange24hr // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSupply: freezed == totalSupply
          ? _value.totalSupply
          : totalSupply // ignore: cast_nullable_to_non_nullable
              as int?,
      marketCap: freezed == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as num?,
      selfReportedCirculatingSupply: freezed == selfReportedCirculatingSupply
          ? _value.selfReportedCirculatingSupply
          : selfReportedCirculatingSupply // ignore: cast_nullable_to_non_nullable
              as num?,
      selfReportedMarketCap: freezed == selfReportedMarketCap
          ? _value.selfReportedMarketCap
          : selfReportedMarketCap // ignore: cast_nullable_to_non_nullable
              as num?,
      maxSupply: freezed == maxSupply
          ? _value.maxSupply
          : maxSupply // ignore: cast_nullable_to_non_nullable
              as num?,
      fullyDilutedMarketCap: freezed == fullyDilutedMarketCap
          ? _value.fullyDilutedMarketCap
          : fullyDilutedMarketCap // ignore: cast_nullable_to_non_nullable
              as num?,
      tvl: freezed == tvl
          ? _value.tvl
          : tvl // ignore: cast_nullable_to_non_nullable
              as num?,
      circulatingSupply: freezed == circulatingSupply
          ? _value.circulatingSupply
          : circulatingSupply // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinMetricEntityImplCopyWith<$Res>
    implements $CoinMetricEntityCopyWith<$Res> {
  factory _$$CoinMetricEntityImplCopyWith(_$CoinMetricEntityImpl value,
          $Res Function(_$CoinMetricEntityImpl) then) =
      __$$CoinMetricEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? priceChange1hr,
      double? priceChange24hr,
      double? priceChange30d,
      double? priceChange5m,
      double? priceChange6hr,
      double? priceChange7d,
      double? priceUsd,
      double? volume24hr,
      double? volume30d,
      double? volume7d,
      double? volumeChange24hr,
      int? totalSupply,
      num? marketCap,
      num? selfReportedCirculatingSupply,
      num? selfReportedMarketCap,
      num? maxSupply,
      num? fullyDilutedMarketCap,
      num? tvl,
      num? circulatingSupply});
}

/// @nodoc
class __$$CoinMetricEntityImplCopyWithImpl<$Res>
    extends _$CoinMetricEntityCopyWithImpl<$Res, _$CoinMetricEntityImpl>
    implements _$$CoinMetricEntityImplCopyWith<$Res> {
  __$$CoinMetricEntityImplCopyWithImpl(_$CoinMetricEntityImpl _value,
      $Res Function(_$CoinMetricEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoinMetricEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceChange1hr = freezed,
    Object? priceChange24hr = freezed,
    Object? priceChange30d = freezed,
    Object? priceChange5m = freezed,
    Object? priceChange6hr = freezed,
    Object? priceChange7d = freezed,
    Object? priceUsd = freezed,
    Object? volume24hr = freezed,
    Object? volume30d = freezed,
    Object? volume7d = freezed,
    Object? volumeChange24hr = freezed,
    Object? totalSupply = freezed,
    Object? marketCap = freezed,
    Object? selfReportedCirculatingSupply = freezed,
    Object? selfReportedMarketCap = freezed,
    Object? maxSupply = freezed,
    Object? fullyDilutedMarketCap = freezed,
    Object? tvl = freezed,
    Object? circulatingSupply = freezed,
  }) {
    return _then(_$CoinMetricEntityImpl(
      priceChange1hr: freezed == priceChange1hr
          ? _value.priceChange1hr
          : priceChange1hr // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange24hr: freezed == priceChange24hr
          ? _value.priceChange24hr
          : priceChange24hr // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange30d: freezed == priceChange30d
          ? _value.priceChange30d
          : priceChange30d // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange5m: freezed == priceChange5m
          ? _value.priceChange5m
          : priceChange5m // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange6hr: freezed == priceChange6hr
          ? _value.priceChange6hr
          : priceChange6hr // ignore: cast_nullable_to_non_nullable
              as double?,
      priceChange7d: freezed == priceChange7d
          ? _value.priceChange7d
          : priceChange7d // ignore: cast_nullable_to_non_nullable
              as double?,
      priceUsd: freezed == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as double?,
      volume24hr: freezed == volume24hr
          ? _value.volume24hr
          : volume24hr // ignore: cast_nullable_to_non_nullable
              as double?,
      volume30d: freezed == volume30d
          ? _value.volume30d
          : volume30d // ignore: cast_nullable_to_non_nullable
              as double?,
      volume7d: freezed == volume7d
          ? _value.volume7d
          : volume7d // ignore: cast_nullable_to_non_nullable
              as double?,
      volumeChange24hr: freezed == volumeChange24hr
          ? _value.volumeChange24hr
          : volumeChange24hr // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSupply: freezed == totalSupply
          ? _value.totalSupply
          : totalSupply // ignore: cast_nullable_to_non_nullable
              as int?,
      marketCap: freezed == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as num?,
      selfReportedCirculatingSupply: freezed == selfReportedCirculatingSupply
          ? _value.selfReportedCirculatingSupply
          : selfReportedCirculatingSupply // ignore: cast_nullable_to_non_nullable
              as num?,
      selfReportedMarketCap: freezed == selfReportedMarketCap
          ? _value.selfReportedMarketCap
          : selfReportedMarketCap // ignore: cast_nullable_to_non_nullable
              as num?,
      maxSupply: freezed == maxSupply
          ? _value.maxSupply
          : maxSupply // ignore: cast_nullable_to_non_nullable
              as num?,
      fullyDilutedMarketCap: freezed == fullyDilutedMarketCap
          ? _value.fullyDilutedMarketCap
          : fullyDilutedMarketCap // ignore: cast_nullable_to_non_nullable
              as num?,
      tvl: freezed == tvl
          ? _value.tvl
          : tvl // ignore: cast_nullable_to_non_nullable
              as num?,
      circulatingSupply: freezed == circulatingSupply
          ? _value.circulatingSupply
          : circulatingSupply // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinMetricEntityImpl extends _CoinMetricEntity {
  const _$CoinMetricEntityImpl(
      {required this.priceChange1hr,
      required this.priceChange24hr,
      required this.priceChange30d,
      required this.priceChange5m,
      required this.priceChange6hr,
      required this.priceChange7d,
      required this.priceUsd,
      required this.volume24hr,
      required this.volume30d,
      required this.volume7d,
      required this.volumeChange24hr,
      required this.totalSupply,
      required this.marketCap,
      required this.selfReportedCirculatingSupply,
      required this.selfReportedMarketCap,
      required this.maxSupply,
      required this.fullyDilutedMarketCap,
      required this.tvl,
      required this.circulatingSupply})
      : super._();

  factory _$CoinMetricEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinMetricEntityImplFromJson(json);

  @override
  final double? priceChange1hr;
  @override
  final double? priceChange24hr;
  @override
  final double? priceChange30d;
  @override
  final double? priceChange5m;
  @override
  final double? priceChange6hr;
  @override
  final double? priceChange7d;
  @override
  final double? priceUsd;
  @override
  final double? volume24hr;
  @override
  final double? volume30d;
  @override
  final double? volume7d;
  @override
  final double? volumeChange24hr;
  @override
  final int? totalSupply;
  @override
  final num? marketCap;
  @override
  final num? selfReportedCirculatingSupply;
  @override
  final num? selfReportedMarketCap;
  @override
  final num? maxSupply;
  @override
  final num? fullyDilutedMarketCap;
  @override
  final num? tvl;
  @override
  final num? circulatingSupply;

  @override
  String toString() {
    return 'CoinMetricEntity(priceChange1hr: $priceChange1hr, priceChange24hr: $priceChange24hr, priceChange30d: $priceChange30d, priceChange5m: $priceChange5m, priceChange6hr: $priceChange6hr, priceChange7d: $priceChange7d, priceUsd: $priceUsd, volume24hr: $volume24hr, volume30d: $volume30d, volume7d: $volume7d, volumeChange24hr: $volumeChange24hr, totalSupply: $totalSupply, marketCap: $marketCap, selfReportedCirculatingSupply: $selfReportedCirculatingSupply, selfReportedMarketCap: $selfReportedMarketCap, maxSupply: $maxSupply, fullyDilutedMarketCap: $fullyDilutedMarketCap, tvl: $tvl, circulatingSupply: $circulatingSupply)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinMetricEntityImpl &&
            (identical(other.priceChange1hr, priceChange1hr) ||
                other.priceChange1hr == priceChange1hr) &&
            (identical(other.priceChange24hr, priceChange24hr) ||
                other.priceChange24hr == priceChange24hr) &&
            (identical(other.priceChange30d, priceChange30d) ||
                other.priceChange30d == priceChange30d) &&
            (identical(other.priceChange5m, priceChange5m) ||
                other.priceChange5m == priceChange5m) &&
            (identical(other.priceChange6hr, priceChange6hr) ||
                other.priceChange6hr == priceChange6hr) &&
            (identical(other.priceChange7d, priceChange7d) ||
                other.priceChange7d == priceChange7d) &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd) &&
            (identical(other.volume24hr, volume24hr) ||
                other.volume24hr == volume24hr) &&
            (identical(other.volume30d, volume30d) ||
                other.volume30d == volume30d) &&
            (identical(other.volume7d, volume7d) ||
                other.volume7d == volume7d) &&
            (identical(other.volumeChange24hr, volumeChange24hr) ||
                other.volumeChange24hr == volumeChange24hr) &&
            (identical(other.totalSupply, totalSupply) ||
                other.totalSupply == totalSupply) &&
            (identical(other.marketCap, marketCap) ||
                other.marketCap == marketCap) &&
            (identical(other.selfReportedCirculatingSupply,
                    selfReportedCirculatingSupply) ||
                other.selfReportedCirculatingSupply ==
                    selfReportedCirculatingSupply) &&
            (identical(other.selfReportedMarketCap, selfReportedMarketCap) ||
                other.selfReportedMarketCap == selfReportedMarketCap) &&
            (identical(other.maxSupply, maxSupply) ||
                other.maxSupply == maxSupply) &&
            (identical(other.fullyDilutedMarketCap, fullyDilutedMarketCap) ||
                other.fullyDilutedMarketCap == fullyDilutedMarketCap) &&
            (identical(other.tvl, tvl) || other.tvl == tvl) &&
            (identical(other.circulatingSupply, circulatingSupply) ||
                other.circulatingSupply == circulatingSupply));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        priceChange1hr,
        priceChange24hr,
        priceChange30d,
        priceChange5m,
        priceChange6hr,
        priceChange7d,
        priceUsd,
        volume24hr,
        volume30d,
        volume7d,
        volumeChange24hr,
        totalSupply,
        marketCap,
        selfReportedCirculatingSupply,
        selfReportedMarketCap,
        maxSupply,
        fullyDilutedMarketCap,
        tvl,
        circulatingSupply
      ]);

  /// Create a copy of CoinMetricEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinMetricEntityImplCopyWith<_$CoinMetricEntityImpl> get copyWith =>
      __$$CoinMetricEntityImplCopyWithImpl<_$CoinMetricEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinMetricEntityImplToJson(
      this,
    );
  }
}

abstract class _CoinMetricEntity extends CoinMetricEntity {
  const factory _CoinMetricEntity(
      {required final double? priceChange1hr,
      required final double? priceChange24hr,
      required final double? priceChange30d,
      required final double? priceChange5m,
      required final double? priceChange6hr,
      required final double? priceChange7d,
      required final double? priceUsd,
      required final double? volume24hr,
      required final double? volume30d,
      required final double? volume7d,
      required final double? volumeChange24hr,
      required final int? totalSupply,
      required final num? marketCap,
      required final num? selfReportedCirculatingSupply,
      required final num? selfReportedMarketCap,
      required final num? maxSupply,
      required final num? fullyDilutedMarketCap,
      required final num? tvl,
      required final num? circulatingSupply}) = _$CoinMetricEntityImpl;
  const _CoinMetricEntity._() : super._();

  factory _CoinMetricEntity.fromJson(Map<String, dynamic> json) =
      _$CoinMetricEntityImpl.fromJson;

  @override
  double? get priceChange1hr;
  @override
  double? get priceChange24hr;
  @override
  double? get priceChange30d;
  @override
  double? get priceChange5m;
  @override
  double? get priceChange6hr;
  @override
  double? get priceChange7d;
  @override
  double? get priceUsd;
  @override
  double? get volume24hr;
  @override
  double? get volume30d;
  @override
  double? get volume7d;
  @override
  double? get volumeChange24hr;
  @override
  int? get totalSupply;
  @override
  num? get marketCap;
  @override
  num? get selfReportedCirculatingSupply;
  @override
  num? get selfReportedMarketCap;
  @override
  num? get maxSupply;
  @override
  num? get fullyDilutedMarketCap;
  @override
  num? get tvl;
  @override
  num? get circulatingSupply;

  /// Create a copy of CoinMetricEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinMetricEntityImplCopyWith<_$CoinMetricEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
