import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/domain/entities/collection_details_entity.dart';
import 'package:defy/features/marketplace/presentation/provider/nft_marketplace_cart_notifier.dart';
import 'package:defy/features/shared/presentation/widgets/nft_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NFTCollectionItemsTab extends ConsumerStatefulWidget {
  final List<CollectionListingsEntity> listings;
  final CollectionInfoEntity collectionInfo;
  final String? collectionName;
  final String? collectionImageUrl;

  const NFTCollectionItemsTab({
    super.key,
    required this.collectionInfo,
    required this.listings,
    required this.collectionName,
    required this.collectionImageUrl,
  });

  @override
  ConsumerState<NFTCollectionItemsTab> createState() =>
      _NFTCollectionItemsTabState();
}

class _NFTCollectionItemsTabState extends ConsumerState<NFTCollectionItemsTab> {
  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartNotifierProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        const horizontalPadding = 24.0;
        const cardSpacing = 16.0;
        final cardWidth =
            (constraints.maxWidth - 2 * horizontalPadding - cardSpacing) / 2;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: cardWidth,
                      child: quickSellContainer(),
                    ),
                    const SizedBox(width: cardSpacing),
                    if (widget.listings.isNotEmpty)
                      SizedBox(
                        width: cardWidth,
                        child: NFTCard(
                          discordUrl: widget.collectionInfo.discord,
                          twitterUrl: widget.collectionInfo.twitter,
                          websiteUrl: widget.collectionInfo.website,
                          description: widget.collectionInfo.description,
                          isCollectionItem: true,
                          imageUrl: widget.listings[0].nft?.mediaUrl ?? '',
                          nftName: widget.listings[0].nft?.name ?? '',
                          collectionName: widget.collectionName ?? '',
                          price: widget.listings[0].price ?? 0,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                ...List.generate((widget.listings.length - 1) ~/ 2 + 1,
                    (index) {
                  final firstIndex = index * 2 + 1;
                  final secondIndex = firstIndex + 1;
                  return Column(
                    children: [
                      Row(
                        children: [
                          if (firstIndex < widget.listings.length)
                            SizedBox(
                              width: cardWidth,
                              child: NFTCard(
                                discordUrl: widget.collectionInfo.discord,
                                twitterUrl: widget.collectionInfo.twitter,
                                websiteUrl: widget.collectionInfo.website,
                                description: widget.collectionInfo.description,
                                isCollectionItem: true,
                                imageUrl:
                                    widget.listings[firstIndex].nft?.mediaUrl ??
                                        '',
                                nftName:
                                    widget.listings[firstIndex].nft?.name ?? '',
                                collectionName: widget.collectionName ?? '',
                                price: widget.listings[firstIndex].price ?? 0,
                              ),
                            ),
                          const SizedBox(width: cardSpacing),
                          if (secondIndex < widget.listings.length)
                            SizedBox(
                              width: cardWidth,
                              child: NFTCard(
                                discordUrl: widget.collectionInfo.discord,
                                twitterUrl: widget.collectionInfo.twitter,
                                websiteUrl: widget.collectionInfo.website,
                                description: widget.collectionInfo.description,
                                isCollectionItem: true,
                                imageUrl: widget
                                        .listings[secondIndex].nft?.mediaUrl ??
                                    '',
                                nftName:
                                    widget.listings[secondIndex].nft?.name ??
                                        '',
                                collectionName: widget.collectionName ?? '',
                                price: widget.listings[secondIndex].price ?? 0,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget quickSellContainer() {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            PhosphorIconsRegular.clock,
            color: Colors.black,
            size: 36,
          ),
          const SizedBox(height: 8),
          Text(
            'Instant Sell',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '14.85 APT',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Sell Now     ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color:AppColors. greyLight),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Make Offer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.greyDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
