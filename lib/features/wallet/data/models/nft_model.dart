// NFT Collection Model
class NFTCollection {
  NFTCollection({required this.name, required this.count, required this.nfts});
  final String name;
  final int count;
  final List<NFT> nfts;
}

// NFT Model
class NFT {
  NFT({
    required this.id, 
    required this.price, 
    required this.imageUrl, 
    this.onTap, // Make onTap optional
    this.type = NFTType.image, // Default type is image
  });
  
  final String id;
  final String price;
  final String imageUrl;
  final Function? onTap; // Make it nullable
  final NFTType type; // Add NFT type for different media types
}

// NFT Type Enum
enum NFTType {
  image,
  audio,
  video
}
