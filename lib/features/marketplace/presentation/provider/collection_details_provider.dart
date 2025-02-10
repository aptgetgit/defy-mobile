
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/marketplace/data/repository/collection_details_repository_impl.dart';
import 'package:defy/features/marketplace/data/sources/remote/collection_details_remote.dart';
import 'package:defy/features/marketplace/domain/entities/collection_details_entity.dart';
import 'package:defy/features/marketplace/domain/repository/collection_details_repository.dart';
import 'package:defy/features/marketplace/domain/usecases/collection_details_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/collection_details_provider.g.dart';

@riverpod
CollectionDetailsRemote collectionDetailsRemote(
    CollectionDetailsRemoteRef ref) {
  return CollectionDetailsRemoteImpl();
}

@riverpod
CollectionDetailsRepository collectionDetailsRepository(
    CollectionDetailsRepositoryRef ref) {
  final collectionDetailsRemote = ref.read(collectionDetailsRemoteProvider);
  return CollectionDetailsRepositoryImpl(
      collectionDetailsRemote: collectionDetailsRemote);
}

@riverpod
CollectionDetailsUsecase collectionDetailsUsecase(
    CollectionDetailsUsecaseRef ref) {
  final collectionDetailsRepository =
      ref.read(collectionDetailsRepositoryProvider);
  return CollectionDetailsUsecase(
      collectionDetailRepository: collectionDetailsRepository);
}

@riverpod
class CollectionDetails extends _$CollectionDetails {
  @override
  void build() {}

  Future<List<CollectionDetailsEntity>?> getCollectionDetails({
    required String id,
    required String slug,
    required int offsetListings,
    required int limitListings,
    required int offsetActivity,
    required int limitActivity,
  }) async {
    final collectionDetails = await ref
        .read(collectionDetailsUsecaseProvider)
        .call(id, slug, offsetListings, limitListings, offsetActivity,
            limitActivity);
    AppLogger.debug(collectionDetails);
    return collectionDetails;
  }
}
