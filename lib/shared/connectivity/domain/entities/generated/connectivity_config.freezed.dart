// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../connectivity_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectivityConfig {
  List<String> get checkUrls => throw _privateConstructorUsedError;
  Duration get timeout => throw _privateConstructorUsedError;
  String get lookupAddress => throw _privateConstructorUsedError;

  /// Create a copy of ConnectivityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnectivityConfigCopyWith<ConnectivityConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityConfigCopyWith<$Res> {
  factory $ConnectivityConfigCopyWith(
          ConnectivityConfig value, $Res Function(ConnectivityConfig) then) =
      _$ConnectivityConfigCopyWithImpl<$Res, ConnectivityConfig>;
  @useResult
  $Res call({List<String> checkUrls, Duration timeout, String lookupAddress});
}

/// @nodoc
class _$ConnectivityConfigCopyWithImpl<$Res, $Val extends ConnectivityConfig>
    implements $ConnectivityConfigCopyWith<$Res> {
  _$ConnectivityConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectivityConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkUrls = null,
    Object? timeout = null,
    Object? lookupAddress = null,
  }) {
    return _then(_value.copyWith(
      checkUrls: null == checkUrls
          ? _value.checkUrls
          : checkUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as Duration,
      lookupAddress: null == lookupAddress
          ? _value.lookupAddress
          : lookupAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectivityConfigImplCopyWith<$Res>
    implements $ConnectivityConfigCopyWith<$Res> {
  factory _$$ConnectivityConfigImplCopyWith(_$ConnectivityConfigImpl value,
          $Res Function(_$ConnectivityConfigImpl) then) =
      __$$ConnectivityConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> checkUrls, Duration timeout, String lookupAddress});
}

/// @nodoc
class __$$ConnectivityConfigImplCopyWithImpl<$Res>
    extends _$ConnectivityConfigCopyWithImpl<$Res, _$ConnectivityConfigImpl>
    implements _$$ConnectivityConfigImplCopyWith<$Res> {
  __$$ConnectivityConfigImplCopyWithImpl(_$ConnectivityConfigImpl _value,
      $Res Function(_$ConnectivityConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectivityConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkUrls = null,
    Object? timeout = null,
    Object? lookupAddress = null,
  }) {
    return _then(_$ConnectivityConfigImpl(
      checkUrls: null == checkUrls
          ? _value._checkUrls
          : checkUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as Duration,
      lookupAddress: null == lookupAddress
          ? _value.lookupAddress
          : lookupAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConnectivityConfigImpl extends _ConnectivityConfig {
  const _$ConnectivityConfigImpl(
      {final List<String> checkUrls = const <String>[
        'https://8.8.8.8',
        'https://1.1.1.1',
        'https://google.com'
      ],
      this.timeout = const Duration(seconds: 5),
      this.lookupAddress = 'google.com'})
      : _checkUrls = checkUrls,
        super._();

  final List<String> _checkUrls;
  @override
  @JsonKey()
  List<String> get checkUrls {
    if (_checkUrls is EqualUnmodifiableListView) return _checkUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkUrls);
  }

  @override
  @JsonKey()
  final Duration timeout;
  @override
  @JsonKey()
  final String lookupAddress;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectivityConfigImpl &&
            const DeepCollectionEquality()
                .equals(other._checkUrls, _checkUrls) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.lookupAddress, lookupAddress) ||
                other.lookupAddress == lookupAddress));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_checkUrls), timeout, lookupAddress);

  /// Create a copy of ConnectivityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectivityConfigImplCopyWith<_$ConnectivityConfigImpl> get copyWith =>
      __$$ConnectivityConfigImplCopyWithImpl<_$ConnectivityConfigImpl>(
          this, _$identity);
}

abstract class _ConnectivityConfig extends ConnectivityConfig {
  const factory _ConnectivityConfig(
      {final List<String> checkUrls,
      final Duration timeout,
      final String lookupAddress}) = _$ConnectivityConfigImpl;
  const _ConnectivityConfig._() : super._();

  @override
  List<String> get checkUrls;
  @override
  Duration get timeout;
  @override
  String get lookupAddress;

  /// Create a copy of ConnectivityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectivityConfigImplCopyWith<_$ConnectivityConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
