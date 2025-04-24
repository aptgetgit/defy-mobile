// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../explore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExploreState {
// Token management
  List<ExploreToken> get allTokens => throw _privateConstructorUsedError;
  List<ExploreToken> get displayedTokens => throw _privateConstructorUsedError;
  List<ExploreToken> get trendingTokens => throw _privateConstructorUsedError;
  Set<String> get favoriteTokenIds => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError; // Dapps management
  List<ExploreDapp> get allDapps => throw _privateConstructorUsedError;
  List<ExploreDapp> get displayedDapps => throw _privateConstructorUsedError;
  List<ExploreDapp> get popularDapps => throw _privateConstructorUsedError;
  Set<String> get favoriteDappIds =>
      throw _privateConstructorUsedError; // UI state
  int get currentTabIndex => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  bool get isToggled => throw _privateConstructorUsedError; // Sort options
  bool get isSortSheetVisible => throw _privateConstructorUsedError;
  bool get isSortPriceHighToLowSelected => throw _privateConstructorUsedError;
  bool get isSortPriceLowToHighSelected => throw _privateConstructorUsedError;
  bool get isSortAlphabeticalSelected => throw _privateConstructorUsedError;
  bool get isSortChangeSelected => throw _privateConstructorUsedError;

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExploreStateCopyWith<ExploreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreStateCopyWith<$Res> {
  factory $ExploreStateCopyWith(
          ExploreState value, $Res Function(ExploreState) then) =
      _$ExploreStateCopyWithImpl<$Res, ExploreState>;
  @useResult
  $Res call(
      {List<ExploreToken> allTokens,
      List<ExploreToken> displayedTokens,
      List<ExploreToken> trendingTokens,
      Set<String> favoriteTokenIds,
      bool isLoading,
      String? error,
      List<ExploreDapp> allDapps,
      List<ExploreDapp> displayedDapps,
      List<ExploreDapp> popularDapps,
      Set<String> favoriteDappIds,
      int currentTabIndex,
      String searchQuery,
      bool isToggled,
      bool isSortSheetVisible,
      bool isSortPriceHighToLowSelected,
      bool isSortPriceLowToHighSelected,
      bool isSortAlphabeticalSelected,
      bool isSortChangeSelected});
}

/// @nodoc
class _$ExploreStateCopyWithImpl<$Res, $Val extends ExploreState>
    implements $ExploreStateCopyWith<$Res> {
  _$ExploreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTokens = null,
    Object? displayedTokens = null,
    Object? trendingTokens = null,
    Object? favoriteTokenIds = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? allDapps = null,
    Object? displayedDapps = null,
    Object? popularDapps = null,
    Object? favoriteDappIds = null,
    Object? currentTabIndex = null,
    Object? searchQuery = null,
    Object? isToggled = null,
    Object? isSortSheetVisible = null,
    Object? isSortPriceHighToLowSelected = null,
    Object? isSortPriceLowToHighSelected = null,
    Object? isSortAlphabeticalSelected = null,
    Object? isSortChangeSelected = null,
  }) {
    return _then(_value.copyWith(
      allTokens: null == allTokens
          ? _value.allTokens
          : allTokens // ignore: cast_nullable_to_non_nullable
              as List<ExploreToken>,
      displayedTokens: null == displayedTokens
          ? _value.displayedTokens
          : displayedTokens // ignore: cast_nullable_to_non_nullable
              as List<ExploreToken>,
      trendingTokens: null == trendingTokens
          ? _value.trendingTokens
          : trendingTokens // ignore: cast_nullable_to_non_nullable
              as List<ExploreToken>,
      favoriteTokenIds: null == favoriteTokenIds
          ? _value.favoriteTokenIds
          : favoriteTokenIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      allDapps: null == allDapps
          ? _value.allDapps
          : allDapps // ignore: cast_nullable_to_non_nullable
              as List<ExploreDapp>,
      displayedDapps: null == displayedDapps
          ? _value.displayedDapps
          : displayedDapps // ignore: cast_nullable_to_non_nullable
              as List<ExploreDapp>,
      popularDapps: null == popularDapps
          ? _value.popularDapps
          : popularDapps // ignore: cast_nullable_to_non_nullable
              as List<ExploreDapp>,
      favoriteDappIds: null == favoriteDappIds
          ? _value.favoriteDappIds
          : favoriteDappIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      currentTabIndex: null == currentTabIndex
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isToggled: null == isToggled
          ? _value.isToggled
          : isToggled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortSheetVisible: null == isSortSheetVisible
          ? _value.isSortSheetVisible
          : isSortSheetVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortPriceHighToLowSelected: null == isSortPriceHighToLowSelected
          ? _value.isSortPriceHighToLowSelected
          : isSortPriceHighToLowSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortPriceLowToHighSelected: null == isSortPriceLowToHighSelected
          ? _value.isSortPriceLowToHighSelected
          : isSortPriceLowToHighSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortAlphabeticalSelected: null == isSortAlphabeticalSelected
          ? _value.isSortAlphabeticalSelected
          : isSortAlphabeticalSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortChangeSelected: null == isSortChangeSelected
          ? _value.isSortChangeSelected
          : isSortChangeSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExploreStateImplCopyWith<$Res>
    implements $ExploreStateCopyWith<$Res> {
  factory _$$ExploreStateImplCopyWith(
          _$ExploreStateImpl value, $Res Function(_$ExploreStateImpl) then) =
      __$$ExploreStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExploreToken> allTokens,
      List<ExploreToken> displayedTokens,
      List<ExploreToken> trendingTokens,
      Set<String> favoriteTokenIds,
      bool isLoading,
      String? error,
      List<ExploreDapp> allDapps,
      List<ExploreDapp> displayedDapps,
      List<ExploreDapp> popularDapps,
      Set<String> favoriteDappIds,
      int currentTabIndex,
      String searchQuery,
      bool isToggled,
      bool isSortSheetVisible,
      bool isSortPriceHighToLowSelected,
      bool isSortPriceLowToHighSelected,
      bool isSortAlphabeticalSelected,
      bool isSortChangeSelected});
}

/// @nodoc
class __$$ExploreStateImplCopyWithImpl<$Res>
    extends _$ExploreStateCopyWithImpl<$Res, _$ExploreStateImpl>
    implements _$$ExploreStateImplCopyWith<$Res> {
  __$$ExploreStateImplCopyWithImpl(
      _$ExploreStateImpl _value, $Res Function(_$ExploreStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTokens = null,
    Object? displayedTokens = null,
    Object? trendingTokens = null,
    Object? favoriteTokenIds = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? allDapps = null,
    Object? displayedDapps = null,
    Object? popularDapps = null,
    Object? favoriteDappIds = null,
    Object? currentTabIndex = null,
    Object? searchQuery = null,
    Object? isToggled = null,
    Object? isSortSheetVisible = null,
    Object? isSortPriceHighToLowSelected = null,
    Object? isSortPriceLowToHighSelected = null,
    Object? isSortAlphabeticalSelected = null,
    Object? isSortChangeSelected = null,
  }) {
    return _then(_$ExploreStateImpl(
      allTokens: null == allTokens
          ? _value._allTokens
          : allTokens // ignore: cast_nullable_to_non_nullable
              as List<ExploreToken>,
      displayedTokens: null == displayedTokens
          ? _value._displayedTokens
          : displayedTokens // ignore: cast_nullable_to_non_nullable
              as List<ExploreToken>,
      trendingTokens: null == trendingTokens
          ? _value._trendingTokens
          : trendingTokens // ignore: cast_nullable_to_non_nullable
              as List<ExploreToken>,
      favoriteTokenIds: null == favoriteTokenIds
          ? _value._favoriteTokenIds
          : favoriteTokenIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      allDapps: null == allDapps
          ? _value._allDapps
          : allDapps // ignore: cast_nullable_to_non_nullable
              as List<ExploreDapp>,
      displayedDapps: null == displayedDapps
          ? _value._displayedDapps
          : displayedDapps // ignore: cast_nullable_to_non_nullable
              as List<ExploreDapp>,
      popularDapps: null == popularDapps
          ? _value._popularDapps
          : popularDapps // ignore: cast_nullable_to_non_nullable
              as List<ExploreDapp>,
      favoriteDappIds: null == favoriteDappIds
          ? _value._favoriteDappIds
          : favoriteDappIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      currentTabIndex: null == currentTabIndex
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isToggled: null == isToggled
          ? _value.isToggled
          : isToggled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortSheetVisible: null == isSortSheetVisible
          ? _value.isSortSheetVisible
          : isSortSheetVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortPriceHighToLowSelected: null == isSortPriceHighToLowSelected
          ? _value.isSortPriceHighToLowSelected
          : isSortPriceHighToLowSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortPriceLowToHighSelected: null == isSortPriceLowToHighSelected
          ? _value.isSortPriceLowToHighSelected
          : isSortPriceLowToHighSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortAlphabeticalSelected: null == isSortAlphabeticalSelected
          ? _value.isSortAlphabeticalSelected
          : isSortAlphabeticalSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortChangeSelected: null == isSortChangeSelected
          ? _value.isSortChangeSelected
          : isSortChangeSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ExploreStateImpl implements _ExploreState {
  const _$ExploreStateImpl(
      {final List<ExploreToken> allTokens = const [],
      final List<ExploreToken> displayedTokens = const [],
      final List<ExploreToken> trendingTokens = const [],
      final Set<String> favoriteTokenIds = const {},
      this.isLoading = false,
      this.error,
      final List<ExploreDapp> allDapps = const [],
      final List<ExploreDapp> displayedDapps = const [],
      final List<ExploreDapp> popularDapps = const [],
      final Set<String> favoriteDappIds = const {},
      this.currentTabIndex = 0,
      this.searchQuery = '',
      this.isToggled = false,
      this.isSortSheetVisible = false,
      this.isSortPriceHighToLowSelected = true,
      this.isSortPriceLowToHighSelected = false,
      this.isSortAlphabeticalSelected = false,
      this.isSortChangeSelected = false})
      : _allTokens = allTokens,
        _displayedTokens = displayedTokens,
        _trendingTokens = trendingTokens,
        _favoriteTokenIds = favoriteTokenIds,
        _allDapps = allDapps,
        _displayedDapps = displayedDapps,
        _popularDapps = popularDapps,
        _favoriteDappIds = favoriteDappIds;

// Token management
  final List<ExploreToken> _allTokens;
// Token management
  @override
  @JsonKey()
  List<ExploreToken> get allTokens {
    if (_allTokens is EqualUnmodifiableListView) return _allTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTokens);
  }

  final List<ExploreToken> _displayedTokens;
  @override
  @JsonKey()
  List<ExploreToken> get displayedTokens {
    if (_displayedTokens is EqualUnmodifiableListView) return _displayedTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_displayedTokens);
  }

  final List<ExploreToken> _trendingTokens;
  @override
  @JsonKey()
  List<ExploreToken> get trendingTokens {
    if (_trendingTokens is EqualUnmodifiableListView) return _trendingTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingTokens);
  }

  final Set<String> _favoriteTokenIds;
  @override
  @JsonKey()
  Set<String> get favoriteTokenIds {
    if (_favoriteTokenIds is EqualUnmodifiableSetView) return _favoriteTokenIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_favoriteTokenIds);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
// Dapps management
  final List<ExploreDapp> _allDapps;
// Dapps management
  @override
  @JsonKey()
  List<ExploreDapp> get allDapps {
    if (_allDapps is EqualUnmodifiableListView) return _allDapps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allDapps);
  }

  final List<ExploreDapp> _displayedDapps;
  @override
  @JsonKey()
  List<ExploreDapp> get displayedDapps {
    if (_displayedDapps is EqualUnmodifiableListView) return _displayedDapps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_displayedDapps);
  }

  final List<ExploreDapp> _popularDapps;
  @override
  @JsonKey()
  List<ExploreDapp> get popularDapps {
    if (_popularDapps is EqualUnmodifiableListView) return _popularDapps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularDapps);
  }

  final Set<String> _favoriteDappIds;
  @override
  @JsonKey()
  Set<String> get favoriteDappIds {
    if (_favoriteDappIds is EqualUnmodifiableSetView) return _favoriteDappIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_favoriteDappIds);
  }

// UI state
  @override
  @JsonKey()
  final int currentTabIndex;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final bool isToggled;
// Sort options
  @override
  @JsonKey()
  final bool isSortSheetVisible;
  @override
  @JsonKey()
  final bool isSortPriceHighToLowSelected;
  @override
  @JsonKey()
  final bool isSortPriceLowToHighSelected;
  @override
  @JsonKey()
  final bool isSortAlphabeticalSelected;
  @override
  @JsonKey()
  final bool isSortChangeSelected;

  @override
  String toString() {
    return 'ExploreState(allTokens: $allTokens, displayedTokens: $displayedTokens, trendingTokens: $trendingTokens, favoriteTokenIds: $favoriteTokenIds, isLoading: $isLoading, error: $error, allDapps: $allDapps, displayedDapps: $displayedDapps, popularDapps: $popularDapps, favoriteDappIds: $favoriteDappIds, currentTabIndex: $currentTabIndex, searchQuery: $searchQuery, isToggled: $isToggled, isSortSheetVisible: $isSortSheetVisible, isSortPriceHighToLowSelected: $isSortPriceHighToLowSelected, isSortPriceLowToHighSelected: $isSortPriceLowToHighSelected, isSortAlphabeticalSelected: $isSortAlphabeticalSelected, isSortChangeSelected: $isSortChangeSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExploreStateImpl &&
            const DeepCollectionEquality()
                .equals(other._allTokens, _allTokens) &&
            const DeepCollectionEquality()
                .equals(other._displayedTokens, _displayedTokens) &&
            const DeepCollectionEquality()
                .equals(other._trendingTokens, _trendingTokens) &&
            const DeepCollectionEquality()
                .equals(other._favoriteTokenIds, _favoriteTokenIds) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._allDapps, _allDapps) &&
            const DeepCollectionEquality()
                .equals(other._displayedDapps, _displayedDapps) &&
            const DeepCollectionEquality()
                .equals(other._popularDapps, _popularDapps) &&
            const DeepCollectionEquality()
                .equals(other._favoriteDappIds, _favoriteDappIds) &&
            (identical(other.currentTabIndex, currentTabIndex) ||
                other.currentTabIndex == currentTabIndex) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isToggled, isToggled) ||
                other.isToggled == isToggled) &&
            (identical(other.isSortSheetVisible, isSortSheetVisible) ||
                other.isSortSheetVisible == isSortSheetVisible) &&
            (identical(other.isSortPriceHighToLowSelected,
                    isSortPriceHighToLowSelected) ||
                other.isSortPriceHighToLowSelected ==
                    isSortPriceHighToLowSelected) &&
            (identical(other.isSortPriceLowToHighSelected,
                    isSortPriceLowToHighSelected) ||
                other.isSortPriceLowToHighSelected ==
                    isSortPriceLowToHighSelected) &&
            (identical(other.isSortAlphabeticalSelected,
                    isSortAlphabeticalSelected) ||
                other.isSortAlphabeticalSelected ==
                    isSortAlphabeticalSelected) &&
            (identical(other.isSortChangeSelected, isSortChangeSelected) ||
                other.isSortChangeSelected == isSortChangeSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allTokens),
      const DeepCollectionEquality().hash(_displayedTokens),
      const DeepCollectionEquality().hash(_trendingTokens),
      const DeepCollectionEquality().hash(_favoriteTokenIds),
      isLoading,
      error,
      const DeepCollectionEquality().hash(_allDapps),
      const DeepCollectionEquality().hash(_displayedDapps),
      const DeepCollectionEquality().hash(_popularDapps),
      const DeepCollectionEquality().hash(_favoriteDappIds),
      currentTabIndex,
      searchQuery,
      isToggled,
      isSortSheetVisible,
      isSortPriceHighToLowSelected,
      isSortPriceLowToHighSelected,
      isSortAlphabeticalSelected,
      isSortChangeSelected);

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExploreStateImplCopyWith<_$ExploreStateImpl> get copyWith =>
      __$$ExploreStateImplCopyWithImpl<_$ExploreStateImpl>(this, _$identity);
}

abstract class _ExploreState implements ExploreState {
  const factory _ExploreState(
      {final List<ExploreToken> allTokens,
      final List<ExploreToken> displayedTokens,
      final List<ExploreToken> trendingTokens,
      final Set<String> favoriteTokenIds,
      final bool isLoading,
      final String? error,
      final List<ExploreDapp> allDapps,
      final List<ExploreDapp> displayedDapps,
      final List<ExploreDapp> popularDapps,
      final Set<String> favoriteDappIds,
      final int currentTabIndex,
      final String searchQuery,
      final bool isToggled,
      final bool isSortSheetVisible,
      final bool isSortPriceHighToLowSelected,
      final bool isSortPriceLowToHighSelected,
      final bool isSortAlphabeticalSelected,
      final bool isSortChangeSelected}) = _$ExploreStateImpl;

// Token management
  @override
  List<ExploreToken> get allTokens;
  @override
  List<ExploreToken> get displayedTokens;
  @override
  List<ExploreToken> get trendingTokens;
  @override
  Set<String> get favoriteTokenIds;
  @override
  bool get isLoading;
  @override
  String? get error; // Dapps management
  @override
  List<ExploreDapp> get allDapps;
  @override
  List<ExploreDapp> get displayedDapps;
  @override
  List<ExploreDapp> get popularDapps;
  @override
  Set<String> get favoriteDappIds; // UI state
  @override
  int get currentTabIndex;
  @override
  String get searchQuery;
  @override
  bool get isToggled; // Sort options
  @override
  bool get isSortSheetVisible;
  @override
  bool get isSortPriceHighToLowSelected;
  @override
  bool get isSortPriceLowToHighSelected;
  @override
  bool get isSortAlphabeticalSelected;
  @override
  bool get isSortChangeSelected;

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExploreStateImplCopyWith<_$ExploreStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
