import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; // Add this import

import '../../../config/theme/colors.dart';
import '../providers/token_selection_provider.dart'; // Import the new provider
import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../../wallet/data/models/token_model.dart'; // Import token model
import '../../watchlist/presentation/watchlist_avatar_nft_screen.dart';
import '../../watchlist/presentation/watchlist_cute_nft_screen.dart';
import '../../watchlist/presentation/watchlist_safety_tokens_screen.dart';
import 'about_page.dart';
import 'analytics_page.dart';
import 'explore_page.dart';
import 'history_page.dart';
import 'price_alert_page.dart';
import 'shared/staking_chart.dart';
import 'shared/token_watchlist_bottom_sheet.dart';

class TokensInfoScreen extends ConsumerStatefulWidget {
  final String tokenId; // Keep this for direct deep links
  
  const TokensInfoScreen({
    super.key,
    this.tokenId = 'aptos', // Default value
  });

  @override
  ConsumerState<TokensInfoScreen> createState() => _TokensInfoScreenState();
}

class _TokensInfoScreenState extends ConsumerState<TokensInfoScreen> with TickerProviderStateMixin {
  double _currentPrice = 2212.21;
  double _previousPrice = 2212.21;
  bool _isPriceIncreasing = true;
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  double _scrollOffset = 0;
  OverlayEntry? _overlayEntry;
  final Set<int> _watchlistTokens = <int>{};
  final Set<int> _selectedTokens = <int>{};
  bool _showInAppBar = false;
  double _scrollProgress = 0.0;
  late Token _displayedToken;

  // Add a controller for the rotation animation
  late AnimationController _arrowAnimationController;
  late Animation<double> _arrowRotationAnimation;

  final Map<int, Widget> _collectionScreens = <int, Widget>{
    0: const WatchlistSafetyTokensScreen(),
    1: const WatchlistAvatarNFTScreen(),
    2: const WatchlistCuteNFTScreen(),
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController.addListener(_handleScroll);
    
    // Initialize arrow animation controller
    _arrowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    // Create the rotation animation
    _arrowRotationAnimation = Tween<double>(
      begin: 0,
      end: 3.14159, // 180 degrees in radians
    ).animate(CurvedAnimation(
      parent: _arrowAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override 
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Check if we're coming from a direct link or selection
    final selectedToken = ref.read(selectedTokenNotifierProvider);
    
    // If we have a selected token from provider, use it
    // Otherwise, select token based on tokenId parameter
    if (selectedToken == null) {
      ref.read(selectedTokenNotifierProvider.notifier).selectToken(widget.tokenId);
    }
  }

  void _handleScroll() {
    // Create a wider, more gradual transition zone (0-200px instead of 50-150px)
    final double scrollProgress = (_scrollController.offset / 200.0).clamp(0.0, 1.0);
    
    // Use this progress value to update _showInAppBar with a smoother transition
    final bool newShowInAppBar = scrollProgress >= 0.5;
    
    setState(() {
      _scrollOffset = _scrollController.offset;
      
      // Only update the boolean if it changed, to avoid unnecessary rebuilds
      if (newShowInAppBar != _showInAppBar) {
        _showInAppBar = newShowInAppBar;
      }
      
      // Store the scroll progress for animation interpolation
      _scrollProgress = scrollProgress;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _tabController.dispose();
    _arrowAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the selected token from the provider
    final selectedToken = ref.watch(selectedTokenNotifierProvider);
    
    // If no token is selected yet, show a loading indicator
    if (selectedToken == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 60.h,
            leading: IconButton(
              icon: Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Icon(
                  PhosphorIconsBold.caretLeft,
                  color: Colors.black,
                  size: 24.sp,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            pinned: true,
            // Use AnimatedOpacity for smooth fade effect
            title: AnimatedOpacity(
              opacity: _scrollProgress,
              duration: const Duration(milliseconds: 300),
              child: _buildAppBarTitle(selectedToken),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: IconButton(
                  icon: Icon(PhosphorIconsRegular.star, size: 24.sp),
                  onPressed: _showWatchlistBottomSheet,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: IconButton(
                  icon: Icon(PhosphorIconsRegular.bell, size: 24.sp),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => const PriceAlertPage()),
                    );
                  },
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Use AnimatedOpacity for smooth fade effect for the header
                  AnimatedOpacity(
                    opacity: 1.0 - _scrollProgress,
                    duration: const Duration(milliseconds: 300),
                    child: _scrollProgress < 1.0 ? _buildHeaderContent(selectedToken) : const SizedBox.shrink(),
                  ),
                  
                  // Use Transform.translate instead of negative margins for smooth animation
                  Transform.translate(
                    offset: Offset(0, -50.h * _scrollProgress),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: StakingChart(
                        onPriceChange: (double price) {
                          _updatePrice(price);
                        },
                      ),
                    ),
                  ),
                  
                  // Add a vertical space that reduces as you scroll to maintain layout
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 38.h - (10.h * _scrollProgress),
                  ),
                  
                  // Rest of the content unchanged
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildInfoContainer('100 ${selectedToken.currency}', 'Balance'),
                        _buildInfoContainer(selectedToken.price, 'AVG BUY PRICE'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: TabBarDelegate(
              CustomTabBar(
                tabController: _tabController,
                tabs: const <String>['About', 'Explore', 'History', 'Analytics'],
              ),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1.5,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  const AboutPage(),
                  const ExplorePage(),
                  HistoryPage(),
                  const AnalyticsPage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarTitle(Token token) => Row(
    children: <Widget>[
      // Display the selected token's image
      if (_showInAppBar) Hero(
            tag: 'token_image_${token.imagePath}',
            child: Image.asset(token.imagePath, height: 32.h, width: 32.h),
          ) else Image.asset(token.imagePath, height: 32.h, width: 32.h),
      Gap(10.w),
      
      // Column with token name and price
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Token name
          Text(
            token.name,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          
          // USD value below the token name
          Text(
            '\$${_currentPrice.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.greyDark,
            ),
          ),
        ],
      ),
    ],
  );

  Widget _buildHeaderContent(Token token) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: _showInAppBar 
            ? Image.asset(token.imagePath, height: 44.w, width: 44.w)
            : Hero(
                tag: 'token_image_${token.imagePath}',
                child: Image.asset(token.imagePath, height: 44.w, width: 44.w),
              ),
        ),
        Gap(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              token.name,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '\$${_currentPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Gap(4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              token.currency,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  '${token.percentageChange}%',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: token.percentageChange >= 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(4.w),
                // Use AnimatedBuilder to rebuild when animation value changes
                AnimatedBuilder(
                  animation: _arrowAnimationController,
                  builder: (BuildContext context, Widget? child) => Transform.rotate(
                      angle: _isPriceIncreasing ? 0 : _arrowRotationAnimation.value,
                      child: Icon(
                        _isPriceIncreasing 
                          ? PhosphorIconsRegular.arrowUp
                          : PhosphorIconsRegular.arrowDown,
                        size: 14.sp,
                        color: _isPriceIncreasing ? Colors.green : Colors.red,
                      ),
                    ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );

  // Rest of the implementation remains the same
  
  // ...
  
  void _updatePrice(double price) {
    final double newPrice = price * 1000;
    
    // Determine if price is increasing or decreasing
    final bool isIncreasing = newPrice >= _currentPrice;
    
    // Only animate if direction changed
    if (isIncreasing != _isPriceIncreasing) {
      _isPriceIncreasing = isIncreasing;
      
      // Animate to appropriate rotation
      if (isIncreasing) {
        _arrowAnimationController.reverse(); // Point up
      } else {
        _arrowAnimationController.forward(); // Point down
      }
    }
    
    setState(() {
      _previousPrice = _currentPrice;
      _currentPrice = newPrice;
    });
  }
  
  // Other methods remain unchanged...
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
    // Existing implementation...
  }
}
