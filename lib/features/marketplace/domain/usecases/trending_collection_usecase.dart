// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:defy/features/marketplace/domain/entities/trending_collection_entity.dart';
import 'package:defy/features/marketplace/domain/repository/trending_collection_repository.dart';

class TrendingCollectionUsecase {
  final TrendingCollectionRepository trendingCollectionRepository;
  TrendingCollectionUsecase({
    required this.trendingCollectionRepository,
  });

  Future<List<TrendingCollectionEntity>?> call({
    required String period,
    required String trendingBy,
    required int offset,
    required int limit,
  }) async {
    return await trendingCollectionRepository.getTrendingCollections(
        period: period, trendingBy: trendingBy, offset: offset, limit: limit);
  }
}
