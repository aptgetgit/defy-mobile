// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../key_source_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KeySourceFlowState {}

/// @nodoc
abstract class $KeySourceFlowStateCopyWith<$Res> {
  factory $KeySourceFlowStateCopyWith(
          KeySourceFlowState value, $Res Function(KeySourceFlowState) then) =
      _$KeySourceFlowStateCopyWithImpl<$Res, KeySourceFlowState>;
}

/// @nodoc
class _$KeySourceFlowStateCopyWithImpl<$Res, $Val extends KeySourceFlowState>
    implements $KeySourceFlowStateCopyWith<$Res> {
  _$KeySourceFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$KeySourceIdleImplCopyWith<$Res> {
  factory _$$KeySourceIdleImplCopyWith(
          _$KeySourceIdleImpl value, $Res Function(_$KeySourceIdleImpl) then) =
      __$$KeySourceIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$KeySourceIdleImplCopyWithImpl<$Res>
    extends _$KeySourceFlowStateCopyWithImpl<$Res, _$KeySourceIdleImpl>
    implements _$$KeySourceIdleImplCopyWith<$Res> {
  __$$KeySourceIdleImplCopyWithImpl(
      _$KeySourceIdleImpl _value, $Res Function(_$KeySourceIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$KeySourceIdleImpl implements _KeySourceIdle {
  const _$KeySourceIdleImpl();

  @override
  String toString() {
    return 'KeySourceFlowState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$KeySourceIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _KeySourceIdle implements KeySourceFlowState {
  const factory _KeySourceIdle() = _$KeySourceIdleImpl;
}

/// @nodoc
abstract class _$$GeneratingMnemonicImplCopyWith<$Res> {
  factory _$$GeneratingMnemonicImplCopyWith(_$GeneratingMnemonicImpl value,
          $Res Function(_$GeneratingMnemonicImpl) then) =
      __$$GeneratingMnemonicImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? strength});
}

/// @nodoc
class __$$GeneratingMnemonicImplCopyWithImpl<$Res>
    extends _$KeySourceFlowStateCopyWithImpl<$Res, _$GeneratingMnemonicImpl>
    implements _$$GeneratingMnemonicImplCopyWith<$Res> {
  __$$GeneratingMnemonicImplCopyWithImpl(_$GeneratingMnemonicImpl _value,
      $Res Function(_$GeneratingMnemonicImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strength = freezed,
  }) {
    return _then(_$GeneratingMnemonicImpl(
      strength: freezed == strength
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GeneratingMnemonicImpl implements _GeneratingMnemonic {
  const _$GeneratingMnemonicImpl({this.strength});

  @override
  final int? strength;

  @override
  String toString() {
    return 'KeySourceFlowState.generatingMnemonic(strength: $strength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratingMnemonicImpl &&
            (identical(other.strength, strength) ||
                other.strength == strength));
  }

  @override
  int get hashCode => Object.hash(runtimeType, strength);

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratingMnemonicImplCopyWith<_$GeneratingMnemonicImpl> get copyWith =>
      __$$GeneratingMnemonicImplCopyWithImpl<_$GeneratingMnemonicImpl>(
          this, _$identity);
}

abstract class _GeneratingMnemonic implements KeySourceFlowState {
  const factory _GeneratingMnemonic({final int? strength}) =
      _$GeneratingMnemonicImpl;

  int? get strength;

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneratingMnemonicImplCopyWith<_$GeneratingMnemonicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImportingMnemonicImplCopyWith<$Res> {
  factory _$$ImportingMnemonicImplCopyWith(_$ImportingMnemonicImpl value,
          $Res Function(_$ImportingMnemonicImpl) then) =
      __$$ImportingMnemonicImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List entropy});
}

/// @nodoc
class __$$ImportingMnemonicImplCopyWithImpl<$Res>
    extends _$KeySourceFlowStateCopyWithImpl<$Res, _$ImportingMnemonicImpl>
    implements _$$ImportingMnemonicImplCopyWith<$Res> {
  __$$ImportingMnemonicImplCopyWithImpl(_$ImportingMnemonicImpl _value,
      $Res Function(_$ImportingMnemonicImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entropy = null,
  }) {
    return _then(_$ImportingMnemonicImpl(
      entropy: null == entropy
          ? _value.entropy
          : entropy // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$ImportingMnemonicImpl implements _ImportingMnemonic {
  const _$ImportingMnemonicImpl({required this.entropy});

  @override
  final Uint8List entropy;

  @override
  String toString() {
    return 'KeySourceFlowState.importingMnemonic(entropy: $entropy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportingMnemonicImpl &&
            const DeepCollectionEquality().equals(other.entropy, entropy));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entropy));

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportingMnemonicImplCopyWith<_$ImportingMnemonicImpl> get copyWith =>
      __$$ImportingMnemonicImplCopyWithImpl<_$ImportingMnemonicImpl>(
          this, _$identity);
}

abstract class _ImportingMnemonic implements KeySourceFlowState {
  const factory _ImportingMnemonic({required final Uint8List entropy}) =
      _$ImportingMnemonicImpl;

  Uint8List get entropy;

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImportingMnemonicImplCopyWith<_$ImportingMnemonicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImportingPrivateKeyImplCopyWith<$Res> {
  factory _$$ImportingPrivateKeyImplCopyWith(_$ImportingPrivateKeyImpl value,
          $Res Function(_$ImportingPrivateKeyImpl) then) =
      __$$ImportingPrivateKeyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List privateKey});
}

/// @nodoc
class __$$ImportingPrivateKeyImplCopyWithImpl<$Res>
    extends _$KeySourceFlowStateCopyWithImpl<$Res, _$ImportingPrivateKeyImpl>
    implements _$$ImportingPrivateKeyImplCopyWith<$Res> {
  __$$ImportingPrivateKeyImplCopyWithImpl(_$ImportingPrivateKeyImpl _value,
      $Res Function(_$ImportingPrivateKeyImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privateKey = null,
  }) {
    return _then(_$ImportingPrivateKeyImpl(
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$ImportingPrivateKeyImpl implements _ImportingPrivateKey {
  const _$ImportingPrivateKeyImpl({required this.privateKey});

  @override
  final Uint8List privateKey;

  @override
  String toString() {
    return 'KeySourceFlowState.importingPrivateKey(privateKey: $privateKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportingPrivateKeyImpl &&
            const DeepCollectionEquality()
                .equals(other.privateKey, privateKey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(privateKey));

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportingPrivateKeyImplCopyWith<_$ImportingPrivateKeyImpl> get copyWith =>
      __$$ImportingPrivateKeyImplCopyWithImpl<_$ImportingPrivateKeyImpl>(
          this, _$identity);
}

abstract class _ImportingPrivateKey implements KeySourceFlowState {
  const factory _ImportingPrivateKey({required final Uint8List privateKey}) =
      _$ImportingPrivateKeyImpl;

  Uint8List get privateKey;

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImportingPrivateKeyImplCopyWith<_$ImportingPrivateKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MnemonicReadyImplCopyWith<$Res> {
  factory _$$MnemonicReadyImplCopyWith(
          _$MnemonicReadyImpl value, $Res Function(_$MnemonicReadyImpl) then) =
      __$$MnemonicReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List entropyHash});
}

/// @nodoc
class __$$MnemonicReadyImplCopyWithImpl<$Res>
    extends _$KeySourceFlowStateCopyWithImpl<$Res, _$MnemonicReadyImpl>
    implements _$$MnemonicReadyImplCopyWith<$Res> {
  __$$MnemonicReadyImplCopyWithImpl(
      _$MnemonicReadyImpl _value, $Res Function(_$MnemonicReadyImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entropyHash = null,
  }) {
    return _then(_$MnemonicReadyImpl(
      entropyHash: null == entropyHash
          ? _value.entropyHash
          : entropyHash // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$MnemonicReadyImpl implements _MnemonicReady {
  const _$MnemonicReadyImpl({required this.entropyHash});

  @override
  final Uint8List entropyHash;

  @override
  String toString() {
    return 'KeySourceFlowState.mnemonicReady(entropyHash: $entropyHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MnemonicReadyImpl &&
            const DeepCollectionEquality()
                .equals(other.entropyHash, entropyHash));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(entropyHash));

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MnemonicReadyImplCopyWith<_$MnemonicReadyImpl> get copyWith =>
      __$$MnemonicReadyImplCopyWithImpl<_$MnemonicReadyImpl>(this, _$identity);
}

abstract class _MnemonicReady implements KeySourceFlowState {
  const factory _MnemonicReady({required final Uint8List entropyHash}) =
      _$MnemonicReadyImpl;

  Uint8List get entropyHash;

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MnemonicReadyImplCopyWith<_$MnemonicReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PrivateKeyReadyImplCopyWith<$Res> {
  factory _$$PrivateKeyReadyImplCopyWith(_$PrivateKeyReadyImpl value,
          $Res Function(_$PrivateKeyReadyImpl) then) =
      __$$PrivateKeyReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List jwkThumbprint});
}

/// @nodoc
class __$$PrivateKeyReadyImplCopyWithImpl<$Res>
    extends _$KeySourceFlowStateCopyWithImpl<$Res, _$PrivateKeyReadyImpl>
    implements _$$PrivateKeyReadyImplCopyWith<$Res> {
  __$$PrivateKeyReadyImplCopyWithImpl(
      _$PrivateKeyReadyImpl _value, $Res Function(_$PrivateKeyReadyImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwkThumbprint = null,
  }) {
    return _then(_$PrivateKeyReadyImpl(
      jwkThumbprint: null == jwkThumbprint
          ? _value.jwkThumbprint
          : jwkThumbprint // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$PrivateKeyReadyImpl implements _PrivateKeyReady {
  const _$PrivateKeyReadyImpl({required this.jwkThumbprint});

  @override
  final Uint8List jwkThumbprint;

  @override
  String toString() {
    return 'KeySourceFlowState.privateKeyReady(jwkThumbprint: $jwkThumbprint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivateKeyReadyImpl &&
            const DeepCollectionEquality()
                .equals(other.jwkThumbprint, jwkThumbprint));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(jwkThumbprint));

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivateKeyReadyImplCopyWith<_$PrivateKeyReadyImpl> get copyWith =>
      __$$PrivateKeyReadyImplCopyWithImpl<_$PrivateKeyReadyImpl>(
          this, _$identity);
}

abstract class _PrivateKeyReady implements KeySourceFlowState {
  const factory _PrivateKeyReady({required final Uint8List jwkThumbprint}) =
      _$PrivateKeyReadyImpl;

  Uint8List get jwkThumbprint;

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivateKeyReadyImplCopyWith<_$PrivateKeyReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$KeySourceErrorImplCopyWith<$Res> {
  factory _$$KeySourceErrorImplCopyWith(_$KeySourceErrorImpl value,
          $Res Function(_$KeySourceErrorImpl) then) =
      __$$KeySourceErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$KeySourceErrorImplCopyWithImpl<$Res>
    extends _$KeySourceFlowStateCopyWithImpl<$Res, _$KeySourceErrorImpl>
    implements _$$KeySourceErrorImplCopyWith<$Res> {
  __$$KeySourceErrorImplCopyWithImpl(
      _$KeySourceErrorImpl _value, $Res Function(_$KeySourceErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$KeySourceErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$KeySourceErrorImpl implements _KeySourceError {
  const _$KeySourceErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'KeySourceFlowState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeySourceErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeySourceErrorImplCopyWith<_$KeySourceErrorImpl> get copyWith =>
      __$$KeySourceErrorImplCopyWithImpl<_$KeySourceErrorImpl>(
          this, _$identity);
}

abstract class _KeySourceError implements KeySourceFlowState {
  const factory _KeySourceError(final String message) = _$KeySourceErrorImpl;

  String get message;

  /// Create a copy of KeySourceFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeySourceErrorImplCopyWith<_$KeySourceErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
