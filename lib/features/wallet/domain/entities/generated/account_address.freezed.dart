// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../account_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountAddress {
  Uint8List get bytes => throw _privateConstructorUsedError;

  /// Create a copy of AccountAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountAddressCopyWith<AccountAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountAddressCopyWith<$Res> {
  factory $AccountAddressCopyWith(
          AccountAddress value, $Res Function(AccountAddress) then) =
      _$AccountAddressCopyWithImpl<$Res, AccountAddress>;
  @useResult
  $Res call({Uint8List bytes});
}

/// @nodoc
class _$AccountAddressCopyWithImpl<$Res, $Val extends AccountAddress>
    implements $AccountAddressCopyWith<$Res> {
  _$AccountAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountAddress
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
abstract class _$$AccountAddressImplCopyWith<$Res>
    implements $AccountAddressCopyWith<$Res> {
  factory _$$AccountAddressImplCopyWith(_$AccountAddressImpl value,
          $Res Function(_$AccountAddressImpl) then) =
      __$$AccountAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uint8List bytes});
}

/// @nodoc
class __$$AccountAddressImplCopyWithImpl<$Res>
    extends _$AccountAddressCopyWithImpl<$Res, _$AccountAddressImpl>
    implements _$$AccountAddressImplCopyWith<$Res> {
  __$$AccountAddressImplCopyWithImpl(
      _$AccountAddressImpl _value, $Res Function(_$AccountAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bytes = null,
  }) {
    return _then(_$AccountAddressImpl(
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$AccountAddressImpl extends _AccountAddress {
  const _$AccountAddressImpl({required this.bytes})
      : assert(bytes.length == 32, 'Account address must be 32 bytes'),
        super._();

  @override
  final Uint8List bytes;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountAddressImpl &&
            const DeepCollectionEquality().equals(other.bytes, bytes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(bytes));

  /// Create a copy of AccountAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountAddressImplCopyWith<_$AccountAddressImpl> get copyWith =>
      __$$AccountAddressImplCopyWithImpl<_$AccountAddressImpl>(
          this, _$identity);
}

abstract class _AccountAddress extends AccountAddress {
  const factory _AccountAddress({required final Uint8List bytes}) =
      _$AccountAddressImpl;
  const _AccountAddress._() : super._();

  @override
  Uint8List get bytes;

  /// Create a copy of AccountAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountAddressImplCopyWith<_$AccountAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
