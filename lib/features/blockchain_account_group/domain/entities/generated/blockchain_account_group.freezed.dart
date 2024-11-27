// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../blockchain_account_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlockchainAccountGroup _$BlockchainAccountGroupFromJson(
    Map<String, dynamic> json) {
  return _BlockchainAccountGroup.fromJson(json);
}

/// @nodoc
mixin _$BlockchainAccountGroup {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  /// Serializes this BlockchainAccountGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlockchainAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockchainAccountGroupCopyWith<BlockchainAccountGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainAccountGroupCopyWith<$Res> {
  factory $BlockchainAccountGroupCopyWith(BlockchainAccountGroup value,
          $Res Function(BlockchainAccountGroup) then) =
      _$BlockchainAccountGroupCopyWithImpl<$Res, BlockchainAccountGroup>;
  @useResult
  $Res call({String id, String name, String icon, String color});
}

/// @nodoc
class _$BlockchainAccountGroupCopyWithImpl<$Res,
        $Val extends BlockchainAccountGroup>
    implements $BlockchainAccountGroupCopyWith<$Res> {
  _$BlockchainAccountGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockchainAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? color = null,
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
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockchainAccountGroupImplCopyWith<$Res>
    implements $BlockchainAccountGroupCopyWith<$Res> {
  factory _$$BlockchainAccountGroupImplCopyWith(
          _$BlockchainAccountGroupImpl value,
          $Res Function(_$BlockchainAccountGroupImpl) then) =
      __$$BlockchainAccountGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String icon, String color});
}

/// @nodoc
class __$$BlockchainAccountGroupImplCopyWithImpl<$Res>
    extends _$BlockchainAccountGroupCopyWithImpl<$Res,
        _$BlockchainAccountGroupImpl>
    implements _$$BlockchainAccountGroupImplCopyWith<$Res> {
  __$$BlockchainAccountGroupImplCopyWithImpl(
      _$BlockchainAccountGroupImpl _value,
      $Res Function(_$BlockchainAccountGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlockchainAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? color = null,
  }) {
    return _then(_$BlockchainAccountGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockchainAccountGroupImpl extends _BlockchainAccountGroup {
  const _$BlockchainAccountGroupImpl(
      {required this.id,
      required this.name,
      required this.icon,
      required this.color})
      : super._();

  factory _$BlockchainAccountGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockchainAccountGroupImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String icon;
  @override
  final String color;

  @override
  String toString() {
    return 'BlockchainAccountGroup(id: $id, name: $name, icon: $icon, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockchainAccountGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, icon, color);

  /// Create a copy of BlockchainAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockchainAccountGroupImplCopyWith<_$BlockchainAccountGroupImpl>
      get copyWith => __$$BlockchainAccountGroupImplCopyWithImpl<
          _$BlockchainAccountGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockchainAccountGroupImplToJson(
      this,
    );
  }
}

abstract class _BlockchainAccountGroup extends BlockchainAccountGroup {
  const factory _BlockchainAccountGroup(
      {required final String id,
      required final String name,
      required final String icon,
      required final String color}) = _$BlockchainAccountGroupImpl;
  const _BlockchainAccountGroup._() : super._();

  factory _BlockchainAccountGroup.fromJson(Map<String, dynamic> json) =
      _$BlockchainAccountGroupImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get icon;
  @override
  String get color;

  /// Create a copy of BlockchainAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockchainAccountGroupImplCopyWith<_$BlockchainAccountGroupImpl>
      get copyWith => throw _privateConstructorUsedError;
}
