import 'package:defy/features/marketplace/data/sources/remote/collection_details_remote.dart';
import 'package:defy/features/marketplace/domain/entities/collection_details_entity.dart';
import 'package:defy/features/marketplace/domain/repository/collection_details_repository.dart';

class CollectionDetailsRepositoryImpl extends CollectionDetailsRepository {
  final CollectionDetailsRemote collectionDetailsRemote;
  CollectionDetailsRepositoryImpl({
    required this.collectionDetailsRemote,
  });
  @override
  Future<List<CollectionDetailsEntity>?> getCollectionDetails({
    required String id,
    required String slug,
    required int offsetListings,
    required int limitListings,
    required int offsetActivity,
    required int limitActivity,
  }) async {
    return await collectionDetailsRemote.getCollectionDetails(
        id: id,
        slug: slug,
        offsetListings: offsetListings,
        limitListings: limitListings,
        offsetActivity: offsetActivity,
        limitActivity: limitActivity);
  }
}