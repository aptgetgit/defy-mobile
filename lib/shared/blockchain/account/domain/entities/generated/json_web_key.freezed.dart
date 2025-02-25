// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../json_web_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Jwk {
  @protected
  @JsonKey(name: 'x')
  Uint8List get x => throw _privateConstructorUsedError;
  @protected
  @JsonKey(name: 'd')
  Uint8List? get d => throw _privateConstructorUsedError;

  /// Create a copy of Jwk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JwkCopyWith<Jwk> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwkCopyWith<$Res> {
  factory $JwkCopyWith(Jwk value, $Res Function(Jwk) then) =
      _$JwkCopyWithImpl<$Res, Jwk>;
  @useResult
  $Res call(
      {@protected @JsonKey(name: 'x') Uint8List x,
      @protected @JsonKey(name: 'd') Uint8List? d});
}

/// @nodoc
class _$JwkCopyWithImpl<$Res, $Val extends Jwk> implements $JwkCopyWith<$Res> {
  _$JwkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Jwk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? d = freezed,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      d: freezed == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Ed25519JwkImplCopyWith<$Res> implements $JwkCopyWith<$Res> {
  factory _$$Ed25519JwkImplCopyWith(
          _$Ed25519JwkImpl value, $Res Function(_$Ed25519JwkImpl) then) =
      __$$Ed25519JwkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@protected @JsonKey(name: 'x') Uint8List x,
      @protected @JsonKey(name: 'd') Uint8List? d});
}

/// @nodoc
class __$$Ed25519JwkImplCopyWithImpl<$Res>
    extends _$JwkCopyWithImpl<$Res, _$Ed25519JwkImpl>
    implements _$$Ed25519JwkImplCopyWith<$Res> {
  __$$Ed25519JwkImplCopyWithImpl(
      _$Ed25519JwkImpl _value, $Res Function(_$Ed25519JwkImpl) _then)
      : super(_value, _then);

  /// Create a copy of Jwk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? d = freezed,
  }) {
    return _then(_$Ed25519JwkImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      d: freezed == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$Ed25519JwkImpl extends Ed25519Jwk {
  const _$Ed25519JwkImpl(
      {@protected @JsonKey(name: 'x') required this.x,
      @protected @JsonKey(name: 'd') this.d})
      : super._();

  @override
  @protected
  @JsonKey(name: 'x')
  final Uint8List x;
  @override
  @protected
  @JsonKey(name: 'd')
  final Uint8List? d;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Ed25519JwkImpl &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.d, d));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(x),
      const DeepCollectionEquality().hash(d));

  /// Create a copy of Jwk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Ed25519JwkImplCopyWith<_$Ed25519JwkImpl> get copyWith =>
      __$$Ed25519JwkImplCopyWithImpl<_$Ed25519JwkImpl>(this, _$identity);
}

abstract class Ed25519Jwk extends Jwk {
  const factory Ed25519Jwk(
      {@protected @JsonKey(name: 'x') required final Uint8List x,
      @protected @JsonKey(name: 'd') final Uint8List? d}) = _$Ed25519JwkImpl;
  const Ed25519Jwk._() : super._();

  @override
  @protected
  @JsonKey(name: 'x')
  Uint8List get x;
  @override
  @protected
  @JsonKey(name: 'd')
  Uint8List? get d;

  /// Create a copy of Jwk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Ed25519JwkImplCopyWith<_$Ed25519JwkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Secp256k1JwkImplCopyWith<$Res> implements $JwkCopyWith<$Res> {
  factory _$$Secp256k1JwkImplCopyWith(
          _$Secp256k1JwkImpl value, $Res Function(_$Secp256k1JwkImpl) then) =
      __$$Secp256k1JwkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@protected @JsonKey(name: 'x') Uint8List x,
      @protected @JsonKey(name: 'y') Uint8List y,
      @protected @JsonKey(name: 'd') Uint8List? d});
}

/// @nodoc
class __$$Secp256k1JwkImplCopyWithImpl<$Res>
    extends _$JwkCopyWithImpl<$Res, _$Secp256k1JwkImpl>
    implements _$$Secp256k1JwkImplCopyWith<$Res> {
  __$$Secp256k1JwkImplCopyWithImpl(
      _$Secp256k1JwkImpl _value, $Res Function(_$Secp256k1JwkImpl) _then)
      : super(_value, _then);

  /// Create a copy of Jwk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? d = freezed,
  }) {
    return _then(_$Secp256k1JwkImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      d: freezed == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$Secp256k1JwkImpl extends Secp256k1Jwk {
  const _$Secp256k1JwkImpl(
      {@protected @JsonKey(name: 'x') required this.x,
      @protected @JsonKey(name: 'y') required this.y,
      @protected @JsonKey(name: 'd') this.d})
      : super._();

  @override
  @protected
  @JsonKey(name: 'x')
  final Uint8List x;
  @override
  @protected
  @JsonKey(name: 'y')
  final Uint8List y;
  @override
  @protected
  @JsonKey(name: 'd')
  final Uint8List? d;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Secp256k1JwkImpl &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.y, y) &&
            const DeepCollectionEquality().equals(other.d, d));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(x),
      const DeepCollectionEquality().hash(y),
      const DeepCollectionEquality().hash(d));

  /// Create a copy of Jwk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Secp256k1JwkImplCopyWith<_$Secp256k1JwkImpl> get copyWith =>
      __$$Secp256k1JwkImplCopyWithImpl<_$Secp256k1JwkImpl>(this, _$identity);
}

abstract class Secp256k1Jwk extends Jwk {
  const factory Secp256k1Jwk(
      {@protected @JsonKey(name: 'x') required final Uint8List x,
      @protected @JsonKey(name: 'y') required final Uint8List y,
      @protected @JsonKey(name: 'd') final Uint8List? d}) = _$Secp256k1JwkImpl;
  const Secp256k1Jwk._() : super._();

  @override
  @protected
  @JsonKey(name: 'x')
  Uint8List get x;
  @protected
  @JsonKey(name: 'y')
  Uint8List get y;
  @override
  @protected
  @JsonKey(name: 'd')
  Uint8List? get d;

  /// Create a copy of Jwk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Secp256k1JwkImplCopyWith<_$Secp256k1JwkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Secp256r1JwkImplCopyWith<$Res> implements $JwkCopyWith<$Res> {
  factory _$$Secp256r1JwkImplCopyWith(
          _$Secp256r1JwkImpl value, $Res Function(_$Secp256r1JwkImpl) then) =
      __$$Secp256r1JwkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@protected @JsonKey(name: 'x') Uint8List x,
      @protected @JsonKey(name: 'y') Uint8List y,
      @protected @JsonKey(name: 'd') Uint8List? d});
}

/// @nodoc
class __$$Secp256r1JwkImplCopyWithImpl<$Res>
    extends _$JwkCopyWithImpl<$Res, _$Secp256r1JwkImpl>
    implements _$$Secp256r1JwkImplCopyWith<$Res> {
  __$$Secp256r1JwkImplCopyWithImpl(
      _$Secp256r1JwkImpl _value, $Res Function(_$Secp256r1JwkImpl) _then)
      : super(_value, _then);

  /// Create a copy of Jwk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? d = freezed,
  }) {
    return _then(_$Secp256r1JwkImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      d: freezed == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$Secp256r1JwkImpl extends Secp256r1Jwk {
  const _$Secp256r1JwkImpl(
      {@protected @JsonKey(name: 'x') required this.x,
      @protected @JsonKey(name: 'y') required this.y,
      @protected @JsonKey(name: 'd') this.d})
      : super._();

  @override
  @protected
  @JsonKey(name: 'x')
  final Uint8List x;
  @override
  @protected
  @JsonKey(name: 'y')
  final Uint8List y;
  @override
  @protected
  @JsonKey(name: 'd')
  final Uint8List? d;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Secp256r1JwkImpl &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.y, y) &&
            const DeepCollectionEquality().equals(other.d, d));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(x),
      const DeepCollectionEquality().hash(y),
      const DeepCollectionEquality().hash(d));

  /// Create a copy of Jwk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Secp256r1JwkImplCopyWith<_$Secp256r1JwkImpl> get copyWith =>
      __$$Secp256r1JwkImplCopyWithImpl<_$Secp256r1JwkImpl>(this, _$identity);
}

abstract class Secp256r1Jwk extends Jwk {
  const factory Secp256r1Jwk(
      {@protected @JsonKey(name: 'x') required final Uint8List x,
      @protected @JsonKey(name: 'y') required final Uint8List y,
      @protected @JsonKey(name: 'd') final Uint8List? d}) = _$Secp256r1JwkImpl;
  const Secp256r1Jwk._() : super._();

  @override
  @protected
  @JsonKey(name: 'x')
  Uint8List get x;
  @protected
  @JsonKey(name: 'y')
  Uint8List get y;
  @override
  @protected
  @JsonKey(name: 'd')
  Uint8List? get d;

  /// Create a copy of Jwk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Secp256r1JwkImplCopyWith<_$Secp256r1JwkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
