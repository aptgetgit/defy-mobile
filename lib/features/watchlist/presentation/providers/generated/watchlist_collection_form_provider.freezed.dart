// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../watchlist_collection_form_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CollectionFormState {
  String get collectionName => throw _privateConstructorUsedError;
  bool get isKeyboardOpen => throw _privateConstructorUsedError;

  /// Create a copy of CollectionFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionFormStateCopyWith<CollectionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionFormStateCopyWith<$Res> {
  factory $CollectionFormStateCopyWith(
          CollectionFormState value, $Res Function(CollectionFormState) then) =
      _$CollectionFormStateCopyWithImpl<$Res, CollectionFormState>;
  @useResult
  $Res call({String collectionName, bool isKeyboardOpen});
}

/// @nodoc
class _$CollectionFormStateCopyWithImpl<$Res, $Val extends CollectionFormState>
    implements $CollectionFormStateCopyWith<$Res> {
  _$CollectionFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionName = null,
    Object? isKeyboardOpen = null,
  }) {
    return _then(_value.copyWith(
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      isKeyboardOpen: null == isKeyboardOpen
          ? _value.isKeyboardOpen
          : isKeyboardOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionFormStateImplCopyWith<$Res>
    implements $CollectionFormStateCopyWith<$Res> {
  factory _$$CollectionFormStateImplCopyWith(_$CollectionFormStateImpl value,
          $Res Function(_$CollectionFormStateImpl) then) =
      __$$CollectionFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collectionName, bool isKeyboardOpen});
}

/// @nodoc
class __$$CollectionFormStateImplCopyWithImpl<$Res>
    extends _$CollectionFormStateCopyWithImpl<$Res, _$CollectionFormStateImpl>
    implements _$$CollectionFormStateImplCopyWith<$Res> {
  __$$CollectionFormStateImplCopyWithImpl(_$CollectionFormStateImpl _value,
      $Res Function(_$CollectionFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionName = null,
    Object? isKeyboardOpen = null,
  }) {
    return _then(_$CollectionFormStateImpl(
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      isKeyboardOpen: null == isKeyboardOpen
          ? _value.isKeyboardOpen
          : isKeyboardOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CollectionFormStateImpl extends _CollectionFormState {
  const _$CollectionFormStateImpl(
      {required this.collectionName, required this.isKeyboardOpen})
      : super._();

  @override
  final String collectionName;
  @override
  final bool isKeyboardOpen;

  @override
  String toString() {
    return 'CollectionFormState(collectionName: $collectionName, isKeyboardOpen: $isKeyboardOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionFormStateImpl &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            (identical(other.isKeyboardOpen, isKeyboardOpen) ||
                other.isKeyboardOpen == isKeyboardOpen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collectionName, isKeyboardOpen);

  /// Create a copy of CollectionFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionFormStateImplCopyWith<_$CollectionFormStateImpl> get copyWith =>
      __$$CollectionFormStateImplCopyWithImpl<_$CollectionFormStateImpl>(
          this, _$identity);
}

abstract class _CollectionFormState extends CollectionFormState {
  const factory _CollectionFormState(
      {required final String collectionName,
      required final bool isKeyboardOpen}) = _$CollectionFormStateImpl;
  const _CollectionFormState._() : super._();

  @override
  String get collectionName;
  @override
  bool get isKeyboardOpen;

  /// Create a copy of CollectionFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionFormStateImplCopyWith<_$CollectionFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
