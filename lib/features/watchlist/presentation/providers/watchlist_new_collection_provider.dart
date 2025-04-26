// Create this file in lib/features/watchlist/providers/watchlist_provider.dart
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'watchlist_new_collection_model.dart';

class WatchlistNewCollectionsNotifier extends StateNotifier<Map<CollectionType, List<WatchlistNewCollection>>> {
  WatchlistNewCollectionsNotifier() : super({
    CollectionType.token: [],
    CollectionType.nft: [],
  });

  void addCollection(WatchlistNewCollection collection) {
    print('WatchlistNewCollectionsNotifier: Adding collection ${collection.name}');
    
    final type = collection.type;
    final collections = [...state[type]!, collection];
    
    print('WatchlistNewCollectionsNotifier: New state length for ${type} ${collections.length}');
    
    // Update the state
    state = {
      ...state,
      type: collections,
    };
  }

  void removeCollection(CollectionType type, int index) {
    final collections = [...state[type]!];
    collections.removeAt(index);
    state = {
      ...state,
      type: collections,
    };
  }
}

// Separate provider to make it easier to access collections by type
final watchlistCollectionsProvider = StateNotifierProvider<WatchlistNewCollectionsNotifier, Map<CollectionType, List<WatchlistNewCollection>>>(
  (ref) => WatchlistNewCollectionsNotifier(),
);

// Convenience provider for token collections
final tokenCollectionsProvider = Provider<List<WatchlistNewCollection>>((ref) {
  final collections = ref.watch(watchlistCollectionsProvider);
  return collections[CollectionType.token]!;
});

// Convenience provider for NFT collections
final nftCollectionsProvider = Provider<List<WatchlistNewCollection>>((ref) {
  final collections = ref.watch(watchlistCollectionsProvider);
  return collections[CollectionType.nft]!;
});
