// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../session_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionEntity _$SessionEntityFromJson(Map<String, dynamic> json) {
  return _SessionEntity.fromJson(json);
}

/// @nodoc
mixin _$SessionEntity {
  bool get active => throw _privateConstructorUsedError;
  IdentityEntity get identity => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  DateTime get issuedAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  DateTime get authenticatedAt => throw _privateConstructorUsedError;
  AssuranceLevel get authenticatorAssuranceLevel =>
      throw _privateConstructorUsedError;

  /// Serializes this SessionEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionEntityCopyWith<SessionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionEntityCopyWith<$Res> {
  factory $SessionEntityCopyWith(
          SessionEntity value, $Res Function(SessionEntity) then) =
      _$SessionEntityCopyWithImpl<$Res, SessionEntity>;
  @useResult
  $Res call(
      {bool active,
      IdentityEntity identity,
      String id,
      DateTime issuedAt,
      DateTime expiresAt,
      DateTime authenticatedAt,
      AssuranceLevel authenticatorAssuranceLevel});

  $IdentityEntityCopyWith<$Res> get identity;
}

/// @nodoc
class _$SessionEntityCopyWithImpl<$Res, $Val extends SessionEntity>
    implements $SessionEntityCopyWith<$Res> {
  _$SessionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? identity = null,
    Object? id = null,
    Object? issuedAt = null,
    Object? expiresAt = null,
    Object? authenticatedAt = null,
    Object? authenticatorAssuranceLevel = null,
  }) {
    return _then(_value.copyWith(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as IdentityEntity,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      issuedAt: null == issuedAt
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      authenticatedAt: null == authenticatedAt
          ? _value.authenticatedAt
          : authenticatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      authenticatorAssuranceLevel: null == authenticatorAssuranceLevel
          ? _value.authenticatorAssuranceLevel
          : authenticatorAssuranceLevel // ignore: cast_nullable_to_non_nullable
              as AssuranceLevel,
    ) as $Val);
  }

  /// Create a copy of SessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IdentityEntityCopyWith<$Res> get identity {
    return $IdentityEntityCopyWith<$Res>(_value.identity, (value) {
      return _then(_value.copyWith(identity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionEntityImplCopyWith<$Res>
    implements $SessionEntityCopyWith<$Res> {
  factory _$$SessionEntityImplCopyWith(
          _$SessionEntityImpl value, $Res Function(_$SessionEntityImpl) then) =
      __$$SessionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool active,
      IdentityEntity identity,
      String id,
      DateTime issuedAt,
      DateTime expiresAt,
      DateTime authenticatedAt,
      AssuranceLevel authenticatorAssuranceLevel});

  @override
  $IdentityEntityCopyWith<$Res> get identity;
}

/// @nodoc
class __$$SessionEntityImplCopyWithImpl<$Res>
    extends _$SessionEntityCopyWithImpl<$Res, _$SessionEntityImpl>
    implements _$$SessionEntityImplCopyWith<$Res> {
  __$$SessionEntityImplCopyWithImpl(
      _$SessionEntityImpl _value, $Res Function(_$SessionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? identity = null,
    Object? id = null,
    Object? issuedAt = null,
    Object? expiresAt = null,
    Object? authenticatedAt = null,
    Object? authenticatorAssuranceLevel = null,
  }) {
    return _then(_$SessionEntityImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as IdentityEntity,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      issuedAt: null == issuedAt
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      authenticatedAt: null == authenticatedAt
          ? _value.authenticatedAt
          : authenticatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      authenticatorAssuranceLevel: null == authenticatorAssuranceLevel
          ? _value.authenticatorAssuranceLevel
          : authenticatorAssuranceLevel // ignore: cast_nullable_to_non_nullable
              as AssuranceLevel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionEntityImpl extends _SessionEntity {
  _$SessionEntityImpl(
      {required this.active,
      required this.identity,
      required this.id,
      required this.issuedAt,
      required this.expiresAt,
      required this.authenticatedAt,
      required this.authenticatorAssuranceLevel})
      : super._();

  factory _$SessionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionEntityImplFromJson(json);

  @override
  final bool active;
  @override
  final IdentityEntity identity;
  @override
  final String id;
  @override
  final DateTime issuedAt;
  @override
  final DateTime expiresAt;
  @override
  final DateTime authenticatedAt;
  @override
  final AssuranceLevel authenticatorAssuranceLevel;

  @override
  String toString() {
    return 'SessionEntity(active: $active, identity: $identity, id: $id, issuedAt: $issuedAt, expiresAt: $expiresAt, authenticatedAt: $authenticatedAt, authenticatorAssuranceLevel: $authenticatorAssuranceLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionEntityImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.identity, identity) ||
                other.identity == identity) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.authenticatedAt, authenticatedAt) ||
                other.authenticatedAt == authenticatedAt) &&
            (identical(other.authenticatorAssuranceLevel,
                    authenticatorAssuranceLevel) ||
                other.authenticatorAssuranceLevel ==
                    authenticatorAssuranceLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, active, identity, id, issuedAt,
      expiresAt, authenticatedAt, authenticatorAssuranceLevel);

  /// Create a copy of SessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionEntityImplCopyWith<_$SessionEntityImpl> get copyWith =>
      __$$SessionEntityImplCopyWithImpl<_$SessionEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionEntityImplToJson(
      this,
    );
  }
}

abstract class _SessionEntity extends SessionEntity {
  factory _SessionEntity(
          {required final bool active,
          required final IdentityEntity identity,
          required final String id,
          required final DateTime issuedAt,
          required final DateTime expiresAt,
          required final DateTime authenticatedAt,
          required final AssuranceLevel authenticatorAssuranceLevel}) =
      _$SessionEntityImpl;
  _SessionEntity._() : super._();

  factory _SessionEntity.fromJson(Map<String, dynamic> json) =
      _$SessionEntityImpl.fromJson;

  @override
  bool get active;
  @override
  IdentityEntity get identity;
  @override
  String get id;
  @override
  DateTime get issuedAt;
  @override
  DateTime get expiresAt;
  @override
  DateTime get authenticatedAt;
  @override
  AssuranceLevel get authenticatorAssuranceLevel;

  /// Create a copy of SessionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionEntityImplCopyWith<_$SessionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdentityEntity _$IdentityEntityFromJson(Map<String, dynamic> json) {
  return _IdentityEntity.fromJson(json);
}

/// @nodoc
mixin _$IdentityEntity {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this IdentityEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IdentityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IdentityEntityCopyWith<IdentityEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentityEntityCopyWith<$Res> {
  factory $IdentityEntityCopyWith(
          IdentityEntity value, $Res Function(IdentityEntity) then) =
      _$IdentityEntityCopyWithImpl<$Res, IdentityEntity>;
  @useResult
  $Res call({String id, DateTime createdAt, DateTime updatedAt});
}

/// @nodoc
class _$IdentityEntityCopyWithImpl<$Res, $Val extends IdentityEntity>
    implements $IdentityEntityCopyWith<$Res> {
  _$IdentityEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IdentityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdentityEntityImplCopyWith<$Res>
    implements $IdentityEntityCopyWith<$Res> {
  factory _$$IdentityEntityImplCopyWith(_$IdentityEntityImpl value,
          $Res Function(_$IdentityEntityImpl) then) =
      __$$IdentityEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime createdAt, DateTime updatedAt});
}

/// @nodoc
class __$$IdentityEntityImplCopyWithImpl<$Res>
    extends _$IdentityEntityCopyWithImpl<$Res, _$IdentityEntityImpl>
    implements _$$IdentityEntityImplCopyWith<$Res> {
  __$$IdentityEntityImplCopyWithImpl(
      _$IdentityEntityImpl _value, $Res Function(_$IdentityEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of IdentityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$IdentityEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentityEntityImpl extends _IdentityEntity {
  _$IdentityEntityImpl(
      {required this.id, required this.createdAt, required this.updatedAt})
      : super._();

  factory _$IdentityEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentityEntityImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'IdentityEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentityEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt);

  /// Create a copy of IdentityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentityEntityImplCopyWith<_$IdentityEntityImpl> get copyWith =>
      __$$IdentityEntityImplCopyWithImpl<_$IdentityEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentityEntityImplToJson(
      this,
    );
  }
}

abstract class _IdentityEntity extends IdentityEntity {
  factory _IdentityEntity(
      {required final String id,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$IdentityEntityImpl;
  _IdentityEntity._() : super._();

  factory _IdentityEntity.fromJson(Map<String, dynamic> json) =
      _$IdentityEntityImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of IdentityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdentityEntityImplCopyWith<_$IdentityEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
