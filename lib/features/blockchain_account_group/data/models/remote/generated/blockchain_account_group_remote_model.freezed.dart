// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../blockchain_account_group_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlockchainAccountGroupRemoteModel _$BlockchainAccountGroupRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _BlockchainAccountGroupRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$BlockchainAccountGroupRemoteModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String get color => throw _privateConstructorUsedError;

  /// Serializes this BlockchainAccountGroupRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlockchainAccountGroupRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockchainAccountGroupRemoteModelCopyWith<BlockchainAccountGroupRemoteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainAccountGroupRemoteModelCopyWith<$Res> {
  factory $BlockchainAccountGroupRemoteModelCopyWith(
          BlockchainAccountGroupRemoteModel value,
          $Res Function(BlockchainAccountGroupRemoteModel) then) =
      _$BlockchainAccountGroupRemoteModelCopyWithImpl<$Res,
          BlockchainAccountGroupRemoteModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'icon') String icon,
      @JsonKey(name: 'color') String color});
}

/// @nodoc
class _$BlockchainAccountGroupRemoteModelCopyWithImpl<$Res,
        $Val extends BlockchainAccountGroupRemoteModel>
    implements $BlockchainAccountGroupRemoteModelCopyWith<$Res> {
  _$BlockchainAccountGroupRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockchainAccountGroupRemoteModel
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
abstract class _$$BlockchainAccountGroupRemoteModelImplCopyWith<$Res>
    implements $BlockchainAccountGroupRemoteModelCopyWith<$Res> {
  factory _$$BlockchainAccountGroupRemoteModelImplCopyWith(
          _$BlockchainAccountGroupRemoteModelImpl value,
          $Res Function(_$BlockchainAccountGroupRemoteModelImpl) then) =
      __$$BlockchainAccountGroupRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'icon') String icon,
      @JsonKey(name: 'color') String color});
}

/// @nodoc
class __$$BlockchainAccountGroupRemoteModelImplCopyWithImpl<$Res>
    extends _$BlockchainAccountGroupRemoteModelCopyWithImpl<$Res,
        _$BlockchainAccountGroupRemoteModelImpl>
    implements _$$BlockchainAccountGroupRemoteModelImplCopyWith<$Res> {
  __$$BlockchainAccountGroupRemoteModelImplCopyWithImpl(
      _$BlockchainAccountGroupRemoteModelImpl _value,
      $Res Function(_$BlockchainAccountGroupRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlockchainAccountGroupRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? color = null,
  }) {
    return _then(_$BlockchainAccountGroupRemoteModelImpl(
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
class _$BlockchainAccountGroupRemoteModelImpl
    extends _BlockchainAccountGroupRemoteModel {
  const _$BlockchainAccountGroupRemoteModelImpl(
      {required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'icon') required this.icon,
      @JsonKey(name: 'color') required this.color})
      : super._();

  factory _$BlockchainAccountGroupRemoteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BlockchainAccountGroupRemoteModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'icon')
  final String icon;
  @override
  @JsonKey(name: 'color')
  final String color;

  @override
  String toString() {
    return 'BlockchainAccountGroupRemoteModel(id: $id, name: $name, icon: $icon, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockchainAccountGroupRemoteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, icon, color);

  /// Create a copy of BlockchainAccountGroupRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockchainAccountGroupRemoteModelImplCopyWith<
          _$BlockchainAccountGroupRemoteModelImpl>
      get copyWith => __$$BlockchainAccountGroupRemoteModelImplCopyWithImpl<
          _$BlockchainAccountGroupRemoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockchainAccountGroupRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _BlockchainAccountGroupRemoteModel
    extends BlockchainAccountGroupRemoteModel {
  const factory _BlockchainAccountGroupRemoteModel(
          {required final String id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'icon') required final String icon,
          @JsonKey(name: 'color') required final String color}) =
      _$BlockchainAccountGroupRemoteModelImpl;
  const _BlockchainAccountGroupRemoteModel._() : super._();

  factory _BlockchainAccountGroupRemoteModel.fromJson(
          Map<String, dynamic> json) =
      _$BlockchainAccountGroupRemoteModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'icon')
  String get icon;
  @override
  @JsonKey(name: 'color')
  String get color;

  /// Create a copy of BlockchainAccountGroupRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockchainAccountGroupRemoteModelImplCopyWith<
          _$BlockchainAccountGroupRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateBlockchainAccountGroupRemoteRequest
    _$CreateBlockchainAccountGroupRemoteRequestFromJson(
        Map<String, dynamic> json) {
  return _CreateBlockchainAccountGroupRemoteRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateBlockchainAccountGroupRemoteRequest {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String get color => throw _privateConstructorUsedError;

  /// Serializes this CreateBlockchainAccountGroupRemoteRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateBlockchainAccountGroupRemoteRequestCopyWith<
          CreateBlockchainAccountGroupRemoteRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBlockchainAccountGroupRemoteRequestCopyWith<$Res> {
  factory $CreateBlockchainAccountGroupRemoteRequestCopyWith(
          CreateBlockchainAccountGroupRemoteRequest value,
          $Res Function(CreateBlockchainAccountGroupRemoteRequest) then) =
      _$CreateBlockchainAccountGroupRemoteRequestCopyWithImpl<$Res,
          CreateBlockchainAccountGroupRemoteRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'icon') String icon,
      @JsonKey(name: 'color') String color});
}

/// @nodoc
class _$CreateBlockchainAccountGroupRemoteRequestCopyWithImpl<$Res,
        $Val extends CreateBlockchainAccountGroupRemoteRequest>
    implements $CreateBlockchainAccountGroupRemoteRequestCopyWith<$Res> {
  _$CreateBlockchainAccountGroupRemoteRequestCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$CreateBlockchainAccountGroupRemoteRequestImplCopyWith<$Res>
    implements $CreateBlockchainAccountGroupRemoteRequestCopyWith<$Res> {
  factory _$$CreateBlockchainAccountGroupRemoteRequestImplCopyWith(
          _$CreateBlockchainAccountGroupRemoteRequestImpl value,
          $Res Function(_$CreateBlockchainAccountGroupRemoteRequestImpl) then) =
      __$$CreateBlockchainAccountGroupRemoteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'icon') String icon,
      @JsonKey(name: 'color') String color});
}

/// @nodoc
class __$$CreateBlockchainAccountGroupRemoteRequestImplCopyWithImpl<$Res>
    extends _$CreateBlockchainAccountGroupRemoteRequestCopyWithImpl<$Res,
        _$CreateBlockchainAccountGroupRemoteRequestImpl>
    implements _$$CreateBlockchainAccountGroupRemoteRequestImplCopyWith<$Res> {
  __$$CreateBlockchainAccountGroupRemoteRequestImplCopyWithImpl(
      _$CreateBlockchainAccountGroupRemoteRequestImpl _value,
      $Res Function(_$CreateBlockchainAccountGroupRemoteRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? color = null,
  }) {
    return _then(_$CreateBlockchainAccountGroupRemoteRequestImpl(
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
class _$CreateBlockchainAccountGroupRemoteRequestImpl
    implements _CreateBlockchainAccountGroupRemoteRequest {
  const _$CreateBlockchainAccountGroupRemoteRequestImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'icon') required this.icon,
      @JsonKey(name: 'color') required this.color});

  factory _$CreateBlockchainAccountGroupRemoteRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateBlockchainAccountGroupRemoteRequestImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'icon')
  final String icon;
  @override
  @JsonKey(name: 'color')
  final String color;

  @override
  String toString() {
    return 'CreateBlockchainAccountGroupRemoteRequest(name: $name, icon: $icon, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBlockchainAccountGroupRemoteRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, icon, color);

  /// Create a copy of CreateBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBlockchainAccountGroupRemoteRequestImplCopyWith<
          _$CreateBlockchainAccountGroupRemoteRequestImpl>
      get copyWith =>
          __$$CreateBlockchainAccountGroupRemoteRequestImplCopyWithImpl<
                  _$CreateBlockchainAccountGroupRemoteRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBlockchainAccountGroupRemoteRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateBlockchainAccountGroupRemoteRequest
    implements CreateBlockchainAccountGroupRemoteRequest {
  const factory _CreateBlockchainAccountGroupRemoteRequest(
          {@JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'icon') required final String icon,
          @JsonKey(name: 'color') required final String color}) =
      _$CreateBlockchainAccountGroupRemoteRequestImpl;

  factory _CreateBlockchainAccountGroupRemoteRequest.fromJson(
          Map<String, dynamic> json) =
      _$CreateBlockchainAccountGroupRemoteRequestImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'icon')
  String get icon;
  @override
  @JsonKey(name: 'color')
  String get color;

  /// Create a copy of CreateBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateBlockchainAccountGroupRemoteRequestImplCopyWith<
          _$CreateBlockchainAccountGroupRemoteRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateBlockchainAccountGroupRemoteRequest
    _$UpdateBlockchainAccountGroupRemoteRequestFromJson(
        Map<String, dynamic> json) {
  return _UpdateBlockchainAccountGroupRemoteRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateBlockchainAccountGroupRemoteRequest {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String get color => throw _privateConstructorUsedError;

  /// Serializes this UpdateBlockchainAccountGroupRemoteRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateBlockchainAccountGroupRemoteRequestCopyWith<
          UpdateBlockchainAccountGroupRemoteRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateBlockchainAccountGroupRemoteRequestCopyWith<$Res> {
  factory $UpdateBlockchainAccountGroupRemoteRequestCopyWith(
          UpdateBlockchainAccountGroupRemoteRequest value,
          $Res Function(UpdateBlockchainAccountGroupRemoteRequest) then) =
      _$UpdateBlockchainAccountGroupRemoteRequestCopyWithImpl<$Res,
          UpdateBlockchainAccountGroupRemoteRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'icon') String icon,
      @JsonKey(name: 'color') String color});
}

/// @nodoc
class _$UpdateBlockchainAccountGroupRemoteRequestCopyWithImpl<$Res,
        $Val extends UpdateBlockchainAccountGroupRemoteRequest>
    implements $UpdateBlockchainAccountGroupRemoteRequestCopyWith<$Res> {
  _$UpdateBlockchainAccountGroupRemoteRequestCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$UpdateBlockchainAccountGroupRemoteRequestImplCopyWith<$Res>
    implements $UpdateBlockchainAccountGroupRemoteRequestCopyWith<$Res> {
  factory _$$UpdateBlockchainAccountGroupRemoteRequestImplCopyWith(
          _$UpdateBlockchainAccountGroupRemoteRequestImpl value,
          $Res Function(_$UpdateBlockchainAccountGroupRemoteRequestImpl) then) =
      __$$UpdateBlockchainAccountGroupRemoteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'icon') String icon,
      @JsonKey(name: 'color') String color});
}

/// @nodoc
class __$$UpdateBlockchainAccountGroupRemoteRequestImplCopyWithImpl<$Res>
    extends _$UpdateBlockchainAccountGroupRemoteRequestCopyWithImpl<$Res,
        _$UpdateBlockchainAccountGroupRemoteRequestImpl>
    implements _$$UpdateBlockchainAccountGroupRemoteRequestImplCopyWith<$Res> {
  __$$UpdateBlockchainAccountGroupRemoteRequestImplCopyWithImpl(
      _$UpdateBlockchainAccountGroupRemoteRequestImpl _value,
      $Res Function(_$UpdateBlockchainAccountGroupRemoteRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? color = null,
  }) {
    return _then(_$UpdateBlockchainAccountGroupRemoteRequestImpl(
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
class _$UpdateBlockchainAccountGroupRemoteRequestImpl
    implements _UpdateBlockchainAccountGroupRemoteRequest {
  const _$UpdateBlockchainAccountGroupRemoteRequestImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'icon') required this.icon,
      @JsonKey(name: 'color') required this.color});

  factory _$UpdateBlockchainAccountGroupRemoteRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateBlockchainAccountGroupRemoteRequestImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'icon')
  final String icon;
  @override
  @JsonKey(name: 'color')
  final String color;

  @override
  String toString() {
    return 'UpdateBlockchainAccountGroupRemoteRequest(name: $name, icon: $icon, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBlockchainAccountGroupRemoteRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, icon, color);

  /// Create a copy of UpdateBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBlockchainAccountGroupRemoteRequestImplCopyWith<
          _$UpdateBlockchainAccountGroupRemoteRequestImpl>
      get copyWith =>
          __$$UpdateBlockchainAccountGroupRemoteRequestImplCopyWithImpl<
                  _$UpdateBlockchainAccountGroupRemoteRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateBlockchainAccountGroupRemoteRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateBlockchainAccountGroupRemoteRequest
    implements UpdateBlockchainAccountGroupRemoteRequest {
  const factory _UpdateBlockchainAccountGroupRemoteRequest(
          {@JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'icon') required final String icon,
          @JsonKey(name: 'color') required final String color}) =
      _$UpdateBlockchainAccountGroupRemoteRequestImpl;

  factory _UpdateBlockchainAccountGroupRemoteRequest.fromJson(
          Map<String, dynamic> json) =
      _$UpdateBlockchainAccountGroupRemoteRequestImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'icon')
  String get icon;
  @override
  @JsonKey(name: 'color')
  String get color;

  /// Create a copy of UpdateBlockchainAccountGroupRemoteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateBlockchainAccountGroupRemoteRequestImplCopyWith<
          _$UpdateBlockchainAccountGroupRemoteRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
