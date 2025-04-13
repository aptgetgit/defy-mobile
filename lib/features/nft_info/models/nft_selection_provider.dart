import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../wallet/data/models/nft_model.dart';

part 'generated/nft_selection_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedNftNotifier extends _$SelectedNftNotifier {
  @override
  NFT? build() {
    // Initialize with no selected NFT
    return null;
  }
  
  void selectNFT(NFT nft) {
    state = nft;
  }
  
  void selectNFTById(String id, List<NFTCollection> collections) {
    for (final collection in collections) {
      for (final nft in collection.nfts) {
        if (nft.id == id) {
          state = nft;
          return;
        }
      }
    }
  }
  
  void clearSelection() {
    state = null;
  }
}
