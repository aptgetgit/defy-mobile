import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../app/routes/router.dart';
import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../../token_info/presentation/shared/staking_chart.dart';
import '../../watchlist/presentation/watchlist_avatar_nft_screen.dart';
import '../../watchlist/presentation/watchlist_cute_nft_screen.dart';
import '../../watchlist/presentation/watchlist_safety_tokens_screen.dart';
import 'about_page.dart';
import 'activity_page.dart';
import 'analytics_page.dart';
import 'price_alert_page.dart';
import 'shared/token_watchlist_bottom_sheet.dart';

class TokensInfoScreen extends StatefulWidget {
  const TokensInfoScreen({super.key});

  @override
  _TokensInfoScreenState createState() => _TokensInfoScreenState();
}

class _TokensInfoScreenState extends State<TokensInfoScreen> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  final double _investmentAmount = 10000;
  final String _timePeriod = '1M';
  double _scrollOffset = 0;
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
    _tabController = TabController(length: 3, vsync: this);
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double scrollProgress = (_scrollOffset / 200).clamp(0.0, 1.0);
    
    // Define a safe top position that works across different device sizes
    // This is the position where elements should end up when scrolled
    final double safeTopPosition = statusBarHeight;
    
    // Calculate positions based on screen proportions rather than fixed values
    
    // Aptos text position
    final double startX = 16.w;
    final double startY = screenHeight * 0.24; // Use percentage of screen height
    final double endX = (screenWidth - 100.w) / 2 - 40.w;
    final double endY = safeTopPosition + 12.h; // Relative to safe top position
    
    final double animatedX = startX + (endX - startX) * scrollProgress;
    final double animatedY = startY - (startY - endY) * scrollProgress;
    final double textSize = (24 - (8 * scrollProgress)).sp;

    // APT label position
    final double investorsStartX = 16.w;
    final double investorsStartY = screenHeight * 0.28; // Use percentage of screen height
    final double investorsEndX = (screenWidth - 200.w) / 2 + 60.w;
    final double investorsEndY = safeTopPosition + 16.h; // Align with main text

    final double animatedInvestorsX = investorsStartX + (investorsEndX - investorsStartX) * scrollProgress;
    final double animatedInvestorsY = investorsStartY - (investorsStartY - investorsEndY) * scrollProgress;
    final double investorsTextSize = (14 - (2 * scrollProgress)).sp;

    // Measure the width of the "APT" text for accurate positioning
    final TextPainter investorsTextPainter = TextPainter(
      text: TextSpan(
        text: 'APT',
        style: TextStyle(fontSize: investorsTextSize, color: Colors.grey[600]),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    // Amount text position
    final double amountStartX = screenWidth - 120.w;
    final double amountStartY = screenHeight * 0.24; // Use percentage of screen height
    final double amountEndX = (screenWidth - 200.w) / 2 + 11.w;
    final double amountEndY = safeTopPosition + 33.h; // Position below title

    final double animatedAmountX = amountStartX + (amountEndX - amountStartX) * scrollProgress;
    final double animatedAmountY = amountStartY - (amountStartY - amountEndY) * scrollProgress;
    final double amountTextSize = (24 - (12 * scrollProgress)).sp;

    // Percentage indicator position
    final double percentageStartX = screenWidth - 67.w;
    final double percentageStartY = screenHeight * 0.28; // Use percentage of screen height
    final double percentageEndX = investorsStartX + investorsTextPainter.width + 127.w;
    final double percentageEndY = safeTopPosition + 33.h; // Align with amount text

    final double animatedPercentageX = percentageStartX + (percentageEndX - percentageStartX) * scrollProgress;
    final double animatedPercentageY = percentageStartY - (percentageStartY - percentageEndY) * scrollProgress;
    final double percentageTextSize = (14 - (2 * scrollProgress)).sp;

    // Logo image position
    final double imageStartX = screenWidth / 2 - 180.w;
    final double imageStartY = screenHeight * 0.18; // Use percentage of screen height
    final double imageEndX = 60.w;
    final double imageEndY = safeTopPosition + 15.h; // Relative to safe top position

    final double animatedImageX = imageStartX + (imageEndX - imageStartX) * scrollProgress;
    final double animatedImageY = imageStartY - (imageStartY - imageEndY) * scrollProgress;
    final double imageSize = (40 - (10 * scrollProgress)).w;


    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 200.h,
                leading: IconButton(
                  icon: Icon(
                    PhosphorIconsBold.caretLeft,
                    color: Colors.black,
                    size: 24.sp,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                pinned: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(PhosphorIconsRegular.star, size: 24.sp),
                    onPressed: _showWatchlistBottomSheet,
                  ),
                  IconButton(
                    icon: Icon(PhosphorIconsRegular.bell, size: 24.sp),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => const PriceAlertPage()),
                      );
                    },
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const StakingChart(),
                      Gap(16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _buildInfoContainer('100 APT', 'Balance'),
                            _buildInfoContainer(r'$10.09', 'AVG BUY PRICE'),
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
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height + 275.h,
                  child: TabBarView(
                    controller: _tabController,
                    children: const <Widget>[
                      AboutPage(),
                      ActivityPage(),
                      AnalyticsPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: animatedX,
            top: animatedY,
            child: Text(
              'Aptos',
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: animatedInvestorsX,
            top: animatedInvestorsY,
            child: Text(
              'APT',
              style: TextStyle(
                fontSize: investorsTextSize,
                color: Colors.grey[600],
              ),
            ),
          ),
          Positioned(
            left: animatedAmountX,
            top: animatedAmountY,
            child: Text(
              r'$2,212.21',
              style: TextStyle(
                fontSize: amountTextSize,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: animatedImageX,
            top: animatedImageY,
            child: SizedBox(
              width: imageSize,
              height: imageSize,
              child: Image.asset('assets/icons/aptos.png'),
            ),
          ),
          Positioned(
            left: animatedPercentageX,
            top: animatedPercentageY,
            child: Row(
              children: <Widget>[
                Text(
                  '3.16%',
                  style: TextStyle(
                    fontSize: percentageTextSize,
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(4.w),
                Icon(
                  PhosphorIconsRegular.arrowDown,
                  size: 14.sp,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
        buttonText1: 'Stake Now',
        buttonColor1: AppColors.black,
        onTap1: () {
          const StakeAmountRoute().push(context);
        },
        image1: 'avatar-1.png',
        image2: 'avatar-2.png',
        image3: 'avatar-3.png',
        headerText: 'James, Jane and 14+ hold >',
      ),
    );
  }

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
    _overlayEntry?.remove();

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

                if (collectionIndex != null && _collectionScreens.containsKey(collectionIndex)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => _collectionScreens[collectionIndex]!),
                  );
                } else {
                  print('Invalid collection index or screen not found.');
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('assets/icons/watchlist-logo2.png', width: 32.w, height: 32.h),
                  Text(
                    'Tokens Added to Watchlist',
                    style: TextStyle(color: AppColors.greyDark, fontWeight: FontWeight.w500, fontSize: 16.sp),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, size: 20.sp, color: AppColors.greyLight),
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

    Future<void>.delayed(const Duration(seconds: 3), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  Widget _buildPoolLogo({bool small = false}) => Image.asset(
      'assets/icons/aptos.png',
      height: small ? 24.h : 32.h,
    );
}