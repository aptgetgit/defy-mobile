import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/nft_card.dart';
import '../provider/marketplace_provider.dart';
import '../screens/nft_marketplace_all_collections_screen.dart';
import '../screens/nft_marketplace_cart_screen.dart';
import '../screens/nft_marketplace_search_screen.dart';
import '../screens/nft_marketplace_sell_screen.dart';
import '../state/marketplace_filter_state_model.dart';
import '../widgets/nft_marketplace/carousel_item_widget.dart';
import '../widgets/nft_marketplace/nft_marketplace_filter_bottom_sheet.dart';
import '../widgets/nft_marketplace/nft_tab_tile.dart';

class NFTMarketplaceNFTTab extends ConsumerStatefulWidget {
  const NFTMarketplaceNFTTab({super.key});

  @override
  ConsumerState<NFTMarketplaceNFTTab> createState() =>
      _NFTMarketplaceNFTTabState();
}

class _NFTMarketplaceNFTTabState extends ConsumerState<NFTMarketplaceNFTTab> {
  final ScrollController _scrollController = ScrollController();
  bool _showNFTHeader = false;
  bool _showCollectionHeader = true;
  final GlobalKey _nftHeaderKey = GlobalKey();
  final GlobalKey _collectionEndKey = GlobalKey();
  double customHeaderHeight = 52.0;
  final GlobalKey _lastNFTTileKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
      Future.delayed(Duration(milliseconds: 100), () {
        _onScroll();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final RenderBox? nftHeaderBox =
        _nftHeaderKey.currentContext?.findRenderObject() as RenderBox?;

    if (nftHeaderBox != null) {
      final nftHeaderPosition =
          nftHeaderBox.localToGlobal(Offset.zero).dy * 5.1;
      final nftHeaderHeight = nftHeaderBox.size.height;

      if (_scrollController.offset >=
          nftHeaderPosition + nftHeaderHeight - kToolbarHeight) {
        if (_showCollectionHeader) {
          setState(() {
            _showCollectionHeader = false;
          });
        }
      } else {
        if (!_showCollectionHeader) {
          setState(() {
            _showCollectionHeader = true;
          });
        }
      }
    }
  }

  void loadData() {
    final state = ref.read(marketplaceProviderProvider);
    if (state.tabIndex == 0) {
      ref.read(marketplaceProviderProvider.notifier).loadFilteredData();
    } else {
      ref.read(marketplaceProviderProvider.notifier).loadTopCollections();
    }
  }

  void openBottomSheet() {
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

    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.2,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        viewportFraction: 0.8,
                        enlargeFactor: 0.2,
                      ),
                      items: const [
                        CarouselItemWidget(),
                        CarouselItemWidget(),
                        CarouselItemWidget()
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 40,
                  maxHeight: 40,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
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
                                    color: state.tabIndex == 0
                                        ? AppColors.black
                                        : AppColors.greyMedium,
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
                                    color: state.tabIndex == 1
                                        ? AppColors.black
                                        : AppColors.greyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                              onTap: openBottomSheet,
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  color:AppColors. greyVeryLight,
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
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 53,
                  maxHeight: 53,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Divider(color: Color(0xfff4f4f6), thickness: 1.5),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _showCollectionHeader ? "Collections" : "NFT",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.greyLight,
                                  ),
                                ),
                                Text(
                                  _showCollectionHeader
                                      ? (state.tabIndex == 0
                                          ? "Vol"
                                          : "Market Cap")
                                      : "Vol",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.greyLight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (state.isLoading)
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final state = ref.watch(marketplaceProviderProvider);

                      if (state.allCollections.isEmpty) {
                        return Column(
                          children: [
                            const Center(
                                child:
                                    Text('No trending collections available')),
                            Container(key: _collectionEndKey),
                          ],
                        );
                      }

                      if (index < state.displayedItemCount) {
                        final collection = state.allCollections[index];
                        return NFTTabTile(
                          key: index == state.displayedItemCount - 1
                              ? _lastNFTTileKey
                              : null,
                          index: index + 1,
                          collectionUrl: collection.collection!.coverUrl,
                          collectionName: collection.collection!.title,
                          volume: collection.collection?.volume,
                          floor: collection.collection!.floor,
                          id: collection.collection!.id!,
                          slug: collection.collection!.slug!,
                          usdVolume: collection.collection!.usdVolume!.toInt(),
                          supply: collection.collection!.supply!,
                          tradesCount: collection.currentTradesCount!,
                        );
                      } else if (index == state.displayedItemCount) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NFTMarketplaceAllCollectionsScreen(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'View All',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blue,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Icon(
                                        PhosphorIconsBold.caretDown,
                                        color: AppColors.blue,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(key: _collectionEndKey, height: 20),
                          ],
                        );
                      } else {
                        return null;
                      }
                    },
                    childCount: state.allCollections.isEmpty
                        ? 1
                        : state.displayedItemCount + 1,
                  ),
                ),
              ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Container(
                  key: _nftHeaderKey,
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.only(
                      bottom: 32,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "NFT",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyLight,
                          ),
                        ),
                        Text(
                          "Vol",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final listing = listings[index];
                    return NFTCard(
                      description: null,
                      discordUrl: null,
                      websiteUrl: null,
                      twitterUrl: null,
                      isCollectionItem: true,
                      imageUrl: listing.imageUrl,
                      nftName: listing.name,
                      collectionName: "Pontem Space Pirates",
                      price: listing.price,
                    );
                  },
                  childCount: listings.length,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 2,
          bottom: 40,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.075,
              decoration: BoxDecoration(
                color: const Color(0xff252525),
                borderRadius: BorderRadius.circular(40),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NFTMarketplaceSellScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          PhosphorIconsBold.coins,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Sell',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NFTMarketplaceCartScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          PhosphorIconsBold.shoppingCart,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        PhosphorIconsBold.filePlus,
                        color: Colors.white,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Create',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        PhosphorIconsBold.spinnerBall,
                        color: Colors.white,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Spins',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodButton(String label, int index) {
    final state = ref.watch(marketplaceProviderProvider);
    return GestureDetector(
      onTap: () =>
          ref.read(marketplaceProviderProvider.notifier).changePeriod(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: MediaQuery.of(context).size.height * 0.035,
        width: MediaQuery.of(context).size.width * 0.075,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: state.selectedPeriod == index ? AppColors.black : AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: state.selectedPeriod == index ? AppColors.white : AppColors.greyLight,
            ),
          ),
        ),
      ),
    );
  }

  void openSearchPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NFTMarketplaceSearchScreen(),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

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

class NFTListing {
  final String id;
  final int price;
  final String imageUrl;
  final String name;

  NFTListing({
    required this.id,
    required this.price,
    required this.imageUrl,
    required this.name,
  });
}

final List<NFTListing> listings = [
  NFTListing(
    id: "6977e058-c84c-4f5e-9f8a-f7dc17e01d35",
    price: 17000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/6656.png",
    name: "#6656",
  ),
  NFTListing(
    id: "422ab1db-328b-4b64-b83b-1081b4812d28",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/5881.png",
    name: "#5881",
  ),
  NFTListing(
    id: "452ab8be-8415-4f3e-bfc2-d76c3214ee4d",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/8248.png",
    name: "#8248",
  ),
  NFTListing(
    id: "65f77940-2ae0-49c7-969c-69aed7b55fd9",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/4232.png",
    name: "#4232",
  ),
  NFTListing(
    id: "7be5577f-7f40-472a-9daa-fca2b32af50b",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/1443.png",
    name: "#1443",
  ),
  NFTListing(
    id: "e43ddce5-3c97-42dd-ae53-2c0ae35e3a29",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/8857.png",
    name: "#8857",
  ),
  NFTListing(
    id: "58457839-f8af-4283-a791-bfbda32d0505",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/9740.png",
    name: "#9740",
  ),
  NFTListing(
    id: "17008e46-252b-4b5c-a68c-c55de1687be0",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/2113.png",
    name: "#2113",
  ),
  NFTListing(
    id: "713322c4-f133-420c-8f8f-31a604361863",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/9095.png",
    name: "#9095",
  ),
  NFTListing(
    id: "7e4f5039-3e50-443c-9fe7-b7280f80338f",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/6436.png",
    name: "#6436",
  ),
  NFTListing(
    id: "4e7d4c83-6c25-4865-bbe3-0a58be8a6f62",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/335.png",
    name: "#335",
  ),
  NFTListing(
    id: "5480b170-296f-47a4-8129-122afb050b3a",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/5433.png",
    name: "#5433",
  ),
  NFTListing(
    id: "a87f8508-4f7c-443a-972f-cbf3fada3af5",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/2999.png",
    name: "#2999",
  ),
  NFTListing(
    id: "03ef4df4-50d7-4d37-99bf-30ec46beea3e",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/8513.png",
    name: "#8513",
  ),
  NFTListing(
    id: "3b5e71ef-5a83-4a54-835d-08286d1dba5c",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/2520.png",
    name: "#2520",
  ),
  NFTListing(
    id: "3583aac6-6863-4285-b371-8163f783e9fc",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/8941.png",
    name: "#8941",
  ),
  NFTListing(
    id: "bffcd379-3aa2-439a-8585-6fcbcbfb2907",
    price: 21000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/3137.png",
    name: "#3137",
  ),
  NFTListing(
    id: "7c6a510f-1cd5-4c8f-b89e-c1522337570c",
    price: 25000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/8984.png",
    name: "#8984",
  ),
  NFTListing(
    id: "5374d0ce-30e2-436f-b7f0-9b6413e48f8d",
    price: 25000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/9406.png",
    name: "#9406",
  ),
  NFTListing(
    id: "7b8ec904-a2ac-4049-988f-819ec09ae745",
    price: 25000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/5702.png",
    name: "#5702",
  ),
];
