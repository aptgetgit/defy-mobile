
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/marketplace/data/repository/trending_collection_repository_impl.dart';
import 'package:defy/features/marketplace/data/sources/remote/trending_collection_remote.dart';
import 'package:defy/features/marketplace/domain/entities/trending_collection_entity.dart';
import 'package:defy/features/marketplace/domain/repository/trending_collection_repository.dart';
import 'package:defy/features/marketplace/domain/usecases/trending_collection_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/trending_collection_provider.g.dart';

@riverpod
TrendingCollectionRemote trendingCollectionRemote(TrendingCollectionRemoteRef ref) {
  return TrendingCollectionRemoteImpl();
}

@riverpod
TrendingCollectionRepository trendingCollectionRepository(TrendingCollectionRepositoryRef ref) {
  final trendingCollectionRemote = ref.read(trendingCollectionRemoteProvider);
  return TrendingCollectionRepositoryImpl(trendingCollectionRemote: trendingCollectionRemote);
}

@riverpod
TrendingCollectionUsecase trendingCollectionUsecase(TrendingCollectionUsecaseRef ref) {
  final trendingCollectionRepository = ref.read(trendingCollectionRepositoryProvider);
  return TrendingCollectionUsecase(trendingCollectionRepository: trendingCollectionRepository);
}

@riverpod
class TrendingCollection extends _$TrendingCollection {
  @override
  void build() {}

  Future<List<TrendingCollectionEntity>?> getTrendingCollection({required String period,
      required String trendingBy,
      required int offset,
      required int limit,
      }) async {
        final trendingCollections = await ref.read(trendingCollectionUsecaseProvider).call(period:period,trendingBy:trendingBy,offset:offset,limit:limit);
        AppLogger.debug(trendingCollections);
       return trendingCollections;
  }
}