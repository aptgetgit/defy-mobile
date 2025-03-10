import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import 'watchlist_collection_model.dart';
import 'watchlist_item_model.dart';
import 'watchlist_state.dart';

part 'generated/watchlist_provider.g.dart';

@Riverpod(keepAlive: true)
class Watchlist extends _$Watchlist {
  final Uuid _uuid = const Uuid();

  WatchlistState build() => WatchlistState(
      collections: <WatchlistCollection>[
        WatchlistCollection(
          id: _uuid.v4(),
          name: 'Cute NFTs🐣',
          type: CollectionType.nft,
          createdAt: DateTime.now().subtract(const Duration(days: 30)),
          items: List.generate(
            6,
            (int index) => WatchlistItem(
              id: _uuid.v4(),
              name: 'Funky Monkey #${index + 1}',
              imagePath: 'assets/images/onboarding-nft-6.png',
              usdValue: r'$123.39',
              nativeValue: '32 APT',
            ),
          ),
        ),
        WatchlistCollection(
          id: _uuid.v4(),
          name: 'Avatar NFTs',
          type: CollectionType.nft,
          createdAt: DateTime.now().subtract(const Duration(days: 60)),
          items: List.generate(
            6,
            (int index) => WatchlistItem(
              id: _uuid.v4(),
              name: 'Avatar NFT #${index + 1}',
              imagePath: 'assets/images/watchlist${(index % 4) + 1}.png',
              usdValue: '\$${200 + index * 10}.00',
              nativeValue: '${10 + index} APT',
            ),
          ),
        ),
        WatchlistCollection(
          id: _uuid.v4(),
          name: 'Safety Tokens 🤩',
          type: CollectionType.token,
          createdAt: DateTime.now().subtract(const Duration(days: 45)),
          items: List.generate(
            6,
            (int index) => WatchlistItem(
              id: _uuid.v4(),
              name: 'Token #${index + 1}',
              imagePath: 'assets/images/watchlist${(index % 4) + 1}.png',
              usdValue: '\$${500 + index * 20}.00',
              nativeValue: '${20 + index * 2} APT',
              symbol: 'APT',
            ),
          ),
        ),
      ],
    );
  
  // Tab navigation
  void setSelectedTab(int tabIndex) {
    state = state.copyWith(selectedTabIndex: tabIndex);
  }
  
  // Collection selection
  void selectCollection(String collectionId) {
    state = state.copyWith(selectedCollectionId: collectionId);
  }
  
  // Create new collection
  void createCollection(String name, CollectionType type) {
    final WatchlistCollection collection = WatchlistCollection(
      id: _uuid.v4(),
      name: name,
      type: type,
      createdAt: DateTime.now(),
    );
    
    state = state.copyWith(
      collections: <WatchlistCollection>[...state.collections, collection],
      newCollectionName: null,
    );
  }
  
  // Update collection name
  void updateCollectionName(String collectionId, String newName) {
    state = state.copyWith(
      collections: state.collections.map((collection) => 
        collection.id == collectionId
            ? collection.copyWith(name: newName, lastUpdated: DateTime.now())
            : collection,
      ).toList(),
      editingCollectionId: null,
    );
  }
  
  // Set editing collection name
  void setEditingCollectionName(String? collectionId, String? newName) {
    state = state.copyWith(
      editingCollectionId: collectionId,
      newCollectionName: newName,
    );
  }
  
  // Delete collection
  void deleteCollection(String collectionId) {
    state = state.copyWith(
      collections: state.collections.where((collection) => 
        collection.id != collectionId,
      ).toList(),
      selectedCollectionId: null,
    );
  }
  
  // Toggle delete mode
  void toggleDeleteMode() {
    state = state.copyWith(isDeleteMode: !state.isDeleteMode);
  }
  
  // Add item to collection
  void addItemToCollection(String collectionId, WatchlistItem item) {
    state = state.copyWith(
      collections: state.collections.map<WatchlistCollection>((WatchlistCollection collection) => 
        collection.id == collectionId
            ? collection.copyWith(
                items: <WatchlistItem>[...collection.items, item],
                lastUpdated: DateTime.now(),
              )
            : collection,
      ).toList(),
    );
  }
  
  // Remove item from collection
  void removeItemFromCollection(String collectionId, String itemId) {
    state = state.copyWith(
      collections: state.collections.map((collection) => 
        collection.id == collectionId
            ? collection.copyWith(
                items: collection.items.where((item) => 
                  item.id != itemId,
                ).toList(),
                lastUpdated: DateTime.now(),
              )
            : collection,
      ).toList(),
    );
  }
  
  // Set item deletion state
  void setItemDeletingState(String collectionId, String itemId, bool isDeleting) {
    state = state.copyWith(
      collections: state.collections.map((collection) => 
        collection.id == collectionId
            ? collection.copyWith(
                items: collection.items.map((item) => 
                  item.id == itemId
                      ? item.copyWith(isDeleting: isDeleting)
                      : item,
                ).toList(),
              )
            : collection,
      ).toList(),
    );
  }
  
  // Get collections by type
  List<WatchlistCollection> getCollectionsByType(CollectionType type) => state.collections.where((collection) => collection.type == type).toList();
  
  // Get collection by id
  WatchlistCollection? getCollectionById(String id) {
    final matches = state.collections.where((collection) => collection.id == id);
    return matches.isNotEmpty ? matches.first : null;
  }
}
