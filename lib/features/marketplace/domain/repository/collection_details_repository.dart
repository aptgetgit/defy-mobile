

import 'package:defy/features/marketplace/domain/entities/collection_details_entity.dart';

abstract class CollectionDetailsRepository {
  Future<List<CollectionDetailsEntity>?> getCollectionDetails({
    required String id,
    required String slug,
    required int offsetListings,
    required int limitListings,
    required int offsetActivity,
    required int limitActivity,
  });
}