import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/domain/entities/trending_collection_entity.dart';
import 'package:defy/features/marketplace/presentation/provider/marketplace_provider.dart';
import 'package:defy/features/marketplace/presentation/screens/nft_collections_details_screen.dart';
import 'package:defy/features/marketplace/presentation/screens/nft_marketplace_search_screen.dart';
import 'package:defy/features/marketplace/presentation/state/marketplace_filter_state_model.dart';
import 'package:defy/features/marketplace/presentation/widgets/nft_marketplace/nft_marketplace_filter_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'dart:math' as math;

class NFTMarketplaceAllCollectionsScreen extends ConsumerStatefulWidget {
  const NFTMarketplaceAllCollectionsScreen({super.key});

  @override
  ConsumerState<NFTMarketplaceAllCollectionsScreen> createState() =>
      _NFTMarketplaceAllCollectionsScreenState();
}

class _NFTMarketplaceAllCollectionsScreenState
    extends ConsumerState<NFTMarketplaceAllCollectionsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  void loadData() {
    final state = ref.read(marketplaceProviderProvider);
    if (state.tabIndex == 0) {
      ref.read(marketplaceProviderProvider.notifier).loadFilteredData();
    } else {
      ref.read(marketplaceProviderProvider.notifier).loadTopCollections();
    }
  }

  void openSearchPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NFTMarketplaceSearchScreen(),
      ),
    );
  }

  void openFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return NFTMarketplaceFilterBottomSheet(
          initialFilterState: ref.read(marketplaceProviderProvider).filterState,
          onFilterChanged: (newFilterState) {
            ref
                .read(marketplaceProviderProvider.notifier)
                .updateFilterState(newFilterState as MarketplaceFilterStateModel);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(marketplaceProviderProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections',
            style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(PhosphorIconsRegular.caretLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => ref
                          .read(marketplaceProviderProvider.notifier)
                          .changeTab(0),
                      child: Text(
                        "Trending",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: state.tabIndex == 0 ? AppColors.black : AppColors.greyMedium,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    GestureDetector(
                      onTap: () => ref
                          .read(marketplaceProviderProvider.notifier)
                          .changeTab(1),
                      child: Text(
                        "Top",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: state.tabIndex == 1 ? AppColors.black : AppColors.greyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: openSearchPage,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Icon(
                          PhosphorIcons.magnifyingGlass(
                              PhosphorIconsStyle.bold),
                          color: AppColors.greyDark,
                          size: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: openFilterBottomSheet,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Icon(
                          PhosphorIcons.slidersHorizontal(
                              PhosphorIconsStyle.bold),
                          color: AppColors.greyDark,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Divider(color: Color(0xfff4f4f6), thickness: 1.5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Collections",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyLight,
                        ),
                      ),
                      Text(
                        state.tabIndex == 0 ? "Vol" : "Market Cap",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: () async => loadData(),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: state.allCollections.length,
                      itemBuilder: (context, index) {
                        final collection = state.allCollections[index];
                        return NFTCollectionTile(
                          collection: collection,
                          index: index + 1,
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class NFTCollectionTile extends StatelessWidget {
  final TrendingCollectionEntity collection;
  final int index;

  const NFTCollectionTile({
    Key? key,
    required this.collection,
    required this.index,
  }) : super(key: key);

  double getPriceInAPT(int price) {
    return price / math.pow(10, 8);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NFTCollectionsDetailsScreen(
              id: collection.collection?.id ?? '',
              slug: collection.collection?.slug ?? '',
              floor: collection.collection?.floor ?? 0,
              usdVolume: collection.collection?.usdVolume!.toInt() ?? 0,
              volume: collection.collection?.volume ?? 0,
              supply: collection.collection?.supply ?? 0,
              tradesCount: collection.currentTradesCount ?? 0,
              imageUrl: collection.collection?.coverUrl ?? '',
              collectionName: collection.collection?.title ?? '',
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  _buildLeadingImage(),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          collection.collection!.title!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Floor: ${getPriceInAPT(collection.collection!.floor ?? 0).toStringAsFixed(2)} APT',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${getPriceInAPT(collection.collection!.volume ?? 0).toStringAsFixed(2)} APT',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Volume',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatItem(
                      collection.currentTradesCount.toString(), 'Trades '),
                  _buildStatItem(
                      getPriceInAPT(collection.collection!.floor!)
                          .toStringAsFixed(2),
                      'Floor'),
                  _buildStatItem(
                      collection.collection?.supply.toString() ?? '', 'Items'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildLeadingImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            _getValidImageUrl(collection.collection!.coverUrl!),
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 70,
                height: 70,
                color: Colors.grey[300],
                child: Icon(Icons.image_not_supported, color: Colors.grey[500]),
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              '#$index',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  String _getValidImageUrl(String url) {
    if (url.startsWith('ipfs://')) {
      return 'https://ipfs.io/ipfs/' + url.substring(7);
    }
    return url;
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
