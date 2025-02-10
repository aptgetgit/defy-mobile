import '../state/nft_collection_buy_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/collection_details_entity.dart';

part 'generated/nft_collection_buy_provider.g.dart';

@Riverpod(keepAlive: true)
class NFTCollectionBuyNotifier extends _$NFTCollectionBuyNotifier {
  @override
  NFTCollectionBuyStateModel build() => const NFTCollectionBuyStateModel();

  void toggleNFTSelection(String nftId) {
    final newSelectedNFTs = Set<String>.from(state.selectedNFTs);
    if (newSelectedNFTs.contains(nftId)) {
      newSelectedNFTs.remove(nftId);
    } else {
      newSelectedNFTs.add(nftId);
    }
    state = state.copyWith(selectedNFTs: newSelectedNFTs);
  }

  void setSortBy(String sortBy, bool isAscending) {
    state = state.copyWith(sortBy: sortBy, isAscending: isAscending);
  }

  void toggleSort() {
    final newSortOrder = !state.isAscending;
    state = state.copyWith(isAscending: newSortOrder);
  }

  void clearSelections() {
    state = state.copyWith(selectedNFTs: {});
  }

  void setFilter(Map<String, dynamic> filter) {
    state = state.copyWith(filter: filter);
  }

  void toggleSelectedNFT(CollectionListingsEntity listing) {
    final newSelectedNFTs = Set<String>.from(state.selectedNFTs);
    final nftId = listing.nft?.id ?? '';
    if (newSelectedNFTs.contains(nftId)) {
      newSelectedNFTs.remove(nftId);
    } else {
      newSelectedNFTs.add(nftId);
    }

    final newSweepValue = newSelectedNFTs.length.toDouble();

    state = state.copyWith(
      selectedNFTs: newSelectedNFTs,
      sweepValue: newSweepValue,
    );
  }

  void updateSweepValue(double value, List<CollectionListingsEntity> listings) {
    final sortedListings = listings.toList()
      ..sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));

    final newSelectedNFTs = sortedListings
        .take(value.round())
        .map((listing) => listing.nft?.id ?? '')
        .where((id) => id.isNotEmpty)
        .toSet();

    state = state.copyWith(
      sweepValue: value,
      selectedNFTs: newSelectedNFTs,
    );
  }

  void resetState() {
    state = const NFTCollectionBuyStateModel();
  }
}
