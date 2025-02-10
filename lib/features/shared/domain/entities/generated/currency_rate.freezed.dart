// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../currency_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrencyRate _$CurrencyRateFromJson(Map<String, dynamic> json) {
  return _CurrencyRate.fromJson(json);
}

/// @nodoc
mixin _$CurrencyRate {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  DateTime get lastUpdate => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyRateCopyWith<CurrencyRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyRateCopyWith<$Res> {
  factory $CurrencyRateCopyWith(
          CurrencyRate value, $Res Function(CurrencyRate) then) =
      _$CurrencyRateCopyWithImpl<$Res, CurrencyRate>;
  @useResult
  $Res call({String id, String code, double rate, DateTime lastUpdate});
}

/// @nodoc
class _$CurrencyRateCopyWithImpl<$Res, $Val extends CurrencyRate>
    implements $CurrencyRateCopyWith<$Res> {
  _$CurrencyRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? rate = null,
    Object? lastUpdate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyRateImplCopyWith<$Res>
    implements $CurrencyRateCopyWith<$Res> {
  factory _$$CurrencyRateImplCopyWith(
          _$CurrencyRateImpl value, $Res Function(_$CurrencyRateImpl) then) =
      __$$CurrencyRateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String code, double rate, DateTime lastUpdate});
}

/// @nodoc
class __$$CurrencyRateImplCopyWithImpl<$Res>
    extends _$CurrencyRateCopyWithImpl<$Res, _$CurrencyRateImpl>
    implements _$$CurrencyRateImplCopyWith<$Res> {
  __$$CurrencyRateImplCopyWithImpl(
      _$CurrencyRateImpl _value, $Res Function(_$CurrencyRateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? rate = null,
    Object? lastUpdate = null,
  }) {
    return _then(_$CurrencyRateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CurrencyRateImpl extends _CurrencyRate {
  const _$CurrencyRateImpl(
      {required this.id,
      required this.code,
      required this.rate,
      required this.lastUpdate})
      : super._();

  factory _$CurrencyRateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyRateImplFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final double rate;
  @override
  final DateTime lastUpdate;

  @override
  String toString() {
    return 'CurrencyRate(id: $id, code: $code, rate: $rate, lastUpdate: $lastUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyRateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, rate, lastUpdate);

  /// Create a copy of CurrencyRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyRateImplCopyWith<_$CurrencyRateImpl> get copyWith =>
      __$$CurrencyRateImplCopyWithImpl<_$CurrencyRateImpl>(this, _$identity);
}

abstract class _CurrencyRate extends CurrencyRate {
  const factory _CurrencyRate(
      {required final String id,
      required final String code,
      required final double rate,
      required final DateTime lastUpdate}) = _$CurrencyRateImpl;
  const _CurrencyRate._() : super._();

  factory _CurrencyRate.fromJson(Map<String, dynamic> json) =
      _$CurrencyRateImpl.fromJson;

  @override
  String get id;
  @override
  String get code;
  @override
  double get rate;
  @override
  DateTime get lastUpdate;

  /// Create a copy of CurrencyRate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyRateImplCopyWith<_$CurrencyRateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
