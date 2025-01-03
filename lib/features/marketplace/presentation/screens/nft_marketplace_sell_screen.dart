import 'dart:math';

import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/marketplace/data/models/wallet_inventory_model.dart';
import 'package:defy/features/marketplace/domain/entities/wallet_inventory_entity.dart';
import 'package:defy/features/marketplace/presentation/provider/nft_marketplace_sell_provider.dart';
import 'package:defy/features/marketplace/presentation/provider/wallet_inventory_provider.dart';
import 'package:defy/features/marketplace/presentation/screens/instant_sell_screen.dart';
import 'package:defy/features/marketplace/presentation/screens/list_nft_screen.dart';
import 'package:defy/features/marketplace/presentation/state/nft_marketplace_sell_state_model.dart';
import 'package:defy/features/marketplace/presentation/widgets/nft_marketplace_sell_filter_bottom_sheet.dart';
import 'package:defy/features/shared/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui';

class NFTMarketplaceSellScreen extends ConsumerStatefulWidget {
  final bool fromCollectionPage;
  final String? collectionName;
  const NFTMarketplaceSellScreen({
    Key? key,
    this.fromCollectionPage = false,
    this.collectionName,
  }) : super(key: key);

  @override
  ConsumerState<NFTMarketplaceSellScreen> createState() =>
      _NFTMarketplaceSellScreenState();
}

class _NFTMarketplaceSellScreenState
    extends ConsumerState<NFTMarketplaceSellScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<NFTEntity> allNFTs = [];

  List<CollectionEntity> getSortedCollections(
      List<CollectionEntity> collections, String sortBy, bool isAscending) {
    List<CollectionEntity> sortableList =
        List<CollectionEntity>.from(collections);

    int sortMultiplier = isAscending ? -1 : 1;

    switch (sortBy) {
      case 'Alphabetic Order':
        sortableList
            .sort((a, b) => sortMultiplier * a.title!.compareTo(b.title!));
        break;
      case 'Collection Floor':
        sortableList.sort(
            (a, b) => sortMultiplier * (a.floor ?? 0).compareTo(b.floor ?? 0));
        break;
      case 'Collection Volume':
        sortableList.sort((a, b) =>
            sortMultiplier * (a.usdVolume ?? 0).compareTo(b.usdVolume ?? 0));
        break;
      default:
        print('Unknown sort option: $sortBy'); // Debug print
        break;
    }

    return sortableList;
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(nFTMarketplaceSellNotifierProvider);
    final notifier = ref.read(nFTMarketplaceSellNotifierProvider.notifier);
    final walletInventoryAsyncValue = ref.watch(walletInventoryDataProvider(
        "0x5854bea58242413198805f866ec66a4c163512916590b435678b8d878b377165"));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(PhosphorIconsBold.caretLeft),
        ),
        title: const Text(
          'Sell NFT',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
        ),
        actions: const [Icon(PhosphorIconsBold.coins), Gap(24)],
      ),
      body: walletInventoryAsyncValue.when(
        data: (inventory) {
          if (inventory != null) {
            populateAllNFTs(inventory);
            List<CollectionEntity> relevantCollections;
            if (widget.fromCollectionPage) {
              relevantCollections = inventory.aptos.collections
                  .where(
                      (collection) => collection.title == widget.collectionName)
                  .toList();
            } else {
              relevantCollections = getSortedCollections(
                  inventory.aptos.collections, state.sortBy, state.isAscending);
            }

            if (relevantCollections.isEmpty ||
                relevantCollections.first.nfts.isEmpty) {
              return _buildEmptyState();
            }

            return Column(
              children: [
                Expanded(
                    child: _buildContent(inventory, context, state, notifier)),
                _buildBottomBar(state, notifier, inventory),
              ],
            );
          } else {
            return _buildEmptyState();
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildContent(WalletInventoryEntity inventory, BuildContext context,
      NFTMarketplaceSellState state, NFTMarketplaceSellNotifier notifier) {
    List<CollectionEntity> sortedCollections;

    if (widget.fromCollectionPage) {
      sortedCollections = inventory.aptos.collections
          .where((collection) => collection.title == widget.collectionName)
          .toList();
    } else {
      sortedCollections = getSortedCollections(
          inventory.aptos.collections, state.sortBy, state.isAscending);
    }

    if (sortedCollections.isEmpty) {
      return _buildEmptyState();
    }

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: 62,
            maxHeight: 62,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.selectedNFTs.isEmpty
                            ? '${allNFTs.length} NFT'
                            : '${state.selectedNFTs.length} Selected',
                        style: TextStyle(
                          fontSize: state.selectedNFTs.isEmpty ? 18 : 16,
                          fontWeight: FontWeight.w600,
                          color: state.selectedNFTs.isEmpty
                              ? const Color(0xff979DAA)
                              : AppColors.blue,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                builder: (context) =>
                                    const NFTMarketplaceSellFilterBottomSheet(),
                              );
                            },
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
                  const SizedBox(height: 8),
                  const Divider(
                    color: Color(0xffE5E5E5),
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverList(
          key: ValueKey('${state.sortBy}-${state.isAscending}'),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final collection = sortedCollections[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CollectionExpansionTile(
                  collection: collection,
                ),
              );
            },
            childCount: sortedCollections.length,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(NFTMarketplaceSellState state,
      NFTMarketplaceSellNotifier notifier, WalletInventoryEntity inventory) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: state.selectedNFTs.isEmpty
                ? Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Select NFT',
                        style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              AppLogger.debug("Names: ${state.selectedNFTs}");
                              final selectedNFTsWithCollection = state
                                  .selectedNFTs
                                  .map((id) => allNFTs.firstWhere(
                                      (nft) => getNFTIdentifier(nft) == id))
                                  .toList();
                              AppLogger.debug('Test$selectedNFTsWithCollection');
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => InstantSellScreen(
                                    nfts: selectedNFTsWithCollection,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFF6767),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Sell 20.79',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ClipOval(
                                  child: Image.asset(
                                    'assets/blockchains/aptos.jpg',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              final selectedNFTs = state.selectedNFTs
                                  .map((id) => allNFTs.firstWhere(
                                      (nft) => getNFTIdentifier(nft) == id))
                                  .toList();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ListNFTScreen(
                                    nfts: selectedNFTs,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'List Items',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  void populateAllNFTs(WalletInventoryEntity inventory) {
    allNFTs = inventory.aptos.collections
        .expand((collection) => collection.nfts)
        .toList();
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          const Icon(PhosphorIconsRegular.shoppingBag,
                  size: 80, color: Colors.grey)
              .animate()
              .scale(duration: 600.ms, curve: Curves.elasticOut),
          const SizedBox(height: 24),
          Text(
            widget.fromCollectionPage
                ? "You don't own any NFTs from this collection"
                : "You don't have any NFTs to sell",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ).animate().fadeIn(duration: 600.ms, delay: 300.ms),
          const SizedBox(height: 16),
          Text(
            'Explore the marketplace to find NFTs!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ).animate().fadeIn(duration: 600.ms, delay: 600.ms),
          const Spacer(flex: 3),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A90E2),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                shadowColor: AppColors.blue.withOpacity(0.5),
              ),
              child: const Text(
                'Explore Marketplace',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms, delay: 900.ms)
                .slideY(
                  begin: 0.5,
                  end: 0,
                  duration: 600.ms,
                  delay: 900.ms,
                  curve: Curves.easeOutBack,
                )
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .shimmer(
                    duration: 1800.ms, color: Colors.white.withOpacity(0.2))
                .animate()
                .scale(
                  begin: const Offset(1, 1),
                  end: const Offset(1.05, 1.05),
                  duration: 600.ms,
                )
                .then(delay: 400.ms)
                .scale(
                  begin: const Offset(1.05, 1.05),
                  end: const Offset(1, 1),
                  duration: 600.ms,
                ),
          ),
        ],
      ),
    );
  }
}

class CollectionExpansionTile extends ConsumerStatefulWidget {
  final CollectionEntity collection;

  const CollectionExpansionTile({
    super.key,
    required this.collection,
  });

  @override
  ConsumerState<CollectionExpansionTile> createState() =>
      _CollectionExpansionTileState();
}

class _CollectionExpansionTileState
    extends ConsumerState<CollectionExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconRotation;
  late Animation<double> _heightFactor;
  late Animation<double> _contentFade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _iconRotation = Tween<double>(begin: 0.75, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _heightFactor = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _contentFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isExpanded = ref
              .read(nFTMarketplaceSellNotifierProvider)
              .expandedStates[widget.collection.title] ??
          true;
      if (isExpanded) {
        _controller.value = 1.0;
      }
    });
  }

  bool _isAnimating = false;

  void _toggleExpanded() {
    if (_isAnimating) return;
    _isAnimating = true;

    final notifier = ref.read(nFTMarketplaceSellNotifierProvider.notifier);
    notifier.toggleExpansion(widget.collection.title!);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        _isAnimating = false;
      }
    });
  }

  void _selectAll() {
    final notifier = ref.read(nFTMarketplaceSellNotifierProvider.notifier);
    notifier.selectAll(
        widget.collection.nfts.map((nft) => getNFTIdentifier(nft)).toList());
  }

  @override
  void didUpdateWidget(covariant CollectionExpansionTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    final isExpanded = ref
            .read(nFTMarketplaceSellNotifierProvider)
            .expandedStates[widget.collection.title] ??
        true;
    if (isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(nFTMarketplaceSellNotifierProvider);
    final isExpanded = state.expandedStates[widget.collection.title] ?? true;
    final selectedNFTs = state.selectedNFTs;

    int selectedCount = widget.collection.nfts
        .where((nft) => selectedNFTs.contains(getNFTIdentifier(nft)))
        .length;

    bool allSelected = selectedCount == widget.collection.nfts.length;
    bool anySelected = selectedCount > 0;

    if (isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          leading: ClipOval(
            child: CachedNetworkImage(
              imageUrl: widget.collection.coverUrl
                      ?.replaceAll('ipfs://', 'https://ipfs.io/ipfs/') ??
                  '',
              width: 30,
              height: 30,
              fit: BoxFit.fill,
            ),
          ),
          title: Text(
            widget.collection.title ?? 'Loading...',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      axis: Axis.horizontal,
                      axisAlignment: 1,
                      child: child,
                      fixedCrossAxisSizeFactor: 1,
                    ),
                  );
                },
                child: isExpanded
                    ? GestureDetector(
                        key: ValueKey<bool>(allSelected),
                        onTap: _selectAll,
                        child: Text(
                          allSelected ? 'Unselect All' : 'Select All',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : Text(
                        '${widget.collection.nfts.length}',
                        key: const ValueKey<bool>(false),
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
              AnimatedRotation(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                turns: isExpanded ? 0.5 : 0.75,
                child: IconButton(
                  icon: const Icon(Icons.expand_more),
                  onPressed: _toggleExpanded,
                ),
              ),
            ],
          ),
          onTap: _toggleExpanded,
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ClipRect(
              child: Align(
                alignment: Alignment.centerLeft,
                heightFactor: _heightFactor.value,
                child: Opacity(
                  opacity: _contentFade.value,
                  child: child,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final cardWidth = (constraints.maxWidth - 8) / 2;
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.start,
                  children: widget.collection.nfts.map((nft) {
                    return SellNFTCard(
                      nft: nft,
                      collectionName:
                          widget.collection.title ?? 'Collection Name',
                      cardWidth: cardWidth,
                      isSelected: selectedNFTs.contains(nft.name),
                      isSelectionMode: true,
                      onToggleSelection: () => ref
                          .read(nFTMarketplaceSellNotifierProvider.notifier)
                          .toggleNFTSelection(getNFTIdentifier(nft)),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SellNFTCard extends StatelessWidget {
  final NFTEntity nft;
  final String collectionName;
  final double cardWidth;
  final bool isSelected;
  final bool isSelectionMode;
  final VoidCallback onToggleSelection;

  const SellNFTCard({
    super.key,
    required this.nft,
    required this.collectionName,
    required this.cardWidth,
    required this.isSelected,
    required this.isSelectionMode,
    required this.onToggleSelection,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelectionMode ? onToggleSelection : null,
      child: Stack(
        children: [
          Container(
            width: cardWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: nft.mediaUrl?.replaceAll(
                              'ipfs://', 'https://ipfs.io/ipfs/') ??
                          '',
                      fit: BoxFit.cover,
                      errorWidget: (context, error, stackTrace) => Container(
                        color: Colors.grey[100],
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey[300],
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  nft.name ?? 'Unnamed NFT',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (isSelectionMode)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: CustomCheckbox(
                  isRound: true,
                  isChecked: isSelected,
                  onTap: onToggleSelection,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class SelectedNFTInfo {
  final NFTEntity nft;
  final String collectionTitle;

  SelectedNFTInfo(this.nft, this.collectionTitle);
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
  double get maxExtent => max(maxHeight, minHeight);

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

String getNFTIdentifier(NFTEntity nft) {
  return nft.name ?? 'Unknown NFT';
}
