// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../network_connectivity_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NetworkConnectivityConfig _$NetworkConnectivityConfigFromJson(
    Map<String, dynamic> json) {
  return _NetworkConnectivityConfig.fromJson(json);
}

/// @nodoc
mixin _$NetworkConnectivityConfig {
  List<String> get checkUrls => throw _privateConstructorUsedError;
  Duration get timeout => throw _privateConstructorUsedError;
  String get lookupAddress => throw _privateConstructorUsedError;

  /// Serializes this NetworkConnectivityConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NetworkConnectivityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkConnectivityConfigCopyWith<NetworkConnectivityConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkConnectivityConfigCopyWith<$Res> {
  factory $NetworkConnectivityConfigCopyWith(NetworkConnectivityConfig value,
          $Res Function(NetworkConnectivityConfig) then) =
      _$NetworkConnectivityConfigCopyWithImpl<$Res, NetworkConnectivityConfig>;
  @useResult
  $Res call({List<String> checkUrls, Duration timeout, String lookupAddress});
}

/// @nodoc
class _$NetworkConnectivityConfigCopyWithImpl<$Res,
        $Val extends NetworkConnectivityConfig>
    implements $NetworkConnectivityConfigCopyWith<$Res> {
  _$NetworkConnectivityConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkConnectivityConfig
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
abstract class _$$NetworkConnectivityConfigImplCopyWith<$Res>
    implements $NetworkConnectivityConfigCopyWith<$Res> {
  factory _$$NetworkConnectivityConfigImplCopyWith(
          _$NetworkConnectivityConfigImpl value,
          $Res Function(_$NetworkConnectivityConfigImpl) then) =
      __$$NetworkConnectivityConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> checkUrls, Duration timeout, String lookupAddress});
}

/// @nodoc
class __$$NetworkConnectivityConfigImplCopyWithImpl<$Res>
    extends _$NetworkConnectivityConfigCopyWithImpl<$Res,
        _$NetworkConnectivityConfigImpl>
    implements _$$NetworkConnectivityConfigImplCopyWith<$Res> {
  __$$NetworkConnectivityConfigImplCopyWithImpl(
      _$NetworkConnectivityConfigImpl _value,
      $Res Function(_$NetworkConnectivityConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkConnectivityConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkUrls = null,
    Object? timeout = null,
    Object? lookupAddress = null,
  }) {
    return _then(_$NetworkConnectivityConfigImpl(
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
@JsonSerializable()
class _$NetworkConnectivityConfigImpl extends _NetworkConnectivityConfig {
  const _$NetworkConnectivityConfigImpl(
      {final List<String> checkUrls = const [
        'https://8.8.8.8',
        'https://1.1.1.1',
        'https://google.com'
      ],
      this.timeout = const Duration(seconds: 5),
      this.lookupAddress = 'google.com'})
      : _checkUrls = checkUrls,
        super._();

  factory _$NetworkConnectivityConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkConnectivityConfigImplFromJson(json);

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
    return 'NetworkConnectivityConfig(checkUrls: $checkUrls, timeout: $timeout, lookupAddress: $lookupAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkConnectivityConfigImpl &&
            const DeepCollectionEquality()
                .equals(other._checkUrls, _checkUrls) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.lookupAddress, lookupAddress) ||
                other.lookupAddress == lookupAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_checkUrls), timeout, lookupAddress);

  /// Create a copy of NetworkConnectivityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkConnectivityConfigImplCopyWith<_$NetworkConnectivityConfigImpl>
      get copyWith => __$$NetworkConnectivityConfigImplCopyWithImpl<
          _$NetworkConnectivityConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkConnectivityConfigImplToJson(
      this,
    );
  }
}

abstract class _NetworkConnectivityConfig extends NetworkConnectivityConfig {
  const factory _NetworkConnectivityConfig(
      {final List<String> checkUrls,
      final Duration timeout,
      final String lookupAddress}) = _$NetworkConnectivityConfigImpl;
  const _NetworkConnectivityConfig._() : super._();

  factory _NetworkConnectivityConfig.fromJson(Map<String, dynamic> json) =
      _$NetworkConnectivityConfigImpl.fromJson;

  @override
  List<String> get checkUrls;
  @override
  Duration get timeout;
  @override
  String get lookupAddress;

  /// Create a copy of NetworkConnectivityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkConnectivityConfigImplCopyWith<_$NetworkConnectivityConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}
