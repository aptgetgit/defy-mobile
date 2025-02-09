// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../authentication_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticationKey {
  @protected
  Uint8List get bytes => throw _privateConstructorUsedError;

  /// Create a copy of AuthenticationKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticationKeyCopyWith<AuthenticationKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationKeyCopyWith<$Res> {
  factory $AuthenticationKeyCopyWith(
          AuthenticationKey value, $Res Function(AuthenticationKey) then) =
      _$AuthenticationKeyCopyWithImpl<$Res, AuthenticationKey>;
  @useResult
  $Res call({@protected Uint8List bytes});
}

/// @nodoc
class _$AuthenticationKeyCopyWithImpl<$Res, $Val extends AuthenticationKey>
    implements $AuthenticationKeyCopyWith<$Res> {
  _$AuthenticationKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bytes = null,
  }) {
    return _then(_value.copyWith(
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenticationKeyImplCopyWith<$Res>
    implements $AuthenticationKeyCopyWith<$Res> {
  factory _$$AuthenticationKeyImplCopyWith(_$AuthenticationKeyImpl value,
          $Res Function(_$AuthenticationKeyImpl) then) =
      __$$AuthenticationKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@protected Uint8List bytes});
}

/// @nodoc
class __$$AuthenticationKeyImplCopyWithImpl<$Res>
    extends _$AuthenticationKeyCopyWithImpl<$Res, _$AuthenticationKeyImpl>
    implements _$$AuthenticationKeyImplCopyWith<$Res> {
  __$$AuthenticationKeyImplCopyWithImpl(_$AuthenticationKeyImpl _value,
      $Res Function(_$AuthenticationKeyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bytes = null,
  }) {
    return _then(_$AuthenticationKeyImpl(
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$AuthenticationKeyImpl extends _AuthenticationKey {
  const _$AuthenticationKeyImpl({@protected required this.bytes})
      : assert(bytes.length == 32, 'Authentication key must be 32 bytes'),
        super._();

  @override
  @protected
  final Uint8List bytes;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationKeyImpl &&
            const DeepCollectionEquality().equals(other.bytes, bytes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(bytes));

  /// Create a copy of AuthenticationKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationKeyImplCopyWith<_$AuthenticationKeyImpl> get copyWith =>
      __$$AuthenticationKeyImplCopyWithImpl<_$AuthenticationKeyImpl>(
          this, _$identity);
}

abstract class _AuthenticationKey extends AuthenticationKey {
  const factory _AuthenticationKey(
      {@protected required final Uint8List bytes}) = _$AuthenticationKeyImpl;
  const _AuthenticationKey._() : super._();

  @override
  @protected
  Uint8List get bytes;

  /// Create a copy of AuthenticationKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationKeyImplCopyWith<_$AuthenticationKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
