// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_blockchain_account_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBlockchainAccountRemoteModel _$UserBlockchainAccountRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _UserBlockchainAccountRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$UserBlockchainAccountRemoteModel {
  String get id => throw _privateConstructorUsedError;
  String get blockchainNetworkId => throw _privateConstructorUsedError;
  String get accountAddress => throw _privateConstructorUsedError;

  /// Serializes this UserBlockchainAccountRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBlockchainAccountRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBlockchainAccountRemoteModelCopyWith<UserBlockchainAccountRemoteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlockchainAccountRemoteModelCopyWith<$Res> {
  factory $UserBlockchainAccountRemoteModelCopyWith(
          UserBlockchainAccountRemoteModel value,
          $Res Function(UserBlockchainAccountRemoteModel) then) =
      _$UserBlockchainAccountRemoteModelCopyWithImpl<$Res,
          UserBlockchainAccountRemoteModel>;
  @useResult
  $Res call({String id, String blockchainNetworkId, String accountAddress});
}

/// @nodoc
class _$UserBlockchainAccountRemoteModelCopyWithImpl<$Res,
        $Val extends UserBlockchainAccountRemoteModel>
    implements $UserBlockchainAccountRemoteModelCopyWith<$Res> {
  _$UserBlockchainAccountRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBlockchainAccountRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? blockchainNetworkId = null,
    Object? accountAddress = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      blockchainNetworkId: null == blockchainNetworkId
          ? _value.blockchainNetworkId
          : blockchainNetworkId // ignore: cast_nullable_to_non_nullable
              as String,
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBlockchainAccountRemoteModelImplCopyWith<$Res>
    implements $UserBlockchainAccountRemoteModelCopyWith<$Res> {
  factory _$$UserBlockchainAccountRemoteModelImplCopyWith(
          _$UserBlockchainAccountRemoteModelImpl value,
          $Res Function(_$UserBlockchainAccountRemoteModelImpl) then) =
      __$$UserBlockchainAccountRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String blockchainNetworkId, String accountAddress});
}

/// @nodoc
class __$$UserBlockchainAccountRemoteModelImplCopyWithImpl<$Res>
    extends _$UserBlockchainAccountRemoteModelCopyWithImpl<$Res,
        _$UserBlockchainAccountRemoteModelImpl>
    implements _$$UserBlockchainAccountRemoteModelImplCopyWith<$Res> {
  __$$UserBlockchainAccountRemoteModelImplCopyWithImpl(
      _$UserBlockchainAccountRemoteModelImpl _value,
      $Res Function(_$UserBlockchainAccountRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBlockchainAccountRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? blockchainNetworkId = null,
    Object? accountAddress = null,
  }) {
    return _then(_$UserBlockchainAccountRemoteModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      blockchainNetworkId: null == blockchainNetworkId
          ? _value.blockchainNetworkId
          : blockchainNetworkId // ignore: cast_nullable_to_non_nullable
              as String,
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBlockchainAccountRemoteModelImpl
    extends _UserBlockchainAccountRemoteModel {
  const _$UserBlockchainAccountRemoteModelImpl(
      {required this.id,
      required this.blockchainNetworkId,
      required this.accountAddress})
      : super._();

  factory _$UserBlockchainAccountRemoteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserBlockchainAccountRemoteModelImplFromJson(json);

  @override
  final String id;
  @override
  final String blockchainNetworkId;
  @override
  final String accountAddress;

  @override
  String toString() {
    return 'UserBlockchainAccountRemoteModel(id: $id, blockchainNetworkId: $blockchainNetworkId, accountAddress: $accountAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBlockchainAccountRemoteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.blockchainNetworkId, blockchainNetworkId) ||
                other.blockchainNetworkId == blockchainNetworkId) &&
            (identical(other.accountAddress, accountAddress) ||
                other.accountAddress == accountAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, blockchainNetworkId, accountAddress);

  /// Create a copy of UserBlockchainAccountRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBlockchainAccountRemoteModelImplCopyWith<
          _$UserBlockchainAccountRemoteModelImpl>
      get copyWith => __$$UserBlockchainAccountRemoteModelImplCopyWithImpl<
          _$UserBlockchainAccountRemoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBlockchainAccountRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _UserBlockchainAccountRemoteModel
    extends UserBlockchainAccountRemoteModel {
  const factory _UserBlockchainAccountRemoteModel(
          {required final String id,
          required final String blockchainNetworkId,
          required final String accountAddress}) =
      _$UserBlockchainAccountRemoteModelImpl;
  const _UserBlockchainAccountRemoteModel._() : super._();

  factory _UserBlockchainAccountRemoteModel.fromJson(
          Map<String, dynamic> json) =
      _$UserBlockchainAccountRemoteModelImpl.fromJson;

  @override
  String get id;
  @override
  String get blockchainNetworkId;
  @override
  String get accountAddress;

  /// Create a copy of UserBlockchainAccountRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBlockchainAccountRemoteModelImplCopyWith<
          _$UserBlockchainAccountRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateUserBlockchainAccountRemoteRequest
    _$CreateUserBlockchainAccountRemoteRequestFromJson(
        Map<String, dynamic> json) {
  return _CreateUserBlockchainAccountRemoteRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateUserBlockchainAccountRemoteRequest {
  String get blockchainNetworkId => throw _privateConstructorUsedError;
  String get accountAddress => throw _privateConstructorUsedError;

  /// Serializes this CreateUserBlockchainAccountRemoteRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateUserBlockchainAccountRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateUserBlockchainAccountRemoteRequestCopyWith<
          CreateUserBlockchainAccountRemoteRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserBlockchainAccountRemoteRequestCopyWith<$Res> {
  factory $CreateUserBlockchainAccountRemoteRequestCopyWith(
          CreateUserBlockchainAccountRemoteRequest value,
          $Res Function(CreateUserBlockchainAccountRemoteRequest) then) =
      _$CreateUserBlockchainAccountRemoteRequestCopyWithImpl<$Res,
          CreateUserBlockchainAccountRemoteRequest>;
  @useResult
  $Res call({String blockchainNetworkId, String accountAddress});
}

/// @nodoc
class _$CreateUserBlockchainAccountRemoteRequestCopyWithImpl<$Res,
        $Val extends CreateUserBlockchainAccountRemoteRequest>
    implements $CreateUserBlockchainAccountRemoteRequestCopyWith<$Res> {
  _$CreateUserBlockchainAccountRemoteRequestCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateUserBlockchainAccountRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchainNetworkId = null,
    Object? accountAddress = null,
  }) {
    return _then(_value.copyWith(
      blockchainNetworkId: null == blockchainNetworkId
          ? _value.blockchainNetworkId
          : blockchainNetworkId // ignore: cast_nullable_to_non_nullable
              as String,
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateUserBlockchainAccountRemoteRequestImplCopyWith<$Res>
    implements $CreateUserBlockchainAccountRemoteRequestCopyWith<$Res> {
  factory _$$CreateUserBlockchainAccountRemoteRequestImplCopyWith(
          _$CreateUserBlockchainAccountRemoteRequestImpl value,
          $Res Function(_$CreateUserBlockchainAccountRemoteRequestImpl) then) =
      __$$CreateUserBlockchainAccountRemoteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String blockchainNetworkId, String accountAddress});
}

/// @nodoc
class __$$CreateUserBlockchainAccountRemoteRequestImplCopyWithImpl<$Res>
    extends _$CreateUserBlockchainAccountRemoteRequestCopyWithImpl<$Res,
        _$CreateUserBlockchainAccountRemoteRequestImpl>
    implements _$$CreateUserBlockchainAccountRemoteRequestImplCopyWith<$Res> {
  __$$CreateUserBlockchainAccountRemoteRequestImplCopyWithImpl(
      _$CreateUserBlockchainAccountRemoteRequestImpl _value,
      $Res Function(_$CreateUserBlockchainAccountRemoteRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateUserBlockchainAccountRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchainNetworkId = null,
    Object? accountAddress = null,
  }) {
    return _then(_$CreateUserBlockchainAccountRemoteRequestImpl(
      blockchainNetworkId: null == blockchainNetworkId
          ? _value.blockchainNetworkId
          : blockchainNetworkId // ignore: cast_nullable_to_non_nullable
              as String,
      accountAddress: null == accountAddress
          ? _value.accountAddress
          : accountAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateUserBlockchainAccountRemoteRequestImpl
    implements _CreateUserBlockchainAccountRemoteRequest {
  const _$CreateUserBlockchainAccountRemoteRequestImpl(
      {required this.blockchainNetworkId, required this.accountAddress});

  factory _$CreateUserBlockchainAccountRemoteRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateUserBlockchainAccountRemoteRequestImplFromJson(json);

  @override
  final String blockchainNetworkId;
  @override
  final String accountAddress;

  @override
  String toString() {
    return 'CreateUserBlockchainAccountRemoteRequest(blockchainNetworkId: $blockchainNetworkId, accountAddress: $accountAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserBlockchainAccountRemoteRequestImpl &&
            (identical(other.blockchainNetworkId, blockchainNetworkId) ||
                other.blockchainNetworkId == blockchainNetworkId) &&
            (identical(other.accountAddress, accountAddress) ||
                other.accountAddress == accountAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, blockchainNetworkId, accountAddress);

  /// Create a copy of CreateUserBlockchainAccountRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserBlockchainAccountRemoteRequestImplCopyWith<
          _$CreateUserBlockchainAccountRemoteRequestImpl>
      get copyWith =>
          __$$CreateUserBlockchainAccountRemoteRequestImplCopyWithImpl<
              _$CreateUserBlockchainAccountRemoteRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateUserBlockchainAccountRemoteRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateUserBlockchainAccountRemoteRequest
    implements CreateUserBlockchainAccountRemoteRequest {
  const factory _CreateUserBlockchainAccountRemoteRequest(
          {required final String blockchainNetworkId,
          required final String accountAddress}) =
      _$CreateUserBlockchainAccountRemoteRequestImpl;

  factory _CreateUserBlockchainAccountRemoteRequest.fromJson(
          Map<String, dynamic> json) =
      _$CreateUserBlockchainAccountRemoteRequestImpl.fromJson;

  @override
  String get blockchainNetworkId;
  @override
  String get accountAddress;

  /// Create a copy of CreateUserBlockchainAccountRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateUserBlockchainAccountRemoteRequestImplCopyWith<
          _$CreateUserBlockchainAccountRemoteRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
