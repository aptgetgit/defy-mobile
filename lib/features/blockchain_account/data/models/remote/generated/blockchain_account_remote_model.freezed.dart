// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../blockchain_account_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlockchainAccountRemoteModel _$BlockchainAccountRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _BlockchainAccountRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$BlockchainAccountRemoteModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'blockchainNetworkId')
  String get blockchainNetworkId => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountAddress')
  String get accountAddress => throw _privateConstructorUsedError;

  /// Serializes this BlockchainAccountRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlockchainAccountRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockchainAccountRemoteModelCopyWith<BlockchainAccountRemoteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainAccountRemoteModelCopyWith<$Res> {
  factory $BlockchainAccountRemoteModelCopyWith(
          BlockchainAccountRemoteModel value,
          $Res Function(BlockchainAccountRemoteModel) then) =
      _$BlockchainAccountRemoteModelCopyWithImpl<$Res,
          BlockchainAccountRemoteModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'blockchainNetworkId') String blockchainNetworkId,
      @JsonKey(name: 'accountAddress') String accountAddress});
}

/// @nodoc
class _$BlockchainAccountRemoteModelCopyWithImpl<$Res,
        $Val extends BlockchainAccountRemoteModel>
    implements $BlockchainAccountRemoteModelCopyWith<$Res> {
  _$BlockchainAccountRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockchainAccountRemoteModel
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
abstract class _$$BlockchainAccountRemoteModelImplCopyWith<$Res>
    implements $BlockchainAccountRemoteModelCopyWith<$Res> {
  factory _$$BlockchainAccountRemoteModelImplCopyWith(
          _$BlockchainAccountRemoteModelImpl value,
          $Res Function(_$BlockchainAccountRemoteModelImpl) then) =
      __$$BlockchainAccountRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'blockchainNetworkId') String blockchainNetworkId,
      @JsonKey(name: 'accountAddress') String accountAddress});
}

/// @nodoc
class __$$BlockchainAccountRemoteModelImplCopyWithImpl<$Res>
    extends _$BlockchainAccountRemoteModelCopyWithImpl<$Res,
        _$BlockchainAccountRemoteModelImpl>
    implements _$$BlockchainAccountRemoteModelImplCopyWith<$Res> {
  __$$BlockchainAccountRemoteModelImplCopyWithImpl(
      _$BlockchainAccountRemoteModelImpl _value,
      $Res Function(_$BlockchainAccountRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlockchainAccountRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? blockchainNetworkId = null,
    Object? accountAddress = null,
  }) {
    return _then(_$BlockchainAccountRemoteModelImpl(
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
class _$BlockchainAccountRemoteModelImpl extends _BlockchainAccountRemoteModel {
  const _$BlockchainAccountRemoteModelImpl(
      {required this.id,
      @JsonKey(name: 'blockchainNetworkId') required this.blockchainNetworkId,
      @JsonKey(name: 'accountAddress') required this.accountAddress})
      : super._();

  factory _$BlockchainAccountRemoteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BlockchainAccountRemoteModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'blockchainNetworkId')
  final String blockchainNetworkId;
  @override
  @JsonKey(name: 'accountAddress')
  final String accountAddress;

  @override
  String toString() {
    return 'BlockchainAccountRemoteModel(id: $id, blockchainNetworkId: $blockchainNetworkId, accountAddress: $accountAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockchainAccountRemoteModelImpl &&
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

  /// Create a copy of BlockchainAccountRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockchainAccountRemoteModelImplCopyWith<
          _$BlockchainAccountRemoteModelImpl>
      get copyWith => __$$BlockchainAccountRemoteModelImplCopyWithImpl<
          _$BlockchainAccountRemoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockchainAccountRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _BlockchainAccountRemoteModel
    extends BlockchainAccountRemoteModel {
  const factory _BlockchainAccountRemoteModel(
          {required final String id,
          @JsonKey(name: 'blockchainNetworkId')
          required final String blockchainNetworkId,
          @JsonKey(name: 'accountAddress')
          required final String accountAddress}) =
      _$BlockchainAccountRemoteModelImpl;
  const _BlockchainAccountRemoteModel._() : super._();

  factory _BlockchainAccountRemoteModel.fromJson(Map<String, dynamic> json) =
      _$BlockchainAccountRemoteModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'blockchainNetworkId')
  String get blockchainNetworkId;
  @override
  @JsonKey(name: 'accountAddress')
  String get accountAddress;

  /// Create a copy of BlockchainAccountRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockchainAccountRemoteModelImplCopyWith<
          _$BlockchainAccountRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateBlockchainAccountRemoteRequest
    _$CreateBlockchainAccountRemoteRequestFromJson(Map<String, dynamic> json) {
  return _CreateBlockchainAccountRemoteRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateBlockchainAccountRemoteRequest {
  @JsonKey(name: 'blockchainNetworkId')
  String get blockchainNetworkId => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountAddress')
  String get accountAddress => throw _privateConstructorUsedError;

  /// Serializes this CreateBlockchainAccountRemoteRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateBlockchainAccountRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateBlockchainAccountRemoteRequestCopyWith<
          CreateBlockchainAccountRemoteRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBlockchainAccountRemoteRequestCopyWith<$Res> {
  factory $CreateBlockchainAccountRemoteRequestCopyWith(
          CreateBlockchainAccountRemoteRequest value,
          $Res Function(CreateBlockchainAccountRemoteRequest) then) =
      _$CreateBlockchainAccountRemoteRequestCopyWithImpl<$Res,
          CreateBlockchainAccountRemoteRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'blockchainNetworkId') String blockchainNetworkId,
      @JsonKey(name: 'accountAddress') String accountAddress});
}

/// @nodoc
class _$CreateBlockchainAccountRemoteRequestCopyWithImpl<$Res,
        $Val extends CreateBlockchainAccountRemoteRequest>
    implements $CreateBlockchainAccountRemoteRequestCopyWith<$Res> {
  _$CreateBlockchainAccountRemoteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateBlockchainAccountRemoteRequest
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
abstract class _$$CreateBlockchainAccountRemoteRequestImplCopyWith<$Res>
    implements $CreateBlockchainAccountRemoteRequestCopyWith<$Res> {
  factory _$$CreateBlockchainAccountRemoteRequestImplCopyWith(
          _$CreateBlockchainAccountRemoteRequestImpl value,
          $Res Function(_$CreateBlockchainAccountRemoteRequestImpl) then) =
      __$$CreateBlockchainAccountRemoteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'blockchainNetworkId') String blockchainNetworkId,
      @JsonKey(name: 'accountAddress') String accountAddress});
}

/// @nodoc
class __$$CreateBlockchainAccountRemoteRequestImplCopyWithImpl<$Res>
    extends _$CreateBlockchainAccountRemoteRequestCopyWithImpl<$Res,
        _$CreateBlockchainAccountRemoteRequestImpl>
    implements _$$CreateBlockchainAccountRemoteRequestImplCopyWith<$Res> {
  __$$CreateBlockchainAccountRemoteRequestImplCopyWithImpl(
      _$CreateBlockchainAccountRemoteRequestImpl _value,
      $Res Function(_$CreateBlockchainAccountRemoteRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBlockchainAccountRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchainNetworkId = null,
    Object? accountAddress = null,
  }) {
    return _then(_$CreateBlockchainAccountRemoteRequestImpl(
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
class _$CreateBlockchainAccountRemoteRequestImpl
    implements _CreateBlockchainAccountRemoteRequest {
  const _$CreateBlockchainAccountRemoteRequestImpl(
      {@JsonKey(name: 'blockchainNetworkId') required this.blockchainNetworkId,
      @JsonKey(name: 'accountAddress') required this.accountAddress});

  factory _$CreateBlockchainAccountRemoteRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateBlockchainAccountRemoteRequestImplFromJson(json);

  @override
  @JsonKey(name: 'blockchainNetworkId')
  final String blockchainNetworkId;
  @override
  @JsonKey(name: 'accountAddress')
  final String accountAddress;

  @override
  String toString() {
    return 'CreateBlockchainAccountRemoteRequest(blockchainNetworkId: $blockchainNetworkId, accountAddress: $accountAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBlockchainAccountRemoteRequestImpl &&
            (identical(other.blockchainNetworkId, blockchainNetworkId) ||
                other.blockchainNetworkId == blockchainNetworkId) &&
            (identical(other.accountAddress, accountAddress) ||
                other.accountAddress == accountAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, blockchainNetworkId, accountAddress);

  /// Create a copy of CreateBlockchainAccountRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBlockchainAccountRemoteRequestImplCopyWith<
          _$CreateBlockchainAccountRemoteRequestImpl>
      get copyWith => __$$CreateBlockchainAccountRemoteRequestImplCopyWithImpl<
          _$CreateBlockchainAccountRemoteRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBlockchainAccountRemoteRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateBlockchainAccountRemoteRequest
    implements CreateBlockchainAccountRemoteRequest {
  const factory _CreateBlockchainAccountRemoteRequest(
          {@JsonKey(name: 'blockchainNetworkId')
          required final String blockchainNetworkId,
          @JsonKey(name: 'accountAddress')
          required final String accountAddress}) =
      _$CreateBlockchainAccountRemoteRequestImpl;

  factory _CreateBlockchainAccountRemoteRequest.fromJson(
          Map<String, dynamic> json) =
      _$CreateBlockchainAccountRemoteRequestImpl.fromJson;

  @override
  @JsonKey(name: 'blockchainNetworkId')
  String get blockchainNetworkId;
  @override
  @JsonKey(name: 'accountAddress')
  String get accountAddress;

  /// Create a copy of CreateBlockchainAccountRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateBlockchainAccountRemoteRequestImplCopyWith<
          _$CreateBlockchainAccountRemoteRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
