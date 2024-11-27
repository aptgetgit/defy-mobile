// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../blockchain_account_group_assignment_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlockchainAccountGroupAssignmentRemoteModel
    _$BlockchainAccountGroupAssignmentRemoteModelFromJson(
        Map<String, dynamic> json) {
  return _BlockchainAccountGroupAssignmentRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$BlockchainAccountGroupAssignmentRemoteModel {
  @JsonKey(name: 'blockchainAccountGroupId')
  String get blockchainAccountGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'blockchainAccountId')
  String get blockchainAccountId => throw _privateConstructorUsedError;

  /// Serializes this BlockchainAccountGroupAssignmentRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlockchainAccountGroupAssignmentRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockchainAccountGroupAssignmentRemoteModelCopyWith<
          BlockchainAccountGroupAssignmentRemoteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainAccountGroupAssignmentRemoteModelCopyWith<$Res> {
  factory $BlockchainAccountGroupAssignmentRemoteModelCopyWith(
          BlockchainAccountGroupAssignmentRemoteModel value,
          $Res Function(BlockchainAccountGroupAssignmentRemoteModel) then) =
      _$BlockchainAccountGroupAssignmentRemoteModelCopyWithImpl<$Res,
          BlockchainAccountGroupAssignmentRemoteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'blockchainAccountGroupId')
      String blockchainAccountGroupId,
      @JsonKey(name: 'blockchainAccountId') String blockchainAccountId});
}

/// @nodoc
class _$BlockchainAccountGroupAssignmentRemoteModelCopyWithImpl<$Res,
        $Val extends BlockchainAccountGroupAssignmentRemoteModel>
    implements $BlockchainAccountGroupAssignmentRemoteModelCopyWith<$Res> {
  _$BlockchainAccountGroupAssignmentRemoteModelCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockchainAccountGroupAssignmentRemoteModel
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
abstract class _$$BlockchainAccountGroupAssignmentRemoteModelImplCopyWith<$Res>
    implements $BlockchainAccountGroupAssignmentRemoteModelCopyWith<$Res> {
  factory _$$BlockchainAccountGroupAssignmentRemoteModelImplCopyWith(
          _$BlockchainAccountGroupAssignmentRemoteModelImpl value,
          $Res Function(_$BlockchainAccountGroupAssignmentRemoteModelImpl)
              then) =
      __$$BlockchainAccountGroupAssignmentRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'blockchainAccountGroupId')
      String blockchainAccountGroupId,
      @JsonKey(name: 'blockchainAccountId') String blockchainAccountId});
}

/// @nodoc
class __$$BlockchainAccountGroupAssignmentRemoteModelImplCopyWithImpl<$Res>
    extends _$BlockchainAccountGroupAssignmentRemoteModelCopyWithImpl<$Res,
        _$BlockchainAccountGroupAssignmentRemoteModelImpl>
    implements
        _$$BlockchainAccountGroupAssignmentRemoteModelImplCopyWith<$Res> {
  __$$BlockchainAccountGroupAssignmentRemoteModelImplCopyWithImpl(
      _$BlockchainAccountGroupAssignmentRemoteModelImpl _value,
      $Res Function(_$BlockchainAccountGroupAssignmentRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlockchainAccountGroupAssignmentRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchainAccountGroupId = null,
    Object? blockchainAccountId = null,
  }) {
    return _then(_$BlockchainAccountGroupAssignmentRemoteModelImpl(
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
class _$BlockchainAccountGroupAssignmentRemoteModelImpl
    extends _BlockchainAccountGroupAssignmentRemoteModel {
  const _$BlockchainAccountGroupAssignmentRemoteModelImpl(
      {@JsonKey(name: 'blockchainAccountGroupId')
      required this.blockchainAccountGroupId,
      @JsonKey(name: 'blockchainAccountId') required this.blockchainAccountId})
      : super._();

  factory _$BlockchainAccountGroupAssignmentRemoteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BlockchainAccountGroupAssignmentRemoteModelImplFromJson(json);

  @override
  @JsonKey(name: 'blockchainAccountGroupId')
  final String blockchainAccountGroupId;
  @override
  @JsonKey(name: 'blockchainAccountId')
  final String blockchainAccountId;

  @override
  String toString() {
    return 'BlockchainAccountGroupAssignmentRemoteModel(blockchainAccountGroupId: $blockchainAccountGroupId, blockchainAccountId: $blockchainAccountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockchainAccountGroupAssignmentRemoteModelImpl &&
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

  /// Create a copy of BlockchainAccountGroupAssignmentRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockchainAccountGroupAssignmentRemoteModelImplCopyWith<
          _$BlockchainAccountGroupAssignmentRemoteModelImpl>
      get copyWith =>
          __$$BlockchainAccountGroupAssignmentRemoteModelImplCopyWithImpl<
                  _$BlockchainAccountGroupAssignmentRemoteModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockchainAccountGroupAssignmentRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _BlockchainAccountGroupAssignmentRemoteModel
    extends BlockchainAccountGroupAssignmentRemoteModel {
  const factory _BlockchainAccountGroupAssignmentRemoteModel(
          {@JsonKey(name: 'blockchainAccountGroupId')
          required final String blockchainAccountGroupId,
          @JsonKey(name: 'blockchainAccountId')
          required final String blockchainAccountId}) =
      _$BlockchainAccountGroupAssignmentRemoteModelImpl;
  const _BlockchainAccountGroupAssignmentRemoteModel._() : super._();

  factory _BlockchainAccountGroupAssignmentRemoteModel.fromJson(
          Map<String, dynamic> json) =
      _$BlockchainAccountGroupAssignmentRemoteModelImpl.fromJson;

  @override
  @JsonKey(name: 'blockchainAccountGroupId')
  String get blockchainAccountGroupId;
  @override
  @JsonKey(name: 'blockchainAccountId')
  String get blockchainAccountId;

  /// Create a copy of BlockchainAccountGroupAssignmentRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockchainAccountGroupAssignmentRemoteModelImplCopyWith<
          _$BlockchainAccountGroupAssignmentRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
