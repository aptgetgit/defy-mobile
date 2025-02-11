// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../network_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NetworkConfig {
  List<String> get checkUrls => throw _privateConstructorUsedError;
  Duration get timeout => throw _privateConstructorUsedError;
  String get lookupAddress => throw _privateConstructorUsedError;

  /// Create a copy of NetworkConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkConfigCopyWith<NetworkConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkConfigCopyWith<$Res> {
  factory $NetworkConfigCopyWith(
          NetworkConfig value, $Res Function(NetworkConfig) then) =
      _$NetworkConfigCopyWithImpl<$Res, NetworkConfig>;
  @useResult
  $Res call({List<String> checkUrls, Duration timeout, String lookupAddress});
}

/// @nodoc
class _$NetworkConfigCopyWithImpl<$Res, $Val extends NetworkConfig>
    implements $NetworkConfigCopyWith<$Res> {
  _$NetworkConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkConfig
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
abstract class _$$NetworkConfigImplCopyWith<$Res>
    implements $NetworkConfigCopyWith<$Res> {
  factory _$$NetworkConfigImplCopyWith(
          _$NetworkConfigImpl value, $Res Function(_$NetworkConfigImpl) then) =
      __$$NetworkConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> checkUrls, Duration timeout, String lookupAddress});
}

/// @nodoc
class __$$NetworkConfigImplCopyWithImpl<$Res>
    extends _$NetworkConfigCopyWithImpl<$Res, _$NetworkConfigImpl>
    implements _$$NetworkConfigImplCopyWith<$Res> {
  __$$NetworkConfigImplCopyWithImpl(
      _$NetworkConfigImpl _value, $Res Function(_$NetworkConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkUrls = null,
    Object? timeout = null,
    Object? lookupAddress = null,
  }) {
    return _then(_$NetworkConfigImpl(
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

class _$NetworkConfigImpl extends _NetworkConfig {
  const _$NetworkConfigImpl(
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
  String toString() {
    return 'NetworkConfig(checkUrls: $checkUrls, timeout: $timeout, lookupAddress: $lookupAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkConfigImpl &&
            const DeepCollectionEquality()
                .equals(other._checkUrls, _checkUrls) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.lookupAddress, lookupAddress) ||
                other.lookupAddress == lookupAddress));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_checkUrls), timeout, lookupAddress);

  /// Create a copy of NetworkConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkConfigImplCopyWith<_$NetworkConfigImpl> get copyWith =>
      __$$NetworkConfigImplCopyWithImpl<_$NetworkConfigImpl>(this, _$identity);
}

abstract class _NetworkConfig extends NetworkConfig {
  const factory _NetworkConfig(
      {final List<String> checkUrls,
      final Duration timeout,
      final String lookupAddress}) = _$NetworkConfigImpl;
  const _NetworkConfig._() : super._();

  @override
  List<String> get checkUrls;
  @override
  Duration get timeout;
  @override
  String get lookupAddress;

  /// Create a copy of NetworkConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkConfigImplCopyWith<_$NetworkConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
