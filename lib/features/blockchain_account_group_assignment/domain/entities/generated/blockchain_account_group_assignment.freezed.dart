// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../blockchain_account_group_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlockchainAccountGroupAssignment _$BlockchainAccountGroupAssignmentFromJson(
    Map<String, dynamic> json) {
  return _BlockchainAccountGroupAssignment.fromJson(json);
}

/// @nodoc
mixin _$BlockchainAccountGroupAssignment {
  String get blockchainAccountGroupId => throw _privateConstructorUsedError;
  String get blockchainAccountId => throw _privateConstructorUsedError;

  /// Serializes this BlockchainAccountGroupAssignment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlockchainAccountGroupAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockchainAccountGroupAssignmentCopyWith<BlockchainAccountGroupAssignment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainAccountGroupAssignmentCopyWith<$Res> {
  factory $BlockchainAccountGroupAssignmentCopyWith(
          BlockchainAccountGroupAssignment value,
          $Res Function(BlockchainAccountGroupAssignment) then) =
      _$BlockchainAccountGroupAssignmentCopyWithImpl<$Res,
          BlockchainAccountGroupAssignment>;
  @useResult
  $Res call({String blockchainAccountGroupId, String blockchainAccountId});
}

/// @nodoc
class _$BlockchainAccountGroupAssignmentCopyWithImpl<$Res,
        $Val extends BlockchainAccountGroupAssignment>
    implements $BlockchainAccountGroupAssignmentCopyWith<$Res> {
  _$BlockchainAccountGroupAssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockchainAccountGroupAssignment
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
abstract class _$$BlockchainAccountGroupAssignmentImplCopyWith<$Res>
    implements $BlockchainAccountGroupAssignmentCopyWith<$Res> {
  factory _$$BlockchainAccountGroupAssignmentImplCopyWith(
          _$BlockchainAccountGroupAssignmentImpl value,
          $Res Function(_$BlockchainAccountGroupAssignmentImpl) then) =
      __$$BlockchainAccountGroupAssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String blockchainAccountGroupId, String blockchainAccountId});
}

/// @nodoc
class __$$BlockchainAccountGroupAssignmentImplCopyWithImpl<$Res>
    extends _$BlockchainAccountGroupAssignmentCopyWithImpl<$Res,
        _$BlockchainAccountGroupAssignmentImpl>
    implements _$$BlockchainAccountGroupAssignmentImplCopyWith<$Res> {
  __$$BlockchainAccountGroupAssignmentImplCopyWithImpl(
      _$BlockchainAccountGroupAssignmentImpl _value,
      $Res Function(_$BlockchainAccountGroupAssignmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlockchainAccountGroupAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchainAccountGroupId = null,
    Object? blockchainAccountId = null,
  }) {
    return _then(_$BlockchainAccountGroupAssignmentImpl(
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
class _$BlockchainAccountGroupAssignmentImpl
    extends _BlockchainAccountGroupAssignment {
  const _$BlockchainAccountGroupAssignmentImpl(
      {required this.blockchainAccountGroupId,
      required this.blockchainAccountId})
      : super._();

  factory _$BlockchainAccountGroupAssignmentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BlockchainAccountGroupAssignmentImplFromJson(json);

  @override
  final String blockchainAccountGroupId;
  @override
  final String blockchainAccountId;

  @override
  String toString() {
    return 'BlockchainAccountGroupAssignment(blockchainAccountGroupId: $blockchainAccountGroupId, blockchainAccountId: $blockchainAccountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockchainAccountGroupAssignmentImpl &&
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

  /// Create a copy of BlockchainAccountGroupAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockchainAccountGroupAssignmentImplCopyWith<
          _$BlockchainAccountGroupAssignmentImpl>
      get copyWith => __$$BlockchainAccountGroupAssignmentImplCopyWithImpl<
          _$BlockchainAccountGroupAssignmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockchainAccountGroupAssignmentImplToJson(
      this,
    );
  }
}

abstract class _BlockchainAccountGroupAssignment
    extends BlockchainAccountGroupAssignment {
  const factory _BlockchainAccountGroupAssignment(
          {required final String blockchainAccountGroupId,
          required final String blockchainAccountId}) =
      _$BlockchainAccountGroupAssignmentImpl;
  const _BlockchainAccountGroupAssignment._() : super._();

  factory _BlockchainAccountGroupAssignment.fromJson(
          Map<String, dynamic> json) =
      _$BlockchainAccountGroupAssignmentImpl.fromJson;

  @override
  String get blockchainAccountGroupId;
  @override
  String get blockchainAccountId;

  /// Create a copy of BlockchainAccountGroupAssignment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockchainAccountGroupAssignmentImplCopyWith<
          _$BlockchainAccountGroupAssignmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
