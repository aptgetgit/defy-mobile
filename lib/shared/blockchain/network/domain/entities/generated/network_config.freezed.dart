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
  String get caipChainId => throw _privateConstructorUsedError;
  Uri get rpcUrl => throw _privateConstructorUsedError;

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
  $Res call({String caipChainId, Uri rpcUrl});
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
    Object? caipChainId = null,
    Object? rpcUrl = null,
  }) {
    return _then(_value.copyWith(
      caipChainId: null == caipChainId
          ? _value.caipChainId
          : caipChainId // ignore: cast_nullable_to_non_nullable
              as String,
      rpcUrl: null == rpcUrl
          ? _value.rpcUrl
          : rpcUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
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
  $Res call({String caipChainId, Uri rpcUrl});
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
    Object? caipChainId = null,
    Object? rpcUrl = null,
  }) {
    return _then(_$NetworkConfigImpl(
      caipChainId: null == caipChainId
          ? _value.caipChainId
          : caipChainId // ignore: cast_nullable_to_non_nullable
              as String,
      rpcUrl: null == rpcUrl
          ? _value.rpcUrl
          : rpcUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$NetworkConfigImpl extends _NetworkConfig {
  const _$NetworkConfigImpl({required this.caipChainId, required this.rpcUrl})
      : super._();

  @override
  final String caipChainId;
  @override
  final Uri rpcUrl;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkConfigImpl &&
            (identical(other.caipChainId, caipChainId) ||
                other.caipChainId == caipChainId) &&
            (identical(other.rpcUrl, rpcUrl) || other.rpcUrl == rpcUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, caipChainId, rpcUrl);

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
      {required final String caipChainId,
      required final Uri rpcUrl}) = _$NetworkConfigImpl;
  const _NetworkConfig._() : super._();

  @override
  String get caipChainId;
  @override
  Uri get rpcUrl;

  /// Create a copy of NetworkConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkConfigImplCopyWith<_$NetworkConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
