import 'package:defy/features/marketplace/domain/entities/collection_details_entity.dart';
import 'package:defy/features/marketplace/domain/entities/nft_marketplace_cart_entity.dart';
import 'package:defy/features/marketplace/presentation/state/nft_marketplace_cart_state_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/nft_marketplace_cart_notifier.g.dart';

@Riverpod(keepAlive: true)
class CartNotifier extends _$CartNotifier {
  @override
  NFTMarketplaceCartStateModel build() => const NFTMarketplaceCartStateModel();

  void addToCart(NFTMarketplaceCartEntity nft) {
    state = state.copyWith(items: [...state.items, nft]);
  }



  bool isInCart(NFTMarketplaceCartEntity nft) {
    return state.items.contains(nft);
  }



void toggleSort() {
  final newSortOrder = !state.isSortAscending;
  final sortedItems = List<NFTMarketplaceCartEntity>.from(state.items)
    ..sort((a, b) => newSortOrder
        ? a.price.compareTo(b.price)
        : b.price.compareTo(a.price));

  state = state.copyWith(items: sortedItems, isSortAscending: newSortOrder);
}

  void toggleEditMode() {
    state = state.copyWith(
      isEditMode: !state.isEditMode,
      deletedItems: state.isEditMode ? {} : state.deletedItems,
    );
  }

  void toggleNFTSelection(String nftName) {
    final newSelectedNFTs = Set<String>.from(state.selectedNFTs);
    if (newSelectedNFTs.contains(nftName)) {
      newSelectedNFTs.remove(nftName);
    } else {
      newSelectedNFTs.add(nftName);
    }
    state = state.copyWith(selectedNFTs: newSelectedNFTs);
  }



  void initializeSelectedNFTs() {
    final currentSelectedNFTs = state.selectedNFTs;
    final newSelectedNFTs =
        Set<String>.from(state.items.map((nft) => (nft as NFTMarketplaceCartEntity).name ?? ''));

    if (currentSelectedNFTs != newSelectedNFTs) {
      state = state.copyWith(selectedNFTs: newSelectedNFTs);
    }
  }

 void markItemAsDeleted(String nftName, bool isDeleted) {
  state = state.copyWith(
    deletedItems: {...state.deletedItems, nftName: isDeleted},
  );
}

  void removeFromCart(NFTMarketplaceCartEntity nft) {
  state = state.copyWith(
    items: state.items.where((item) => (item as NFTMarketplaceCartEntity).name != nft.name).toList(),
    selectedNFTs: state.selectedNFTs.where((name) => name != nft.name).toSet(),
    deletedItems: Map.from(state.deletedItems)..remove(nft.name),
  );
}

  void removeAllFromCart() {
    state = state.copyWith(
      items: [],
      selectedNFTs: {},
      deletedItems: {},
    );
  }
}
