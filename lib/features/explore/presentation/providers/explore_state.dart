import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/explore_dapp.dart';

import '../data/models/explore_token.dart';




part 'generated/explore_state.freezed.dart';

@freezed
class ExploreState with _$ExploreState {
  const factory ExploreState({
    // Token management
    @Default([]) List<ExploreToken> allTokens,
    @Default([]) List<ExploreToken> displayedTokens,
    @Default([]) List<ExploreToken> trendingTokens,
    @Default({}) Set<String> favoriteTokenIds,
    @Default(false) bool isLoading,
    String? error,
    
    // Dapps management
    @Default([]) List<ExploreDapp> allDapps,
    @Default([]) List<ExploreDapp> displayedDapps,
    @Default([]) List<ExploreDapp> popularDapps,
    @Default({}) Set<String> favoriteDappIds,
    
    // UI state
    @Default(0) int currentTabIndex,
    @Default('') String searchQuery,
    @Default(false) bool isToggled,
    
    // Sort options
    @Default(false) bool isSortSheetVisible,
    @Default(true) bool isSortPriceHighToLowSelected,
    @Default(false) bool isSortPriceLowToHighSelected,
    @Default(false) bool isSortAlphabeticalSelected,
    @Default(false) bool isSortChangeSelected,
  }) = _ExploreState;
}