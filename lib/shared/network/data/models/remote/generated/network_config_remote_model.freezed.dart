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
  $Res call({String namespace, String reference, String rpcUrl});
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
  $Res call({String namespace, String reference, String rpcUrl});
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
      {required this.namespace, required this.reference, required this.rpcUrl})
      : super._();

  factory _$NetworkConfigRemoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkConfigRemoteModelImplFromJson(json);

  @override
  final String namespace;
  @override
  final String reference;
  @override
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
      required final String rpcUrl}) = _$NetworkConfigRemoteModelImpl;
  const _NetworkConfigRemoteModel._() : super._();

  factory _NetworkConfigRemoteModel.fromJson(Map<String, dynamic> json) =
      _$NetworkConfigRemoteModelImpl.fromJson;

  @override
  String get namespace;
  @override
  String get reference;
  @override
  String get rpcUrl;

  /// Create a copy of NetworkConfigRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkConfigRemoteModelImplCopyWith<_$NetworkConfigRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NetworkConfigResponseModel _$NetworkConfigResponseModelFromJson(
    Map<String, dynamic> json) {
  return _NetworkConfigResponseModel.fromJson(json);
}

/// @nodoc
mixin _$NetworkConfigResponseModel {
  List<NetworkConfigRemoteModel> get data => throw _privateConstructorUsedError;

  /// Serializes this NetworkConfigResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NetworkConfigResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkConfigResponseModelCopyWith<NetworkConfigResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkConfigResponseModelCopyWith<$Res> {
  factory $NetworkConfigResponseModelCopyWith(NetworkConfigResponseModel value,
          $Res Function(NetworkConfigResponseModel) then) =
      _$NetworkConfigResponseModelCopyWithImpl<$Res,
          NetworkConfigResponseModel>;
  @useResult
  $Res call({List<NetworkConfigRemoteModel> data});
}

/// @nodoc
class _$NetworkConfigResponseModelCopyWithImpl<$Res,
        $Val extends NetworkConfigResponseModel>
    implements $NetworkConfigResponseModelCopyWith<$Res> {
  _$NetworkConfigResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkConfigResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NetworkConfigRemoteModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkConfigResponseModelImplCopyWith<$Res>
    implements $NetworkConfigResponseModelCopyWith<$Res> {
  factory _$$NetworkConfigResponseModelImplCopyWith(
          _$NetworkConfigResponseModelImpl value,
          $Res Function(_$NetworkConfigResponseModelImpl) then) =
      __$$NetworkConfigResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NetworkConfigRemoteModel> data});
}

/// @nodoc
class __$$NetworkConfigResponseModelImplCopyWithImpl<$Res>
    extends _$NetworkConfigResponseModelCopyWithImpl<$Res,
        _$NetworkConfigResponseModelImpl>
    implements _$$NetworkConfigResponseModelImplCopyWith<$Res> {
  __$$NetworkConfigResponseModelImplCopyWithImpl(
      _$NetworkConfigResponseModelImpl _value,
      $Res Function(_$NetworkConfigResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkConfigResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$NetworkConfigResponseModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NetworkConfigRemoteModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkConfigResponseModelImpl implements _NetworkConfigResponseModel {
  const _$NetworkConfigResponseModelImpl(
      {required final List<NetworkConfigRemoteModel> data})
      : _data = data;

  factory _$NetworkConfigResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NetworkConfigResponseModelImplFromJson(json);

  final List<NetworkConfigRemoteModel> _data;
  @override
  List<NetworkConfigRemoteModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'NetworkConfigResponseModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkConfigResponseModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of NetworkConfigResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkConfigResponseModelImplCopyWith<_$NetworkConfigResponseModelImpl>
      get copyWith => __$$NetworkConfigResponseModelImplCopyWithImpl<
          _$NetworkConfigResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkConfigResponseModelImplToJson(
      this,
    );
  }
}

abstract class _NetworkConfigResponseModel
    implements NetworkConfigResponseModel {
  const factory _NetworkConfigResponseModel(
          {required final List<NetworkConfigRemoteModel> data}) =
      _$NetworkConfigResponseModelImpl;

  factory _NetworkConfigResponseModel.fromJson(Map<String, dynamic> json) =
      _$NetworkConfigResponseModelImpl.fromJson;

  @override
  List<NetworkConfigRemoteModel> get data;

  /// Create a copy of NetworkConfigResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkConfigResponseModelImplCopyWith<_$NetworkConfigResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
