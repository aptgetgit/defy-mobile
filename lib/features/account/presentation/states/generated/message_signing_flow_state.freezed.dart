// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../message_signing_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessageSigningFlowState {}

/// @nodoc
abstract class $MessageSigningFlowStateCopyWith<$Res> {
  factory $MessageSigningFlowStateCopyWith(MessageSigningFlowState value,
          $Res Function(MessageSigningFlowState) then) =
      _$MessageSigningFlowStateCopyWithImpl<$Res, MessageSigningFlowState>;
}

/// @nodoc
class _$MessageSigningFlowStateCopyWithImpl<$Res,
        $Val extends MessageSigningFlowState>
    implements $MessageSigningFlowStateCopyWith<$Res> {
  _$MessageSigningFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageSigningFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MessageSigningFlowInitialImplCopyWith<$Res> {
  factory _$$MessageSigningFlowInitialImplCopyWith(
          _$MessageSigningFlowInitialImpl value,
          $Res Function(_$MessageSigningFlowInitialImpl) then) =
      __$$MessageSigningFlowInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MessageSigningFlowInitialImplCopyWithImpl<$Res>
    extends _$MessageSigningFlowStateCopyWithImpl<$Res,
        _$MessageSigningFlowInitialImpl>
    implements _$$MessageSigningFlowInitialImplCopyWith<$Res> {
  __$$MessageSigningFlowInitialImplCopyWithImpl(
      _$MessageSigningFlowInitialImpl _value,
      $Res Function(_$MessageSigningFlowInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageSigningFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MessageSigningFlowInitialImpl implements MessageSigningFlowInitial {
  const _$MessageSigningFlowInitialImpl();

  @override
  String toString() {
    return 'MessageSigningFlowState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageSigningFlowInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class MessageSigningFlowInitial implements MessageSigningFlowState {
  const factory MessageSigningFlowInitial() = _$MessageSigningFlowInitialImpl;
}

/// @nodoc
abstract class _$$MessageSigningFlowSigningImplCopyWith<$Res> {
  factory _$$MessageSigningFlowSigningImplCopyWith(
          _$MessageSigningFlowSigningImpl value,
          $Res Function(_$MessageSigningFlowSigningImpl) then) =
      __$$MessageSigningFlowSigningImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MessageSigningFlowSigningImplCopyWithImpl<$Res>
    extends _$MessageSigningFlowStateCopyWithImpl<$Res,
        _$MessageSigningFlowSigningImpl>
    implements _$$MessageSigningFlowSigningImplCopyWith<$Res> {
  __$$MessageSigningFlowSigningImplCopyWithImpl(
      _$MessageSigningFlowSigningImpl _value,
      $Res Function(_$MessageSigningFlowSigningImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageSigningFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MessageSigningFlowSigningImpl implements MessageSigningFlowSigning {
  const _$MessageSigningFlowSigningImpl();

  @override
  String toString() {
    return 'MessageSigningFlowState.signing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageSigningFlowSigningImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class MessageSigningFlowSigning implements MessageSigningFlowState {
  const factory MessageSigningFlowSigning() = _$MessageSigningFlowSigningImpl;
}

/// @nodoc
abstract class _$$MessageSigningFlowCompletedImplCopyWith<$Res> {
  factory _$$MessageSigningFlowCompletedImplCopyWith(
          _$MessageSigningFlowCompletedImpl value,
          $Res Function(_$MessageSigningFlowCompletedImpl) then) =
      __$$MessageSigningFlowCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List signature, Uint8List publicKey});
}

/// @nodoc
class __$$MessageSigningFlowCompletedImplCopyWithImpl<$Res>
    extends _$MessageSigningFlowStateCopyWithImpl<$Res,
        _$MessageSigningFlowCompletedImpl>
    implements _$$MessageSigningFlowCompletedImplCopyWith<$Res> {
  __$$MessageSigningFlowCompletedImplCopyWithImpl(
      _$MessageSigningFlowCompletedImpl _value,
      $Res Function(_$MessageSigningFlowCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageSigningFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signature = null,
    Object? publicKey = null,
  }) {
    return _then(_$MessageSigningFlowCompletedImpl(
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

class _$MessageSigningFlowCompletedImpl implements MessageSigningFlowCompleted {
  const _$MessageSigningFlowCompletedImpl(
      {required this.signature, required this.publicKey});

  @override
  final Uint8List signature;
  @override
  final Uint8List publicKey;

  @override
  String toString() {
    return 'MessageSigningFlowState.completed(signature: $signature, publicKey: $publicKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageSigningFlowCompletedImpl &&
            const DeepCollectionEquality().equals(other.signature, signature) &&
            const DeepCollectionEquality().equals(other.publicKey, publicKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(signature),
      const DeepCollectionEquality().hash(publicKey));

  /// Create a copy of MessageSigningFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageSigningFlowCompletedImplCopyWith<_$MessageSigningFlowCompletedImpl>
      get copyWith => __$$MessageSigningFlowCompletedImplCopyWithImpl<
          _$MessageSigningFlowCompletedImpl>(this, _$identity);
}

abstract class MessageSigningFlowCompleted implements MessageSigningFlowState {
  const factory MessageSigningFlowCompleted(
      {required final Uint8List signature,
      required final Uint8List publicKey}) = _$MessageSigningFlowCompletedImpl;

  Uint8List get signature;
  Uint8List get publicKey;

  /// Create a copy of MessageSigningFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageSigningFlowCompletedImplCopyWith<_$MessageSigningFlowCompletedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageSigningFlowFailedImplCopyWith<$Res> {
  factory _$$MessageSigningFlowFailedImplCopyWith(
          _$MessageSigningFlowFailedImpl value,
          $Res Function(_$MessageSigningFlowFailedImpl) then) =
      __$$MessageSigningFlowFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$MessageSigningFlowFailedImplCopyWithImpl<$Res>
    extends _$MessageSigningFlowStateCopyWithImpl<$Res,
        _$MessageSigningFlowFailedImpl>
    implements _$$MessageSigningFlowFailedImplCopyWith<$Res> {
  __$$MessageSigningFlowFailedImplCopyWithImpl(
      _$MessageSigningFlowFailedImpl _value,
      $Res Function(_$MessageSigningFlowFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageSigningFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$MessageSigningFlowFailedImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MessageSigningFlowFailedImpl implements MessageSigningFlowFailed {
  const _$MessageSigningFlowFailedImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'MessageSigningFlowState.failed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageSigningFlowFailedImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of MessageSigningFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageSigningFlowFailedImplCopyWith<_$MessageSigningFlowFailedImpl>
      get copyWith => __$$MessageSigningFlowFailedImplCopyWithImpl<
          _$MessageSigningFlowFailedImpl>(this, _$identity);
}

abstract class MessageSigningFlowFailed implements MessageSigningFlowState {
  const factory MessageSigningFlowFailed({required final String error}) =
      _$MessageSigningFlowFailedImpl;

  String get error;

  /// Create a copy of MessageSigningFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageSigningFlowFailedImplCopyWith<_$MessageSigningFlowFailedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
