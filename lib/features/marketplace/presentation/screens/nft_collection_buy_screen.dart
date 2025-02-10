import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/domain/entities/collection_details_entity.dart';
import 'package:defy/features/marketplace/domain/entities/nft_marketplace_cart_entity.dart';
import 'package:defy/features/marketplace/presentation/provider/nft_collection_buy_provider.dart';
import 'package:defy/features/marketplace/presentation/screens/bid_nft_screen.dart';
import 'package:defy/features/marketplace/presentation/screens/buy_nft_screen.dart';
import 'package:defy/features/marketplace/presentation/state/nft_collection_buy_state.dart';
import 'package:defy/features/shared/presentation/widgets/custom_check_box.dart';
import 'package:defy/features/shared/presentation/widgets/nft_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NftCollectionBuyScreen extends ConsumerStatefulWidget {
  final List<CollectionListingsEntity> listings;
  final String collectionName;
  final String collectionImageUrl;

  const NftCollectionBuyScreen({
    super.key,
    required this.listings,
    required this.collectionName,
    required this.collectionImageUrl,
  });

  @override
  ConsumerState<NftCollectionBuyScreen> createState() =>
      _NftCollectionBuyScreenState();
}

class _NftCollectionBuyScreenState extends ConsumerState<NftCollectionBuyScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

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
    final state = ref.watch(nFTCollectionBuyNotifierProvider);
    final notifier = ref.read(nFTCollectionBuyNotifierProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(PhosphorIconsBold.caretLeft),
          ),
          title: const Text(
            'Buy NFT',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child:
                    _buildContent(widget.listings, context, state, notifier)),
            _buildBottomBar(state, notifier),
          ],
        ));
  }

  Widget _buildContent(
      List<CollectionListingsEntity> listings,
      BuildContext context,
      NFTCollectionBuyStateModel state,
      NFTCollectionBuyNotifier notifier) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: 90,
            maxHeight: 90,
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
                            ? '${listings.length} NFTs'
                            : '${state.selectedNFTs.length} Selected',
                        style: TextStyle(
                          fontSize: state.selectedNFTs.isEmpty ? 18 : 16,
                          fontWeight: FontWeight.w600,
                          color: state.selectedNFTs.isEmpty
                              ? const Color(0xff979DAA)
                              : AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(
                    color: Color(0xffE5E5E5),
                    thickness: 1,
                  ),
                  Row(children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: widget.collectionImageUrl,
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.collectionName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16,
              mainAxisSpacing: 8,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final listing = listings[index];
                final isSelected = state.selectedNFTs.contains(listing.nft?.id);
                return Stack(
                  children: [
                    NFTCard(
                      isCollectionItem: false,
                      imageUrl: listing.nft?.mediaUrl ?? '',
                      nftName: listing.nft?.name ?? '',
                      collectionName: widget.collectionName,
                      price: listing.price ?? 0,
                      description: '',
                      discordUrl: '',
                      twitterUrl: '',
                      websiteUrl: '',
                      nonRedirecting: true,
                      showCartButton: false,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: CustomCheckbox(
                          isRound: true,
                          isChecked: isSelected,
                          onTap: () => notifier.toggleSelectedNFT(listing),
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: listings.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(
      NFTCollectionBuyStateModel state, NFTCollectionBuyNotifier notifier) {
    final selectedListings = widget.listings
        .where((listing) => state.selectedNFTs.contains(listing.nft?.id))
        .toList();
    final totalPrice = selectedListings.fold(
        0.0, (sum, listing) => sum + (listing.price ?? 0));
    final selectedNFTsCart = selectedListings
        .map((listing) => NFTMarketplaceCartEntity(
              name: listing.nft?.name ?? '',
              collectionName: widget.collectionName,
              mediaUrl: listing.nft?.mediaUrl ?? '',
              price: listing.price ?? 0,
            ))
        .toList();
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      const Text(
                        'Sweep',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xff979DAA),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 4,
                            activeTrackColor: const Color(0xff2071ee),
                            inactiveTrackColor: Colors.grey[300],
                            thumbColor: Colors.white,
                            thumbShape: _CustomSliderThumbShape(),
                            overlayColor: Colors.transparent,
                            overlayShape: SliderComponentShape.noOverlay,
                            tickMarkShape: SliderTickMarkShape.noTickMark,
                            showValueIndicator: ShowValueIndicator.never,
                            valueIndicatorShape:
                                const PaddleSliderValueIndicatorShape(),
                            valueIndicatorColor: const Color(0xff2071ee),
                            valueIndicatorTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Slider(
                            value: state.sweepValue,
                            min: 0,
                            max: widget.listings.length.toDouble(),
                            divisions: widget.listings.length,
                            label: state.sweepValue.round().toString(),
                            onChanged: (double value) {
                              notifier.updateSweepValue(value, widget.listings);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${state.sweepValue.round()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: state.selectedNFTs.isNotEmpty
                            ? () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BuyNFTScreen(
                                    nfts: selectedNFTsCart,
                                  ),
                                ));
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff2071EE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Buy ${getPriceInAPT(totalPrice).toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 8),
                            ClipOval(
                              child: Image.asset(
                                'assets/icons/aptos.png',
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: state.selectedNFTs.isNotEmpty
                            ? () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BidNFTScreen(
                                    nfts: selectedNFTsCart,
                                  ),
                                ));
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                        child: const Text(
                          'Bid Items',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
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
            "No NFTs available for purchase",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ).animate().fadeIn(duration: 600.ms, delay: 300.ms),
          const SizedBox(height: 16),
          Text(
            'Check back later for new listings!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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

double getPriceInAPT(double price) {
  return price / math.pow(10, 8);
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

class _CustomSliderThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(20, 20);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = const Color(0xff2071ee)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, 10, paint);
    canvas.drawCircle(center, 9, borderPaint);
  }
}
