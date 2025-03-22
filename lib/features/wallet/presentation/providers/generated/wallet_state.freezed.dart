// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../wallet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletState {
// Balance information
  String get selectedBalanceOption => throw _privateConstructorUsedError;
  String get totalBalance => throw _privateConstructorUsedError;
  bool get isBalanceHidden =>
      throw _privateConstructorUsedError; // Token management
  List<Token> get allTokens => throw _privateConstructorUsedError;
  List<Token> get displayedTokens => throw _privateConstructorUsedError;
  Set<int> get selectedTokens => throw _privateConstructorUsedError;
  Set<int> get watchlistTokens => throw _privateConstructorUsedError;
  bool get hideSelected => throw _privateConstructorUsedError;
  bool get isWatchlistActionTriggered =>
      throw _privateConstructorUsedError; // NFT management
  List<NFTCollection> get allNFTCollections =>
      throw _privateConstructorUsedError;
  List<NFTCollection> get displayedNFTCollections =>
      throw _privateConstructorUsedError;
  Map<int, Set<int>> get selectedNFTs => throw _privateConstructorUsedError;
  Map<int, bool> get expandedStates => throw _privateConstructorUsedError;
  Map<int, bool> get allCollectionNFTsSelected =>
      throw _privateConstructorUsedError; // UI state
  int get currentTabIndex => throw _privateConstructorUsedError;
  bool get isMoreButtonSelected => throw _privateConstructorUsedError;
  bool get isHidingActive => throw _privateConstructorUsedError;
  bool get isQrScannerOpen =>
      throw _privateConstructorUsedError; // Sort options
  bool get isSortSheetVisible => throw _privateConstructorUsedError;
  bool get isSortPriceButtonSelected => throw _privateConstructorUsedError;
  bool get isSortBalanceButtonSelected => throw _privateConstructorUsedError;
  bool get isSortAlphabetButtonSelected => throw _privateConstructorUsedError;
  bool get isSort24hrButtonSelected => throw _privateConstructorUsedError;

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletStateCopyWith<WalletState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletStateCopyWith<$Res> {
  factory $WalletStateCopyWith(
          WalletState value, $Res Function(WalletState) then) =
      _$WalletStateCopyWithImpl<$Res, WalletState>;
  @useResult
  $Res call(
      {String selectedBalanceOption,
      String totalBalance,
      bool isBalanceHidden,
      List<Token> allTokens,
      List<Token> displayedTokens,
      Set<int> selectedTokens,
      Set<int> watchlistTokens,
      bool hideSelected,
      bool isWatchlistActionTriggered,
      List<NFTCollection> allNFTCollections,
      List<NFTCollection> displayedNFTCollections,
      Map<int, Set<int>> selectedNFTs,
      Map<int, bool> expandedStates,
      Map<int, bool> allCollectionNFTsSelected,
      int currentTabIndex,
      bool isMoreButtonSelected,
      bool isHidingActive,
      bool isQrScannerOpen,
      bool isSortSheetVisible,
      bool isSortPriceButtonSelected,
      bool isSortBalanceButtonSelected,
      bool isSortAlphabetButtonSelected,
      bool isSort24hrButtonSelected});
}

/// @nodoc
class _$WalletStateCopyWithImpl<$Res, $Val extends WalletState>
    implements $WalletStateCopyWith<$Res> {
  _$WalletStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBalanceOption = null,
    Object? totalBalance = null,
    Object? isBalanceHidden = null,
    Object? allTokens = null,
    Object? displayedTokens = null,
    Object? selectedTokens = null,
    Object? watchlistTokens = null,
    Object? hideSelected = null,
    Object? isWatchlistActionTriggered = null,
    Object? allNFTCollections = null,
    Object? displayedNFTCollections = null,
    Object? selectedNFTs = null,
    Object? expandedStates = null,
    Object? allCollectionNFTsSelected = null,
    Object? currentTabIndex = null,
    Object? isMoreButtonSelected = null,
    Object? isHidingActive = null,
    Object? isQrScannerOpen = null,
    Object? isSortSheetVisible = null,
    Object? isSortPriceButtonSelected = null,
    Object? isSortBalanceButtonSelected = null,
    Object? isSortAlphabetButtonSelected = null,
    Object? isSort24hrButtonSelected = null,
  }) {
    return _then(_value.copyWith(
      selectedBalanceOption: null == selectedBalanceOption
          ? _value.selectedBalanceOption
          : selectedBalanceOption // ignore: cast_nullable_to_non_nullable
              as String,
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as String,
      isBalanceHidden: null == isBalanceHidden
          ? _value.isBalanceHidden
          : isBalanceHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      allTokens: null == allTokens
          ? _value.allTokens
          : allTokens // ignore: cast_nullable_to_non_nullable
              as List<Token>,
      displayedTokens: null == displayedTokens
          ? _value.displayedTokens
          : displayedTokens // ignore: cast_nullable_to_non_nullable
              as List<Token>,
      selectedTokens: null == selectedTokens
          ? _value.selectedTokens
          : selectedTokens // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      watchlistTokens: null == watchlistTokens
          ? _value.watchlistTokens
          : watchlistTokens // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      hideSelected: null == hideSelected
          ? _value.hideSelected
          : hideSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatchlistActionTriggered: null == isWatchlistActionTriggered
          ? _value.isWatchlistActionTriggered
          : isWatchlistActionTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
      allNFTCollections: null == allNFTCollections
          ? _value.allNFTCollections
          : allNFTCollections // ignore: cast_nullable_to_non_nullable
              as List<NFTCollection>,
      displayedNFTCollections: null == displayedNFTCollections
          ? _value.displayedNFTCollections
          : displayedNFTCollections // ignore: cast_nullable_to_non_nullable
              as List<NFTCollection>,
      selectedNFTs: null == selectedNFTs
          ? _value.selectedNFTs
          : selectedNFTs // ignore: cast_nullable_to_non_nullable
              as Map<int, Set<int>>,
      expandedStates: null == expandedStates
          ? _value.expandedStates
          : expandedStates // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
      allCollectionNFTsSelected: null == allCollectionNFTsSelected
          ? _value.allCollectionNFTsSelected
          : allCollectionNFTsSelected // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
      currentTabIndex: null == currentTabIndex
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isMoreButtonSelected: null == isMoreButtonSelected
          ? _value.isMoreButtonSelected
          : isMoreButtonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isHidingActive: null == isHidingActive
          ? _value.isHidingActive
          : isHidingActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isQrScannerOpen: null == isQrScannerOpen
          ? _value.isQrScannerOpen
          : isQrScannerOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortSheetVisible: null == isSortSheetVisible
          ? _value.isSortSheetVisible
          : isSortSheetVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortPriceButtonSelected: null == isSortPriceButtonSelected
          ? _value.isSortPriceButtonSelected
          : isSortPriceButtonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortBalanceButtonSelected: null == isSortBalanceButtonSelected
          ? _value.isSortBalanceButtonSelected
          : isSortBalanceButtonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortAlphabetButtonSelected: null == isSortAlphabetButtonSelected
          ? _value.isSortAlphabetButtonSelected
          : isSortAlphabetButtonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSort24hrButtonSelected: null == isSort24hrButtonSelected
          ? _value.isSort24hrButtonSelected
          : isSort24hrButtonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletStateImplCopyWith<$Res>
    implements $WalletStateCopyWith<$Res> {
  factory _$$WalletStateImplCopyWith(
          _$WalletStateImpl value, $Res Function(_$WalletStateImpl) then) =
      __$$WalletStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String selectedBalanceOption,
      String totalBalance,
      bool isBalanceHidden,
      List<Token> allTokens,
      List<Token> displayedTokens,
      Set<int> selectedTokens,
      Set<int> watchlistTokens,
      bool hideSelected,
      bool isWatchlistActionTriggered,
      List<NFTCollection> allNFTCollections,
      List<NFTCollection> displayedNFTCollections,
      Map<int, Set<int>> selectedNFTs,
      Map<int, bool> expandedStates,
      Map<int, bool> allCollectionNFTsSelected,
      int currentTabIndex,
      bool isMoreButtonSelected,
      bool isHidingActive,
      bool isQrScannerOpen,
      bool isSortSheetVisible,
      bool isSortPriceButtonSelected,
      bool isSortBalanceButtonSelected,
      bool isSortAlphabetButtonSelected,
      bool isSort24hrButtonSelected});
}

/// @nodoc
class __$$WalletStateImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$WalletStateImpl>
    implements _$$WalletStateImplCopyWith<$Res> {
  __$$WalletStateImplCopyWithImpl(
      _$WalletStateImpl _value, $Res Function(_$WalletStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBalanceOption = null,
    Object? totalBalance = null,
    Object? isBalanceHidden = null,
    Object? allTokens = null,
    Object? displayedTokens = null,
    Object? selectedTokens = null,
    Object? watchlistTokens = null,
    Object? hideSelected = null,
    Object? isWatchlistActionTriggered = null,
    Object? allNFTCollections = null,
    Object? displayedNFTCollections = null,
    Object? selectedNFTs = null,
    Object? expandedStates = null,
    Object? allCollectionNFTsSelected = null,
    Object? currentTabIndex = null,
    Object? isMoreButtonSelected = null,
    Object? isHidingActive = null,
    Object? isQrScannerOpen = null,
    Object? isSortSheetVisible = null,
    Object? isSortPriceButtonSelected = null,
    Object? isSortBalanceButtonSelected = null,
    Object? isSortAlphabetButtonSelected = null,
    Object? isSort24hrButtonSelected = null,
  }) {
    return _then(_$WalletStateImpl(
      selectedBalanceOption: null == selectedBalanceOption
          ? _value.selectedBalanceOption
          : selectedBalanceOption // ignore: cast_nullable_to_non_nullable
              as String,
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as String,
      isBalanceHidden: null == isBalanceHidden
          ? _value.isBalanceHidden
          : isBalanceHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      allTokens: null == allTokens
          ? _value._allTokens
          : allTokens // ignore: cast_nullable_to_non_nullable
              as List<Token>,
      displayedTokens: null == displayedTokens
          ? _value._displayedTokens
          : displayedTokens // ignore: cast_nullable_to_non_nullable
              as List<Token>,
      selectedTokens: null == selectedTokens
          ? _value._selectedTokens
          : selectedTokens // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      watchlistTokens: null == watchlistTokens
          ? _value._watchlistTokens
          : watchlistTokens // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      hideSelected: null == hideSelected
          ? _value.hideSelected
          : hideSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isWatchlistActionTriggered: null == isWatchlistActionTriggered
          ? _value.isWatchlistActionTriggered
          : isWatchlistActionTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
      allNFTCollections: null == allNFTCollections
          ? _value._allNFTCollections
          : allNFTCollections // ignore: cast_nullable_to_non_nullable
              as List<NFTCollection>,
      displayedNFTCollections: null == displayedNFTCollections
          ? _value._displayedNFTCollections
          : displayedNFTCollections // ignore: cast_nullable_to_non_nullable
              as List<NFTCollection>,
      selectedNFTs: null == selectedNFTs
          ? _value._selectedNFTs
          : selectedNFTs // ignore: cast_nullable_to_non_nullable
              as Map<int, Set<int>>,
      expandedStates: null == expandedStates
          ? _value._expandedStates
          : expandedStates // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
      allCollectionNFTsSelected: null == allCollectionNFTsSelected
          ? _value._allCollectionNFTsSelected
          : allCollectionNFTsSelected // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
      currentTabIndex: null == currentTabIndex
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isMoreButtonSelected: null == isMoreButtonSelected
          ? _value.isMoreButtonSelected
          : isMoreButtonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isHidingActive: null == isHidingActive
          ? _value.isHidingActive
          : isHidingActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isQrScannerOpen: null == isQrScannerOpen
          ? _value.isQrScannerOpen
          : isQrScannerOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortSheetVisible: null == isSortSheetVisible
          ? _value.isSortSheetVisible
          : isSortSheetVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortPriceButtonSelected: null == isSortPriceButtonSelected
          ? _value.isSortPriceButtonSelected
          : isSortPriceButtonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortBalanceButtonSelected: null == isSortBalanceButtonSelected
          ? _value.isSortBalanceButtonSelected
          : isSortBalanceButtonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortAlphabetButtonSelected: null == isSortAlphabetButtonSelected
          ? _value.isSortAlphabetButtonSelected
          : isSortAlphabetButtonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSort24hrButtonSelected: null == isSort24hrButtonSelected
          ? _value.isSort24hrButtonSelected
          : isSort24hrButtonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WalletStateImpl implements _WalletState {
  const _$WalletStateImpl(
      {this.selectedBalanceOption = 'Total Balance',
      this.totalBalance = '1,038.56',
      this.isBalanceHidden = false,
      final List<Token> allTokens = const [],
      final List<Token> displayedTokens = const [],
      final Set<int> selectedTokens = const {},
      final Set<int> watchlistTokens = const {},
      this.hideSelected = false,
      this.isWatchlistActionTriggered = false,
      final List<NFTCollection> allNFTCollections = const [],
      final List<NFTCollection> displayedNFTCollections = const [],
      final Map<int, Set<int>> selectedNFTs = const {},
      final Map<int, bool> expandedStates = const {},
      final Map<int, bool> allCollectionNFTsSelected = const {},
      this.currentTabIndex = 0,
      this.isMoreButtonSelected = false,
      this.isHidingActive = false,
      this.isQrScannerOpen = false,
      this.isSortSheetVisible = false,
      this.isSortPriceButtonSelected = false,
      this.isSortBalanceButtonSelected = true,
      this.isSortAlphabetButtonSelected = false,
      this.isSort24hrButtonSelected = false})
      : _allTokens = allTokens,
        _displayedTokens = displayedTokens,
        _selectedTokens = selectedTokens,
        _watchlistTokens = watchlistTokens,
        _allNFTCollections = allNFTCollections,
        _displayedNFTCollections = displayedNFTCollections,
        _selectedNFTs = selectedNFTs,
        _expandedStates = expandedStates,
        _allCollectionNFTsSelected = allCollectionNFTsSelected;

// Balance information
  @override
  @JsonKey()
  final String selectedBalanceOption;
  @override
  @JsonKey()
  final String totalBalance;
  @override
  @JsonKey()
  final bool isBalanceHidden;
// Token management
  final List<Token> _allTokens;
// Token management
  @override
  @JsonKey()
  List<Token> get allTokens {
    if (_allTokens is EqualUnmodifiableListView) return _allTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTokens);
  }

  final List<Token> _displayedTokens;
  @override
  @JsonKey()
  List<Token> get displayedTokens {
    if (_displayedTokens is EqualUnmodifiableListView) return _displayedTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_displayedTokens);
  }

  final Set<int> _selectedTokens;
  @override
  @JsonKey()
  Set<int> get selectedTokens {
    if (_selectedTokens is EqualUnmodifiableSetView) return _selectedTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedTokens);
  }

  final Set<int> _watchlistTokens;
  @override
  @JsonKey()
  Set<int> get watchlistTokens {
    if (_watchlistTokens is EqualUnmodifiableSetView) return _watchlistTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_watchlistTokens);
  }

  @override
  @JsonKey()
  final bool hideSelected;
  @override
  @JsonKey()
  final bool isWatchlistActionTriggered;
// NFT management
  final List<NFTCollection> _allNFTCollections;
// NFT management
  @override
  @JsonKey()
  List<NFTCollection> get allNFTCollections {
    if (_allNFTCollections is EqualUnmodifiableListView)
      return _allNFTCollections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allNFTCollections);
  }

  final List<NFTCollection> _displayedNFTCollections;
  @override
  @JsonKey()
  List<NFTCollection> get displayedNFTCollections {
    if (_displayedNFTCollections is EqualUnmodifiableListView)
      return _displayedNFTCollections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_displayedNFTCollections);
  }

  final Map<int, Set<int>> _selectedNFTs;
  @override
  @JsonKey()
  Map<int, Set<int>> get selectedNFTs {
    if (_selectedNFTs is EqualUnmodifiableMapView) return _selectedNFTs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedNFTs);
  }

  final Map<int, bool> _expandedStates;
  @override
  @JsonKey()
  Map<int, bool> get expandedStates {
    if (_expandedStates is EqualUnmodifiableMapView) return _expandedStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_expandedStates);
  }

  final Map<int, bool> _allCollectionNFTsSelected;
  @override
  @JsonKey()
  Map<int, bool> get allCollectionNFTsSelected {
    if (_allCollectionNFTsSelected is EqualUnmodifiableMapView)
      return _allCollectionNFTsSelected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_allCollectionNFTsSelected);
  }

// UI state
  @override
  @JsonKey()
  final int currentTabIndex;
  @override
  @JsonKey()
  final bool isMoreButtonSelected;
  @override
  @JsonKey()
  final bool isHidingActive;
  @override
  @JsonKey()
  final bool isQrScannerOpen;
// Sort options
  @override
  @JsonKey()
  final bool isSortSheetVisible;
  @override
  @JsonKey()
  final bool isSortPriceButtonSelected;
  @override
  @JsonKey()
  final bool isSortBalanceButtonSelected;
  @override
  @JsonKey()
  final bool isSortAlphabetButtonSelected;
  @override
  @JsonKey()
  final bool isSort24hrButtonSelected;

  @override
  String toString() {
    return 'WalletState(selectedBalanceOption: $selectedBalanceOption, totalBalance: $totalBalance, isBalanceHidden: $isBalanceHidden, allTokens: $allTokens, displayedTokens: $displayedTokens, selectedTokens: $selectedTokens, watchlistTokens: $watchlistTokens, hideSelected: $hideSelected, isWatchlistActionTriggered: $isWatchlistActionTriggered, allNFTCollections: $allNFTCollections, displayedNFTCollections: $displayedNFTCollections, selectedNFTs: $selectedNFTs, expandedStates: $expandedStates, allCollectionNFTsSelected: $allCollectionNFTsSelected, currentTabIndex: $currentTabIndex, isMoreButtonSelected: $isMoreButtonSelected, isHidingActive: $isHidingActive, isQrScannerOpen: $isQrScannerOpen, isSortSheetVisible: $isSortSheetVisible, isSortPriceButtonSelected: $isSortPriceButtonSelected, isSortBalanceButtonSelected: $isSortBalanceButtonSelected, isSortAlphabetButtonSelected: $isSortAlphabetButtonSelected, isSort24hrButtonSelected: $isSort24hrButtonSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletStateImpl &&
            (identical(other.selectedBalanceOption, selectedBalanceOption) ||
                other.selectedBalanceOption == selectedBalanceOption) &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            (identical(other.isBalanceHidden, isBalanceHidden) ||
                other.isBalanceHidden == isBalanceHidden) &&
            const DeepCollectionEquality()
                .equals(other._allTokens, _allTokens) &&
            const DeepCollectionEquality()
                .equals(other._displayedTokens, _displayedTokens) &&
            const DeepCollectionEquality()
                .equals(other._selectedTokens, _selectedTokens) &&
            const DeepCollectionEquality()
                .equals(other._watchlistTokens, _watchlistTokens) &&
            (identical(other.hideSelected, hideSelected) ||
                other.hideSelected == hideSelected) &&
            (identical(other.isWatchlistActionTriggered,
                    isWatchlistActionTriggered) ||
                other.isWatchlistActionTriggered ==
                    isWatchlistActionTriggered) &&
            const DeepCollectionEquality()
                .equals(other._allNFTCollections, _allNFTCollections) &&
            const DeepCollectionEquality().equals(
                other._displayedNFTCollections, _displayedNFTCollections) &&
            const DeepCollectionEquality()
                .equals(other._selectedNFTs, _selectedNFTs) &&
            const DeepCollectionEquality()
                .equals(other._expandedStates, _expandedStates) &&
            const DeepCollectionEquality().equals(
                other._allCollectionNFTsSelected, _allCollectionNFTsSelected) &&
            (identical(other.currentTabIndex, currentTabIndex) ||
                other.currentTabIndex == currentTabIndex) &&
            (identical(other.isMoreButtonSelected, isMoreButtonSelected) ||
                other.isMoreButtonSelected == isMoreButtonSelected) &&
            (identical(other.isHidingActive, isHidingActive) ||
                other.isHidingActive == isHidingActive) &&
            (identical(other.isQrScannerOpen, isQrScannerOpen) ||
                other.isQrScannerOpen == isQrScannerOpen) &&
            (identical(other.isSortSheetVisible, isSortSheetVisible) ||
                other.isSortSheetVisible == isSortSheetVisible) &&
            (identical(other.isSortPriceButtonSelected, isSortPriceButtonSelected) ||
                other.isSortPriceButtonSelected == isSortPriceButtonSelected) &&
            (identical(other.isSortBalanceButtonSelected,
                    isSortBalanceButtonSelected) ||
                other.isSortBalanceButtonSelected ==
                    isSortBalanceButtonSelected) &&
            (identical(other.isSortAlphabetButtonSelected,
                    isSortAlphabetButtonSelected) ||
                other.isSortAlphabetButtonSelected ==
                    isSortAlphabetButtonSelected) &&
            (identical(other.isSort24hrButtonSelected, isSort24hrButtonSelected) ||
                other.isSort24hrButtonSelected == isSort24hrButtonSelected));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        selectedBalanceOption,
        totalBalance,
        isBalanceHidden,
        const DeepCollectionEquality().hash(_allTokens),
        const DeepCollectionEquality().hash(_displayedTokens),
        const DeepCollectionEquality().hash(_selectedTokens),
        const DeepCollectionEquality().hash(_watchlistTokens),
        hideSelected,
        isWatchlistActionTriggered,
        const DeepCollectionEquality().hash(_allNFTCollections),
        const DeepCollectionEquality().hash(_displayedNFTCollections),
        const DeepCollectionEquality().hash(_selectedNFTs),
        const DeepCollectionEquality().hash(_expandedStates),
        const DeepCollectionEquality().hash(_allCollectionNFTsSelected),
        currentTabIndex,
        isMoreButtonSelected,
        isHidingActive,
        isQrScannerOpen,
        isSortSheetVisible,
        isSortPriceButtonSelected,
        isSortBalanceButtonSelected,
        isSortAlphabetButtonSelected,
        isSort24hrButtonSelected
      ]);

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletStateImplCopyWith<_$WalletStateImpl> get copyWith =>
      __$$WalletStateImplCopyWithImpl<_$WalletStateImpl>(this, _$identity);
}

abstract class _WalletState implements WalletState {
  const factory _WalletState(
      {final String selectedBalanceOption,
      final String totalBalance,
      final bool isBalanceHidden,
      final List<Token> allTokens,
      final List<Token> displayedTokens,
      final Set<int> selectedTokens,
      final Set<int> watchlistTokens,
      final bool hideSelected,
      final bool isWatchlistActionTriggered,
      final List<NFTCollection> allNFTCollections,
      final List<NFTCollection> displayedNFTCollections,
      final Map<int, Set<int>> selectedNFTs,
      final Map<int, bool> expandedStates,
      final Map<int, bool> allCollectionNFTsSelected,
      final int currentTabIndex,
      final bool isMoreButtonSelected,
      final bool isHidingActive,
      final bool isQrScannerOpen,
      final bool isSortSheetVisible,
      final bool isSortPriceButtonSelected,
      final bool isSortBalanceButtonSelected,
      final bool isSortAlphabetButtonSelected,
      final bool isSort24hrButtonSelected}) = _$WalletStateImpl;

// Balance information
  @override
  String get selectedBalanceOption;
  @override
  String get totalBalance;
  @override
  bool get isBalanceHidden; // Token management
  @override
  List<Token> get allTokens;
  @override
  List<Token> get displayedTokens;
  @override
  Set<int> get selectedTokens;
  @override
  Set<int> get watchlistTokens;
  @override
  bool get hideSelected;
  @override
  bool get isWatchlistActionTriggered; // NFT management
  @override
  List<NFTCollection> get allNFTCollections;
  @override
  List<NFTCollection> get displayedNFTCollections;
  @override
  Map<int, Set<int>> get selectedNFTs;
  @override
  Map<int, bool> get expandedStates;
  @override
  Map<int, bool> get allCollectionNFTsSelected; // UI state
  @override
  int get currentTabIndex;
  @override
  bool get isMoreButtonSelected;
  @override
  bool get isHidingActive;
  @override
  bool get isQrScannerOpen; // Sort options
  @override
  bool get isSortSheetVisible;
  @override
  bool get isSortPriceButtonSelected;
  @override
  bool get isSortBalanceButtonSelected;
  @override
  bool get isSortAlphabetButtonSelected;
  @override
  bool get isSort24hrButtonSelected;

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletStateImplCopyWith<_$WalletStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
