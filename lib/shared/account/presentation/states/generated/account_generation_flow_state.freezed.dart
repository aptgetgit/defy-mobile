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
abstract class _$$AccountGenerationStateImportingImplCopyWith<$Res> {
  factory _$$AccountGenerationStateImportingImplCopyWith(
          _$AccountGenerationStateImportingImpl value,
          $Res Function(_$AccountGenerationStateImportingImpl) then) =
      __$$AccountGenerationStateImportingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountGenerationStateImportingImplCopyWithImpl<$Res>
    extends _$AccountGenerationFlowStateCopyWithImpl<$Res,
        _$AccountGenerationStateImportingImpl>
    implements _$$AccountGenerationStateImportingImplCopyWith<$Res> {
  __$$AccountGenerationStateImportingImplCopyWithImpl(
      _$AccountGenerationStateImportingImpl _value,
      $Res Function(_$AccountGenerationStateImportingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AccountGenerationStateImportingImpl
    implements AccountGenerationStateImporting {
  const _$AccountGenerationStateImportingImpl();

  @override
  String toString() {
    return 'AccountGenerationFlowState.importing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountGenerationStateImportingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class AccountGenerationStateImporting
    implements AccountGenerationFlowState {
  const factory AccountGenerationStateImporting() =
      _$AccountGenerationStateImportingImpl;
}

/// @nodoc
abstract class _$$AccountGenerationStateWaitingForMetadataImplCopyWith<$Res> {
  factory _$$AccountGenerationStateWaitingForMetadataImplCopyWith(
          _$AccountGenerationStateWaitingForMetadataImpl value,
          $Res Function(_$AccountGenerationStateWaitingForMetadataImpl) then) =
      __$$AccountGenerationStateWaitingForMetadataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({KeySource keySource});

  $KeySourceCopyWith<$Res> get keySource;
}

/// @nodoc
class __$$AccountGenerationStateWaitingForMetadataImplCopyWithImpl<$Res>
    extends _$AccountGenerationFlowStateCopyWithImpl<$Res,
        _$AccountGenerationStateWaitingForMetadataImpl>
    implements _$$AccountGenerationStateWaitingForMetadataImplCopyWith<$Res> {
  __$$AccountGenerationStateWaitingForMetadataImplCopyWithImpl(
      _$AccountGenerationStateWaitingForMetadataImpl _value,
      $Res Function(_$AccountGenerationStateWaitingForMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keySource = null,
  }) {
    return _then(_$AccountGenerationStateWaitingForMetadataImpl(
      keySource: null == keySource
          ? _value.keySource
          : keySource // ignore: cast_nullable_to_non_nullable
              as KeySource,
    ));
  }

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeySourceCopyWith<$Res> get keySource {
    return $KeySourceCopyWith<$Res>(_value.keySource, (value) {
      return _then(_value.copyWith(keySource: value));
    });
  }
}

/// @nodoc

class _$AccountGenerationStateWaitingForMetadataImpl
    implements AccountGenerationStateWaitingForMetadata {
  const _$AccountGenerationStateWaitingForMetadataImpl(
      {required this.keySource});

  @override
  final KeySource keySource;

  @override
  String toString() {
    return 'AccountGenerationFlowState.waitingForMetadata(keySource: $keySource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountGenerationStateWaitingForMetadataImpl &&
            (identical(other.keySource, keySource) ||
                other.keySource == keySource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keySource);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountGenerationStateWaitingForMetadataImplCopyWith<
          _$AccountGenerationStateWaitingForMetadataImpl>
      get copyWith =>
          __$$AccountGenerationStateWaitingForMetadataImplCopyWithImpl<
              _$AccountGenerationStateWaitingForMetadataImpl>(this, _$identity);
}

abstract class AccountGenerationStateWaitingForMetadata
    implements AccountGenerationFlowState {
  const factory AccountGenerationStateWaitingForMetadata(
          {required final KeySource keySource}) =
      _$AccountGenerationStateWaitingForMetadataImpl;

  KeySource get keySource;

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountGenerationStateWaitingForMetadataImplCopyWith<
          _$AccountGenerationStateWaitingForMetadataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountGenerationStateGeneratingImplCopyWith<$Res> {
  factory _$$AccountGenerationStateGeneratingImplCopyWith(
          _$AccountGenerationStateGeneratingImpl value,
          $Res Function(_$AccountGenerationStateGeneratingImpl) then) =
      __$$AccountGenerationStateGeneratingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({KeySource keySource, String label, Uri iconUri});

  $KeySourceCopyWith<$Res> get keySource;
}

/// @nodoc
class __$$AccountGenerationStateGeneratingImplCopyWithImpl<$Res>
    extends _$AccountGenerationFlowStateCopyWithImpl<$Res,
        _$AccountGenerationStateGeneratingImpl>
    implements _$$AccountGenerationStateGeneratingImplCopyWith<$Res> {
  __$$AccountGenerationStateGeneratingImplCopyWithImpl(
      _$AccountGenerationStateGeneratingImpl _value,
      $Res Function(_$AccountGenerationStateGeneratingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keySource = null,
    Object? label = null,
    Object? iconUri = null,
  }) {
    return _then(_$AccountGenerationStateGeneratingImpl(
      keySource: null == keySource
          ? _value.keySource
          : keySource // ignore: cast_nullable_to_non_nullable
              as KeySource,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      iconUri: null == iconUri
          ? _value.iconUri
          : iconUri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KeySourceCopyWith<$Res> get keySource {
    return $KeySourceCopyWith<$Res>(_value.keySource, (value) {
      return _then(_value.copyWith(keySource: value));
    });
  }
}

/// @nodoc

class _$AccountGenerationStateGeneratingImpl
    implements AccountGenerationStateGenerating {
  const _$AccountGenerationStateGeneratingImpl(
      {required this.keySource, required this.label, required this.iconUri});

  @override
  final KeySource keySource;
  @override
  final String label;
  @override
  final Uri iconUri;

  @override
  String toString() {
    return 'AccountGenerationFlowState.generating(keySource: $keySource, label: $label, iconUri: $iconUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountGenerationStateGeneratingImpl &&
            (identical(other.keySource, keySource) ||
                other.keySource == keySource) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.iconUri, iconUri) || other.iconUri == iconUri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keySource, label, iconUri);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountGenerationStateGeneratingImplCopyWith<
          _$AccountGenerationStateGeneratingImpl>
      get copyWith => __$$AccountGenerationStateGeneratingImplCopyWithImpl<
          _$AccountGenerationStateGeneratingImpl>(this, _$identity);
}

abstract class AccountGenerationStateGenerating
    implements AccountGenerationFlowState {
  const factory AccountGenerationStateGenerating(
      {required final KeySource keySource,
      required final String label,
      required final Uri iconUri}) = _$AccountGenerationStateGeneratingImpl;

  KeySource get keySource;
  String get label;
  Uri get iconUri;

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountGenerationStateGeneratingImplCopyWith<
          _$AccountGenerationStateGeneratingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountGenerationStateReadyImplCopyWith<$Res> {
  factory _$$AccountGenerationStateReadyImplCopyWith(
          _$AccountGenerationStateReadyImpl value,
          $Res Function(_$AccountGenerationStateReadyImpl) then) =
      __$$AccountGenerationStateReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AptosAccountWithMetadata account});

  $AptosAccountWithMetadataCopyWith<$Res> get account;
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
              as AptosAccountWithMetadata,
    ));
  }

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AptosAccountWithMetadataCopyWith<$Res> get account {
    return $AptosAccountWithMetadataCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc

class _$AccountGenerationStateReadyImpl implements AccountGenerationStateReady {
  const _$AccountGenerationStateReadyImpl({required this.account});

  @override
  final AptosAccountWithMetadata account;

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
          {required final AptosAccountWithMetadata account}) =
      _$AccountGenerationStateReadyImpl;

  AptosAccountWithMetadata get account;

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountGenerationStateReadyImplCopyWith<_$AccountGenerationStateReadyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountGenerationStateErrorImplCopyWith<$Res> {
  factory _$$AccountGenerationStateErrorImplCopyWith(
          _$AccountGenerationStateErrorImpl value,
          $Res Function(_$AccountGenerationStateErrorImpl) then) =
      __$$AccountGenerationStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AccountGenerationStateErrorImplCopyWithImpl<$Res>
    extends _$AccountGenerationFlowStateCopyWithImpl<$Res,
        _$AccountGenerationStateErrorImpl>
    implements _$$AccountGenerationStateErrorImplCopyWith<$Res> {
  __$$AccountGenerationStateErrorImplCopyWithImpl(
      _$AccountGenerationStateErrorImpl _value,
      $Res Function(_$AccountGenerationStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AccountGenerationStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountGenerationStateErrorImpl implements AccountGenerationStateError {
  const _$AccountGenerationStateErrorImpl(this.message);

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
            other is _$AccountGenerationStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountGenerationStateErrorImplCopyWith<_$AccountGenerationStateErrorImpl>
      get copyWith => __$$AccountGenerationStateErrorImplCopyWithImpl<
          _$AccountGenerationStateErrorImpl>(this, _$identity);
}

abstract class AccountGenerationStateError
    implements AccountGenerationFlowState {
  const factory AccountGenerationStateError(final String message) =
      _$AccountGenerationStateErrorImpl;

  String get message;

  /// Create a copy of AccountGenerationFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountGenerationStateErrorImplCopyWith<_$AccountGenerationStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
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
