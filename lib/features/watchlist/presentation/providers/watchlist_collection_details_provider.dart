import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'watchlist_collection_model.dart';
import 'watchlist_provider.dart';

part 'generated/watchlist_collection_details_provider.g.dart';
part 'generated/watchlist_collection_details_provider.freezed.dart';

@riverpod
class WatchlistCollectionDetails extends _$WatchlistCollectionDetails {
  @override
  CollectionDetailsState build(String collectionId) {
    // Get collection from the main provider
    final collections = ref.watch(watchlistProvider).collections;
    final collection = collections.firstWhere(
      (c) => c.id == collectionId,
      orElse: () => WatchlistCollection(
        id: '', 
        name: '', 
        type: CollectionType.nft,
      ),
    );
    
    return CollectionDetailsState(
      collection: collection,
      isDeleteMode: false,
      sortOption: SortOption.nameAsc,
    );
  }
  
  void toggleDeleteMode() {
    state = state.copyWith(isDeleteMode: !state.isDeleteMode);
  }
  
  void setSortOption(SortOption option) {
    state = state.copyWith(sortOption: option);
  }
  
  void updateCollection(String newName) {
    // First update in the main provider
    ref.read(watchlistProvider.notifier).updateCollectionName(state.collection.id, newName);
    
    // Then update the local state
    state = state.copyWith(
      collection: state.collection.copyWith(name: newName),
    );
  }
  
  void deleteItem(String itemId) {
    ref.read(watchlistProvider.notifier).removeItemFromCollection(state.collection.id, itemId);
  }
  
  void markItemAsDeleting(String itemId, bool isDeleting) {
    ref.read(watchlistProvider.notifier).setItemDeletingState(state.collection.id, itemId, isDeleting);
  }
}

enum SortOption {
  nameAsc,
  nameDesc,
  priceAsc,
  priceDesc,
}

@freezed
class CollectionDetailsState with _$CollectionDetailsState {
  const factory CollectionDetailsState({
    required WatchlistCollection collection,
    required bool isDeleteMode,
    required SortOption sortOption,
  }) = _CollectionDetailsState;
}
