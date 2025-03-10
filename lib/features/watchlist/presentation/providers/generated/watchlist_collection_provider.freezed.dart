// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../watchlist_collection_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateCollectionState {
  String get name => throw _privateConstructorUsedError;
  CollectionType get type => throw _privateConstructorUsedError;
  bool get isKeyboardOpen => throw _privateConstructorUsedError;

  /// Create a copy of CreateCollectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateCollectionStateCopyWith<CreateCollectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCollectionStateCopyWith<$Res> {
  factory $CreateCollectionStateCopyWith(CreateCollectionState value,
          $Res Function(CreateCollectionState) then) =
      _$CreateCollectionStateCopyWithImpl<$Res, CreateCollectionState>;
  @useResult
  $Res call({String name, CollectionType type, bool isKeyboardOpen});
}

/// @nodoc
class _$CreateCollectionStateCopyWithImpl<$Res,
        $Val extends CreateCollectionState>
    implements $CreateCollectionStateCopyWith<$Res> {
  _$CreateCollectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateCollectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? isKeyboardOpen = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CollectionType,
      isKeyboardOpen: null == isKeyboardOpen
          ? _value.isKeyboardOpen
          : isKeyboardOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateCollectionStateImplCopyWith<$Res>
    implements $CreateCollectionStateCopyWith<$Res> {
  factory _$$CreateCollectionStateImplCopyWith(
          _$CreateCollectionStateImpl value,
          $Res Function(_$CreateCollectionStateImpl) then) =
      __$$CreateCollectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, CollectionType type, bool isKeyboardOpen});
}

/// @nodoc
class __$$CreateCollectionStateImplCopyWithImpl<$Res>
    extends _$CreateCollectionStateCopyWithImpl<$Res,
        _$CreateCollectionStateImpl>
    implements _$$CreateCollectionStateImplCopyWith<$Res> {
  __$$CreateCollectionStateImplCopyWithImpl(_$CreateCollectionStateImpl _value,
      $Res Function(_$CreateCollectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateCollectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? isKeyboardOpen = null,
  }) {
    return _then(_$CreateCollectionStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CollectionType,
      isKeyboardOpen: null == isKeyboardOpen
          ? _value.isKeyboardOpen
          : isKeyboardOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CreateCollectionStateImpl extends _CreateCollectionState {
  const _$CreateCollectionStateImpl(
      {this.name = '',
      this.type = CollectionType.nft,
      this.isKeyboardOpen = false})
      : super._();

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final CollectionType type;
  @override
  @JsonKey()
  final bool isKeyboardOpen;

  @override
  String toString() {
    return 'CreateCollectionState(name: $name, type: $type, isKeyboardOpen: $isKeyboardOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCollectionStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isKeyboardOpen, isKeyboardOpen) ||
                other.isKeyboardOpen == isKeyboardOpen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, type, isKeyboardOpen);

  /// Create a copy of CreateCollectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCollectionStateImplCopyWith<_$CreateCollectionStateImpl>
      get copyWith => __$$CreateCollectionStateImplCopyWithImpl<
          _$CreateCollectionStateImpl>(this, _$identity);
}

abstract class _CreateCollectionState extends CreateCollectionState {
  const factory _CreateCollectionState(
      {final String name,
      final CollectionType type,
      final bool isKeyboardOpen}) = _$CreateCollectionStateImpl;
  const _CreateCollectionState._() : super._();

  @override
  String get name;
  @override
  CollectionType get type;
  @override
  bool get isKeyboardOpen;

  /// Create a copy of CreateCollectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCollectionStateImplCopyWith<_$CreateCollectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
