// NFT Collection Model
class NFTCollection {
  NFTCollection({required this.name, required this.count, required this.nfts});
  final String name;
  final int count;
  final List<NFT> nfts;
}

// NFT Model
class NFT {
  NFT({required this.id, required this.price, required this.imageUrl});
  final String id;
  final String price;
  final String imageUrl;
}