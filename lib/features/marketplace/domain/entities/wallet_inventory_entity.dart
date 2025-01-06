class WalletInventoryEntity {
  final AptosEntity aptos;

  WalletInventoryEntity({required this.aptos});
}

class AptosEntity {
  final List<CollectionEntity> collections;

  AptosEntity({required this.collections});
}

class CollectionEntity {
  final String title;
  final String? description;
  final double? floor;
  final double? usdVolume;
  final bool verified;
  final String? coverUrl;
  final List<NFTEntity> nfts;

  CollectionEntity({
    required this.title,
    this.description,
    this.floor,
    this.usdVolume,
    required this.verified,
    this.coverUrl,
    required this.nfts,
  });
}

class NFTEntity {
  final String mediaUrl;
  final String name;
  final String owner;
  final CollectionTitleEntity collection;

  NFTEntity({
    required this.mediaUrl,
    required this.name,
    required this.owner,
    required this.collection,
  });
}

class CollectionTitleEntity {
  final String title;

  CollectionTitleEntity({required this.title});
}