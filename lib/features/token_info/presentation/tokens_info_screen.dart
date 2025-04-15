// ignore_for_file: avoid_redundant_argument_values

import 'dart:math' show pi;

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../../wallet/data/models/token_model.dart';
import '../../watchlist/presentation/watchlist_avatar_nft_screen.dart';
import '../../watchlist/presentation/watchlist_cute_nft_screen.dart';
import '../../watchlist/presentation/watchlist_safety_tokens_screen.dart';
import '../providers/token_selection_provider.dart';
import 'about_page.dart';
import 'analytics_page.dart';
import 'explore_page.dart';
import 'history_page.dart';
import 'price_alert_page.dart';
import 'shared/staking_chart.dart';
import 'shared/token_watchlist_bottom_sheet.dart';

class TokensInfoScreen extends ConsumerStatefulWidget {

  const TokensInfoScreen({
    super.key,
    this.tokenId = 'aptos',
  });
  final String tokenId;

  @override
  ConsumerState<TokensInfoScreen> createState() => _TokensInfoScreenState();
}

class _TokensInfoScreenState extends ConsumerState<TokensInfoScreen> with TickerProviderStateMixin {
  double _currentPrice = 2212.21;
  double _previousPrice = 2212.21;
  double _baselinePrice = 2212.21;
  double _arrowAngle = 0;
  Color _arrowColor = Colors.green;
  bool _isAboveBaseline = true;
  bool _useAnimatedPrice = false; // Flag to toggle between animated and static price display
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  double _scrollOffset = 0;
  OverlayEntry? _overlayEntry;
  final Set<int> _watchlistTokens = <int>{};
  final Set<int> _selectedTokens = <int>{};
  bool _showInAppBar = false;
  double _scrollProgress = 0;
  late Token _displayedToken;

  late AnimationController _arrowAnimationController;
  late Animation<double> _arrowRotationAnimation;

  final Map<int, Widget> _collectionScreens = <int, Widget>{
    0: const WatchlistSafetyTokensScreen(),
    1: const WatchlistAvatarNFTScreen(),
    2: const WatchlistCuteNFTScreen(),
  };

  bool _isUserScrolling = false;
  bool _wasScrolling = false;
  bool _isChartInteractable = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController.addListener(_handleScroll);
    
    // Add scroll status listener
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.position.isScrollingNotifier.addListener(_scrollStatusChanged);
      }
    });

    _arrowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _arrowRotationAnimation = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _arrowAnimationController,
      curve: Curves.easeInOut,
    ),);

    _isAboveBaseline = _currentPrice >= _baselinePrice;
    _arrowAngle = _isAboveBaseline ? 0.0 : pi;
    _arrowColor = _isAboveBaseline ? Colors.green : Colors.red;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Token? selectedToken = ref.read(selectedTokenNotifierProvider);
    if (selectedToken == null) {
      ref.read(selectedTokenNotifierProvider.notifier).selectToken(widget.tokenId);
    }
  }

  void _handleScroll() {
    final bool isScrolling = _scrollController.position.isScrollingNotifier.value;
    
    // Handle chart interaction
    if (isScrolling && _isChartInteractable) {
      setState(() => _isChartInteractable = false);
    } else if (!isScrolling && !_isChartInteractable) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) setState(() => _isChartInteractable = true);
      });
    }

    // Simple scroll progress calculation based on fixed threshold
    final double threshold = 56.h; // Standard app bar height
    final double scrollProgress = (_scrollController.offset / threshold).clamp(0.0, 1.0);
    final bool newShowInAppBar = scrollProgress > 0.5;

    if (newShowInAppBar != _showInAppBar || scrollProgress != _scrollProgress) {
      setState(() {
        _scrollProgress = scrollProgress;
        _showInAppBar = newShowInAppBar;
      });
    }
  }

  void _scrollStatusChanged() {
    final bool isScrolling = _scrollController.position.isScrollingNotifier.value;
    
    if (isScrolling && !_wasScrolling) {
      setState(() => _isUserScrolling = true);
    } else if (!isScrolling && _wasScrolling) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) setState(() => _isUserScrolling = false);
      });
    }
    
    _wasScrolling = isScrolling;
  }

  @override
  void dispose() {
    // Clean up scroll status listener
    if (_scrollController.hasClients) {
      _scrollController.position.isScrollingNotifier.removeListener(_scrollStatusChanged);
    }
    _scrollController..removeListener(_handleScroll)
      ..dispose();
    _tabController.dispose();
    _arrowAnimationController.dispose();
    super.dispose();
  }

  void _updateArrowAngle(double newPrice) {
    final double difference = newPrice - _baselinePrice;
    const double threshold = 0.01;
    final double switchZone = _baselinePrice * threshold;
    final bool newIsAboveBaseline = newPrice >= _baselinePrice;
    double newAngle;
    Color newColor;

    if (_baselinePrice == 0) {
      newAngle = 0.0;
      newColor = Colors.green;
    } else {
      newAngle = newIsAboveBaseline ? 0.0 : pi;
      newColor = newIsAboveBaseline ? Colors.green : Colors.red;

      final bool inSwitchZone = difference.abs() < switchZone;
      final bool stateChanged = newIsAboveBaseline != _isAboveBaseline;

      if (inSwitchZone || stateChanged) {
        newColor = inSwitchZone ? Colors.grey : newColor;
        setState(() {
          _arrowRotationAnimation = Tween<double>(
            begin: _arrowAngle,
            end: newAngle,
          ).animate(CurvedAnimation(
            parent: _arrowAnimationController,
            curve: Curves.easeInOut,
          ),);
          _arrowAngle = newAngle;
          _arrowColor = newColor;
          _isAboveBaseline = newIsAboveBaseline;
        });

        if (_arrowAnimationController.isAnimating) {
          _arrowAnimationController.forward(from: _arrowAnimationController.value);
        } else {
          _arrowAnimationController.forward(from: 0);
        }
      } else {
        setState(() {
          _arrowAngle = newAngle;
          _arrowColor = newColor;
          _isAboveBaseline = newIsAboveBaseline;
        });
      }
    }
  }

  void _updatePrice(double price, {bool animate = false}) {
    final double newPrice = price * 1000;
    
    setState(() {
      _previousPrice = _currentPrice;
      _currentPrice = newPrice;
      
      // Always turn on animation if explicitly requested
      if (animate) {
        _useAnimatedPrice = true;
        
        // Turn off animation after a short delay so it's ready for next animation
        // ignore: always_specify_types
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) {
            setState(() {
              _useAnimatedPrice = false;
            });
          }
        });
      } else {
        _useAnimatedPrice = false;
      }
    });
    
    _updateArrowAngle(newPrice);
  }

  void _updateBaseline(double baselineValue) {
    final double newBaseline = baselineValue * 1000;
    setState(() {
      _baselinePrice = newBaseline;
    });
    _updateArrowAngle(_currentPrice);
  }

  @override
  Widget build(BuildContext context) {
    final Token? selectedToken = ref.watch(selectedTokenNotifierProvider);

    if (selectedToken == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
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
              onPressed: () {
                // Use pop with no animations
                Navigator.of(context).pop();
              },
            ),
            pinned: true,
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
                  // Header content with animation
                  AnimatedOpacity(
                    opacity: 1.0 - _scrollProgress,
                    duration: const Duration(milliseconds: 300),
                    child: _scrollProgress < 1.0 ? _buildHeaderContent(selectedToken) : const SizedBox.shrink(),
                  ),
                  Column(
                    children: [
                      // Staking chart with improved interaction handling
                      RepaintBoundary(
                        child: AbsorbPointer(
                          absorbing: !_isChartInteractable,
                          child: IgnorePointer(
                            ignoring: !_isChartInteractable,
                            child: StakingChart(
                              freezeUpdates: !_isChartInteractable,
                              onPriceChange: (double price) {
                                if (_isChartInteractable) {
                                  _updatePrice(price, animate: false);
                                }
                              },
                              onPriceChangeWithAnimation: (double price) {
                                if (_isChartInteractable) {
                                  _updatePrice(price, animate: true);
                                }
                              },
                              onBaselineValueBalance: (double baselineValue) {
                                if (_isChartInteractable) _updateBaseline(baselineValue);
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // Balance containers
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _buildInfoContainer('100 ${selectedToken.currency}', 'BALANCE'),
                            _buildInfoContainer(selectedToken.price, 'AVG BUY PRICE'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: TabBarDelegate(
              Material(
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    // Full width tab bar without border
                    SizedBox(
                      width: double.infinity,
                      child: CustomTabBar(
                        tabController: _tabController,
                        tabs: const <String>['About', 'Explore', 'History', 'Analytics'],
                        // ignore: avoid_redundant_argument_values
                        isScrollable: true,
                      ),
                    ),
                    // Centered shorter grey underline
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 350.w, // Custom width for the underline only
                        height: 1,
                        color: AppColors.greyVeryLight,
                      ),
                    ),
                  ],
                ),
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
          if (_showInAppBar)
            Hero(
              tag: 'token_image_${token.imagePath}',
              child: Image.asset(token.imagePath, height: 32.h, width: 32.h),
            )
          else
            Image.asset(token.imagePath, height: 32.h, width: 32.h),
          Gap(10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                token.name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
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
            Padding(
              // Reduce the top padding from 12.h to 8.h
              padding: EdgeInsets.only(top: 8.h),
              child: Align(
                alignment: Alignment.centerLeft,
                // Make sure this is tall enough for the reduced bounce animation
                child: SizedBox(
                  height: 45.h, // Reduced from 50.h
                  width: 32.w,
                  child: _showInAppBar
                    ? Image.asset(token.imagePath, height: 32.w, width: 32.w)
                    : Hero(
                        tag: 'token_image_${token.imagePath}',
                        flightShuttleBuilder: (
                          BuildContext flightContext,
                          Animation<double> animation,
                          HeroFlightDirection direction,
                          BuildContext fromContext,
                          BuildContext toContext,
                        ) {
                          // Custom flight animation with reduced bounce
                          return AnimatedBuilder(
                            animation: animation,
                            child: Image.asset(token.imagePath, height: 32.w, width: 32.w),
                            builder: (BuildContext context, Widget? child) {
                              // Calculate bounce value with reduced effect
                              final double inputValue = (animation.value < 0.7 
                                ? 0.0 
                                : (animation.value - 0.7) / 0.3).clamp(0.0, 1.0);
                                
                              // Reduce bounce multiplier from 0.15 to 0.08
                              final double bounceValue = Curves.elasticOut.transform(inputValue);
                              
                              return Transform.scale(
                                // Reduce the bounce multiplier from 0.15 to 0.08
                                scale: 0.8 + (animation.value * 0.2) + (bounceValue * 0.08), 
                                child: child,
                              );
                            },
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          clipBehavior: Clip.none,
                          child: TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.bounceOut,
                            // Reduce the bounce distance from -15 to -8
                            tween: Tween<double>(begin: -8, end: 0),
                            builder: (BuildContext context, double value, Widget? child) => Transform.translate(
                                offset: Offset(0, value),
                                child: child,
                              ),
                            child: Image.asset(token.imagePath, height: 32.w, width: 32.w),
                          ),
                        ),
                      ),
                ),
              ),
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  token.name,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (_useAnimatedPrice) AnimatedFlipCounter(
                        value: _currentPrice,
                        prefix: r'$',
                        fractionDigits: 2,
                        textStyle: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ) else Text(
                        '\$${_currentPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
              ],
            ),
            Gap(8.h),
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
                    // Arrow moved to the beginning of the row
                    SizedBox(
                      height: 20.h, // Fixed height for consistent positioning
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _arrowAnimationController,
                          builder: (BuildContext context, Widget? child) => Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..rotateZ(_arrowRotationAnimation.value),
                            child: Icon(
                              PhosphorIconsRegular.arrowUp,
                              size: 14.sp,
                              color: _arrowColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(4.w),
                    // Percentage text follows the arrow
                    if (_useAnimatedPrice) AnimatedFlipCounter(
                            value: _baselinePrice > 0 ? ((_currentPrice - _baselinePrice) / _baselinePrice * 100) : 0.0,
                            fractionDigits: 2,
                            suffix: '%',
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                              color: _arrowColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ) else Text(
                            '${(_baselinePrice > 0 ? ((_currentPrice - _baselinePrice) / _baselinePrice * 100) : 0.0).toStringAsFixed(2)}%',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: _arrowColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
    // Implementation for watchlist message
  }
}
