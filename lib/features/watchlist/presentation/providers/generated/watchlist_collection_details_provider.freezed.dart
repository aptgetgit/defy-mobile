// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../watchlist_collection_details_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CollectionDetailsState {
  WatchlistCollection get collection => throw _privateConstructorUsedError;
  bool get isDeleteMode => throw _privateConstructorUsedError;
  SortOption get sortOption => throw _privateConstructorUsedError;

  /// Create a copy of CollectionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionDetailsStateCopyWith<CollectionDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionDetailsStateCopyWith<$Res> {
  factory $CollectionDetailsStateCopyWith(CollectionDetailsState value,
          $Res Function(CollectionDetailsState) then) =
      _$CollectionDetailsStateCopyWithImpl<$Res, CollectionDetailsState>;
  @useResult
  $Res call(
      {WatchlistCollection collection,
      bool isDeleteMode,
      SortOption sortOption});

  $WatchlistCollectionCopyWith<$Res> get collection;
}

/// @nodoc
class _$CollectionDetailsStateCopyWithImpl<$Res,
        $Val extends CollectionDetailsState>
    implements $CollectionDetailsStateCopyWith<$Res> {
  _$CollectionDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
    Object? isDeleteMode = null,
    Object? sortOption = null,
  }) {
    return _then(_value.copyWith(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as WatchlistCollection,
      isDeleteMode: null == isDeleteMode
          ? _value.isDeleteMode
          : isDeleteMode // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOption: null == sortOption
          ? _value.sortOption
          : sortOption // ignore: cast_nullable_to_non_nullable
              as SortOption,
    ) as $Val);
  }

  /// Create a copy of CollectionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchlistCollectionCopyWith<$Res> get collection {
    return $WatchlistCollectionCopyWith<$Res>(_value.collection, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CollectionDetailsStateImplCopyWith<$Res>
    implements $CollectionDetailsStateCopyWith<$Res> {
  factory _$$CollectionDetailsStateImplCopyWith(
          _$CollectionDetailsStateImpl value,
          $Res Function(_$CollectionDetailsStateImpl) then) =
      __$$CollectionDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WatchlistCollection collection,
      bool isDeleteMode,
      SortOption sortOption});

  @override
  $WatchlistCollectionCopyWith<$Res> get collection;
}

/// @nodoc
class __$$CollectionDetailsStateImplCopyWithImpl<$Res>
    extends _$CollectionDetailsStateCopyWithImpl<$Res,
        _$CollectionDetailsStateImpl>
    implements _$$CollectionDetailsStateImplCopyWith<$Res> {
  __$$CollectionDetailsStateImplCopyWithImpl(
      _$CollectionDetailsStateImpl _value,
      $Res Function(_$CollectionDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
    Object? isDeleteMode = null,
    Object? sortOption = null,
  }) {
    return _then(_$CollectionDetailsStateImpl(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as WatchlistCollection,
      isDeleteMode: null == isDeleteMode
          ? _value.isDeleteMode
          : isDeleteMode // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOption: null == sortOption
          ? _value.sortOption
          : sortOption // ignore: cast_nullable_to_non_nullable
              as SortOption,
    ));
  }
}

/// @nodoc

class _$CollectionDetailsStateImpl implements _CollectionDetailsState {
  const _$CollectionDetailsStateImpl(
      {required this.collection,
      required this.isDeleteMode,
      required this.sortOption});

  @override
  final WatchlistCollection collection;
  @override
  final bool isDeleteMode;
  @override
  final SortOption sortOption;

  @override
  String toString() {
    return 'CollectionDetailsState(collection: $collection, isDeleteMode: $isDeleteMode, sortOption: $sortOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionDetailsStateImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.isDeleteMode, isDeleteMode) ||
                other.isDeleteMode == isDeleteMode) &&
            (identical(other.sortOption, sortOption) ||
                other.sortOption == sortOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, collection, isDeleteMode, sortOption);

  /// Create a copy of CollectionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionDetailsStateImplCopyWith<_$CollectionDetailsStateImpl>
      get copyWith => __$$CollectionDetailsStateImplCopyWithImpl<
          _$CollectionDetailsStateImpl>(this, _$identity);
}

abstract class _CollectionDetailsState implements CollectionDetailsState {
  const factory _CollectionDetailsState(
      {required final WatchlistCollection collection,
      required final bool isDeleteMode,
      required final SortOption sortOption}) = _$CollectionDetailsStateImpl;

  @override
  WatchlistCollection get collection;
  @override
  bool get isDeleteMode;
  @override
  SortOption get sortOption;

  /// Create a copy of CollectionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionDetailsStateImplCopyWith<_$CollectionDetailsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
