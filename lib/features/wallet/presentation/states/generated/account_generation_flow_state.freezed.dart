// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../account_generation_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountGenerationFlowState {}

/// @nodoc
abstract class $AccountGenerationFlowStateCopyWith<$Res> {
  factory $AccountGenerationFlowStateCopyWith(AccountGenerationFlowState value,
          $Res Function(AccountGenerationFlowState) then) =
      _$AccountGenerationFlowStateCopyWithImpl<$Res,
          AccountGenerationFlowState>;
}

/// @nodoc
class _$AccountGenerationFlowStateCopyWithImpl<$Res,
        $Val extends AccountGenerationFlowState>
    implements $AccountGenerationFlowStateCopyWith<$Res> {
  _$AccountGenerationFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AccountGenerationStateIdleImplCopyWith<$Res> {
  factory _$$AccountGenerationStateIdleImplCopyWith(
          _$AccountGenerationStateIdleImpl value,
          $Res Function(_$AccountGenerationStateIdleImpl) then) =
      __$$AccountGenerationStateIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountGenerationStateIdleImplCopyWithImpl<$Res>
    extends _$AccountGenerationFlowStateCopyWithImpl<$Res,
        _$AccountGenerationStateIdleImpl>
    implements _$$AccountGenerationStateIdleImplCopyWith<$Res> {
  __$$AccountGenerationStateIdleImplCopyWithImpl(
      _$AccountGenerationStateIdleImpl _value,
      $Res Function(_$AccountGenerationStateIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AccountGenerationStateIdleImpl implements AccountGenerationStateIdle {
  const _$AccountGenerationStateIdleImpl();

  @override
  String toString() {
    return 'AccountGenerationFlowState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountGenerationStateIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class AccountGenerationStateIdle
    implements AccountGenerationFlowState {
  const factory AccountGenerationStateIdle() = _$AccountGenerationStateIdleImpl;
}

/// @nodoc
abstract class _$$AccountGenerationStateInProgressImplCopyWith<$Res> {
  factory _$$AccountGenerationStateInProgressImplCopyWith(
          _$AccountGenerationStateInProgressImpl value,
          $Res Function(_$AccountGenerationStateInProgressImpl) then) =
      __$$AccountGenerationStateInProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({KeySource source});

  $KeySourceCopyWith<$Res> get source;
}

/// @nodoc
class __$$AccountGenerationStateInProgressImplCopyWithImpl<$Res>
    extends _$AccountGenerationFlowStateCopyWithImpl<$Res,
        _$AccountGenerationStateInProgressImpl>
    implements _$$AccountGenerationStateInProgressImplCopyWith<$Res> {
  __$$AccountGenerationStateInProgressImplCopyWithImpl(
      _$AccountGenerationStateInProgressImpl _value,
      $Res Function(_$AccountGenerationStateInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$AccountGenerationStateInProgressImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as KeySource,
    ));
  }

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeySourceCopyWith<$Res> get source {
    return $KeySourceCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value));
    });
  }
}

/// @nodoc

class _$AccountGenerationStateInProgressImpl
    implements AccountGenerationStateInProgress {
  const _$AccountGenerationStateInProgressImpl({required this.source});

  @override
  final KeySource source;

  @override
  String toString() {
    return 'AccountGenerationFlowState.inProgress(source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountGenerationStateInProgressImpl &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountGenerationStateInProgressImplCopyWith<
          _$AccountGenerationStateInProgressImpl>
      get copyWith => __$$AccountGenerationStateInProgressImplCopyWithImpl<
          _$AccountGenerationStateInProgressImpl>(this, _$identity);
}

abstract class AccountGenerationStateInProgress
    implements AccountGenerationFlowState {
  const factory AccountGenerationStateInProgress(
          {required final KeySource source}) =
      _$AccountGenerationStateInProgressImpl;

  KeySource get source;

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountGenerationStateInProgressImplCopyWith<
          _$AccountGenerationStateInProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountGenerationStateReadyImplCopyWith<$Res> {
  factory _$$AccountGenerationStateReadyImplCopyWith(
          _$AccountGenerationStateReadyImpl value,
          $Res Function(_$AccountGenerationStateReadyImpl) then) =
      __$$AccountGenerationStateReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AptosAccount account});

  $AptosAccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$AccountGenerationStateReadyImplCopyWithImpl<$Res>
    extends _$AccountGenerationFlowStateCopyWithImpl<$Res,
        _$AccountGenerationStateReadyImpl>
    implements _$$AccountGenerationStateReadyImplCopyWith<$Res> {
  __$$AccountGenerationStateReadyImplCopyWithImpl(
      _$AccountGenerationStateReadyImpl _value,
      $Res Function(_$AccountGenerationStateReadyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$AccountGenerationStateReadyImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AptosAccount,
    ));
  }

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AptosAccountCopyWith<$Res> get account {
    return $AptosAccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc

class _$AccountGenerationStateReadyImpl implements AccountGenerationStateReady {
  const _$AccountGenerationStateReadyImpl({required this.account});

  @override
  final AptosAccount account;

  @override
  String toString() {
    return 'AccountGenerationFlowState.ready(account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountGenerationStateReadyImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountGenerationStateReadyImplCopyWith<_$AccountGenerationStateReadyImpl>
      get copyWith => __$$AccountGenerationStateReadyImplCopyWithImpl<
          _$AccountGenerationStateReadyImpl>(this, _$identity);
}

abstract class AccountGenerationStateReady
    implements AccountGenerationFlowState {
  const factory AccountGenerationStateReady(
          {required final AptosAccount account}) =
      _$AccountGenerationStateReadyImpl;

  AptosAccount get account;

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountGenerationStateReadyImplCopyWith<_$AccountGenerationStateReadyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AccountGenerationFlowStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AccountGenerationFlowState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);
}

abstract class _Error implements AccountGenerationFlowState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$KeySource {}

/// @nodoc
abstract class $KeySourceCopyWith<$Res> {
  factory $KeySourceCopyWith(KeySource value, $Res Function(KeySource) then) =
      _$KeySourceCopyWithImpl<$Res, KeySource>;
}

/// @nodoc
class _$KeySourceCopyWithImpl<$Res, $Val extends KeySource>
    implements $KeySourceCopyWith<$Res> {
  _$KeySourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KeySource
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$KeySourceMnemonicImplCopyWith<$Res> {
  factory _$$KeySourceMnemonicImplCopyWith(_$KeySourceMnemonicImpl value,
          $Res Function(_$KeySourceMnemonicImpl) then) =
      __$$KeySourceMnemonicImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List entropyHash, int? accountIndex});
}

/// @nodoc
class __$$KeySourceMnemonicImplCopyWithImpl<$Res>
    extends _$KeySourceCopyWithImpl<$Res, _$KeySourceMnemonicImpl>
    implements _$$KeySourceMnemonicImplCopyWith<$Res> {
  __$$KeySourceMnemonicImplCopyWithImpl(_$KeySourceMnemonicImpl _value,
      $Res Function(_$KeySourceMnemonicImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeySource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entropyHash = null,
    Object? accountIndex = freezed,
  }) {
    return _then(_$KeySourceMnemonicImpl(
      entropyHash: null == entropyHash
          ? _value.entropyHash
          : entropyHash // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      accountIndex: freezed == accountIndex
          ? _value.accountIndex
          : accountIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$KeySourceMnemonicImpl implements KeySourceMnemonic {
  const _$KeySourceMnemonicImpl({required this.entropyHash, this.accountIndex});

  @override
  final Uint8List entropyHash;
  @override
  final int? accountIndex;

  @override
  String toString() {
    return 'KeySource.mnemonic(entropyHash: $entropyHash, accountIndex: $accountIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeySourceMnemonicImpl &&
            const DeepCollectionEquality()
                .equals(other.entropyHash, entropyHash) &&
            (identical(other.accountIndex, accountIndex) ||
                other.accountIndex == accountIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(entropyHash), accountIndex);

  /// Create a copy of KeySource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeySourceMnemonicImplCopyWith<_$KeySourceMnemonicImpl> get copyWith =>
      __$$KeySourceMnemonicImplCopyWithImpl<_$KeySourceMnemonicImpl>(
          this, _$identity);
}

abstract class KeySourceMnemonic implements KeySource {
  const factory KeySourceMnemonic(
      {required final Uint8List entropyHash,
      final int? accountIndex}) = _$KeySourceMnemonicImpl;

  Uint8List get entropyHash;
  int? get accountIndex;

  /// Create a copy of KeySource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeySourceMnemonicImplCopyWith<_$KeySourceMnemonicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$KeySourcePrivateKeyImplCopyWith<$Res> {
  factory _$$KeySourcePrivateKeyImplCopyWith(_$KeySourcePrivateKeyImpl value,
          $Res Function(_$KeySourcePrivateKeyImpl) then) =
      __$$KeySourcePrivateKeyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List jwkThumbprint});
}

/// @nodoc
class __$$KeySourcePrivateKeyImplCopyWithImpl<$Res>
    extends _$KeySourceCopyWithImpl<$Res, _$KeySourcePrivateKeyImpl>
    implements _$$KeySourcePrivateKeyImplCopyWith<$Res> {
  __$$KeySourcePrivateKeyImplCopyWithImpl(_$KeySourcePrivateKeyImpl _value,
      $Res Function(_$KeySourcePrivateKeyImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeySource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwkThumbprint = null,
  }) {
    return _then(_$KeySourcePrivateKeyImpl(
      jwkThumbprint: null == jwkThumbprint
          ? _value.jwkThumbprint
          : jwkThumbprint // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$KeySourcePrivateKeyImpl implements KeySourcePrivateKey {
  const _$KeySourcePrivateKeyImpl({required this.jwkThumbprint});

  @override
  final Uint8List jwkThumbprint;

  @override
  String toString() {
    return 'KeySource.privateKey(jwkThumbprint: $jwkThumbprint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeySourcePrivateKeyImpl &&
            const DeepCollectionEquality()
                .equals(other.jwkThumbprint, jwkThumbprint));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(jwkThumbprint));

  /// Create a copy of KeySource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeySourcePrivateKeyImplCopyWith<_$KeySourcePrivateKeyImpl> get copyWith =>
      __$$KeySourcePrivateKeyImplCopyWithImpl<_$KeySourcePrivateKeyImpl>(
          this, _$identity);
}

abstract class KeySourcePrivateKey implements KeySource {
  const factory KeySourcePrivateKey({required final Uint8List jwkThumbprint}) =
      _$KeySourcePrivateKeyImpl;

  Uint8List get jwkThumbprint;

  /// Create a copy of KeySource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeySourcePrivateKeyImplCopyWith<_$KeySourcePrivateKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
