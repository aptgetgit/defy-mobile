// ignore_for_file: public_member_api_docs, sort_constructors_first
class TrendingCollectionEntity {
  final String? id;
  final int? currentTradesCount;
  final String? currentUsdVolume;
  final String? currentVolume;
  final int? previousTradesCount; 
  final String? previousUsdVolume;
  final String? previousVolume;
  final CollectionEntity? collection;
  TrendingCollectionEntity({
    this.id,
    this.currentTradesCount,
    this.currentUsdVolume,
    this.currentVolume,
    this.previousTradesCount,
    this.previousUsdVolume,
    this.previousVolume,
    required this.collection,
  });
}

class CollectionEntity {
  final String? id;
  final String? slug;
  final String? title;
  final int? supply;
  final String? coverUrl;
  final int? floor;
  final double? usdVolume;
  final int? volume;
  final bool? verified;
  CollectionEntity({
    this.id,
    this.slug,
    this.title,
    this.supply,
    this.coverUrl,
    this.floor,
    this.usdVolume,
    this.volume,
    this.verified,
  });
}
