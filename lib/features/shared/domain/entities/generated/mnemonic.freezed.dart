// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../mnemonic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MnemonicWrapper {
  Mnemonic get mnemonic => throw _privateConstructorUsedError;

  /// Create a copy of MnemonicWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MnemonicWrapperCopyWith<MnemonicWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MnemonicWrapperCopyWith<$Res> {
  factory $MnemonicWrapperCopyWith(
          MnemonicWrapper value, $Res Function(MnemonicWrapper) then) =
      _$MnemonicWrapperCopyWithImpl<$Res, MnemonicWrapper>;
  @useResult
  $Res call({Mnemonic mnemonic});
}

/// @nodoc
class _$MnemonicWrapperCopyWithImpl<$Res, $Val extends MnemonicWrapper>
    implements $MnemonicWrapperCopyWith<$Res> {
  _$MnemonicWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MnemonicWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mnemonic = null,
  }) {
    return _then(_value.copyWith(
      mnemonic: null == mnemonic
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as Mnemonic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MnemonicWrapperImplCopyWith<$Res>
    implements $MnemonicWrapperCopyWith<$Res> {
  factory _$$MnemonicWrapperImplCopyWith(_$MnemonicWrapperImpl value,
          $Res Function(_$MnemonicWrapperImpl) then) =
      __$$MnemonicWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Mnemonic mnemonic});
}

/// @nodoc
class __$$MnemonicWrapperImplCopyWithImpl<$Res>
    extends _$MnemonicWrapperCopyWithImpl<$Res, _$MnemonicWrapperImpl>
    implements _$$MnemonicWrapperImplCopyWith<$Res> {
  __$$MnemonicWrapperImplCopyWithImpl(
      _$MnemonicWrapperImpl _value, $Res Function(_$MnemonicWrapperImpl) _then)
      : super(_value, _then);

  /// Create a copy of MnemonicWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mnemonic = null,
  }) {
    return _then(_$MnemonicWrapperImpl(
      mnemonic: null == mnemonic
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as Mnemonic,
    ));
  }
}

/// @nodoc

class _$MnemonicWrapperImpl extends _MnemonicWrapper {
  const _$MnemonicWrapperImpl({required this.mnemonic}) : super._();

  @override
  final Mnemonic mnemonic;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MnemonicWrapperImpl &&
            (identical(other.mnemonic, mnemonic) ||
                other.mnemonic == mnemonic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mnemonic);

  /// Create a copy of MnemonicWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MnemonicWrapperImplCopyWith<_$MnemonicWrapperImpl> get copyWith =>
      __$$MnemonicWrapperImplCopyWithImpl<_$MnemonicWrapperImpl>(
          this, _$identity);
}

abstract class _MnemonicWrapper extends MnemonicWrapper {
  const factory _MnemonicWrapper({required final Mnemonic mnemonic}) =
      _$MnemonicWrapperImpl;
  const _MnemonicWrapper._() : super._();

  @override
  Mnemonic get mnemonic;

  /// Create a copy of MnemonicWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MnemonicWrapperImplCopyWith<_$MnemonicWrapperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
