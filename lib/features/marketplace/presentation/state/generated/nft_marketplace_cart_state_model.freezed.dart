// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../nft_marketplace_cart_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NFTMarketplaceCartStateModel {
  List<NFTMarketplaceCartEntity> get items =>
      throw _privateConstructorUsedError;
  bool get isSortAscending => throw _privateConstructorUsedError;
  bool get isEditMode => throw _privateConstructorUsedError;
  Map<String, bool> get deletedItems => throw _privateConstructorUsedError;
  Set<String> get selectedNFTs => throw _privateConstructorUsedError;

  /// Create a copy of NFTMarketplaceCartStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NFTMarketplaceCartStateModelCopyWith<NFTMarketplaceCartStateModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTMarketplaceCartStateModelCopyWith<$Res> {
  factory $NFTMarketplaceCartStateModelCopyWith(
          NFTMarketplaceCartStateModel value,
          $Res Function(NFTMarketplaceCartStateModel) then) =
      _$NFTMarketplaceCartStateModelCopyWithImpl<$Res,
          NFTMarketplaceCartStateModel>;
  @useResult
  $Res call(
      {List<NFTMarketplaceCartEntity> items,
      bool isSortAscending,
      bool isEditMode,
      Map<String, bool> deletedItems,
      Set<String> selectedNFTs});
}

/// @nodoc
class _$NFTMarketplaceCartStateModelCopyWithImpl<$Res,
        $Val extends NFTMarketplaceCartStateModel>
    implements $NFTMarketplaceCartStateModelCopyWith<$Res> {
  _$NFTMarketplaceCartStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NFTMarketplaceCartStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isSortAscending = null,
    Object? isEditMode = null,
    Object? deletedItems = null,
    Object? selectedNFTs = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NFTMarketplaceCartEntity>,
      isSortAscending: null == isSortAscending
          ? _value.isSortAscending
          : isSortAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditMode: null == isEditMode
          ? _value.isEditMode
          : isEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedItems: null == deletedItems
          ? _value.deletedItems
          : deletedItems // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      selectedNFTs: null == selectedNFTs
          ? _value.selectedNFTs
          : selectedNFTs // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NFTMarketplaceCartStateModelImplCopyWith<$Res>
    implements $NFTMarketplaceCartStateModelCopyWith<$Res> {
  factory _$$NFTMarketplaceCartStateModelImplCopyWith(
          _$NFTMarketplaceCartStateModelImpl value,
          $Res Function(_$NFTMarketplaceCartStateModelImpl) then) =
      __$$NFTMarketplaceCartStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NFTMarketplaceCartEntity> items,
      bool isSortAscending,
      bool isEditMode,
      Map<String, bool> deletedItems,
      Set<String> selectedNFTs});
}

/// @nodoc
class __$$NFTMarketplaceCartStateModelImplCopyWithImpl<$Res>
    extends _$NFTMarketplaceCartStateModelCopyWithImpl<$Res,
        _$NFTMarketplaceCartStateModelImpl>
    implements _$$NFTMarketplaceCartStateModelImplCopyWith<$Res> {
  __$$NFTMarketplaceCartStateModelImplCopyWithImpl(
      _$NFTMarketplaceCartStateModelImpl _value,
      $Res Function(_$NFTMarketplaceCartStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NFTMarketplaceCartStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isSortAscending = null,
    Object? isEditMode = null,
    Object? deletedItems = null,
    Object? selectedNFTs = null,
  }) {
    return _then(_$NFTMarketplaceCartStateModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NFTMarketplaceCartEntity>,
      isSortAscending: null == isSortAscending
          ? _value.isSortAscending
          : isSortAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditMode: null == isEditMode
          ? _value.isEditMode
          : isEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedItems: null == deletedItems
          ? _value._deletedItems
          : deletedItems // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      selectedNFTs: null == selectedNFTs
          ? _value._selectedNFTs
          : selectedNFTs // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$NFTMarketplaceCartStateModelImpl
    implements _NFTMarketplaceCartStateModel {
  const _$NFTMarketplaceCartStateModelImpl(
      {final List<NFTMarketplaceCartEntity> items = const [],
      this.isSortAscending = true,
      this.isEditMode = false,
      final Map<String, bool> deletedItems = const {},
      final Set<String> selectedNFTs = const {}})
      : _items = items,
        _deletedItems = deletedItems,
        _selectedNFTs = selectedNFTs;

  final List<NFTMarketplaceCartEntity> _items;
  @override
  @JsonKey()
  List<NFTMarketplaceCartEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool isSortAscending;
  @override
  @JsonKey()
  final bool isEditMode;
  final Map<String, bool> _deletedItems;
  @override
  @JsonKey()
  Map<String, bool> get deletedItems {
    if (_deletedItems is EqualUnmodifiableMapView) return _deletedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_deletedItems);
  }

  final Set<String> _selectedNFTs;
  @override
  @JsonKey()
  Set<String> get selectedNFTs {
    if (_selectedNFTs is EqualUnmodifiableSetView) return _selectedNFTs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedNFTs);
  }

  @override
  String toString() {
    return 'NFTMarketplaceCartStateModel(items: $items, isSortAscending: $isSortAscending, isEditMode: $isEditMode, deletedItems: $deletedItems, selectedNFTs: $selectedNFTs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTMarketplaceCartStateModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isSortAscending, isSortAscending) ||
                other.isSortAscending == isSortAscending) &&
            (identical(other.isEditMode, isEditMode) ||
                other.isEditMode == isEditMode) &&
            const DeepCollectionEquality()
                .equals(other._deletedItems, _deletedItems) &&
            const DeepCollectionEquality()
                .equals(other._selectedNFTs, _selectedNFTs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      isSortAscending,
      isEditMode,
      const DeepCollectionEquality().hash(_deletedItems),
      const DeepCollectionEquality().hash(_selectedNFTs));

  /// Create a copy of NFTMarketplaceCartStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTMarketplaceCartStateModelImplCopyWith<
          _$NFTMarketplaceCartStateModelImpl>
      get copyWith => __$$NFTMarketplaceCartStateModelImplCopyWithImpl<
          _$NFTMarketplaceCartStateModelImpl>(this, _$identity);
}

abstract class _NFTMarketplaceCartStateModel
    implements NFTMarketplaceCartStateModel {
  const factory _NFTMarketplaceCartStateModel(
      {final List<NFTMarketplaceCartEntity> items,
      final bool isSortAscending,
      final bool isEditMode,
      final Map<String, bool> deletedItems,
      final Set<String> selectedNFTs}) = _$NFTMarketplaceCartStateModelImpl;

  @override
  List<NFTMarketplaceCartEntity> get items;
  @override
  bool get isSortAscending;
  @override
  bool get isEditMode;
  @override
  Map<String, bool> get deletedItems;
  @override
  Set<String> get selectedNFTs;

  /// Create a copy of NFTMarketplaceCartStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFTMarketplaceCartStateModelImplCopyWith<
          _$NFTMarketplaceCartStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
