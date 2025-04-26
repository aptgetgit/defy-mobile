import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'watchlist_collection_model.dart';
import 'watchlist_item_model.dart';
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
    state = state.copyWith(
      isDeleteMode: !state.isDeleteMode,
      // Don't modify anything else here that might interfere with deletion
    );
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
    // Preserve the current delete mode
    final bool currentDeleteMode = state.isDeleteMode;

    // Create a new list of items excluding the deleted one
    final List<WatchlistItem> updatedItems = state.collection.items
        .where((item) => item.id != itemId)
        .toList();

    // Update the collection with the new list of items
    final WatchlistCollection updatedCollection = state.collection.copyWith(
      items: updatedItems,
      lastUpdated: DateTime.now(),
    );

    // Update the state without affecting the delete mode
    state = state.copyWith(
      collection: updatedCollection,
      isDeleteMode: currentDeleteMode, // Ensure delete mode is preserved
    );
  }
  
  void markItemAsDeleting(String itemId, bool isDeleting) {
    ref.read(watchlistProvider.notifier).setItemDeletingState(state.collection.id, itemId, isDeleting);
  }

  void reorderItems(List<WatchlistItem> newOrder) {
    final updatedCollection = state.collection.copyWith(items: newOrder);
    state = state.copyWith(collection: updatedCollection);
  }

  // Add this method to ensure delete mode is preserved
  void preserveDeleteMode() {
    if (state.isDeleteMode) {
      state = state.copyWith(isDeleteMode: true);
    }
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
