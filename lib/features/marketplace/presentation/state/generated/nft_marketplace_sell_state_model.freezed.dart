// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../nft_marketplace_sell_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NFTMarketplaceSellState _$NFTMarketplaceSellStateFromJson(
    Map<String, dynamic> json) {
  return _NFTMarketplaceSellState.fromJson(json);
}

/// @nodoc
mixin _$NFTMarketplaceSellState {
  bool get isSelectionMode => throw _privateConstructorUsedError;
  Set<String> get selectedNFTs => throw _privateConstructorUsedError;
  Map<String, bool> get expandedStates => throw _privateConstructorUsedError;
  String get sortBy => throw _privateConstructorUsedError;
  bool get isAscending => throw _privateConstructorUsedError;

  /// Create a copy of NFTMarketplaceSellState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NFTMarketplaceSellStateCopyWith<NFTMarketplaceSellState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTMarketplaceSellStateCopyWith<$Res> {
  factory $NFTMarketplaceSellStateCopyWith(NFTMarketplaceSellState value,
          $Res Function(NFTMarketplaceSellState) then) =
      _$NFTMarketplaceSellStateCopyWithImpl<$Res, NFTMarketplaceSellState>;
  @useResult
  $Res call(
      {bool isSelectionMode,
      Set<String> selectedNFTs,
      Map<String, bool> expandedStates,
      String sortBy,
      bool isAscending});
}

/// @nodoc
class _$NFTMarketplaceSellStateCopyWithImpl<$Res,
        $Val extends NFTMarketplaceSellState>
    implements $NFTMarketplaceSellStateCopyWith<$Res> {
  _$NFTMarketplaceSellStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NFTMarketplaceSellState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSelectionMode = null,
    Object? selectedNFTs = null,
    Object? expandedStates = null,
    Object? sortBy = null,
    Object? isAscending = null,
  }) {
    return _then(_value.copyWith(
      isSelectionMode: null == isSelectionMode
          ? _value.isSelectionMode
          : isSelectionMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedNFTs: null == selectedNFTs
          ? _value.selectedNFTs
          : selectedNFTs // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      expandedStates: null == expandedStates
          ? _value.expandedStates
          : expandedStates // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      isAscending: null == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NFTMarketplaceSellStateImplCopyWith<$Res>
    implements $NFTMarketplaceSellStateCopyWith<$Res> {
  factory _$$NFTMarketplaceSellStateImplCopyWith(
          _$NFTMarketplaceSellStateImpl value,
          $Res Function(_$NFTMarketplaceSellStateImpl) then) =
      __$$NFTMarketplaceSellStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSelectionMode,
      Set<String> selectedNFTs,
      Map<String, bool> expandedStates,
      String sortBy,
      bool isAscending});
}

/// @nodoc
class __$$NFTMarketplaceSellStateImplCopyWithImpl<$Res>
    extends _$NFTMarketplaceSellStateCopyWithImpl<$Res,
        _$NFTMarketplaceSellStateImpl>
    implements _$$NFTMarketplaceSellStateImplCopyWith<$Res> {
  __$$NFTMarketplaceSellStateImplCopyWithImpl(
      _$NFTMarketplaceSellStateImpl _value,
      $Res Function(_$NFTMarketplaceSellStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NFTMarketplaceSellState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSelectionMode = null,
    Object? selectedNFTs = null,
    Object? expandedStates = null,
    Object? sortBy = null,
    Object? isAscending = null,
  }) {
    return _then(_$NFTMarketplaceSellStateImpl(
      isSelectionMode: null == isSelectionMode
          ? _value.isSelectionMode
          : isSelectionMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedNFTs: null == selectedNFTs
          ? _value._selectedNFTs
          : selectedNFTs // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      expandedStates: null == expandedStates
          ? _value._expandedStates
          : expandedStates // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      isAscending: null == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NFTMarketplaceSellStateImpl implements _NFTMarketplaceSellState {
  const _$NFTMarketplaceSellStateImpl(
      {this.isSelectionMode = true,
      final Set<String> selectedNFTs = const {},
      final Map<String, bool> expandedStates = const {},
      this.sortBy = "Collection Volume",
      this.isAscending = true})
      : _selectedNFTs = selectedNFTs,
        _expandedStates = expandedStates;

  factory _$NFTMarketplaceSellStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$NFTMarketplaceSellStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isSelectionMode;
  final Set<String> _selectedNFTs;
  @override
  @JsonKey()
  Set<String> get selectedNFTs {
    if (_selectedNFTs is EqualUnmodifiableSetView) return _selectedNFTs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedNFTs);
  }

  final Map<String, bool> _expandedStates;
  @override
  @JsonKey()
  Map<String, bool> get expandedStates {
    if (_expandedStates is EqualUnmodifiableMapView) return _expandedStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_expandedStates);
  }

  @override
  @JsonKey()
  final String sortBy;
  @override
  @JsonKey()
  final bool isAscending;

  @override
  String toString() {
    return 'NFTMarketplaceSellState(isSelectionMode: $isSelectionMode, selectedNFTs: $selectedNFTs, expandedStates: $expandedStates, sortBy: $sortBy, isAscending: $isAscending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTMarketplaceSellStateImpl &&
            (identical(other.isSelectionMode, isSelectionMode) ||
                other.isSelectionMode == isSelectionMode) &&
            const DeepCollectionEquality()
                .equals(other._selectedNFTs, _selectedNFTs) &&
            const DeepCollectionEquality()
                .equals(other._expandedStates, _expandedStates) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.isAscending, isAscending) ||
                other.isAscending == isAscending));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSelectionMode,
      const DeepCollectionEquality().hash(_selectedNFTs),
      const DeepCollectionEquality().hash(_expandedStates),
      sortBy,
      isAscending);

  /// Create a copy of NFTMarketplaceSellState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTMarketplaceSellStateImplCopyWith<_$NFTMarketplaceSellStateImpl>
      get copyWith => __$$NFTMarketplaceSellStateImplCopyWithImpl<
          _$NFTMarketplaceSellStateImpl>(this, _$identity);
}

abstract class _NFTMarketplaceSellState implements NFTMarketplaceSellState {
  const factory _NFTMarketplaceSellState(
      {final bool isSelectionMode,
      final Set<String> selectedNFTs,
      final Map<String, bool> expandedStates,
      final String sortBy,
      final bool isAscending}) = _$NFTMarketplaceSellStateImpl;

  factory _NFTMarketplaceSellState.fromJson(Map<String, dynamic> json) =
      _$NFTMarketplaceSellStateImpl.fromJson;

  @override
  bool get isSelectionMode;
  @override
  Set<String> get selectedNFTs;
  @override
  Map<String, bool> get expandedStates;
  @override
  String get sortBy;
  @override
  bool get isAscending;

  /// Create a copy of NFTMarketplaceSellState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFTMarketplaceSellStateImplCopyWith<_$NFTMarketplaceSellStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
