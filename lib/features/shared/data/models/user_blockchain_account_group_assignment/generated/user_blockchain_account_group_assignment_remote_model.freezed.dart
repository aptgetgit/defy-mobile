// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_blockchain_account_group_assignment_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBlockchainAccountGroupAssignmentRemoteModel
    _$UserBlockchainAccountGroupAssignmentRemoteModelFromJson(
        Map<String, dynamic> json) {
  return _UserBlockchainAccountGroupAssignmentRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$UserBlockchainAccountGroupAssignmentRemoteModel {
  @JsonKey(name: 'blockchainAccountGroupId')
  String get blockchainAccountGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'blockchainAccountId')
  String get blockchainAccountId => throw _privateConstructorUsedError;

  /// Serializes this UserBlockchainAccountGroupAssignmentRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBlockchainAccountGroupAssignmentRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBlockchainAccountGroupAssignmentRemoteModelCopyWith<
          UserBlockchainAccountGroupAssignmentRemoteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlockchainAccountGroupAssignmentRemoteModelCopyWith<$Res> {
  factory $UserBlockchainAccountGroupAssignmentRemoteModelCopyWith(
          UserBlockchainAccountGroupAssignmentRemoteModel value,
          $Res Function(UserBlockchainAccountGroupAssignmentRemoteModel) then) =
      _$UserBlockchainAccountGroupAssignmentRemoteModelCopyWithImpl<$Res,
          UserBlockchainAccountGroupAssignmentRemoteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'blockchainAccountGroupId')
      String blockchainAccountGroupId,
      @JsonKey(name: 'blockchainAccountId') String blockchainAccountId});
}

/// @nodoc
class _$UserBlockchainAccountGroupAssignmentRemoteModelCopyWithImpl<$Res,
        $Val extends UserBlockchainAccountGroupAssignmentRemoteModel>
    implements $UserBlockchainAccountGroupAssignmentRemoteModelCopyWith<$Res> {
  _$UserBlockchainAccountGroupAssignmentRemoteModelCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBlockchainAccountGroupAssignmentRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchainAccountGroupId = null,
    Object? blockchainAccountId = null,
  }) {
    return _then(_value.copyWith(
      blockchainAccountGroupId: null == blockchainAccountGroupId
          ? _value.blockchainAccountGroupId
          : blockchainAccountGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      blockchainAccountId: null == blockchainAccountId
          ? _value.blockchainAccountId
          : blockchainAccountId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBlockchainAccountGroupAssignmentRemoteModelImplCopyWith<
        $Res>
    implements $UserBlockchainAccountGroupAssignmentRemoteModelCopyWith<$Res> {
  factory _$$UserBlockchainAccountGroupAssignmentRemoteModelImplCopyWith(
          _$UserBlockchainAccountGroupAssignmentRemoteModelImpl value,
          $Res Function(_$UserBlockchainAccountGroupAssignmentRemoteModelImpl)
              then) =
      __$$UserBlockchainAccountGroupAssignmentRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'blockchainAccountGroupId')
      String blockchainAccountGroupId,
      @JsonKey(name: 'blockchainAccountId') String blockchainAccountId});
}

/// @nodoc
class __$$UserBlockchainAccountGroupAssignmentRemoteModelImplCopyWithImpl<$Res>
    extends _$UserBlockchainAccountGroupAssignmentRemoteModelCopyWithImpl<$Res,
        _$UserBlockchainAccountGroupAssignmentRemoteModelImpl>
    implements
        _$$UserBlockchainAccountGroupAssignmentRemoteModelImplCopyWith<$Res> {
  __$$UserBlockchainAccountGroupAssignmentRemoteModelImplCopyWithImpl(
      _$UserBlockchainAccountGroupAssignmentRemoteModelImpl _value,
      $Res Function(_$UserBlockchainAccountGroupAssignmentRemoteModelImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of UserBlockchainAccountGroupAssignmentRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchainAccountGroupId = null,
    Object? blockchainAccountId = null,
  }) {
    return _then(_$UserBlockchainAccountGroupAssignmentRemoteModelImpl(
      blockchainAccountGroupId: null == blockchainAccountGroupId
          ? _value.blockchainAccountGroupId
          : blockchainAccountGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      blockchainAccountId: null == blockchainAccountId
          ? _value.blockchainAccountId
          : blockchainAccountId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBlockchainAccountGroupAssignmentRemoteModelImpl
    extends _UserBlockchainAccountGroupAssignmentRemoteModel {
  const _$UserBlockchainAccountGroupAssignmentRemoteModelImpl(
      {@JsonKey(name: 'blockchainAccountGroupId')
      required this.blockchainAccountGroupId,
      @JsonKey(name: 'blockchainAccountId') required this.blockchainAccountId})
      : super._();

  factory _$UserBlockchainAccountGroupAssignmentRemoteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserBlockchainAccountGroupAssignmentRemoteModelImplFromJson(json);

  @override
  @JsonKey(name: 'blockchainAccountGroupId')
  final String blockchainAccountGroupId;
  @override
  @JsonKey(name: 'blockchainAccountId')
  final String blockchainAccountId;

  @override
  String toString() {
    return 'UserBlockchainAccountGroupAssignmentRemoteModel(blockchainAccountGroupId: $blockchainAccountGroupId, blockchainAccountId: $blockchainAccountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBlockchainAccountGroupAssignmentRemoteModelImpl &&
            (identical(
                    other.blockchainAccountGroupId, blockchainAccountGroupId) ||
                other.blockchainAccountGroupId == blockchainAccountGroupId) &&
            (identical(other.blockchainAccountId, blockchainAccountId) ||
                other.blockchainAccountId == blockchainAccountId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, blockchainAccountGroupId, blockchainAccountId);

  /// Create a copy of UserBlockchainAccountGroupAssignmentRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBlockchainAccountGroupAssignmentRemoteModelImplCopyWith<
          _$UserBlockchainAccountGroupAssignmentRemoteModelImpl>
      get copyWith =>
          __$$UserBlockchainAccountGroupAssignmentRemoteModelImplCopyWithImpl<
                  _$UserBlockchainAccountGroupAssignmentRemoteModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBlockchainAccountGroupAssignmentRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _UserBlockchainAccountGroupAssignmentRemoteModel
    extends UserBlockchainAccountGroupAssignmentRemoteModel {
  const factory _UserBlockchainAccountGroupAssignmentRemoteModel(
          {@JsonKey(name: 'blockchainAccountGroupId')
          required final String blockchainAccountGroupId,
          @JsonKey(name: 'blockchainAccountId')
          required final String blockchainAccountId}) =
      _$UserBlockchainAccountGroupAssignmentRemoteModelImpl;
  const _UserBlockchainAccountGroupAssignmentRemoteModel._() : super._();

  factory _UserBlockchainAccountGroupAssignmentRemoteModel.fromJson(
          Map<String, dynamic> json) =
      _$UserBlockchainAccountGroupAssignmentRemoteModelImpl.fromJson;

  @override
  @JsonKey(name: 'blockchainAccountGroupId')
  String get blockchainAccountGroupId;
  @override
  @JsonKey(name: 'blockchainAccountId')
  String get blockchainAccountId;

  /// Create a copy of UserBlockchainAccountGroupAssignmentRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBlockchainAccountGroupAssignmentRemoteModelImplCopyWith<
          _$UserBlockchainAccountGroupAssignmentRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
