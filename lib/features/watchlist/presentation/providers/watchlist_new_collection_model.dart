import '../../../wallet/data/models/nft_model.dart';
import '../../../wallet/data/models/token_model.dart';

enum CollectionType {
  token,
  nft,
  mixed  // For collections with both tokens and NFTs
}

class WatchlistNewCollection {
  final String name;
  final List<Token> selectedTokens;
  final List<NFT> selectedNFTs;
  final DateTime creationDate;
  final CollectionType type;

  WatchlistNewCollection({
    required this.name,
    required this.selectedTokens,
    required this.selectedNFTs,
    required this.creationDate,
  }): type = _determineCollectionType(selectedTokens, selectedNFTs);

  static CollectionType _determineCollectionType(List<Token> tokens, List<NFT> nfts) {
    if (tokens.isNotEmpty && nfts.isEmpty) {
      return CollectionType.token;
    } else if (tokens.isEmpty && nfts.isNotEmpty) {
      return CollectionType.nft;
    } else {
      return CollectionType.mixed;
    }
  }
}
