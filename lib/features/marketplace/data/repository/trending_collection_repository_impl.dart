// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:defy/features/marketplace/data/sources/remote/trending_collection_remote.dart';
import 'package:defy/features/marketplace/domain/entities/trending_collection_entity.dart';
import 'package:defy/features/marketplace/domain/repository/trending_collection_repository.dart';

class TrendingCollectionRepositoryImpl extends TrendingCollectionRepository {
  final TrendingCollectionRemote trendingCollectionRemote;
  TrendingCollectionRepositoryImpl({
    required this.trendingCollectionRemote,
  });
  @override
  Future<List<TrendingCollectionEntity>?> getTrendingCollections(
      {required String period,
      required String trendingBy,
      required int offset,
      required int limit}) async {
    return await trendingCollectionRemote.getTrendingCollections(
        period: period, trendingBy: trendingBy, offset: offset, limit: limit);
  }
}
