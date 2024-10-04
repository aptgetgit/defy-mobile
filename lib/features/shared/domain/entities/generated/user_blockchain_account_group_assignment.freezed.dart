// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_blockchain_account_group_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBlockchainAccountGroupAssignment
    _$UserBlockchainAccountGroupAssignmentFromJson(Map<String, dynamic> json) {
  return _UserBlockchainAccountGroupAssignment.fromJson(json);
}

/// @nodoc
mixin _$UserBlockchainAccountGroupAssignment {
  String get blockchainAccountGroupId => throw _privateConstructorUsedError;
  String get blockchainAccountId => throw _privateConstructorUsedError;

  /// Serializes this UserBlockchainAccountGroupAssignment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBlockchainAccountGroupAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBlockchainAccountGroupAssignmentCopyWith<
          UserBlockchainAccountGroupAssignment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlockchainAccountGroupAssignmentCopyWith<$Res> {
  factory $UserBlockchainAccountGroupAssignmentCopyWith(
          UserBlockchainAccountGroupAssignment value,
          $Res Function(UserBlockchainAccountGroupAssignment) then) =
      _$UserBlockchainAccountGroupAssignmentCopyWithImpl<$Res,
          UserBlockchainAccountGroupAssignment>;
  @useResult
  $Res call({String blockchainAccountGroupId, String blockchainAccountId});
}

/// @nodoc
class _$UserBlockchainAccountGroupAssignmentCopyWithImpl<$Res,
        $Val extends UserBlockchainAccountGroupAssignment>
    implements $UserBlockchainAccountGroupAssignmentCopyWith<$Res> {
  _$UserBlockchainAccountGroupAssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBlockchainAccountGroupAssignment
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
abstract class _$$UserBlockchainAccountGroupAssignmentImplCopyWith<$Res>
    implements $UserBlockchainAccountGroupAssignmentCopyWith<$Res> {
  factory _$$UserBlockchainAccountGroupAssignmentImplCopyWith(
          _$UserBlockchainAccountGroupAssignmentImpl value,
          $Res Function(_$UserBlockchainAccountGroupAssignmentImpl) then) =
      __$$UserBlockchainAccountGroupAssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String blockchainAccountGroupId, String blockchainAccountId});
}

/// @nodoc
class __$$UserBlockchainAccountGroupAssignmentImplCopyWithImpl<$Res>
    extends _$UserBlockchainAccountGroupAssignmentCopyWithImpl<$Res,
        _$UserBlockchainAccountGroupAssignmentImpl>
    implements _$$UserBlockchainAccountGroupAssignmentImplCopyWith<$Res> {
  __$$UserBlockchainAccountGroupAssignmentImplCopyWithImpl(
      _$UserBlockchainAccountGroupAssignmentImpl _value,
      $Res Function(_$UserBlockchainAccountGroupAssignmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBlockchainAccountGroupAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchainAccountGroupId = null,
    Object? blockchainAccountId = null,
  }) {
    return _then(_$UserBlockchainAccountGroupAssignmentImpl(
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
class _$UserBlockchainAccountGroupAssignmentImpl
    extends _UserBlockchainAccountGroupAssignment {
  const _$UserBlockchainAccountGroupAssignmentImpl(
      {required this.blockchainAccountGroupId,
      required this.blockchainAccountId})
      : super._();

  factory _$UserBlockchainAccountGroupAssignmentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserBlockchainAccountGroupAssignmentImplFromJson(json);

  @override
  final String blockchainAccountGroupId;
  @override
  final String blockchainAccountId;

  @override
  String toString() {
    return 'UserBlockchainAccountGroupAssignment(blockchainAccountGroupId: $blockchainAccountGroupId, blockchainAccountId: $blockchainAccountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBlockchainAccountGroupAssignmentImpl &&
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

  /// Create a copy of UserBlockchainAccountGroupAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBlockchainAccountGroupAssignmentImplCopyWith<
          _$UserBlockchainAccountGroupAssignmentImpl>
      get copyWith => __$$UserBlockchainAccountGroupAssignmentImplCopyWithImpl<
          _$UserBlockchainAccountGroupAssignmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBlockchainAccountGroupAssignmentImplToJson(
      this,
    );
  }
}

abstract class _UserBlockchainAccountGroupAssignment
    extends UserBlockchainAccountGroupAssignment {
  const factory _UserBlockchainAccountGroupAssignment(
          {required final String blockchainAccountGroupId,
          required final String blockchainAccountId}) =
      _$UserBlockchainAccountGroupAssignmentImpl;
  const _UserBlockchainAccountGroupAssignment._() : super._();

  factory _UserBlockchainAccountGroupAssignment.fromJson(
          Map<String, dynamic> json) =
      _$UserBlockchainAccountGroupAssignmentImpl.fromJson;

  @override
  String get blockchainAccountGroupId;
  @override
  String get blockchainAccountId;

  /// Create a copy of UserBlockchainAccountGroupAssignment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBlockchainAccountGroupAssignmentImplCopyWith<
          _$UserBlockchainAccountGroupAssignmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
