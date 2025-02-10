class CollectionDetailsEntity {
  final List<CollectionInfoEntity>? collectionInfo;
  final List<CollectionListingsEntity>? listings;
  final CollectionStatsEntity? stats;
  final List<CollectionActivityEntity>? activity;


  CollectionDetailsEntity({
    this.collectionInfo,
    this.listings,
    this.stats,
    this.activity,
  });
}

class CollectionInfoEntity {
  final String? id;
    final String? title;
  final String? slug;
  final String? semanticSlug;
  final String? description;
  final int? floor;
  final int? volume;
  final double? usdVolume;
  final String? coverUrl;
  final int? supply;
  final bool? verified;
  final String? discord;
  final String? twitter;
  final String? website;

  CollectionInfoEntity({
    this.id,
      this.title,
    this.slug,
    this.semanticSlug,
    this.description,
    this.floor,
    this.volume,
    this.usdVolume,
    this.coverUrl,
    this.supply,
    this.verified,
    this.discord,
    this.twitter,
    this.website,
  });
}

class CollectionListingsEntity {
  final String? id;
  final int? price;
  final String? blockTime;  
  final String? seller;
  final CollectionListingsNFTEntity? nft;
  final CollectionListingsContractEntity? contract;

  CollectionListingsEntity({
    this.id,
    this.price,
    this.blockTime,
    this.seller,
    this.nft,
    this.contract,
  });
}

class CollectionListingsNFTEntity {
  final String? id;
  final String? name;
  final String? mediaUrl;  
  final String? mediaType; 
  final int? ranking;

  CollectionListingsNFTEntity({
    this.id,
    this.name,
    this.mediaUrl,
    this.mediaType,
    this.ranking,
  });
}

class CollectionListingsContractEntity {
  final String? key;

  CollectionListingsContractEntity({
    this.key,
  });
}

class CollectionStatsEntity {
  final String? totalMintVolume; 
  final String? totalMintUsdVolume; 
  final int? totalSales;
  final String? totalUsdVolume; 
  final String? totalVolume;
  final String? dayVolume;
  final int? daySales;
  final String? dayUsdVolume;

  CollectionStatsEntity({
    this.totalMintVolume,
    this.totalMintUsdVolume,
    this.totalSales,
    this.totalUsdVolume,
    this.totalVolume,
    this.dayVolume,
    this.daySales,
    this.dayUsdVolume,
  });
}

class CollectionActivityEntity {
  final String? id;
  final String? type;
  final int? price;
  final double? usdPrice;  
  final String? sender;
  final String? receiver;
  final String? blockTime; 
  final CollectionActivityNFTEntity? nft;

  CollectionActivityEntity({
    this.id,
    this.type,
    this.price,
    this.usdPrice,
    this.sender,
    this.receiver,
    this.blockTime,
    this.nft,
  });
}

class CollectionActivityNFTEntity {
  final String? id;
  final String? name;
  final String? mediaUrl;  
  final int? ranking;

  CollectionActivityNFTEntity({
    this.id,
    this.name,
    this.mediaUrl,
    this.ranking,
  });
}
