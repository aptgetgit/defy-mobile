import '../state/nft_marketplace_sell_state_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/nft_marketplace_sell_provider.g.dart';

@riverpod
class NFTMarketplaceSellNotifier extends _$NFTMarketplaceSellNotifier {
  @override
  NFTMarketplaceSellState build() {
    return const NFTMarketplaceSellState();
  }

  void toggleSelectionMode() {
    state = state.copyWith(
      isSelectionMode: !state.isSelectionMode,
      selectedNFTs: state.isSelectionMode ? {} : state.selectedNFTs,
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

  void toggleExpansion(String collectionId) {
    final newExpandedStates = Map<String, bool>.from(state.expandedStates);
    newExpandedStates[collectionId] =
        !(newExpandedStates[collectionId] ?? true);
    state = state.copyWith(expandedStates: newExpandedStates);
  }

  void selectAll(List<String> nftNames) {
    final newSelectedNFTs = Set<String>.from(state.selectedNFTs);
    if (newSelectedNFTs.containsAll(nftNames)) {
      newSelectedNFTs.removeAll(nftNames);
    } else {
      newSelectedNFTs.addAll(nftNames);
    }
    state = state.copyWith(selectedNFTs: newSelectedNFTs);
  }

  void setSortBy(String sortBy, bool isAscending) {
    state = state.copyWith(sortBy: sortBy, isAscending: isAscending);
  }

  void applyFilters(NFTMarketplaceSellState newState) {
    state = newState;
  }
}
