import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/explore_dapp.dart';

import '../data/models/explore_token.dart';
import './explore_state.dart';

part 'generated/explore_provider.g.dart';

@Riverpod(keepAlive: true)
class ExploreNotifier extends _$ExploreNotifier {
  @override
  ExploreState build() {
    // Initialize with mock data
    final List<ExploreToken> initialTokens = [
      ExploreToken(
        id: '1',
        name: '🌐',
        symbol: 'GLOBE',
        logo: 'assets/icons/globe.png',
        priceUsd: 0.12,
        changePercentage: 1.02,
        investors: 1520,
        returnPeriod: '3m',
        tileType: 'emoji',
        emoji: '🌐',
      ),
      ExploreToken(
        id: '2',
        name: 'Aptos',
        symbol: 'APT',
        logo: 'assets/icons/aptos.png',
        priceUsd: 6.05,
        changePercentage: -0.02,
        investors: 2340,
        returnPeriod: '1y',
        tileType: 'image', // Keep Aptos as image tile
      ),
      ExploreToken(
        id: '3',
        name: 'Pancake',
        symbol: 'CAKE',
        logo: 'assets/icons/pancake.png',
        priceUsd: 5.05,
        changePercentage: -1.02,
        investors: 1800,
        returnPeriod: '6m',
        tileType: 'emoji',
        emoji: '🐰',
      ),
      ExploreToken(
        id: '4',
        name: 'Gui Inu',
        symbol: 'GUI',
        logo: 'assets/icons/gui_inu.png',
        priceUsd: 0.000008,
        changePercentage: -0.02,
        investors: 900,
        returnPeriod: '2m',
        tileType: 'emoji',
        emoji: '🐶',
      ),
      ExploreToken(
        id: '5',
        name: 'Batman',
        symbol: 'BATMAN',
        logo: 'assets/icons/batman.png',
        priceUsd: 0.0000012,
        changePercentage: -0.02,
        investors: 1200,
        returnPeriod: '1m',
        tileType: 'emoji',
        emoji: '🦇',
      ),
      ExploreToken(
        id: '6',
        name: 'Santa',
        symbol: 'SANTA',
        logo: 'assets/icons/santa.png',
        priceUsd: 8.01,
        changePercentage: 1.02,
        investors: 2000,
        returnPeriod: '4m',
        tileType: 'emoji',
        emoji: '🎅',
      ),
      ExploreToken(
        id: '7',
        name: 'Batman (BAT)',
        symbol: 'BATMAN',
        logo: 'assets/icons/batman_bat.png',
        priceUsd: 0.0000012,
        changePercentage: -0.02,
        investors: 1100,
        returnPeriod: '1m',
        tileType: 'emoji',
        emoji: '🦇',
      ),
      ExploreToken(
        id: '8',
        name: 'Handsup',
        symbol: 'HANDSUP',
        logo: 'assets/icons/handsup.png',
        priceUsd: 142.39,
        changePercentage: -1.02,
        investors: 3000,
        returnPeriod: '5m',
        tileType: 'emoji',
        emoji: '🙌',
      ),
      ExploreToken(
        id: '9',
        name: 'Bathtub',
        symbol: 'BATHTUB',
        logo: 'assets/icons/bathtub.png',
        priceUsd: 142.39,
        changePercentage: 0.02,
        investors: 2500,
        returnPeriod: '3m',
        tileType: 'emoji',
        emoji: '🛁',
      ),
      ExploreToken(
        id: '10',
        name: 'Globe Meridian',
        symbol: 'GLOBE',
        logo: 'assets/icons/globe_meridian.png',
        priceUsd: 142.39,
        changePercentage: -1.02,
        investors: 2800,
        returnPeriod: '6m',
        tileType: 'emoji',
        emoji: '🌐',
      ),
    ];

    final List<ExploreDapp> initialDapps = [
      ExploreDapp(
        id: '1',
        name: 'Uniswap',
        description: 'Swap cryptocurrencies directly without intermediaries.',
        imagePath: 'assets/icons/uniswap_dapp_logo.png',
        categories: ['DeFi', 'Staking'],
        url: 'https://uniswap.org',
      ),
    ];

    return ExploreState(
      allTokens: initialTokens,
      displayedTokens: initialTokens,
      trendingTokens: initialTokens.where((token) => token.changePercentage.abs() > 2.0).toList(),
      allDapps: initialDapps,
      displayedDapps: initialDapps,
    );
  }

  void setCurrentTab(int index) {
    state = state.copyWith(currentTabIndex: index);
  }

  void toggleTokenFavorite(String id) {
    final Set<String> newFavorites = Set<String>.from(state.favoriteTokenIds);
    if (newFavorites.contains(id)) {
      newFavorites.remove(id);
    } else {
      newFavorites.add(id);
    }
    state = state.copyWith(favoriteTokenIds: newFavorites);
  }

  void toggleRocketMode() {
    state = state.copyWith(isToggled: !state.isToggled);
  }

  void showSortSheet() {
    state = state.copyWith(isSortSheetVisible: true);
  }

  void hideSortSheet() {
    state = state.copyWith(isSortSheetVisible: false);
  }

  void setSortOption({
    bool? isSortPriceHighToLowSelected,
    bool? isSortPriceLowToHighSelected,
    bool? isSortAlphabeticalSelected,
    bool? isSortChangeSelected,
  }) {
    final ExploreState newState = state.copyWith(
      isSortPriceHighToLowSelected: isSortPriceHighToLowSelected ?? false,
      isSortPriceLowToHighSelected: isSortPriceLowToHighSelected ?? false,
      isSortAlphabeticalSelected: isSortAlphabeticalSelected ?? false,
      isSortChangeSelected: isSortChangeSelected ?? false,
    );
    state = _sortTokens(newState);
  }

  ExploreState _sortTokens(ExploreState currentState) {
    final List<ExploreToken> tokens = List<ExploreToken>.from(currentState.displayedTokens);
    
    if (currentState.isSortPriceHighToLowSelected) {
      tokens.sort((a, b) => b.priceUsd.compareTo(a.priceUsd));
    } else if (currentState.isSortPriceLowToHighSelected) {
      tokens.sort((a, b) => a.priceUsd.compareTo(b.priceUsd));
    } else if (currentState.isSortAlphabeticalSelected) {
      tokens.sort((a, b) => a.name.compareTo(b.name));
    } else if (currentState.isSortChangeSelected) {
      tokens.sort((a, b) => b.changePercentage.compareTo(a.changePercentage));
    }
    
    return currentState.copyWith(displayedTokens: tokens);
  }

  void searchTokens(String query) {
    if (query.isEmpty) {
      state = state.copyWith(
        displayedTokens: state.allTokens,
        searchQuery: '',
      );
      return;
    }
    
    final List<ExploreToken> filteredTokens = state.allTokens.where((token) {
      final bool nameMatch = token.name.toLowerCase().contains(query.toLowerCase());
      final bool symbolMatch = token.symbol.toLowerCase().contains(query.toLowerCase());
      return nameMatch || symbolMatch;
    }).toList();
    
    state = state.copyWith(
      displayedTokens: filteredTokens,
      searchQuery: query,
    );
  }

  void searchDapps(String query) {
    if (query.isEmpty) {
      state = state.copyWith(
        displayedDapps: state.allDapps,
        searchQuery: '',
      );
      return;
    }
    
    final List<ExploreDapp> filteredDapps = state.allDapps.where((dapp) =>
      dapp.name.toLowerCase().contains(query.toLowerCase()) ||
      dapp.description.toLowerCase().contains(query.toLowerCase()) ||
      dapp.categories.any((cat) => cat.toLowerCase().contains(query.toLowerCase()))
    ).toList();
    
    state = state.copyWith(
      displayedDapps: filteredDapps,
      searchQuery: query,
    );
  }
}