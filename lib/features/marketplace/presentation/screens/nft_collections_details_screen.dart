import 'dart:math';
import 'dart:ui';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../domain/entities/collection_details_entity.dart';
import '../components/nft_collection_activity_tab.dart';
import '../components/nft_collection_analytics_tab.dart';
import '../components/nft_collection_items_tab.dart';
import '../provider/collection_details_provider.dart';
import '../widgets/nft_collections/nft_collection_attributes_less.dart';
import '../widgets/nft_collections/nft_collection_attributes_more.dart';
import '../widgets/nft_collections/nft_collections_filter_bottom_sheet.dart';
import 'nft_collection_buy_screen.dart';
import 'nft_collection_search_screen.dart';
import 'nft_marketplace_cart_screen.dart';

class NFTCollectionsDetailsScreen extends ConsumerStatefulWidget {
  final String id;
  final String slug;
  final int floor;
  final int usdVolume;
  final int volume;
  final int supply;
  final int tradesCount;
  final String imageUrl;
  final String? collectionName;

  const NFTCollectionsDetailsScreen({
    super.key,
    required this.id,
    required this.slug,
    required this.floor,
    required this.usdVolume,
    required this.volume,
    required this.supply,
    required this.tradesCount,
    required this.imageUrl,
    required this.collectionName,
  });

  @override
  ConsumerState<NFTCollectionsDetailsScreen> createState() =>
      _NFTCollectionsDetailsScreenState();
}

class _NFTCollectionsDetailsScreenState
    extends ConsumerState<NFTCollectionsDetailsScreen>
    with SingleTickerProviderStateMixin {
  bool isDescriptionExpanded = false;
  bool isAttributesExpanded = false;
  int tabIndex = 0;
  late Future<List<CollectionDetailsEntity>?> collectionDetailsFuture;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    collectionDetailsFuture = getCollectionDetails(
      id: widget.id,
      slug: widget.slug,
      offsetListings: 0,
      limitListings: 40,
      offsetActivity: 0,
      limitActivity: 30,
    );
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final double offset = _scrollController.offset;
    const double maxOffset = 150;
    final double progress = (offset / maxOffset).clamp(0.0, 1.0);
    _animationController.value = progress;
  }

  void changeTab(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  Future<List<CollectionDetailsEntity>?> getCollectionDetails({
    required String id,
    required String slug,
    required int offsetListings,
    required int limitListings,
    required int offsetActivity,
    required int limitActivity,
  }) async => await ref
        .read(collectionDetailsRepositoryProvider)
        .getCollectionDetails(
            id: id,
            slug: slug,
            offsetListings: offsetListings,
            limitActivity: limitActivity,
            offsetActivity: offsetActivity,
            limitListings: limitListings);

  @override
  Widget build(BuildContext context) => Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: FutureBuilder(
        future: collectionDetailsFuture,
        builder: (BuildContext context, AsyncSnapshot<List<CollectionDetailsEntity>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: LottieBuilder.asset(
                    'assets/animations/loading-indicator.json'));
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Center(child: Text("No collection details found.")),
            );
          }

          final List<CollectionDetailsEntity> collectionDetails = snapshot.data!;

          return Stack(
            children: <Widget>[
              CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  _buildHeaderImage(),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                        minHeight: MediaQuery.of(context).size.height * 0.11,
                        maxHeight: MediaQuery.of(context).size.height * 0.11,
                        child: _buildCollectionInfo(collectionDetails)),
                  ),
                  _buildDescription(collectionDetails),
                  _buildAvatarRow(),
                  _buildAttributesSection(collectionDetails),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      minHeight: 75,
                      maxHeight: 75,
                      child: _buildPersistentHeader(
                        listings: collectionDetails.first.listings!,
                        collectionInfo:
                            collectionDetails.first.collectionInfo!.first,
                        collectionName: widget.collectionName,
                      ),
                    ),
                  ),
                  _buildTabContent(collectionDetails),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _buildBottomNavBar(
                  listings: collectionDetails.first.listings!,
                  collectionImageUrl: widget.imageUrl
                      .replaceAll('ipfs://', 'https://ipfs.io/ipfs/'),
                ),
              ),
            ],
          );
        },
      ),
    );

  SliverToBoxAdapter _buildHeaderImage() => SliverToBoxAdapter(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  widget.imageUrl
                      .replaceAll('ipfs://', 'https://ipfs.io/ipfs/'),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.075,
            left: MediaQuery.of(context).size.width * 0.06,
            child: _buildBackButton(),
          ),
          Positioned(
            bottom: 0,
            child: _buildGradientOverlay(),
          ),
          Positioned(
            bottom: -MediaQuery.of(context).size.height * 0.075,
            left: MediaQuery.of(context).size.width * 0.05,
            child: buildCollectionImage(context, widget.imageUrl),
          ),
        ],
      ),
    );

  Widget _buildBackButton() {
    double size = MediaQuery.of(context).size.width * 0.12;
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(size / 2),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: size,
            width: size,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(size / 2)),
            child: Center(
              child: Icon(
                PhosphorIconsBold.caretLeft,
                size: size * 0.5,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() => Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Colors.white.withOpacity(0), Colors.white],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0, 1.5),
        ),
      ),
    );

  Widget _buildCollectionInfo(List<CollectionDetailsEntity> collectionDetails) => Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.325,
        right: MediaQuery.of(context).size.width * 0.05,
        top: MediaQuery.of(context).size.height * 0.01,
        bottom: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.collectionName ?? 'N/A',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "By ${'John'}",
                  style: TextStyle(
                    color: AppColors.greyDark,
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          _buildActionButtons(),
        ],
      ),
    );

  SliverToBoxAdapter _buildDescription(
      List<CollectionDetailsEntity> collectionDetails) => SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: buildDescription(
            collectionDetails.first.collectionInfo!.first.description!),
      ),
    );

  Widget _buildActionButtons() => Row(
      children: <Widget>[
        const Icon(PhosphorIconsRegular.star,
            size: 28, color: AppColors.greyDark),
        const SizedBox(width: 16),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight,
            borderRadius: BorderRadius.circular(32),
          ),
          child: const Center(
            child: Icon(PhosphorIconsBold.dotsThreeVertical,
                size: 20, color: AppColors.greyDark),
          ),
        ),
      ],
    );

  SliverToBoxAdapter _buildAvatarRow() => SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Row(
          children: <Widget>[
            RowSuper(
              innerDistance: -20,
              children: const <Widget?>[
                Image(
                    height: 32,
                    width: 32,
                    image: AssetImage("assets/images/avatar-1.png")),
                Image(
                    height: 32,
                    width: 32,
                    image: AssetImage("assets/images/avatar-4.png")),
                Image(
                    height: 32,
                    width: 32,
                    image: AssetImage("assets/images/avatar-5.png")),
              ],
            ),
            const SizedBox(width: 6),
            Text(
              "James, Jane +2 others",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );

  SliverToBoxAdapter _buildAttributesSection(
      List<CollectionDetailsEntity> collectionDetails) => SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: AnimatedCrossFade(
          firstChild: GestureDetector(
            onTap: () =>
                setState(() => isAttributesExpanded = !isAttributesExpanded),
            child: NFTCollectionAttributesMore(
              volume: widget.volume,
              floor: widget.floor,
              totalSales: collectionDetails.first.stats!.totalSales!,
            ),
          ),
          secondChild: GestureDetector(
            onTap: () =>
                setState(() => isAttributesExpanded = !isAttributesExpanded),
            child: NFTCollectionAttributesLess(
              volume: widget.volume,
              floor: widget.floor,
              totalSales: collectionDetails.first.stats!.totalSales!,
            ),
          ),
          crossFadeState: !isAttributesExpanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 400),
        ),
      ),
    );

  SliverToBoxAdapter _buildTabContent(
      List<CollectionDetailsEntity> collectionDetails) => SliverToBoxAdapter(
      child: IndexedStack(
        index: tabIndex,
        children: <Widget>[
          NFTCollectionItemsTab(
            collectionInfo: collectionDetails.first.collectionInfo!.first,
            listings: collectionDetails.first.listings!,
            collectionName: widget.collectionName,
            collectionImageUrl:
                widget.imageUrl.replaceAll('ipfs://', 'https://ipfs.io/ipfs/'),
          ),
          NFTCollectionActivityTab(
            activities: collectionDetails.first.activity!,
          ),
          const NFTCollectionAnalyticsTab(),
        ],
      ),
    );

  Widget _buildPersistentHeader(
      {required List<CollectionListingsEntity> listings,
      required CollectionInfoEntity collectionInfo,
      required String? collectionName}) => Container(
      color: Colors.white,
      child: _buildTabBar(
          listings: listings,
          collectionInfo: collectionInfo,
          collectionName: collectionName),
    );

  PreferredSizeWidget _buildAppBar() => PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AnimatedBuilder(
        animation: _opacityAnimation,
        builder: (BuildContext context, Widget? child) {
          return AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white.withOpacity(_opacityAnimation.value),
            elevation: _opacityAnimation.value * 4,
            leading: Opacity(
              opacity: _opacityAnimation.value,
              child: IconButton(
                icon: const Icon(
                  PhosphorIconsBold.caretLeft,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            title: Opacity(
              opacity: _opacityAnimation.value,
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                        height: 40,
                        imageUrl: widget.imageUrl
                            .replaceAll('ipfs://', 'https://ipfs.io/ipfs/')),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.collectionName ?? 'N/A',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Opacity(
                opacity: _opacityAnimation.value,
                child: IconButton(
                  icon: Icon(
                    PhosphorIconsRegular.dotsThreeVertical,
                    color: Color.lerp(
                        Colors.white, Colors.black, _opacityAnimation.value),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          );
        },
      ),
    );

  Widget _buildTabBar({
    required List<CollectionListingsEntity> listings,
    required CollectionInfoEntity collectionInfo,
    required String? collectionName,
  }) => Container(
      height: MediaQuery.of(context).size.height * 0.075,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildTabButton("Items", 0),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              _buildTabButton("Activity", 1),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              _buildTabButton("Analytics", 2),
            ],
          ),
          Row(
            children: <Widget>[
              _buildIconButton(PhosphorIconsBold.magnifyingGlass, onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NFTCollectionSearchScreen(
                              listings: listings,
                              collectionInfo: collectionInfo,
                              collectionName: collectionName,
                            )));
              }),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              _buildIconButton(PhosphorIconsBold.slidersHorizontal, onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20)),
                      ),
                      child: DraggableScrollableSheet(
                        initialChildSize: 0.7,
                        minChildSize: 0.5,
                        maxChildSize: 0.75,
                        expand: false,
                        builder: (_, ScrollController controller) {
                          return ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20)),
                            child: NftCollectionsFilterBottomSheet(
                                scrollController: controller),
                          );
                        },
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ],
      ),
    );

  Widget _buildIconButton(IconData icon, {VoidCallback? onTap}) {
    double size = MediaQuery.of(context).size.width * 0.08;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: AppColors.greyVeryLight,
        ),
        child: Center(
          child: Icon(
            icon,
            size: size * 0.6,
            color: AppColors.greenDark,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar({
    required List<CollectionListingsEntity> listings,
    required String collectionImageUrl,
  }) => Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: MediaQuery.of(context).size.height * 0.05,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: BoxDecoration(
        color: const Color(0xff252525),
        borderRadius: BorderRadius.all(
            Radius.circular(MediaQuery.of(context).size.width * 0.1)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildBottomNavItem(PhosphorIconsBold.coins, 'Sell'),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => NftCollectionBuyScreen(
                      collectionName: widget.collectionName ?? 'N/A',
                      listings: listings,
                      collectionImageUrl: collectionImageUrl,
                    ),
                  ),
                );
              },
              child: _buildBottomNavItem(Icons.add_circle_outline, 'Buy')),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const NFTMarketplaceCartScreen(),
                  ),
                );
              },
              child:
                  _buildBottomNavItem(PhosphorIconsBold.shoppingCart, 'Cart')),
          _buildBottomNavItem(Icons.person, 'Bid'),
        ],
      ),
    );

  Widget _buildBottomNavItem(IconData icon, String label) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: Colors.white),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );

  Widget buildDescription(String description) {
    final double fontSize = MediaQuery.of(context).size.width * 0.04;
    const int maxLines = 2;
    final TextStyle textStyle =
        TextStyle(fontSize: fontSize, color: AppColors.greyDark);
    final TextStyle moreStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
    );

    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final TextSpan textSpan = TextSpan(text: description, style: textStyle);
      final TextPainter textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        maxLines: maxLines,
      );
      textPainter.layout(maxWidth: constraints.maxWidth);

      final bool isOverflowing = textPainter.didExceedMaxLines;

      if (!isOverflowing) {
        return Text(description, style: textStyle);
      }

      final String truncatedText =
          _getTruncatedText(textPainter, constraints.maxWidth);

      return GestureDetector(
        onTap: () {
          setState(() {
            isDescriptionExpanded = !isDescriptionExpanded;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AnimatedCrossFade(
              firstChild: Text(description, style: textStyle),
              secondChild: ShaderMask(
                shaderCallback: (Rect bounds) => const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Colors.black, Colors.transparent],
                    stops: <double>[0.5, 1.0],
                  ).createShader(bounds),
                blendMode: BlendMode.dstIn,
                child: Text(
                  truncatedText,
                  style: textStyle,
                  maxLines: maxLines,
                  overflow: TextOverflow.clip,
                ),
              ),
              crossFadeState: isDescriptionExpanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 400),
              reverseDuration: const Duration(milliseconds: 400),
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeInOut,
            ),
            const SizedBox(height: 4),
            AnimatedCrossFade(
              firstChild: Text('Less', style: moreStyle),
              secondChild: Text('More', style: moreStyle),
              crossFadeState: isDescriptionExpanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 400),
              reverseDuration: const Duration(milliseconds: 400),
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeInOut,
            ),
          ],
        ),
      );
    });
  }

  String _getTruncatedText(TextPainter textPainter, double maxWidth) {
    final String fullText = textPainter.text!.toPlainText();
    final TextPainter textPainterForSize = TextPainter(
      text: TextSpan(text: fullText),
      textDirection: TextDirection.ltr,
      maxLines: 2,
    );

    textPainterForSize.layout(maxWidth: maxWidth);

    final TextPosition pos = textPainterForSize.getPositionForOffset(Offset(
      maxWidth,
      textPainterForSize.height,
    ));
    return fullText.substring(0, pos.offset);
  }

  Widget buildCollectionImage(BuildContext context, String imageUrl) {
    double size = MediaQuery.of(context).size.width * 0.25;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.08),
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.white, width: 4),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.08),
        child: CachedNetworkImage(
          imageUrl: imageUrl.replaceAll('ipfs://', 'https://ipfs.io/ipfs/'),
          fit: BoxFit.cover,
          placeholder: (BuildContext context, String url) => const CircularProgressIndicator(),
          errorWidget: (BuildContext context, String url, Object error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index) => GestureDetector(
      onTap: () => changeTab(index),
      child: Text(
        label,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.045,
          fontWeight: FontWeight.w700,
          color: tabIndex == index ? AppColors.black : AppColors.greyMedium,
        ),
      ),
    );
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
      BuildContext context, double shrinkOffset, bool overlapsContent) => SizedBox.expand(child: child);

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
}
