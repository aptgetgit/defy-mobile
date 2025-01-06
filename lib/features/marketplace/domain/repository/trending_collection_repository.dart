import 'package:defy/features/marketplace/domain/entities/trending_collection_entity.dart';

abstract class TrendingCollectionRepository {
  Future<List<TrendingCollectionEntity>?> getTrendingCollections({
    required String period,
    required String trendingBy,
    required int offset,
    required int limit,
  });
}
