// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../sign_buffer_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignBufferFlowState {}

/// @nodoc
abstract class $SignBufferFlowStateCopyWith<$Res> {
  factory $SignBufferFlowStateCopyWith(
          SignBufferFlowState value, $Res Function(SignBufferFlowState) then) =
      _$SignBufferFlowStateCopyWithImpl<$Res, SignBufferFlowState>;
}

/// @nodoc
class _$SignBufferFlowStateCopyWithImpl<$Res, $Val extends SignBufferFlowState>
    implements $SignBufferFlowStateCopyWith<$Res> {
  _$SignBufferFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignBufferFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignBufferFlowStateIdleImplCopyWith<$Res> {
  factory _$$SignBufferFlowStateIdleImplCopyWith(
          _$SignBufferFlowStateIdleImpl value,
          $Res Function(_$SignBufferFlowStateIdleImpl) then) =
      __$$SignBufferFlowStateIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignBufferFlowStateIdleImplCopyWithImpl<$Res>
    extends _$SignBufferFlowStateCopyWithImpl<$Res,
        _$SignBufferFlowStateIdleImpl>
    implements _$$SignBufferFlowStateIdleImplCopyWith<$Res> {
  __$$SignBufferFlowStateIdleImplCopyWithImpl(
      _$SignBufferFlowStateIdleImpl _value,
      $Res Function(_$SignBufferFlowStateIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignBufferFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignBufferFlowStateIdleImpl implements SignBufferFlowStateIdle {
  const _$SignBufferFlowStateIdleImpl();

  @override
  String toString() {
    return 'SignBufferFlowState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignBufferFlowStateIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class SignBufferFlowStateIdle implements SignBufferFlowState {
  const factory SignBufferFlowStateIdle() = _$SignBufferFlowStateIdleImpl;
}

/// @nodoc
abstract class _$$SignBufferFlowStateSigningImplCopyWith<$Res> {
  factory _$$SignBufferFlowStateSigningImplCopyWith(
          _$SignBufferFlowStateSigningImpl value,
          $Res Function(_$SignBufferFlowStateSigningImpl) then) =
      __$$SignBufferFlowStateSigningImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignBufferFlowStateSigningImplCopyWithImpl<$Res>
    extends _$SignBufferFlowStateCopyWithImpl<$Res,
        _$SignBufferFlowStateSigningImpl>
    implements _$$SignBufferFlowStateSigningImplCopyWith<$Res> {
  __$$SignBufferFlowStateSigningImplCopyWithImpl(
      _$SignBufferFlowStateSigningImpl _value,
      $Res Function(_$SignBufferFlowStateSigningImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignBufferFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignBufferFlowStateSigningImpl implements SignBufferFlowStateSigning {
  const _$SignBufferFlowStateSigningImpl();

  @override
  String toString() {
    return 'SignBufferFlowState.signing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignBufferFlowStateSigningImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class SignBufferFlowStateSigning implements SignBufferFlowState {
  const factory SignBufferFlowStateSigning() = _$SignBufferFlowStateSigningImpl;
}

/// @nodoc
abstract class _$$SignBufferFlowStateSignedImplCopyWith<$Res> {
  factory _$$SignBufferFlowStateSignedImplCopyWith(
          _$SignBufferFlowStateSignedImpl value,
          $Res Function(_$SignBufferFlowStateSignedImpl) then) =
      __$$SignBufferFlowStateSignedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List signature, Uint8List publicKey});
}

/// @nodoc
class __$$SignBufferFlowStateSignedImplCopyWithImpl<$Res>
    extends _$SignBufferFlowStateCopyWithImpl<$Res,
        _$SignBufferFlowStateSignedImpl>
    implements _$$SignBufferFlowStateSignedImplCopyWith<$Res> {
  __$$SignBufferFlowStateSignedImplCopyWithImpl(
      _$SignBufferFlowStateSignedImpl _value,
      $Res Function(_$SignBufferFlowStateSignedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignBufferFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signature = null,
    Object? publicKey = null,
  }) {
    return _then(_$SignBufferFlowStateSignedImpl(
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$SignBufferFlowStateSignedImpl implements SignBufferFlowStateSigned {
  const _$SignBufferFlowStateSignedImpl(
      {required this.signature, required this.publicKey});

  @override
  final Uint8List signature;
  @override
  final Uint8List publicKey;

  @override
  String toString() {
    return 'SignBufferFlowState.signed(signature: $signature, publicKey: $publicKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignBufferFlowStateSignedImpl &&
            const DeepCollectionEquality().equals(other.signature, signature) &&
            const DeepCollectionEquality().equals(other.publicKey, publicKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(signature),
      const DeepCollectionEquality().hash(publicKey));

  /// Create a copy of SignBufferFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignBufferFlowStateSignedImplCopyWith<_$SignBufferFlowStateSignedImpl>
      get copyWith => __$$SignBufferFlowStateSignedImplCopyWithImpl<
          _$SignBufferFlowStateSignedImpl>(this, _$identity);
}

abstract class SignBufferFlowStateSigned implements SignBufferFlowState {
  const factory SignBufferFlowStateSigned(
      {required final Uint8List signature,
      required final Uint8List publicKey}) = _$SignBufferFlowStateSignedImpl;

  Uint8List get signature;
  Uint8List get publicKey;

  /// Create a copy of SignBufferFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignBufferFlowStateSignedImplCopyWith<_$SignBufferFlowStateSignedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignBufferFlowStateErrorImplCopyWith<$Res> {
  factory _$$SignBufferFlowStateErrorImplCopyWith(
          _$SignBufferFlowStateErrorImpl value,
          $Res Function(_$SignBufferFlowStateErrorImpl) then) =
      __$$SignBufferFlowStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SignBufferFlowStateErrorImplCopyWithImpl<$Res>
    extends _$SignBufferFlowStateCopyWithImpl<$Res,
        _$SignBufferFlowStateErrorImpl>
    implements _$$SignBufferFlowStateErrorImplCopyWith<$Res> {
  __$$SignBufferFlowStateErrorImplCopyWithImpl(
      _$SignBufferFlowStateErrorImpl _value,
      $Res Function(_$SignBufferFlowStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignBufferFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SignBufferFlowStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignBufferFlowStateErrorImpl implements SignBufferFlowStateError {
  const _$SignBufferFlowStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SignBufferFlowState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignBufferFlowStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SignBufferFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignBufferFlowStateErrorImplCopyWith<_$SignBufferFlowStateErrorImpl>
      get copyWith => __$$SignBufferFlowStateErrorImplCopyWithImpl<
          _$SignBufferFlowStateErrorImpl>(this, _$identity);
}

abstract class SignBufferFlowStateError implements SignBufferFlowState {
  const factory SignBufferFlowStateError(final String message) =
      _$SignBufferFlowStateErrorImpl;

  String get message;

  /// Create a copy of SignBufferFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignBufferFlowStateErrorImplCopyWith<_$SignBufferFlowStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
