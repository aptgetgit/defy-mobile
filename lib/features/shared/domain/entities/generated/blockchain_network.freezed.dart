// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../blockchain_network.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlockchainNetwork _$BlockchainNetworkFromJson(Map<String, dynamic> json) {
  return _BlockchainNetwork.fromJson(json);
}

/// @nodoc
mixin _$BlockchainNetwork {
  String get id => throw _privateConstructorUsedError;
  String get namespace => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;

  /// Create a copy of BlockchainNetwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockchainNetworkCopyWith<BlockchainNetwork> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainNetworkCopyWith<$Res> {
  factory $BlockchainNetworkCopyWith(
          BlockchainNetwork value, $Res Function(BlockchainNetwork) then) =
      _$BlockchainNetworkCopyWithImpl<$Res, BlockchainNetwork>;
  @useResult
  $Res call({String id, String namespace, String reference});
}

/// @nodoc
class _$BlockchainNetworkCopyWithImpl<$Res, $Val extends BlockchainNetwork>
    implements $BlockchainNetworkCopyWith<$Res> {
  _$BlockchainNetworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockchainNetwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namespace = null,
    Object? reference = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namespace: null == namespace
          ? _value.namespace
          : namespace // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockchainNetworkImplCopyWith<$Res>
    implements $BlockchainNetworkCopyWith<$Res> {
  factory _$$BlockchainNetworkImplCopyWith(_$BlockchainNetworkImpl value,
          $Res Function(_$BlockchainNetworkImpl) then) =
      __$$BlockchainNetworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String namespace, String reference});
}

/// @nodoc
class __$$BlockchainNetworkImplCopyWithImpl<$Res>
    extends _$BlockchainNetworkCopyWithImpl<$Res, _$BlockchainNetworkImpl>
    implements _$$BlockchainNetworkImplCopyWith<$Res> {
  __$$BlockchainNetworkImplCopyWithImpl(_$BlockchainNetworkImpl _value,
      $Res Function(_$BlockchainNetworkImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlockchainNetwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namespace = null,
    Object? reference = null,
  }) {
    return _then(_$BlockchainNetworkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namespace: null == namespace
          ? _value.namespace
          : namespace // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$BlockchainNetworkImpl extends _BlockchainNetwork {
  const _$BlockchainNetworkImpl(
      {required this.id, required this.namespace, required this.reference})
      : super._();

  factory _$BlockchainNetworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockchainNetworkImplFromJson(json);

  @override
  final String id;
  @override
  final String namespace;
  @override
  final String reference;

  @override
  String toString() {
    return 'BlockchainNetwork(id: $id, namespace: $namespace, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockchainNetworkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namespace, namespace) ||
                other.namespace == namespace) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, namespace, reference);

  /// Create a copy of BlockchainNetwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockchainNetworkImplCopyWith<_$BlockchainNetworkImpl> get copyWith =>
      __$$BlockchainNetworkImplCopyWithImpl<_$BlockchainNetworkImpl>(
          this, _$identity);
}

abstract class _BlockchainNetwork extends BlockchainNetwork {
  const factory _BlockchainNetwork(
      {required final String id,
      required final String namespace,
      required final String reference}) = _$BlockchainNetworkImpl;
  const _BlockchainNetwork._() : super._();

  factory _BlockchainNetwork.fromJson(Map<String, dynamic> json) =
      _$BlockchainNetworkImpl.fromJson;

  @override
  String get id;
  @override
  String get namespace;
  @override
  String get reference;

  /// Create a copy of BlockchainNetwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockchainNetworkImplCopyWith<_$BlockchainNetworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
