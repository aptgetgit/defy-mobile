// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../network_config_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NetworkConfigRemoteModel _$NetworkConfigRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _NetworkConfigRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$NetworkConfigRemoteModel {
  String get namespace => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'rpcUrl')
  String get rpcUrl => throw _privateConstructorUsedError;

  /// Serializes this NetworkConfigRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NetworkConfigRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkConfigRemoteModelCopyWith<NetworkConfigRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkConfigRemoteModelCopyWith<$Res> {
  factory $NetworkConfigRemoteModelCopyWith(NetworkConfigRemoteModel value,
          $Res Function(NetworkConfigRemoteModel) then) =
      _$NetworkConfigRemoteModelCopyWithImpl<$Res, NetworkConfigRemoteModel>;
  @useResult
  $Res call(
      {String namespace,
      String reference,
      @JsonKey(name: 'rpcUrl') String rpcUrl});
}

/// @nodoc
class _$NetworkConfigRemoteModelCopyWithImpl<$Res,
        $Val extends NetworkConfigRemoteModel>
    implements $NetworkConfigRemoteModelCopyWith<$Res> {
  _$NetworkConfigRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkConfigRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namespace = null,
    Object? reference = null,
    Object? rpcUrl = null,
  }) {
    return _then(_value.copyWith(
      namespace: null == namespace
          ? _value.namespace
          : namespace // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      rpcUrl: null == rpcUrl
          ? _value.rpcUrl
          : rpcUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkConfigRemoteModelImplCopyWith<$Res>
    implements $NetworkConfigRemoteModelCopyWith<$Res> {
  factory _$$NetworkConfigRemoteModelImplCopyWith(
          _$NetworkConfigRemoteModelImpl value,
          $Res Function(_$NetworkConfigRemoteModelImpl) then) =
      __$$NetworkConfigRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String namespace,
      String reference,
      @JsonKey(name: 'rpcUrl') String rpcUrl});
}

/// @nodoc
class __$$NetworkConfigRemoteModelImplCopyWithImpl<$Res>
    extends _$NetworkConfigRemoteModelCopyWithImpl<$Res,
        _$NetworkConfigRemoteModelImpl>
    implements _$$NetworkConfigRemoteModelImplCopyWith<$Res> {
  __$$NetworkConfigRemoteModelImplCopyWithImpl(
      _$NetworkConfigRemoteModelImpl _value,
      $Res Function(_$NetworkConfigRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkConfigRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namespace = null,
    Object? reference = null,
    Object? rpcUrl = null,
  }) {
    return _then(_$NetworkConfigRemoteModelImpl(
      namespace: null == namespace
          ? _value.namespace
          : namespace // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      rpcUrl: null == rpcUrl
          ? _value.rpcUrl
          : rpcUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkConfigRemoteModelImpl extends _NetworkConfigRemoteModel {
  const _$NetworkConfigRemoteModelImpl(
      {required this.namespace,
      required this.reference,
      @JsonKey(name: 'rpcUrl') required this.rpcUrl})
      : super._();

  factory _$NetworkConfigRemoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkConfigRemoteModelImplFromJson(json);

  @override
  final String namespace;
  @override
  final String reference;
  @override
  @JsonKey(name: 'rpcUrl')
  final String rpcUrl;

  @override
  String toString() {
    return 'NetworkConfigRemoteModel(namespace: $namespace, reference: $reference, rpcUrl: $rpcUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkConfigRemoteModelImpl &&
            (identical(other.namespace, namespace) ||
                other.namespace == namespace) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.rpcUrl, rpcUrl) || other.rpcUrl == rpcUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, namespace, reference, rpcUrl);

  /// Create a copy of NetworkConfigRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkConfigRemoteModelImplCopyWith<_$NetworkConfigRemoteModelImpl>
      get copyWith => __$$NetworkConfigRemoteModelImplCopyWithImpl<
          _$NetworkConfigRemoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkConfigRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _NetworkConfigRemoteModel extends NetworkConfigRemoteModel {
  const factory _NetworkConfigRemoteModel(
          {required final String namespace,
          required final String reference,
          @JsonKey(name: 'rpcUrl') required final String rpcUrl}) =
      _$NetworkConfigRemoteModelImpl;
  const _NetworkConfigRemoteModel._() : super._();

  factory _NetworkConfigRemoteModel.fromJson(Map<String, dynamic> json) =
      _$NetworkConfigRemoteModelImpl.fromJson;

  @override
  String get namespace;
  @override
  String get reference;
  @override
  @JsonKey(name: 'rpcUrl')
  String get rpcUrl;

  /// Create a copy of NetworkConfigRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkConfigRemoteModelImplCopyWith<_$NetworkConfigRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
