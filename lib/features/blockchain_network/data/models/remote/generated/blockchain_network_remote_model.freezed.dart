// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../blockchain_network_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlockchainNetworkRemoteModel _$BlockchainNetworkRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _BlockchainNetworkRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$BlockchainNetworkRemoteModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'namespace')
  String get namespace => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference')
  String get reference => throw _privateConstructorUsedError;

  /// Serializes this BlockchainNetworkRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlockchainNetworkRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockchainNetworkRemoteModelCopyWith<BlockchainNetworkRemoteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainNetworkRemoteModelCopyWith<$Res> {
  factory $BlockchainNetworkRemoteModelCopyWith(
          BlockchainNetworkRemoteModel value,
          $Res Function(BlockchainNetworkRemoteModel) then) =
      _$BlockchainNetworkRemoteModelCopyWithImpl<$Res,
          BlockchainNetworkRemoteModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'namespace') String namespace,
      @JsonKey(name: 'reference') String reference});
}

/// @nodoc
class _$BlockchainNetworkRemoteModelCopyWithImpl<$Res,
        $Val extends BlockchainNetworkRemoteModel>
    implements $BlockchainNetworkRemoteModelCopyWith<$Res> {
  _$BlockchainNetworkRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockchainNetworkRemoteModel
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
abstract class _$$BlockchainNetworkRemoteModelImplCopyWith<$Res>
    implements $BlockchainNetworkRemoteModelCopyWith<$Res> {
  factory _$$BlockchainNetworkRemoteModelImplCopyWith(
          _$BlockchainNetworkRemoteModelImpl value,
          $Res Function(_$BlockchainNetworkRemoteModelImpl) then) =
      __$$BlockchainNetworkRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'namespace') String namespace,
      @JsonKey(name: 'reference') String reference});
}

/// @nodoc
class __$$BlockchainNetworkRemoteModelImplCopyWithImpl<$Res>
    extends _$BlockchainNetworkRemoteModelCopyWithImpl<$Res,
        _$BlockchainNetworkRemoteModelImpl>
    implements _$$BlockchainNetworkRemoteModelImplCopyWith<$Res> {
  __$$BlockchainNetworkRemoteModelImplCopyWithImpl(
      _$BlockchainNetworkRemoteModelImpl _value,
      $Res Function(_$BlockchainNetworkRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlockchainNetworkRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namespace = null,
    Object? reference = null,
  }) {
    return _then(_$BlockchainNetworkRemoteModelImpl(
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
@JsonSerializable()
class _$BlockchainNetworkRemoteModelImpl extends _BlockchainNetworkRemoteModel {
  const _$BlockchainNetworkRemoteModelImpl(
      {required this.id,
      @JsonKey(name: 'namespace') required this.namespace,
      @JsonKey(name: 'reference') required this.reference})
      : super._();

  factory _$BlockchainNetworkRemoteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BlockchainNetworkRemoteModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'namespace')
  final String namespace;
  @override
  @JsonKey(name: 'reference')
  final String reference;

  @override
  String toString() {
    return 'BlockchainNetworkRemoteModel(id: $id, namespace: $namespace, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockchainNetworkRemoteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namespace, namespace) ||
                other.namespace == namespace) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, namespace, reference);

  /// Create a copy of BlockchainNetworkRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockchainNetworkRemoteModelImplCopyWith<
          _$BlockchainNetworkRemoteModelImpl>
      get copyWith => __$$BlockchainNetworkRemoteModelImplCopyWithImpl<
          _$BlockchainNetworkRemoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockchainNetworkRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _BlockchainNetworkRemoteModel
    extends BlockchainNetworkRemoteModel {
  const factory _BlockchainNetworkRemoteModel(
          {required final String id,
          @JsonKey(name: 'namespace') required final String namespace,
          @JsonKey(name: 'reference') required final String reference}) =
      _$BlockchainNetworkRemoteModelImpl;
  const _BlockchainNetworkRemoteModel._() : super._();

  factory _BlockchainNetworkRemoteModel.fromJson(Map<String, dynamic> json) =
      _$BlockchainNetworkRemoteModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'namespace')
  String get namespace;
  @override
  @JsonKey(name: 'reference')
  String get reference;

  /// Create a copy of BlockchainNetworkRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockchainNetworkRemoteModelImplCopyWith<
          _$BlockchainNetworkRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
