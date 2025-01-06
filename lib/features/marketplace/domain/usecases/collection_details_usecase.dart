import 'package:defy/features/marketplace/domain/entities/collection_details_entity.dart';
import 'package:defy/features/marketplace/domain/repository/collection_details_repository.dart';
import 'package:fpdart/fpdart.dart';

class CollectionDetailsUsecase {
  final CollectionDetailsRepository collectionDetailRepository;

  CollectionDetailsUsecase( {required this.collectionDetailRepository});

  Future<List<CollectionDetailsEntity>?> call(String id, String slug, int offsetListings, int limitListings, int offsetActivity, int limitActivity) async {
    return await collectionDetailRepository.getCollectionDetails(id: id, slug: slug, offsetListings: offsetListings, limitListings: limitListings, offsetActivity: offsetActivity, limitActivity: limitActivity);
  }
}