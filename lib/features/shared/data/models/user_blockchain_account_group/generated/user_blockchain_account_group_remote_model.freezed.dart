// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_blockchain_account_group_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBlockchainAccountGroupRemoteModel
    _$UserBlockchainAccountGroupRemoteModelFromJson(Map<String, dynamic> json) {
  return _UserBlockchainAccountGroupRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$UserBlockchainAccountGroupRemoteModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get animatedIconUrl => throw _privateConstructorUsedError;
  String get backgroundColor => throw _privateConstructorUsedError;

  /// Serializes this UserBlockchainAccountGroupRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBlockchainAccountGroupRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBlockchainAccountGroupRemoteModelCopyWith<
          UserBlockchainAccountGroupRemoteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlockchainAccountGroupRemoteModelCopyWith<$Res> {
  factory $UserBlockchainAccountGroupRemoteModelCopyWith(
          UserBlockchainAccountGroupRemoteModel value,
          $Res Function(UserBlockchainAccountGroupRemoteModel) then) =
      _$UserBlockchainAccountGroupRemoteModelCopyWithImpl<$Res,
          UserBlockchainAccountGroupRemoteModel>;
  @useResult
  $Res call(
      {String id, String name, String animatedIconUrl, String backgroundColor});
}

/// @nodoc
class _$UserBlockchainAccountGroupRemoteModelCopyWithImpl<$Res,
        $Val extends UserBlockchainAccountGroupRemoteModel>
    implements $UserBlockchainAccountGroupRemoteModelCopyWith<$Res> {
  _$UserBlockchainAccountGroupRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBlockchainAccountGroupRemoteModel
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
abstract class _$$UserBlockchainAccountGroupRemoteModelImplCopyWith<$Res>
    implements $UserBlockchainAccountGroupRemoteModelCopyWith<$Res> {
  factory _$$UserBlockchainAccountGroupRemoteModelImplCopyWith(
          _$UserBlockchainAccountGroupRemoteModelImpl value,
          $Res Function(_$UserBlockchainAccountGroupRemoteModelImpl) then) =
      __$$UserBlockchainAccountGroupRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String animatedIconUrl, String backgroundColor});
}

/// @nodoc
class __$$UserBlockchainAccountGroupRemoteModelImplCopyWithImpl<$Res>
    extends _$UserBlockchainAccountGroupRemoteModelCopyWithImpl<$Res,
        _$UserBlockchainAccountGroupRemoteModelImpl>
    implements _$$UserBlockchainAccountGroupRemoteModelImplCopyWith<$Res> {
  __$$UserBlockchainAccountGroupRemoteModelImplCopyWithImpl(
      _$UserBlockchainAccountGroupRemoteModelImpl _value,
      $Res Function(_$UserBlockchainAccountGroupRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBlockchainAccountGroupRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? animatedIconUrl = null,
    Object? backgroundColor = null,
  }) {
    return _then(_$UserBlockchainAccountGroupRemoteModelImpl(
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
class _$UserBlockchainAccountGroupRemoteModelImpl
    extends _UserBlockchainAccountGroupRemoteModel {
  const _$UserBlockchainAccountGroupRemoteModelImpl(
      {required this.id,
      required this.name,
      required this.animatedIconUrl,
      required this.backgroundColor})
      : super._();

  factory _$UserBlockchainAccountGroupRemoteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserBlockchainAccountGroupRemoteModelImplFromJson(json);

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
    return 'UserBlockchainAccountGroupRemoteModel(id: $id, name: $name, animatedIconUrl: $animatedIconUrl, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBlockchainAccountGroupRemoteModelImpl &&
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

  /// Create a copy of UserBlockchainAccountGroupRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBlockchainAccountGroupRemoteModelImplCopyWith<
          _$UserBlockchainAccountGroupRemoteModelImpl>
      get copyWith => __$$UserBlockchainAccountGroupRemoteModelImplCopyWithImpl<
          _$UserBlockchainAccountGroupRemoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBlockchainAccountGroupRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _UserBlockchainAccountGroupRemoteModel
    extends UserBlockchainAccountGroupRemoteModel {
  const factory _UserBlockchainAccountGroupRemoteModel(
          {required final String id,
          required final String name,
          required final String animatedIconUrl,
          required final String backgroundColor}) =
      _$UserBlockchainAccountGroupRemoteModelImpl;
  const _UserBlockchainAccountGroupRemoteModel._() : super._();

  factory _UserBlockchainAccountGroupRemoteModel.fromJson(
          Map<String, dynamic> json) =
      _$UserBlockchainAccountGroupRemoteModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get animatedIconUrl;
  @override
  String get backgroundColor;

  /// Create a copy of UserBlockchainAccountGroupRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBlockchainAccountGroupRemoteModelImplCopyWith<
          _$UserBlockchainAccountGroupRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateUserBlockchainAccountGroupRemoteRequest
    _$CreateUserBlockchainAccountGroupRemoteRequestFromJson(
        Map<String, dynamic> json) {
  return _CreateUserBlockchainAccountGroupRemoteRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateUserBlockchainAccountGroupRemoteRequest {
  String get name => throw _privateConstructorUsedError;
  String get animatedIconUrl => throw _privateConstructorUsedError;
  String get backgroundColor => throw _privateConstructorUsedError;

  /// Serializes this CreateUserBlockchainAccountGroupRemoteRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateUserBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateUserBlockchainAccountGroupRemoteRequestCopyWith<
          CreateUserBlockchainAccountGroupRemoteRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserBlockchainAccountGroupRemoteRequestCopyWith<$Res> {
  factory $CreateUserBlockchainAccountGroupRemoteRequestCopyWith(
          CreateUserBlockchainAccountGroupRemoteRequest value,
          $Res Function(CreateUserBlockchainAccountGroupRemoteRequest) then) =
      _$CreateUserBlockchainAccountGroupRemoteRequestCopyWithImpl<$Res,
          CreateUserBlockchainAccountGroupRemoteRequest>;
  @useResult
  $Res call({String name, String animatedIconUrl, String backgroundColor});
}

/// @nodoc
class _$CreateUserBlockchainAccountGroupRemoteRequestCopyWithImpl<$Res,
        $Val extends CreateUserBlockchainAccountGroupRemoteRequest>
    implements $CreateUserBlockchainAccountGroupRemoteRequestCopyWith<$Res> {
  _$CreateUserBlockchainAccountGroupRemoteRequestCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateUserBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? animatedIconUrl = null,
    Object? backgroundColor = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$CreateUserBlockchainAccountGroupRemoteRequestImplCopyWith<
        $Res>
    implements $CreateUserBlockchainAccountGroupRemoteRequestCopyWith<$Res> {
  factory _$$CreateUserBlockchainAccountGroupRemoteRequestImplCopyWith(
          _$CreateUserBlockchainAccountGroupRemoteRequestImpl value,
          $Res Function(_$CreateUserBlockchainAccountGroupRemoteRequestImpl)
              then) =
      __$$CreateUserBlockchainAccountGroupRemoteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String animatedIconUrl, String backgroundColor});
}

/// @nodoc
class __$$CreateUserBlockchainAccountGroupRemoteRequestImplCopyWithImpl<$Res>
    extends _$CreateUserBlockchainAccountGroupRemoteRequestCopyWithImpl<$Res,
        _$CreateUserBlockchainAccountGroupRemoteRequestImpl>
    implements
        _$$CreateUserBlockchainAccountGroupRemoteRequestImplCopyWith<$Res> {
  __$$CreateUserBlockchainAccountGroupRemoteRequestImplCopyWithImpl(
      _$CreateUserBlockchainAccountGroupRemoteRequestImpl _value,
      $Res Function(_$CreateUserBlockchainAccountGroupRemoteRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateUserBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? animatedIconUrl = null,
    Object? backgroundColor = null,
  }) {
    return _then(_$CreateUserBlockchainAccountGroupRemoteRequestImpl(
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
class _$CreateUserBlockchainAccountGroupRemoteRequestImpl
    implements _CreateUserBlockchainAccountGroupRemoteRequest {
  const _$CreateUserBlockchainAccountGroupRemoteRequestImpl(
      {required this.name,
      required this.animatedIconUrl,
      required this.backgroundColor});

  factory _$CreateUserBlockchainAccountGroupRemoteRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateUserBlockchainAccountGroupRemoteRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String animatedIconUrl;
  @override
  final String backgroundColor;

  @override
  String toString() {
    return 'CreateUserBlockchainAccountGroupRemoteRequest(name: $name, animatedIconUrl: $animatedIconUrl, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserBlockchainAccountGroupRemoteRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.animatedIconUrl, animatedIconUrl) ||
                other.animatedIconUrl == animatedIconUrl) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, animatedIconUrl, backgroundColor);

  /// Create a copy of CreateUserBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserBlockchainAccountGroupRemoteRequestImplCopyWith<
          _$CreateUserBlockchainAccountGroupRemoteRequestImpl>
      get copyWith =>
          __$$CreateUserBlockchainAccountGroupRemoteRequestImplCopyWithImpl<
                  _$CreateUserBlockchainAccountGroupRemoteRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateUserBlockchainAccountGroupRemoteRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateUserBlockchainAccountGroupRemoteRequest
    implements CreateUserBlockchainAccountGroupRemoteRequest {
  const factory _CreateUserBlockchainAccountGroupRemoteRequest(
          {required final String name,
          required final String animatedIconUrl,
          required final String backgroundColor}) =
      _$CreateUserBlockchainAccountGroupRemoteRequestImpl;

  factory _CreateUserBlockchainAccountGroupRemoteRequest.fromJson(
          Map<String, dynamic> json) =
      _$CreateUserBlockchainAccountGroupRemoteRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get animatedIconUrl;
  @override
  String get backgroundColor;

  /// Create a copy of CreateUserBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateUserBlockchainAccountGroupRemoteRequestImplCopyWith<
          _$CreateUserBlockchainAccountGroupRemoteRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateUserBlockchainAccountGroupRemoteRequest
    _$UpdateUserBlockchainAccountGroupRemoteRequestFromJson(
        Map<String, dynamic> json) {
  return _UpdateUserBlockchainAccountGroupRemoteRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserBlockchainAccountGroupRemoteRequest {
  String get name => throw _privateConstructorUsedError;
  String get animatedIconUrl => throw _privateConstructorUsedError;
  String get backgroundColor => throw _privateConstructorUsedError;

  /// Serializes this UpdateUserBlockchainAccountGroupRemoteRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserBlockchainAccountGroupRemoteRequestCopyWith<
          UpdateUserBlockchainAccountGroupRemoteRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserBlockchainAccountGroupRemoteRequestCopyWith<$Res> {
  factory $UpdateUserBlockchainAccountGroupRemoteRequestCopyWith(
          UpdateUserBlockchainAccountGroupRemoteRequest value,
          $Res Function(UpdateUserBlockchainAccountGroupRemoteRequest) then) =
      _$UpdateUserBlockchainAccountGroupRemoteRequestCopyWithImpl<$Res,
          UpdateUserBlockchainAccountGroupRemoteRequest>;
  @useResult
  $Res call({String name, String animatedIconUrl, String backgroundColor});
}

/// @nodoc
class _$UpdateUserBlockchainAccountGroupRemoteRequestCopyWithImpl<$Res,
        $Val extends UpdateUserBlockchainAccountGroupRemoteRequest>
    implements $UpdateUserBlockchainAccountGroupRemoteRequestCopyWith<$Res> {
  _$UpdateUserBlockchainAccountGroupRemoteRequestCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? animatedIconUrl = null,
    Object? backgroundColor = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$UpdateUserBlockchainAccountGroupRemoteRequestImplCopyWith<
        $Res>
    implements $UpdateUserBlockchainAccountGroupRemoteRequestCopyWith<$Res> {
  factory _$$UpdateUserBlockchainAccountGroupRemoteRequestImplCopyWith(
          _$UpdateUserBlockchainAccountGroupRemoteRequestImpl value,
          $Res Function(_$UpdateUserBlockchainAccountGroupRemoteRequestImpl)
              then) =
      __$$UpdateUserBlockchainAccountGroupRemoteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String animatedIconUrl, String backgroundColor});
}

/// @nodoc
class __$$UpdateUserBlockchainAccountGroupRemoteRequestImplCopyWithImpl<$Res>
    extends _$UpdateUserBlockchainAccountGroupRemoteRequestCopyWithImpl<$Res,
        _$UpdateUserBlockchainAccountGroupRemoteRequestImpl>
    implements
        _$$UpdateUserBlockchainAccountGroupRemoteRequestImplCopyWith<$Res> {
  __$$UpdateUserBlockchainAccountGroupRemoteRequestImplCopyWithImpl(
      _$UpdateUserBlockchainAccountGroupRemoteRequestImpl _value,
      $Res Function(_$UpdateUserBlockchainAccountGroupRemoteRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? animatedIconUrl = null,
    Object? backgroundColor = null,
  }) {
    return _then(_$UpdateUserBlockchainAccountGroupRemoteRequestImpl(
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
class _$UpdateUserBlockchainAccountGroupRemoteRequestImpl
    implements _UpdateUserBlockchainAccountGroupRemoteRequest {
  const _$UpdateUserBlockchainAccountGroupRemoteRequestImpl(
      {required this.name,
      required this.animatedIconUrl,
      required this.backgroundColor});

  factory _$UpdateUserBlockchainAccountGroupRemoteRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateUserBlockchainAccountGroupRemoteRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String animatedIconUrl;
  @override
  final String backgroundColor;

  @override
  String toString() {
    return 'UpdateUserBlockchainAccountGroupRemoteRequest(name: $name, animatedIconUrl: $animatedIconUrl, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserBlockchainAccountGroupRemoteRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.animatedIconUrl, animatedIconUrl) ||
                other.animatedIconUrl == animatedIconUrl) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, animatedIconUrl, backgroundColor);

  /// Create a copy of UpdateUserBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserBlockchainAccountGroupRemoteRequestImplCopyWith<
          _$UpdateUserBlockchainAccountGroupRemoteRequestImpl>
      get copyWith =>
          __$$UpdateUserBlockchainAccountGroupRemoteRequestImplCopyWithImpl<
                  _$UpdateUserBlockchainAccountGroupRemoteRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserBlockchainAccountGroupRemoteRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateUserBlockchainAccountGroupRemoteRequest
    implements UpdateUserBlockchainAccountGroupRemoteRequest {
  const factory _UpdateUserBlockchainAccountGroupRemoteRequest(
          {required final String name,
          required final String animatedIconUrl,
          required final String backgroundColor}) =
      _$UpdateUserBlockchainAccountGroupRemoteRequestImpl;

  factory _UpdateUserBlockchainAccountGroupRemoteRequest.fromJson(
          Map<String, dynamic> json) =
      _$UpdateUserBlockchainAccountGroupRemoteRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get animatedIconUrl;
  @override
  String get backgroundColor;

  /// Create a copy of UpdateUserBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserBlockchainAccountGroupRemoteRequestImplCopyWith<
          _$UpdateUserBlockchainAccountGroupRemoteRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
