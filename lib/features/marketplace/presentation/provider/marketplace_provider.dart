import 'dart:math' as math;

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repository/trending_collection_repository.dart';
import '../state/marketplace_filter_state_model.dart';
import '../state/marketplace_state_model.dart';
import 'trending_collection_provider.dart';

part 'generated/marketplace_provider.g.dart';

@Riverpod(keepAlive: true)
class MarketplaceProvider extends _$MarketplaceProvider {
  late TrendingCollectionRepository _repository;

  @override
  MarketplaceStateModel build() {
    _repository = ref.read(trendingCollectionRepositoryProvider);
    return const MarketplaceStateModel();
  }

  void changeTab(int index) {
    if (index == 1) {
      // Top tab
      loadTopCollections();
      state = state.copyWith(
        filterState: const MarketplaceFilterStateModel(
          selectedSortBy: ['Market Cap'],
          selectedPeriod: ['24 Hrs'],
        ),
        tabIndex: index,
      );
    } else {
      // Trending tab
      state = state.copyWith(
        filterState: const MarketplaceFilterStateModel(
          selectedSortBy: ['Volume'],
          selectedPeriod: ['24 Hrs'],
        ),
        tabIndex: index,
      );
      loadFilteredData();
    }
  }

  Future<void> loadTopCollections() async {
    state = state.copyWith(isLoading: true);

    final data = await _repository.getTrendingCollections(
      period: 'days_1',
      trendingBy: 'crypto_volume',
      offset: 0,
      limit: 1000,
    );

    if (data != null) {
      state = state.copyWith(
        allCollections: data,
        isLoading: false,
        displayedItemCount: math.min(10, data.length),
      );
    } else {
      state = state.copyWith(
        allCollections: [],
        isLoading: false,
        displayedItemCount: 0,
      );
    }
  }

  void changePeriod(int index) {
    state = state.copyWith(selectedPeriod: index);
  }

  void updateFilterState(MarketplaceFilterStateModel newFilterState) {
    state = state.copyWith(filterState: newFilterState);
    loadFilteredData();
  }

  Future<void> loadFilteredData() async {
    state = state.copyWith(isLoading: true);

    String period = 'days_7';
    if (state.filterState.selectedPeriod.contains('24 Hrs')) {
      period = 'days_1';
    } else if (state.filterState.selectedPeriod.contains('7 Days')) {
      period = 'days_7';
    } else if (state.filterState.selectedPeriod.contains('14 Days')) {
      period = 'days_14';
    } else if (state.filterState.selectedPeriod.contains('30 Days')) {
      period = 'days_30';
    } else if (state.filterState.selectedPeriod.contains('60 Days')) {
      period = 'days_60';
    } else if (state.filterState.selectedPeriod.contains('90 Days')) {
      period = 'days_90';
    } else if (state.filterState.selectedPeriod.contains('All Time')) {
      period = 'all_time';
    }

    String trendingBy = 'usd_volume';
    if (state.filterState.selectedSortBy.contains('Volume')) {
      trendingBy = 'usd_volume';
    } else if (state.filterState.selectedSortBy.contains('Sales')) {
      trendingBy = 'trades_count';
    } else if (state.filterState.selectedSortBy.contains('Vol USD')) {
      trendingBy = 'usd_volume';
    } else if (state.filterState.selectedSortBy.contains('Average')) {
      trendingBy = 'average_trade';
    } else if (state.filterState.selectedSortBy.contains('Market Cap')) {
      trendingBy = 'crypto_volume';
    }

    print('Fetching data with period: $period, trendingBy: $trendingBy');

    final data = await _repository.getTrendingCollections(
      period: period,
      trendingBy: trendingBy,
      offset: 0,
      limit: 1000,
    );

    print('Received data: ${data?.length ?? 0} items');

    if (data != null && data.isNotEmpty) {
      state = state.copyWith(
        allCollections: data,
        isLoading: false,
        displayedItemCount: math.min(10, data.length),
      );
      print('Updated state with ${state.allCollections.length} items');
    } else {
      state = state.copyWith(
        allCollections: [],
        isLoading: false,
        displayedItemCount: 0,
      );
      print('No data received, cleared collections');
    }
  }

 
}
