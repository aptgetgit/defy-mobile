// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../token_metadata_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenMetaDataRemoteModel _$TokenMetaDataRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _TokenMetaDataRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$TokenMetaDataRemoteModel {
  @JsonKey(name: 'coin_id')
  String? get coinId => throw _privateConstructorUsedError;
  @JsonKey(name: 'coin_name')
  String? get coinName => throw _privateConstructorUsedError;
  @JsonKey(name: 'coin_decimals')
  int? get coinDecimals => throw _privateConstructorUsedError;
  @JsonKey(name: 'coin_defyapp_symbol')
  String? get coinDefyappSymbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'coin_description')
  String? get coinDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'coin_logo_url')
  String? get coinLogoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'coin_metric')
  TokenMetricModel? get coinMetric => throw _privateConstructorUsedError;

  /// Serializes this TokenMetaDataRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenMetaDataRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenMetaDataRemoteModelCopyWith<TokenMetaDataRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenMetaDataRemoteModelCopyWith<$Res> {
  factory $TokenMetaDataRemoteModelCopyWith(TokenMetaDataRemoteModel value,
          $Res Function(TokenMetaDataRemoteModel) then) =
      _$TokenMetaDataRemoteModelCopyWithImpl<$Res, TokenMetaDataRemoteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'coin_id') String? coinId,
      @JsonKey(name: 'coin_name') String? coinName,
      @JsonKey(name: 'coin_decimals') int? coinDecimals,
      @JsonKey(name: 'coin_defyapp_symbol') String? coinDefyappSymbol,
      @JsonKey(name: 'coin_description') String? coinDescription,
      @JsonKey(name: 'coin_logo_url') String? coinLogoUrl,
      @JsonKey(name: 'coin_metric') TokenMetricModel? coinMetric});

  $TokenMetricModelCopyWith<$Res>? get coinMetric;
}

/// @nodoc
class _$TokenMetaDataRemoteModelCopyWithImpl<$Res,
        $Val extends TokenMetaDataRemoteModel>
    implements $TokenMetaDataRemoteModelCopyWith<$Res> {
  _$TokenMetaDataRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenMetaDataRemoteModel
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
              as TokenMetricModel?,
    ) as $Val);
  }

  /// Create a copy of TokenMetaDataRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenMetricModelCopyWith<$Res>? get coinMetric {
    if (_value.coinMetric == null) {
      return null;
    }

    return $TokenMetricModelCopyWith<$Res>(_value.coinMetric!, (value) {
      return _then(_value.copyWith(coinMetric: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TokenMetaDataRemoteModelImplCopyWith<$Res>
    implements $TokenMetaDataRemoteModelCopyWith<$Res> {
  factory _$$TokenMetaDataRemoteModelImplCopyWith(
          _$TokenMetaDataRemoteModelImpl value,
          $Res Function(_$TokenMetaDataRemoteModelImpl) then) =
      __$$TokenMetaDataRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'coin_id') String? coinId,
      @JsonKey(name: 'coin_name') String? coinName,
      @JsonKey(name: 'coin_decimals') int? coinDecimals,
      @JsonKey(name: 'coin_defyapp_symbol') String? coinDefyappSymbol,
      @JsonKey(name: 'coin_description') String? coinDescription,
      @JsonKey(name: 'coin_logo_url') String? coinLogoUrl,
      @JsonKey(name: 'coin_metric') TokenMetricModel? coinMetric});

  @override
  $TokenMetricModelCopyWith<$Res>? get coinMetric;
}

/// @nodoc
class __$$TokenMetaDataRemoteModelImplCopyWithImpl<$Res>
    extends _$TokenMetaDataRemoteModelCopyWithImpl<$Res,
        _$TokenMetaDataRemoteModelImpl>
    implements _$$TokenMetaDataRemoteModelImplCopyWith<$Res> {
  __$$TokenMetaDataRemoteModelImplCopyWithImpl(
      _$TokenMetaDataRemoteModelImpl _value,
      $Res Function(_$TokenMetaDataRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenMetaDataRemoteModel
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
    return _then(_$TokenMetaDataRemoteModelImpl(
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
              as TokenMetricModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenMetaDataRemoteModelImpl implements _TokenMetaDataRemoteModel {
  _$TokenMetaDataRemoteModelImpl(
      {@JsonKey(name: 'coin_id') required this.coinId,
      @JsonKey(name: 'coin_name') required this.coinName,
      @JsonKey(name: 'coin_decimals') required this.coinDecimals,
      @JsonKey(name: 'coin_defyapp_symbol') required this.coinDefyappSymbol,
      @JsonKey(name: 'coin_description') required this.coinDescription,
      @JsonKey(name: 'coin_logo_url') required this.coinLogoUrl,
      @JsonKey(name: 'coin_metric') required this.coinMetric});

  factory _$TokenMetaDataRemoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenMetaDataRemoteModelImplFromJson(json);

  @override
  @JsonKey(name: 'coin_id')
  final String? coinId;
  @override
  @JsonKey(name: 'coin_name')
  final String? coinName;
  @override
  @JsonKey(name: 'coin_decimals')
  final int? coinDecimals;
  @override
  @JsonKey(name: 'coin_defyapp_symbol')
  final String? coinDefyappSymbol;
  @override
  @JsonKey(name: 'coin_description')
  final String? coinDescription;
  @override
  @JsonKey(name: 'coin_logo_url')
  final String? coinLogoUrl;
  @override
  @JsonKey(name: 'coin_metric')
  final TokenMetricModel? coinMetric;

  @override
  String toString() {
    return 'TokenMetaDataRemoteModel(coinId: $coinId, coinName: $coinName, coinDecimals: $coinDecimals, coinDefyappSymbol: $coinDefyappSymbol, coinDescription: $coinDescription, coinLogoUrl: $coinLogoUrl, coinMetric: $coinMetric)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenMetaDataRemoteModelImpl &&
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

  /// Create a copy of TokenMetaDataRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenMetaDataRemoteModelImplCopyWith<_$TokenMetaDataRemoteModelImpl>
      get copyWith => __$$TokenMetaDataRemoteModelImplCopyWithImpl<
          _$TokenMetaDataRemoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenMetaDataRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _TokenMetaDataRemoteModel implements TokenMetaDataRemoteModel {
  factory _TokenMetaDataRemoteModel(
      {@JsonKey(name: 'coin_id') required final String? coinId,
      @JsonKey(name: 'coin_name') required final String? coinName,
      @JsonKey(name: 'coin_decimals') required final int? coinDecimals,
      @JsonKey(name: 'coin_defyapp_symbol')
      required final String? coinDefyappSymbol,
      @JsonKey(name: 'coin_description') required final String? coinDescription,
      @JsonKey(name: 'coin_logo_url') required final String? coinLogoUrl,
      @JsonKey(name: 'coin_metric')
      required final TokenMetricModel?
          coinMetric}) = _$TokenMetaDataRemoteModelImpl;

  factory _TokenMetaDataRemoteModel.fromJson(Map<String, dynamic> json) =
      _$TokenMetaDataRemoteModelImpl.fromJson;

  @override
  @JsonKey(name: 'coin_id')
  String? get coinId;
  @override
  @JsonKey(name: 'coin_name')
  String? get coinName;
  @override
  @JsonKey(name: 'coin_decimals')
  int? get coinDecimals;
  @override
  @JsonKey(name: 'coin_defyapp_symbol')
  String? get coinDefyappSymbol;
  @override
  @JsonKey(name: 'coin_description')
  String? get coinDescription;
  @override
  @JsonKey(name: 'coin_logo_url')
  String? get coinLogoUrl;
  @override
  @JsonKey(name: 'coin_metric')
  TokenMetricModel? get coinMetric;

  /// Create a copy of TokenMetaDataRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenMetaDataRemoteModelImplCopyWith<_$TokenMetaDataRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TokenMetricModel _$TokenMetricModelFromJson(Map<String, dynamic> json) {
  return _TokenMetricModel.fromJson(json);
}

/// @nodoc
mixin _$TokenMetricModel {
  @JsonKey(name: 'price_change_1hr')
  double? get priceChange1hr => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_change_24h')
  double? get priceChange24hr => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_change_30d')
  double? get priceChange30d => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_change_5m')
  double? get priceChange5m => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_change_6hr')
  double? get priceChange6hr => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_change_7d')
  double? get priceChange7d => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_usd')
  double? get priceUsd => throw _privateConstructorUsedError;
  @JsonKey(name: 'volume_24hr')
  double? get volume24hr => throw _privateConstructorUsedError;
  @JsonKey(name: 'volume_30d')
  double? get volume30d => throw _privateConstructorUsedError;
  @JsonKey(name: 'volume_7d')
  double? get volume7d => throw _privateConstructorUsedError;
  @JsonKey(name: 'volume_change_24hr')
  double? get volumeChange24hr => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_supply')
  int? get totalSupply => throw _privateConstructorUsedError;
  @JsonKey(name: 'market_cap')
  num? get marketCap => throw _privateConstructorUsedError;
  @JsonKey(name: 'self_reported_circulating_supply')
  num? get selfReportedCirculatingSupply => throw _privateConstructorUsedError;
  @JsonKey(name: 'self_reported_market_cap')
  num? get selfReportedMarketCap => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_supply')
  num? get maxSupply => throw _privateConstructorUsedError;
  @JsonKey(name: 'fully_diluted_market_cap')
  num? get fullyDilutedMarketCap => throw _privateConstructorUsedError;
  @JsonKey(name: 'tvl')
  num? get tvl => throw _privateConstructorUsedError;
  @JsonKey(name: 'circulating_supply')
  num? get circulatingSupply => throw _privateConstructorUsedError;

  /// Serializes this TokenMetricModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenMetricModelCopyWith<TokenMetricModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenMetricModelCopyWith<$Res> {
  factory $TokenMetricModelCopyWith(
          TokenMetricModel value, $Res Function(TokenMetricModel) then) =
      _$TokenMetricModelCopyWithImpl<$Res, TokenMetricModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'price_change_1hr') double? priceChange1hr,
      @JsonKey(name: 'price_change_24h') double? priceChange24hr,
      @JsonKey(name: 'price_change_30d') double? priceChange30d,
      @JsonKey(name: 'price_change_5m') double? priceChange5m,
      @JsonKey(name: 'price_change_6hr') double? priceChange6hr,
      @JsonKey(name: 'price_change_7d') double? priceChange7d,
      @JsonKey(name: 'price_usd') double? priceUsd,
      @JsonKey(name: 'volume_24hr') double? volume24hr,
      @JsonKey(name: 'volume_30d') double? volume30d,
      @JsonKey(name: 'volume_7d') double? volume7d,
      @JsonKey(name: 'volume_change_24hr') double? volumeChange24hr,
      @JsonKey(name: 'total_supply') int? totalSupply,
      @JsonKey(name: 'market_cap') num? marketCap,
      @JsonKey(name: 'self_reported_circulating_supply')
      num? selfReportedCirculatingSupply,
      @JsonKey(name: 'self_reported_market_cap') num? selfReportedMarketCap,
      @JsonKey(name: 'max_supply') num? maxSupply,
      @JsonKey(name: 'fully_diluted_market_cap') num? fullyDilutedMarketCap,
      @JsonKey(name: 'tvl') num? tvl,
      @JsonKey(name: 'circulating_supply') num? circulatingSupply});
}

/// @nodoc
class _$TokenMetricModelCopyWithImpl<$Res, $Val extends TokenMetricModel>
    implements $TokenMetricModelCopyWith<$Res> {
  _$TokenMetricModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenMetricModel
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
abstract class _$$TokenMetricModelImplCopyWith<$Res>
    implements $TokenMetricModelCopyWith<$Res> {
  factory _$$TokenMetricModelImplCopyWith(_$TokenMetricModelImpl value,
          $Res Function(_$TokenMetricModelImpl) then) =
      __$$TokenMetricModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'price_change_1hr') double? priceChange1hr,
      @JsonKey(name: 'price_change_24h') double? priceChange24hr,
      @JsonKey(name: 'price_change_30d') double? priceChange30d,
      @JsonKey(name: 'price_change_5m') double? priceChange5m,
      @JsonKey(name: 'price_change_6hr') double? priceChange6hr,
      @JsonKey(name: 'price_change_7d') double? priceChange7d,
      @JsonKey(name: 'price_usd') double? priceUsd,
      @JsonKey(name: 'volume_24hr') double? volume24hr,
      @JsonKey(name: 'volume_30d') double? volume30d,
      @JsonKey(name: 'volume_7d') double? volume7d,
      @JsonKey(name: 'volume_change_24hr') double? volumeChange24hr,
      @JsonKey(name: 'total_supply') int? totalSupply,
      @JsonKey(name: 'market_cap') num? marketCap,
      @JsonKey(name: 'self_reported_circulating_supply')
      num? selfReportedCirculatingSupply,
      @JsonKey(name: 'self_reported_market_cap') num? selfReportedMarketCap,
      @JsonKey(name: 'max_supply') num? maxSupply,
      @JsonKey(name: 'fully_diluted_market_cap') num? fullyDilutedMarketCap,
      @JsonKey(name: 'tvl') num? tvl,
      @JsonKey(name: 'circulating_supply') num? circulatingSupply});
}

/// @nodoc
class __$$TokenMetricModelImplCopyWithImpl<$Res>
    extends _$TokenMetricModelCopyWithImpl<$Res, _$TokenMetricModelImpl>
    implements _$$TokenMetricModelImplCopyWith<$Res> {
  __$$TokenMetricModelImplCopyWithImpl(_$TokenMetricModelImpl _value,
      $Res Function(_$TokenMetricModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenMetricModel
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
    return _then(_$TokenMetricModelImpl(
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
class _$TokenMetricModelImpl implements _TokenMetricModel {
  _$TokenMetricModelImpl(
      {@JsonKey(name: 'price_change_1hr') required this.priceChange1hr,
      @JsonKey(name: 'price_change_24h') required this.priceChange24hr,
      @JsonKey(name: 'price_change_30d') required this.priceChange30d,
      @JsonKey(name: 'price_change_5m') required this.priceChange5m,
      @JsonKey(name: 'price_change_6hr') required this.priceChange6hr,
      @JsonKey(name: 'price_change_7d') required this.priceChange7d,
      @JsonKey(name: 'price_usd') required this.priceUsd,
      @JsonKey(name: 'volume_24hr') required this.volume24hr,
      @JsonKey(name: 'volume_30d') required this.volume30d,
      @JsonKey(name: 'volume_7d') required this.volume7d,
      @JsonKey(name: 'volume_change_24hr') required this.volumeChange24hr,
      @JsonKey(name: 'total_supply') required this.totalSupply,
      @JsonKey(name: 'market_cap') required this.marketCap,
      @JsonKey(name: 'self_reported_circulating_supply')
      required this.selfReportedCirculatingSupply,
      @JsonKey(name: 'self_reported_market_cap')
      required this.selfReportedMarketCap,
      @JsonKey(name: 'max_supply') required this.maxSupply,
      @JsonKey(name: 'fully_diluted_market_cap')
      required this.fullyDilutedMarketCap,
      @JsonKey(name: 'tvl') required this.tvl,
      @JsonKey(name: 'circulating_supply') required this.circulatingSupply});

  factory _$TokenMetricModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenMetricModelImplFromJson(json);

  @override
  @JsonKey(name: 'price_change_1hr')
  final double? priceChange1hr;
  @override
  @JsonKey(name: 'price_change_24h')
  final double? priceChange24hr;
  @override
  @JsonKey(name: 'price_change_30d')
  final double? priceChange30d;
  @override
  @JsonKey(name: 'price_change_5m')
  final double? priceChange5m;
  @override
  @JsonKey(name: 'price_change_6hr')
  final double? priceChange6hr;
  @override
  @JsonKey(name: 'price_change_7d')
  final double? priceChange7d;
  @override
  @JsonKey(name: 'price_usd')
  final double? priceUsd;
  @override
  @JsonKey(name: 'volume_24hr')
  final double? volume24hr;
  @override
  @JsonKey(name: 'volume_30d')
  final double? volume30d;
  @override
  @JsonKey(name: 'volume_7d')
  final double? volume7d;
  @override
  @JsonKey(name: 'volume_change_24hr')
  final double? volumeChange24hr;
  @override
  @JsonKey(name: 'total_supply')
  final int? totalSupply;
  @override
  @JsonKey(name: 'market_cap')
  final num? marketCap;
  @override
  @JsonKey(name: 'self_reported_circulating_supply')
  final num? selfReportedCirculatingSupply;
  @override
  @JsonKey(name: 'self_reported_market_cap')
  final num? selfReportedMarketCap;
  @override
  @JsonKey(name: 'max_supply')
  final num? maxSupply;
  @override
  @JsonKey(name: 'fully_diluted_market_cap')
  final num? fullyDilutedMarketCap;
  @override
  @JsonKey(name: 'tvl')
  final num? tvl;
  @override
  @JsonKey(name: 'circulating_supply')
  final num? circulatingSupply;

  @override
  String toString() {
    return 'TokenMetricModel(priceChange1hr: $priceChange1hr, priceChange24hr: $priceChange24hr, priceChange30d: $priceChange30d, priceChange5m: $priceChange5m, priceChange6hr: $priceChange6hr, priceChange7d: $priceChange7d, priceUsd: $priceUsd, volume24hr: $volume24hr, volume30d: $volume30d, volume7d: $volume7d, volumeChange24hr: $volumeChange24hr, totalSupply: $totalSupply, marketCap: $marketCap, selfReportedCirculatingSupply: $selfReportedCirculatingSupply, selfReportedMarketCap: $selfReportedMarketCap, maxSupply: $maxSupply, fullyDilutedMarketCap: $fullyDilutedMarketCap, tvl: $tvl, circulatingSupply: $circulatingSupply)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenMetricModelImpl &&
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

  /// Create a copy of TokenMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenMetricModelImplCopyWith<_$TokenMetricModelImpl> get copyWith =>
      __$$TokenMetricModelImplCopyWithImpl<_$TokenMetricModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenMetricModelImplToJson(
      this,
    );
  }
}

abstract class _TokenMetricModel implements TokenMetricModel {
  factory _TokenMetricModel(
      {@JsonKey(name: 'price_change_1hr') required final double? priceChange1hr,
      @JsonKey(name: 'price_change_24h') required final double? priceChange24hr,
      @JsonKey(name: 'price_change_30d') required final double? priceChange30d,
      @JsonKey(name: 'price_change_5m') required final double? priceChange5m,
      @JsonKey(name: 'price_change_6hr') required final double? priceChange6hr,
      @JsonKey(name: 'price_change_7d') required final double? priceChange7d,
      @JsonKey(name: 'price_usd') required final double? priceUsd,
      @JsonKey(name: 'volume_24hr') required final double? volume24hr,
      @JsonKey(name: 'volume_30d') required final double? volume30d,
      @JsonKey(name: 'volume_7d') required final double? volume7d,
      @JsonKey(name: 'volume_change_24hr')
      required final double? volumeChange24hr,
      @JsonKey(name: 'total_supply') required final int? totalSupply,
      @JsonKey(name: 'market_cap') required final num? marketCap,
      @JsonKey(name: 'self_reported_circulating_supply')
      required final num? selfReportedCirculatingSupply,
      @JsonKey(name: 'self_reported_market_cap')
      required final num? selfReportedMarketCap,
      @JsonKey(name: 'max_supply') required final num? maxSupply,
      @JsonKey(name: 'fully_diluted_market_cap')
      required final num? fullyDilutedMarketCap,
      @JsonKey(name: 'tvl') required final num? tvl,
      @JsonKey(name: 'circulating_supply')
      required final num? circulatingSupply}) = _$TokenMetricModelImpl;

  factory _TokenMetricModel.fromJson(Map<String, dynamic> json) =
      _$TokenMetricModelImpl.fromJson;

  @override
  @JsonKey(name: 'price_change_1hr')
  double? get priceChange1hr;
  @override
  @JsonKey(name: 'price_change_24h')
  double? get priceChange24hr;
  @override
  @JsonKey(name: 'price_change_30d')
  double? get priceChange30d;
  @override
  @JsonKey(name: 'price_change_5m')
  double? get priceChange5m;
  @override
  @JsonKey(name: 'price_change_6hr')
  double? get priceChange6hr;
  @override
  @JsonKey(name: 'price_change_7d')
  double? get priceChange7d;
  @override
  @JsonKey(name: 'price_usd')
  double? get priceUsd;
  @override
  @JsonKey(name: 'volume_24hr')
  double? get volume24hr;
  @override
  @JsonKey(name: 'volume_30d')
  double? get volume30d;
  @override
  @JsonKey(name: 'volume_7d')
  double? get volume7d;
  @override
  @JsonKey(name: 'volume_change_24hr')
  double? get volumeChange24hr;
  @override
  @JsonKey(name: 'total_supply')
  int? get totalSupply;
  @override
  @JsonKey(name: 'market_cap')
  num? get marketCap;
  @override
  @JsonKey(name: 'self_reported_circulating_supply')
  num? get selfReportedCirculatingSupply;
  @override
  @JsonKey(name: 'self_reported_market_cap')
  num? get selfReportedMarketCap;
  @override
  @JsonKey(name: 'max_supply')
  num? get maxSupply;
  @override
  @JsonKey(name: 'fully_diluted_market_cap')
  num? get fullyDilutedMarketCap;
  @override
  @JsonKey(name: 'tvl')
  num? get tvl;
  @override
  @JsonKey(name: 'circulating_supply')
  num? get circulatingSupply;

  /// Create a copy of TokenMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenMetricModelImplCopyWith<_$TokenMetricModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
