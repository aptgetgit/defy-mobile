// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_blockchain_account_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBlockchainAccountGroup _$UserBlockchainAccountGroupFromJson(
    Map<String, dynamic> json) {
  return _UserBlockchainAccountGroup.fromJson(json);
}

/// @nodoc
mixin _$UserBlockchainAccountGroup {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get animatedIconUrl => throw _privateConstructorUsedError;
  String get backgroundColor => throw _privateConstructorUsedError;

  /// Serializes this UserBlockchainAccountGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBlockchainAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBlockchainAccountGroupCopyWith<UserBlockchainAccountGroup>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlockchainAccountGroupCopyWith<$Res> {
  factory $UserBlockchainAccountGroupCopyWith(UserBlockchainAccountGroup value,
          $Res Function(UserBlockchainAccountGroup) then) =
      _$UserBlockchainAccountGroupCopyWithImpl<$Res,
          UserBlockchainAccountGroup>;
  @useResult
  $Res call(
      {String id, String name, String animatedIconUrl, String backgroundColor});
}

/// @nodoc
class _$UserBlockchainAccountGroupCopyWithImpl<$Res,
        $Val extends UserBlockchainAccountGroup>
    implements $UserBlockchainAccountGroupCopyWith<$Res> {
  _$UserBlockchainAccountGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBlockchainAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? animatedIconUrl = null,
    Object? backgroundColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      animatedIconUrl: null == animatedIconUrl
          ? _value.animatedIconUrl
          : animatedIconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBlockchainAccountGroupImplCopyWith<$Res>
    implements $UserBlockchainAccountGroupCopyWith<$Res> {
  factory _$$UserBlockchainAccountGroupImplCopyWith(
          _$UserBlockchainAccountGroupImpl value,
          $Res Function(_$UserBlockchainAccountGroupImpl) then) =
      __$$UserBlockchainAccountGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String animatedIconUrl, String backgroundColor});
}

/// @nodoc
class __$$UserBlockchainAccountGroupImplCopyWithImpl<$Res>
    extends _$UserBlockchainAccountGroupCopyWithImpl<$Res,
        _$UserBlockchainAccountGroupImpl>
    implements _$$UserBlockchainAccountGroupImplCopyWith<$Res> {
  __$$UserBlockchainAccountGroupImplCopyWithImpl(
      _$UserBlockchainAccountGroupImpl _value,
      $Res Function(_$UserBlockchainAccountGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBlockchainAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? animatedIconUrl = null,
    Object? backgroundColor = null,
  }) {
    return _then(_$UserBlockchainAccountGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      animatedIconUrl: null == animatedIconUrl
          ? _value.animatedIconUrl
          : animatedIconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBlockchainAccountGroupImpl extends _UserBlockchainAccountGroup {
  const _$UserBlockchainAccountGroupImpl(
      {required this.id,
      required this.name,
      required this.animatedIconUrl,
      required this.backgroundColor})
      : super._();

  factory _$UserBlockchainAccountGroupImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserBlockchainAccountGroupImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String animatedIconUrl;
  @override
  final String backgroundColor;

  @override
  String toString() {
    return 'UserBlockchainAccountGroup(id: $id, name: $name, animatedIconUrl: $animatedIconUrl, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBlockchainAccountGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.animatedIconUrl, animatedIconUrl) ||
                other.animatedIconUrl == animatedIconUrl) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, animatedIconUrl, backgroundColor);

  /// Create a copy of UserBlockchainAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBlockchainAccountGroupImplCopyWith<_$UserBlockchainAccountGroupImpl>
      get copyWith => __$$UserBlockchainAccountGroupImplCopyWithImpl<
          _$UserBlockchainAccountGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBlockchainAccountGroupImplToJson(
      this,
    );
  }
}

abstract class _UserBlockchainAccountGroup extends UserBlockchainAccountGroup {
  const factory _UserBlockchainAccountGroup(
          {required final String id,
          required final String name,
          required final String animatedIconUrl,
          required final String backgroundColor}) =
      _$UserBlockchainAccountGroupImpl;
  const _UserBlockchainAccountGroup._() : super._();

  factory _UserBlockchainAccountGroup.fromJson(Map<String, dynamic> json) =
      _$UserBlockchainAccountGroupImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get animatedIconUrl;
  @override
  String get backgroundColor;

  /// Create a copy of UserBlockchainAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBlockchainAccountGroupImplCopyWith<_$UserBlockchainAccountGroupImpl>
      get copyWith => throw _privateConstructorUsedError;
}
