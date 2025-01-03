class NFTMarketplaceCartEntity {
  final String name;
  final String mediaUrl;
  final String collectionName;
  final int price;

  NFTMarketplaceCartEntity({
    required this.name,
    required this.mediaUrl,
    required this.collectionName,
    required this.price,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NFTMarketplaceCartEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          mediaUrl == other.mediaUrl &&
          collectionName == other.collectionName &&
          price == other.price;

  @override
  int get hashCode =>
      name.hashCode ^ mediaUrl.hashCode ^ collectionName.hashCode ^ price.hashCode;
}