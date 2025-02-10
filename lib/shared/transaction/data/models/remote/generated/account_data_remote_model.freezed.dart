// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../account_data_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountDataRemoteModel _$AccountDataRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _AccountDataRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$AccountDataRemoteModel {
  String get sequenceNumber => throw _privateConstructorUsedError;
  String get authenticationKey => throw _privateConstructorUsedError;

  /// Create a copy of AccountDataRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountDataRemoteModelCopyWith<AccountDataRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDataRemoteModelCopyWith<$Res> {
  factory $AccountDataRemoteModelCopyWith(AccountDataRemoteModel value,
          $Res Function(AccountDataRemoteModel) then) =
      _$AccountDataRemoteModelCopyWithImpl<$Res, AccountDataRemoteModel>;
  @useResult
  $Res call({String sequenceNumber, String authenticationKey});
}

/// @nodoc
class _$AccountDataRemoteModelCopyWithImpl<$Res,
        $Val extends AccountDataRemoteModel>
    implements $AccountDataRemoteModelCopyWith<$Res> {
  _$AccountDataRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountDataRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequenceNumber = null,
    Object? authenticationKey = null,
  }) {
    return _then(_value.copyWith(
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      authenticationKey: null == authenticationKey
          ? _value.authenticationKey
          : authenticationKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountDataRemoteModelImplCopyWith<$Res>
    implements $AccountDataRemoteModelCopyWith<$Res> {
  factory _$$AccountDataRemoteModelImplCopyWith(
          _$AccountDataRemoteModelImpl value,
          $Res Function(_$AccountDataRemoteModelImpl) then) =
      __$$AccountDataRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sequenceNumber, String authenticationKey});
}

/// @nodoc
class __$$AccountDataRemoteModelImplCopyWithImpl<$Res>
    extends _$AccountDataRemoteModelCopyWithImpl<$Res,
        _$AccountDataRemoteModelImpl>
    implements _$$AccountDataRemoteModelImplCopyWith<$Res> {
  __$$AccountDataRemoteModelImplCopyWithImpl(
      _$AccountDataRemoteModelImpl _value,
      $Res Function(_$AccountDataRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountDataRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequenceNumber = null,
    Object? authenticationKey = null,
  }) {
    return _then(_$AccountDataRemoteModelImpl(
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      authenticationKey: null == authenticationKey
          ? _value.authenticationKey
          : authenticationKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AccountDataRemoteModelImpl extends _AccountDataRemoteModel {
  const _$AccountDataRemoteModelImpl(
      {required this.sequenceNumber, required this.authenticationKey})
      : super._();

  factory _$AccountDataRemoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountDataRemoteModelImplFromJson(json);

  @override
  final String sequenceNumber;
  @override
  final String authenticationKey;

  @override
  String toString() {
    return 'AccountDataRemoteModel(sequenceNumber: $sequenceNumber, authenticationKey: $authenticationKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDataRemoteModelImpl &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                other.sequenceNumber == sequenceNumber) &&
            (identical(other.authenticationKey, authenticationKey) ||
                other.authenticationKey == authenticationKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sequenceNumber, authenticationKey);

  /// Create a copy of AccountDataRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDataRemoteModelImplCopyWith<_$AccountDataRemoteModelImpl>
      get copyWith => __$$AccountDataRemoteModelImplCopyWithImpl<
          _$AccountDataRemoteModelImpl>(this, _$identity);
}

abstract class _AccountDataRemoteModel extends AccountDataRemoteModel {
  const factory _AccountDataRemoteModel(
      {required final String sequenceNumber,
      required final String authenticationKey}) = _$AccountDataRemoteModelImpl;
  const _AccountDataRemoteModel._() : super._();

  factory _AccountDataRemoteModel.fromJson(Map<String, dynamic> json) =
      _$AccountDataRemoteModelImpl.fromJson;

  @override
  String get sequenceNumber;
  @override
  String get authenticationKey;

  /// Create a copy of AccountDataRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountDataRemoteModelImplCopyWith<_$AccountDataRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
