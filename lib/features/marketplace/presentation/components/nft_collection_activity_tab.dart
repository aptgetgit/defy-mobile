import 'package:flutter/material.dart';
import 'package:defy/features/marketplace/domain/entities/collection_details_entity.dart';
import 'package:defy/features/marketplace/presentation/widgets/nft_collections/nft_collection_activity_tile.dart';

class NFTCollectionActivityTab extends StatelessWidget {
  final List<CollectionActivityEntity> activities;

  const NFTCollectionActivityTab({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return NFTCollectionActivityTile(
          type: activity.type!,
          name: activity.nft?.name ?? 'Unknown',
          imageUrl: activity.nft?.mediaUrl,
          price: activity.price ?? 0,
          sender: activity.sender ?? '',
          receiver: activity.receiver,
          blockTime: activity.blockTime,
        );
      },
    );
  }
}
