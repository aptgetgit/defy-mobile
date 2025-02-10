import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/nft_marketplace_cart_entity.dart';
import '../state/nft_marketplace_cart_state_model.dart';

part 'generated/nft_marketplace_cart_notifier.g.dart';

@Riverpod(keepAlive: true)
class CartNotifier extends _$CartNotifier {
  @override
  NFTMarketplaceCartStateModel build() => const NFTMarketplaceCartStateModel();

  void addToCart(NFTMarketplaceCartEntity nft) {
    state = state.copyWith(items: <NFTMarketplaceCartEntity>[...state.items, nft]);
  }



  bool isInCart(NFTMarketplaceCartEntity nft) => state.items.contains(nft);



void toggleSort() {
  final bool newSortOrder = !state.isSortAscending;
  final List<NFTMarketplaceCartEntity> sortedItems = List<NFTMarketplaceCartEntity>.from(state.items)
    ..sort((NFTMarketplaceCartEntity a, NFTMarketplaceCartEntity b) => newSortOrder
        ? a.price.compareTo(b.price)
        : b.price.compareTo(a.price),);

  state = state.copyWith(items: sortedItems, isSortAscending: newSortOrder);
}

  void toggleEditMode() {
    state = state.copyWith(
      isEditMode: !state.isEditMode,
      deletedItems: state.isEditMode ? <String, bool>{} : state.deletedItems,
    );
  }

  void toggleNFTSelection(String nftName) {
    final Set<String> newSelectedNFTs = Set<String>.from(state.selectedNFTs);
    if (newSelectedNFTs.contains(nftName)) {
      newSelectedNFTs.remove(nftName);
    } else {
      newSelectedNFTs.add(nftName);
    }
    state = state.copyWith(selectedNFTs: newSelectedNFTs);
  }



  void initializeSelectedNFTs() {
    final Set<String> currentSelectedNFTs = state.selectedNFTs;
    final Set<String> newSelectedNFTs =
        Set<String>.from(state.items.map((NFTMarketplaceCartEntity nft) => nft.name));

    if (currentSelectedNFTs != newSelectedNFTs) {
      state = state.copyWith(selectedNFTs: newSelectedNFTs);
    }
  }

 void markItemAsDeleted(String nftName, bool isDeleted) {
  state = state.copyWith(
    deletedItems: <String, bool>{...state.deletedItems, nftName: isDeleted},
  );
}

  void removeFromCart(NFTMarketplaceCartEntity nft) {
  state = state.copyWith(
    items: state.items.where((NFTMarketplaceCartEntity item) => (item).name != nft.name).toList(),
    selectedNFTs: state.selectedNFTs.where((String name) => name != nft.name).toSet(),
    deletedItems: Map.from(state.deletedItems)..remove(nft.name),
  );
}

  void removeAllFromCart() {
    state = state.copyWith(
      items: <NFTMarketplaceCartEntity>[],
      selectedNFTs: <String>{},
      deletedItems: <String, bool>{},
    );
  }
}
