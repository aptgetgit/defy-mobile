// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../currency_rate_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrencyRateRemoteModel _$CurrencyRateRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _CurrencyRateRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$CurrencyRateRemoteModel {
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'usd')
  Map<String, double> get rates => throw _privateConstructorUsedError;

  /// Serializes this CurrencyRateRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyRateRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyRateRemoteModelCopyWith<CurrencyRateRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyRateRemoteModelCopyWith<$Res> {
  factory $CurrencyRateRemoteModelCopyWith(CurrencyRateRemoteModel value,
          $Res Function(CurrencyRateRemoteModel) then) =
      _$CurrencyRateRemoteModelCopyWithImpl<$Res, CurrencyRateRemoteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'date') String date,
      @JsonKey(name: 'usd') Map<String, double> rates});
}

/// @nodoc
class _$CurrencyRateRemoteModelCopyWithImpl<$Res,
        $Val extends CurrencyRateRemoteModel>
    implements $CurrencyRateRemoteModelCopyWith<$Res> {
  _$CurrencyRateRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyRateRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? rates = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      rates: null == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyRateRemoteModelImplCopyWith<$Res>
    implements $CurrencyRateRemoteModelCopyWith<$Res> {
  factory _$$CurrencyRateRemoteModelImplCopyWith(
          _$CurrencyRateRemoteModelImpl value,
          $Res Function(_$CurrencyRateRemoteModelImpl) then) =
      __$$CurrencyRateRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'date') String date,
      @JsonKey(name: 'usd') Map<String, double> rates});
}

/// @nodoc
class __$$CurrencyRateRemoteModelImplCopyWithImpl<$Res>
    extends _$CurrencyRateRemoteModelCopyWithImpl<$Res,
        _$CurrencyRateRemoteModelImpl>
    implements _$$CurrencyRateRemoteModelImplCopyWith<$Res> {
  __$$CurrencyRateRemoteModelImplCopyWithImpl(
      _$CurrencyRateRemoteModelImpl _value,
      $Res Function(_$CurrencyRateRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyRateRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? rates = null,
  }) {
    return _then(_$CurrencyRateRemoteModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      rates: null == rates
          ? _value._rates
          : rates // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyRateRemoteModelImpl extends _CurrencyRateRemoteModel {
  const _$CurrencyRateRemoteModelImpl(
      {@JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'usd') required final Map<String, double> rates})
      : _rates = rates,
        super._();

  factory _$CurrencyRateRemoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyRateRemoteModelImplFromJson(json);

  @override
  @JsonKey(name: 'date')
  final String date;
  final Map<String, double> _rates;
  @override
  @JsonKey(name: 'usd')
  Map<String, double> get rates {
    if (_rates is EqualUnmodifiableMapView) return _rates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rates);
  }

  @override
  String toString() {
    return 'CurrencyRateRemoteModel(date: $date, rates: $rates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyRateRemoteModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._rates, _rates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_rates));

  /// Create a copy of CurrencyRateRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyRateRemoteModelImplCopyWith<_$CurrencyRateRemoteModelImpl>
      get copyWith => __$$CurrencyRateRemoteModelImplCopyWithImpl<
          _$CurrencyRateRemoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyRateRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _CurrencyRateRemoteModel extends CurrencyRateRemoteModel {
  const factory _CurrencyRateRemoteModel(
          {@JsonKey(name: 'date') required final String date,
          @JsonKey(name: 'usd') required final Map<String, double> rates}) =
      _$CurrencyRateRemoteModelImpl;
  const _CurrencyRateRemoteModel._() : super._();

  factory _CurrencyRateRemoteModel.fromJson(Map<String, dynamic> json) =
      _$CurrencyRateRemoteModelImpl.fromJson;

  @override
  @JsonKey(name: 'date')
  String get date;
  @override
  @JsonKey(name: 'usd')
  Map<String, double> get rates;

  /// Create a copy of CurrencyRateRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyRateRemoteModelImplCopyWith<_$CurrencyRateRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
