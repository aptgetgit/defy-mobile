import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../app/routes/router.dart';
import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../../token_info/presentation/about_page.dart';
import '../../token_info/presentation/activity_page.dart';
import '../../token_info/presentation/analytics_page.dart';
import '../../token_info/presentation/price_alert_page.dart';
import '../../token_info/presentation/shared/token_watchlist_bottom_sheet.dart';
import '../../token_info/providers/token_info_controller.dart';
import '../../watchlist/presentation/watchlist_avatar_nft_screen.dart';
import '../../watchlist/presentation/watchlist_cute_nft_screen.dart';
import '../../watchlist/presentation/watchlist_safety_tokens_screen.dart';
import '../shared/nft_info_bottom_navbar.dart';

class NftGifScreen extends ConsumerStatefulWidget {
  const NftGifScreen({super.key});

  @override
  ConsumerState<NftGifScreen> createState() => _NftGifScreenState();
}

class _NftGifScreenState extends ConsumerState<NftGifScreen>
    with TickerProviderStateMixin {
  String coinLogoUrl = '';
  String nftName = 'Cyborg 2078 #5623';
  String owner = 'Fantasy Ruins';
  String priceUsd = '\$2,212.21';
  bool _showTitle = false;
  late ScrollController _scrollController;
  late TokensController controller;
  final List<String> timePeriods = <String>['1M', '3M', '6M', '1Y', '5Y', 'ALL'];
  String selectedPeriod = '1M';
  late TabController _tabController;
  bool _alertCreated = false;
  OverlayEntry? _overlayEntry;
  final Set<int> _watchlistTokens = <int>{};
  final Set<int> _selectedTokens = <int>{};

  final Map<int, Widget> _collectionScreens = <int, Widget>{
    0: const WatchlistSafetyTokensScreen(),
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
    _scrollController..removeListener(_onScroll)
    ..dispose();
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
  Widget build(BuildContext context) => Scaffold(
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
                        const NftInfoVideoRoute().push(context);
                      },
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(
                              'assets/images/nft.gif',
                              width: 353.w,
                              height: 353.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(12.h),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: Text('Cyborg 2078 #5623',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),),
                              ),
                            ),
                            Gap(2.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                children: <Widget>[
                                  RowSuper(
                                    innerDistance: -12,
                                    children: <Widget?>[
                                      Image.asset('assets/images/avatar-1.png',
                                          height: 22.h),
                                      Image.asset('assets/images/avatar-2.png',
                                          height: 22.h),
                                      Image.asset('assets/images/avatar-3.png',
                                          height: 22.h),
                                    ],
                                  ),
                                  Gap(10.w),
                                  Text(
                                    'James, Jane and 14+ hold',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.greyLight,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: Icon(
                            PhosphorIconsRegular.shareNetwork,
                            color: AppColors.black,
                            size: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    Gap(26.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _buildInfoContainer('100 APT', 'BOUGHT AT'),
                          _buildInfoContainer('3', 'ACTIVE BIDS'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: TabBarDelegate(
                CustomTabBar(
                  tabController: _tabController,
                  tabs: const <String>[
                    'About',
                    'Activity',
                    'Analytics',
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

  Widget _buildInfoContainer(String value, String label) => Container(
        height: 65.h,
        width: 170.w,
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
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
      pinned: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          PhosphorIconsBold.caretLeft,
          color: AppColors.black,
          size: 24.sp,
        ),
      ),
      collapsedHeight: 60.h,
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            PhosphorIconsRegular.star,
            color: AppColors.black,
          ),
          onPressed: _showWatchlistBottomSheet,
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
                top: 8.h,
                right: 8.w,
                child: Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        Gap(8.w),
      ],
      titleSpacing: 0,
      title: _showTitle
          ? AnimatedOpacity(
              opacity: _showTitle ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Row(
                children: <Widget>[
                  _buildPoolLogo(),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          nftName,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gap(4.h),
                        Row(
                          children: <Widget>[
                            Text(
                              owner,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.greyLight,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Gap(6.w),
                            Icon(
                              PhosphorIconsFill.sealCheck,
                              color: AppColors.blue,
                              size: 16.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/Fantasy-Ruins.png',
                  width: 32.w,
                  height: 32.h,
                  fit: BoxFit.cover,
                ),
                Gap(8.w),
                Text('Fantasy Ruins',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),),
                Gap(4.w),
                Icon(
                  PhosphorIconsFill.sealCheck,
                  color: AppColors.blue,
                  size: 20.sp,
                ),
              ],
            ),);

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
        bottom: 120.h,
        left: 35.w,
        right: 35.w,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            height: 60.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: GestureDetector(
              onTap: () {
                _overlayEntry?.remove();
                _overlayEntry = null;

                if (collectionIndex != null &&
                    _collectionScreens.containsKey(collectionIndex)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            _collectionScreens[collectionIndex]!,),
                  );
                } else {
                  print('Invalid collection index or screen not found.');
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    'assets/icons/watchlist-logo2.png',
                    width: 32.w,
                    height: 32.h,
                  ),
                  Text(
                    'Tokens Added to Watchlist',
                    style: TextStyle(
                        color: AppColors.greyDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 20.sp,
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
        height: small ? 24.h : 32.h,
      );
}
