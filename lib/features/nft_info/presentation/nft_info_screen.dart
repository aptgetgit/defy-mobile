import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/token_info/presentation/about_page.dart';
import 'package:defy/features/token_info/presentation/activity_page.dart';
import 'package:defy/features/token_info/presentation/analytics_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../app/routes/router.dart';
import '../../token_info/presentation/price_alert_page.dart';
import '../../token_info/presentation/shared/token_bottom_sheet.dart';

import '../../token_info/providers/token_info_controller.dart';
import '../../watchlist/presentation/watchlist_avatar_nft_screen.dart';
import '../../watchlist/presentation/watchlist_cute_nft_screen.dart';
import '../../watchlist/presentation/watchlist_safety_tokens_screen.dart';
import '../shared/nft_info_bottom_navbar.dart';

class NftInfoScreen extends ConsumerStatefulWidget {
  const NftInfoScreen({super.key});

  @override
  ConsumerState<NftInfoScreen> createState() => _NftInfoScreenState();
}

class _NftInfoScreenState extends ConsumerState<NftInfoScreen>
    with TickerProviderStateMixin {
  String coinLogoUrl = '';
  String nftName = 'Cyborg 2078 #5623';
  String owner = 'Fantasy Ruins';
  String priceUsd = '\$2,212.21';
  bool _showTitle = false;
  late ScrollController _scrollController;
  late TokensController controller;
  final List<String> timePeriods = <String>["1M", "3M", "6M", "1Y", "5Y", "ALL"];
  String selectedPeriod = "1M";
  late TabController _tabController;
  bool _alertCreated = false;
  OverlayEntry? _overlayEntry;
  final Set<int> _watchlistTokens = <int>{};
  final Set<int> _selectedTokens = <int>{};

  final Map<int, Widget> _collectionScreens = {
    0: const WatchlistSafetyTokensScreen(), // Replace with your actual screen widgets
    1: const WatchlistAvatarNFTScreen(),
    2: const WatchlistCuteNFTScreen(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    controller = ref.read(tokensControllerProvider.notifier);
    _scrollController.addListener(_onScroll);
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 100 && !_showTitle) {
      setState(() {
        _showTitle = true;
      });
    } else if (_scrollController.offset <= 100 && _showTitle) {
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double appBarExpandedHeight = 188;
    final double imageWidth = 353;
    final double imageHeight = 353;
    final double appBarImageSize = 32;
    final double maxScrollExtent = appBarExpandedHeight - kToolbarHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ColoredBox(
        color: Colors.white,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            _buildSliverAppBar(context),
            SliverToBoxAdapter(
              child: ColoredBox(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap:() {
                        NftInfoAudioRoute().push(context);
                      },
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // Image.asset(
                          //   'assets/images/cyborg2.png',
                          //   width: imageWidth,
                          //   height: imageHeight,
                          //   fit: BoxFit.cover,
                          // ),
                          AnimatedBuilder(
                            animation: _scrollController,
                            builder: (BuildContext context, Widget? child) {
                              double scrollProgress = _scrollController.hasClients
                                  ? (_scrollController.offset / maxScrollExtent)
                                      .clamp(0.0, 1.0)
                                  : 0.0;
                      
                              double animatedWidth =
                                  imageWidth - (imageWidth - appBarImageSize) * scrollProgress;
                              double animatedHeight =
                                  imageHeight - (imageHeight - appBarImageSize) * scrollProgress;
                      
                              double imageXOffset = (353 - imageWidth) / 2;
                              double targetXOffset = 16.0; // Position in the app bar
                      
                              double animatedX = imageXOffset +
                                  (targetXOffset - imageXOffset) * scrollProgress;
                      
                              double imageYOffset = 0;
                              double targetYOffset = 16.0;
                      
                              double animatedY = imageYOffset +
                                  (targetYOffset - imageYOffset) * scrollProgress;
                      
                              return SizedBox(
                                
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    child: AnimatedPositioned(
                                      duration: Duration(milliseconds: 300),
                                      top: animatedY,
                                      left: animatedX,
                                      child: Image.asset(
                                        'assets/images/cyborg2.png',
                                        width: animatedWidth,
                                        height: animatedHeight,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text('Cyborg 2078 #5623',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    )),
                              ),
                            ),
                            const Gap(2),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RowSuper(
                                    innerDistance: -12,
                                    children: [
                                      Image.asset('assets/images/avatar-1.png',
                                          height: 22),
                                      Image.asset('assets/images/avatar-2.png',
                                          height: 22),
                                      Image.asset('assets/images/avatar-3.png',
                                          height: 22),
                                    ],
                                  ),
                                  const Gap(10),
                                  Text(
                                    "James, Jane and 14+ hold",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.greyLight,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            PhosphorIconsRegular.shareNetwork,
                            color: AppColors.black,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const Gap(26),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _buildInfoContainer("100 APT", "BOUGHT AT"),
                          _buildInfoContainer("3", "ACTIVE BIDS"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _TabBarSliverPersistentHeaderDelegate(
                tabBar: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2),
                  ),
                  tabAlignment: TabAlignment.start,
                  labelColor: Colors.black,
                  unselectedLabelColor: AppColors.greyLight,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                  unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                  labelPadding:
                      const EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.zero,
                  indicatorWeight: 1,
                  dividerHeight: 1,
                  dividerColor: AppColors.greyVeryLight,
                  tabs: const <Widget>[
                    Tab(text: 'About'),
                    Tab(text: 'Activity'),
                    Tab(text: 'Analytics'),
                  ],
                ),
              ),
              pinned: true,
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  AboutPage(),
                  ActivityPage(),
                  AnalyticsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NftInfoBottomNavBar(),
    );
  }

  Widget _buildInfoContainer(String value, String label) => Container(
        height: 65,
        width: 170,
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.greyLight,
              ),
            ),
          ],
        ),
      );

  Widget _buildSliverAppBar(BuildContext context) => SliverAppBar(
      elevation: 4,
      shadowColor: Colors.black,
      surfaceTintColor: Colors.black,
      floating: false,
      pinned: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          PhosphorIconsBold.caretLeft,
          color: AppColors.black,
          size: 24,
        ),
      ),
      collapsedHeight: 60,
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            PhosphorIconsRegular.star,
            color: AppColors.black,
          ),
          onPressed: () {
            _showWatchlistBottomSheet();
          },
        ),
        Stack(
          children: <Widget>[
            IconButton(
              icon: const Icon(
                PhosphorIconsRegular.bell,
                color: AppColors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PriceAlertPage(
                      onAlertCreated: () {
                        setState(() {
                          _alertCreated = true;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            if (_alertCreated)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        const Gap(8),
      ],
      titleSpacing: 0,
      title: _showTitle
          ? AnimatedOpacity(
              opacity: _showTitle ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Row(
                children: <Widget>[
                  _buildPoolLogo(small: false),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          nftName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(4),
                        Row(
                          children: <Widget>[
                            Text(
                              owner,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.greyLight,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Gap(6),
                            const Icon(
                              PhosphorIconsFill.sealCheck,
                              color: AppColors.blue,
                              size: 16,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Row(
              children: [
                Image.asset(
                  'assets/images/Fantasy-Ruins.png',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
                const Gap(8),
                const Text('Fantasy Ruins',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    )),
                const Gap(4),
                const Icon(
                  PhosphorIconsFill.sealCheck,
                  color: AppColors.blue,
                  size: 20,
                ),
              ],
            ));

  void _showWatchlistBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => TokenWatchlistBottomSheet(
        onAddToWatchlist: (int? collectionIndex) {
          setState(() {
            _watchlistTokens.addAll(_selectedTokens);
            _showWatchlistAddedMessage(collectionIndex);
            _selectedTokens.clear();
          });
        },
      ),
    );
  }

  void _showWatchlistAddedMessage(int? collectionIndex) {
    _overlayEntry?.remove(); // Remove any existing overlay

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        bottom: 120, // Adjust position as needed
        left: 35,
        right: 35,
        child: Material(
          // Wrap with Material for shadow
          elevation: 4.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: GestureDetector(
              onTap: () {
                _overlayEntry?.remove(); // Remove the overlay
                _overlayEntry = null;

                // Navigate to the appropriate screen based on the collection index
                if (collectionIndex != null &&
                    _collectionScreens.containsKey(collectionIndex)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            _collectionScreens[collectionIndex]!),
                  );
                } else {
                  // Handle the case where the collection index is null or not found in the map
                  print("Invalid collection index or screen not found.");
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    'assets/icons/watchlist-logo2.png',
                    width: 32,
                    height: 32,
                  ),
                  const Text(
                    'Tokens Added to Watchlist',
                    style: TextStyle(
                        color: AppColors.greyDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                      color: AppColors.greyLight,
                    ),
                    onPressed: () {
                      _overlayEntry?.remove();
                      _overlayEntry = null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);

    // Hide the message after a delay
    Future.delayed(const Duration(seconds: 3), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  Widget _buildPoolLogo({bool small = false}) => Image.asset(
        'assets/images/cyborg2.png',
        height: small ? 24 : 32,
      );
}

class _TabBarSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarSliverPersistentHeaderDelegate({required this.tabBar});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: tabBar,
      ),
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}