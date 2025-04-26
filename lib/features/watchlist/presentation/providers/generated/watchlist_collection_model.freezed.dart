// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../watchlist_collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WatchlistCollection {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  CollectionType get type => throw _privateConstructorUsedError;
  List<WatchlistItem> get items => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;

  /// Create a copy of WatchlistCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WatchlistCollectionCopyWith<WatchlistCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistCollectionCopyWith<$Res> {
  factory $WatchlistCollectionCopyWith(
          WatchlistCollection value, $Res Function(WatchlistCollection) then) =
      _$WatchlistCollectionCopyWithImpl<$Res, WatchlistCollection>;
  @useResult
  $Res call(
      {String id,
      String name,
      CollectionType type,
      List<WatchlistItem> items,
      DateTime? createdAt,
      DateTime? lastUpdated,
      bool isDeleting,
      bool isEditing});
}

/// @nodoc
class _$WatchlistCollectionCopyWithImpl<$Res, $Val extends WatchlistCollection>
    implements $WatchlistCollectionCopyWith<$Res> {
  _$WatchlistCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchlistCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? items = null,
    Object? createdAt = freezed,
    Object? lastUpdated = freezed,
    Object? isDeleting = null,
    Object? isEditing = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CollectionType,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WatchlistItem>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchlistCollectionImplCopyWith<$Res>
    implements $WatchlistCollectionCopyWith<$Res> {
  factory _$$WatchlistCollectionImplCopyWith(_$WatchlistCollectionImpl value,
          $Res Function(_$WatchlistCollectionImpl) then) =
      __$$WatchlistCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      CollectionType type,
      List<WatchlistItem> items,
      DateTime? createdAt,
      DateTime? lastUpdated,
      bool isDeleting,
      bool isEditing});
}

/// @nodoc
class __$$WatchlistCollectionImplCopyWithImpl<$Res>
    extends _$WatchlistCollectionCopyWithImpl<$Res, _$WatchlistCollectionImpl>
    implements _$$WatchlistCollectionImplCopyWith<$Res> {
  __$$WatchlistCollectionImplCopyWithImpl(_$WatchlistCollectionImpl _value,
      $Res Function(_$WatchlistCollectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchlistCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? items = null,
    Object? createdAt = freezed,
    Object? lastUpdated = freezed,
    Object? isDeleting = null,
    Object? isEditing = null,
  }) {
    return _then(_$WatchlistCollectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CollectionType,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WatchlistItem>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WatchlistCollectionImpl implements _WatchlistCollection {
  const _$WatchlistCollectionImpl(
      {required this.id,
      required this.name,
      required this.type,
      final List<WatchlistItem> items = const [],
      this.createdAt,
      this.lastUpdated,
      this.isDeleting = false,
      this.isEditing = false})
      : _items = items;

  @override
  final String id;
  @override
  final String name;
  @override
  final CollectionType type;
  final List<WatchlistItem> _items;
  @override
  @JsonKey()
  List<WatchlistItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? lastUpdated;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  @JsonKey()
  final bool isEditing;

  @override
  String toString() {
    return 'WatchlistCollection(id: $id, name: $name, type: $type, items: $items, createdAt: $createdAt, lastUpdated: $lastUpdated, isDeleting: $isDeleting, isEditing: $isEditing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistCollectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      const DeepCollectionEquality().hash(_items),
      createdAt,
      lastUpdated,
      isDeleting,
      isEditing);

  /// Create a copy of WatchlistCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistCollectionImplCopyWith<_$WatchlistCollectionImpl> get copyWith =>
      __$$WatchlistCollectionImplCopyWithImpl<_$WatchlistCollectionImpl>(
          this, _$identity);
}

abstract class _WatchlistCollection implements WatchlistCollection {
  const factory _WatchlistCollection(
      {required final String id,
      required final String name,
      required final CollectionType type,
      final List<WatchlistItem> items,
      final DateTime? createdAt,
      final DateTime? lastUpdated,
      final bool isDeleting,
      final bool isEditing}) = _$WatchlistCollectionImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  CollectionType get type;
  @override
  List<WatchlistItem> get items;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get lastUpdated;
  @override
  bool get isDeleting;
  @override
  bool get isEditing;

  /// Create a copy of WatchlistCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchlistCollectionImplCopyWith<_$WatchlistCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
