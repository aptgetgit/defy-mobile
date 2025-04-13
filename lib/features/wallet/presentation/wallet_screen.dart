// ignore_for_file: always_specify_types

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../app/routes/router.dart';
import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/base_screen_nav.dart';
import '../../shared/presentation/widgets/custom_check_box.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../../shared/presentation/widgets/nft_item.dart';
import '../../token_info/presentation/tokens_info_screen.dart';
import '../../token_info/providers/token_selection_provider.dart';
import '../../watchlist/presentation/watchlist_avatar_nft_screen.dart';
import '../../watchlist/presentation/watchlist_cute_nft_screen.dart';
import '../../watchlist/presentation/watchlist_safety_tokens_screen.dart';
import '../data/models/nft_model.dart';
import '../data/models/token_model.dart';
import 'providers/wallet_provider.dart';
import '../widgets/balance_sheet.dart';
import '../widgets/filter_sheet.dart';
import '../widgets/sort_sheet.dart';
import '../widgets/token_item.dart';
import '../widgets/wallet_header.dart';
import '../widgets/watchlist_sheet.dart';
import 'custom_nav_bar.dart';
import 'providers/wallet_state.dart';
import 'qr_scanner_screen.dart';

class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  late ScrollController _scrollController2;
  double _opacity = 1;
  bool _isUserScrolling = false;
  OverlayEntry? _overlayEntry;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  final double _scrollDownOffset = 210;
  bool? _previousMoreButtonState;
  bool _hideSmallBalances = false;
  bool _filterSpamTokens = false;
  bool _isAnimatingHeader = false;
  late AnimationController _walletSlideController;
  late Animation<Offset> _walletSlideAnimation;

  final Map<int, Widget> _collectionScreens = <int, Widget>{
    0: const WatchlistSafetyTokensScreen(),
    1: const WatchlistAvatarNFTScreen(),
    2: const WatchlistCuteNFTScreen(),
  };

  @override
  void initState() {
    super.initState();
    _initControllers();
    _setupScrollListeners();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _previousMoreButtonState = ref.read(walletNotifierProvider).isMoreButtonSelected;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Check if the more button state changed
    final bool currentMoreButtonState = ref.read(walletNotifierProvider).isMoreButtonSelected;
    if (_previousMoreButtonState != null && _previousMoreButtonState != currentMoreButtonState) {
      _handleMoreButtonStateChange(currentMoreButtonState);
    }
    _previousMoreButtonState = currentMoreButtonState;
  }

  // Add this method to handle scrolling when more button state changes
 void _handleMoreButtonStateChange(bool isMoreSelected) {
  setState(() {
    _isAnimatingHeader = true;
  });
  
  if (isMoreSelected) {
    // Only scroll down if we're not already scrolled down
    if (_scrollController.hasClients && _scrollController.offset < _scrollDownOffset) {
      _scrollController.animateTo(
        _scrollDownOffset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ).then((_) {
        setState(() {
          _isAnimatingHeader = false;
        });
      });
    } else {
      setState(() {
        _isAnimatingHeader = false;
      });
    }
  } else {
    // MODIFICATION: Don't scroll back to top when returning to normal state
    // Just finish the animation
    setState(() {
      _isAnimatingHeader = false;
    });
    
    // Optional: If you want to maintain the current scroll position exactly as is
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.offset);
    }
  }
}
  void _initControllers() {
    _tabController = TabController(length: 2, vsync: this);
    _scrollController2 = ScrollController();

    _walletSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _walletSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1),
    ).animate(CurvedAnimation(
      parent: _walletSlideController,
      curve: Curves.easeInOut,
    ),);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ),);
  }
  
  void _setupScrollListeners() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection != ScrollDirection.idle) {
        setState(() {
          _isUserScrolling = true;
        });
      } else {
        setState(() {
          _isUserScrolling = false;
        });
      }
      
      final double offset = _scrollController.offset;
      final double newOpacity = (1 - (offset / 100)).clamp(0.0, 1.0);

      if (newOpacity != _opacity) {
        setState(() {
          _opacity = newOpacity;
        });
      }

      // Show text when balance section is not visible
      if (offset > 120 && !ref.read(walletNotifierProvider).isBalanceHidden) {
        ref.read(walletNotifierProvider.notifier).toggleBalanceVisibility(true);
      } else if (offset <= 120 && ref.read(walletNotifierProvider).isBalanceHidden) {
        ref.read(walletNotifierProvider.notifier).toggleBalanceVisibility(false);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _scrollController2.dispose();
    _animationController.dispose();
    super.dispose();
  }

  // void _toggleQrScanner() {
  //   ref.read(walletNotifierProvider.notifier).toggleQrScanner();
    
  //   if (ref.read(walletNotifierProvider).isQrScannerOpen) {
  //     _animationController.forward();
  //   } else {
  //     _animationController.reverse();
  //   }
  // }

  // Update the _toggleQrScanner method to use a full-screen approach
  void _toggleQrScanner() {
    // Create a full-screen page route that completely covers the entire screen
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: true, // Make the route opaque to completely cover the screen
        pageBuilder: (context, animation, secondaryAnimation) {
          // Start the wallet slide animation when push begins
          _walletSlideController.forward();
          
          return const QrScannerScreen();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0, 1); // Start from bottom
          const Offset end = Offset.zero;
          const Cubic curve = Curves.easeInOut;

          // Create a tween for the slide transition
          final Animatable<Offset> tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final Animation<Offset> offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 250),
      ),
    ).then((_) {
      // Reverse wallet slide animation when returning
      _walletSlideController.reverse();
    });
  }

  void _showBalanceSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (BuildContext context) => Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: BalanceSheet(
          selectedOption: ref.read(walletNotifierProvider).selectedBalanceOption,
          onOptionSelected: (String option) {
            ref.read(walletNotifierProvider.notifier).setBalanceOption(option);
          },
        ),
      ),
    );
  }
  // Update the _showSortSheet method to handle sort changes with animation
  void _showSortSheet() {
    final WalletState walletState = ref.read(walletNotifierProvider);
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (BuildContext context) => SortSheet(
        isSortPriceButtonSelected: walletState.isSortPriceButtonSelected,
        isSortBalanceButtonSelected: walletState.isSortBalanceButtonSelected,
        isSortAlphabetButtonSelected: walletState.isSortAlphabetButtonSelected,
        isSort24hrButtonSelected: walletState.isSort24hrButtonSelected,
        isSortAscending: walletState.isSortAscending,
        onPriceToggled: () {
          setState(() {
            // Add a small delay to allow animation to show
            Future.delayed(const Duration(milliseconds: 100), () {
              ref.read(walletNotifierProvider.notifier).toggleSortPrice();
              setState(() {});
            });
          });
        },
        onBalanceToggled: () {
          setState(() {
            Future.delayed(const Duration(milliseconds: 100), () {
              ref.read(walletNotifierProvider.notifier).toggleSortBalance();
              setState(() {});
            });
          });
        },
        onAlphabetToggled: () {
          setState(() {
            Future.delayed(const Duration(milliseconds: 100), () {
              ref.read(walletNotifierProvider.notifier).toggleSortAlphabet();
              setState(() {});
            });
          });
        },
        on24hrToggled: () {
          setState(() {
            Future.delayed(const Duration(milliseconds: 100), () {
              ref.read(walletNotifierProvider.notifier).toggleSort24hr();
              setState(() {});
            });
          });
        },
        onDirectionToggled: () {
          setState(() {
            Future.delayed(const Duration(milliseconds: 100), () {
              ref.read(walletNotifierProvider.notifier).toggleSortDirection();
              setState(() {});
            });
          });
        },
        onDismiss: () => Navigator.pop(context),
      ),
    ).then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }
  void _showFilterSheet() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      barrierColor: Colors.black54,
      builder: (BuildContext context) => FilterSheet(
        hideSmallBalances: _hideSmallBalances,
        filterSpamTokens: _filterSpamTokens,
        onHideSmallBalancesChanged: (bool value) {
          setState(() {
            _hideSmallBalances = value;
          });
        },
        onFilterSpamTokensChanged: (bool value) {
          setState(() {
            _filterSpamTokens = value;
          });
        },
        onDismiss: () => Navigator.pop(context),
      ),
    );
  }
  
  void _hideSortSheet() {
    Navigator.pop(context);
  }
  
  void _showWatchlistBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (BuildContext context) => WatchlistBottomSheet(
        onAddToWatchlist: (int? collectionIndex) {
          ref.read(walletNotifierProvider.notifier).addSelectedTokensToWatchlist();
          _showWatchlistAddedMessage(collectionIndex);
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

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = kToolbarHeight;
    final Size screenSize = MediaQuery.of(context).size;
    final WalletState walletState = ref.watch(walletNotifierProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bool currentMoreButtonState = walletState.isMoreButtonSelected;
      if (_previousMoreButtonState != currentMoreButtonState) {
        _handleMoreButtonStateChange(currentMoreButtonState);
        _previousMoreButtonState = currentMoreButtonState;
      }
    });
    
    return BaseScreenWithNav(
      currentIndex: 2,
      onHidePressed: () {
        ref.read(walletNotifierProvider.notifier).activateHiding();
      },
      onSortPressed: _showFilterSheet,
      onWatchlistPressed: _showWatchlistBottomSheet,
      isMoreOptionsSelected: walletState.isMoreButtonSelected,
      onMoreOptionsChanged: (bool value) {
        if (value) {
          ref.read(walletNotifierProvider.notifier).toggleMoreButton();
        } else {
          ref.read(walletNotifierProvider.notifier).applyChanges();
        }
      },
      child: Stack(
        children: <Widget>[
          SlideTransition(
            position: _walletSlideAnimation,
            child: Scaffold(
              appBar: _buildAppBar(),
              body: Stack(
                children: <Widget>[
                  _buildMainContent(screenSize, appBarHeight),
                  // _buildQrScannerOverlay(screenSize, appBarHeight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
    title: Padding(
      padding: EdgeInsets.only(left: 8.w, top: 4.h),
      child: Row(
        children: <Widget>[
          Image.asset('assets/icons/star-struck.png', width: 44.w),
          Gap(12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Allan Jerrold', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Business',
                    style: TextStyle(fontSize: 14.sp, color: AppColors.blue,fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 3.h),
                    child: Icon(PhosphorIconsBold.caretRight, size: 11.sp, color: AppColors.blue),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
    actions: <Widget>[
      Hero(
        tag: 'searchIconHero',
        transitionOnUserGestures: true,
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: Icon(PhosphorIconsBold.magnifyingGlass, size: 24.sp),
            onPressed: () {
              const WalletSearchScreenRoute().push(context);
            },
          ),
        ),
      ),
      IconButton(
        icon: Icon(PhosphorIconsBold.clockCounterClockwise, size: 24.sp),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(PhosphorIconsBold.qrCode, size: 24.sp),
        onPressed: _toggleQrScanner,
      ),
      Gap(12.w),
    ],
  );

Widget _buildMainContent(Size screenSize, double appBarHeight) {
  final WalletState walletState = ref.watch(walletNotifierProvider);

  String sortTypeText = 'Balance';
  if (walletState.isSortPriceButtonSelected) {
    sortTypeText = 'Price';
  } else if (walletState.isSortBalanceButtonSelected) {
    sortTypeText = 'Balance';
  } else if (walletState.isSortAlphabetButtonSelected) {
    sortTypeText = 'Alphabet Order';
  } else if (walletState.isSort24hrButtonSelected) {
    sortTypeText = '24 hr price change';
  }

  return NestedScrollView(
    controller: _scrollController,
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
      SliverToBoxAdapter(
        child: AnimatedContainer(
          duration: Duration(milliseconds: _isAnimatingHeader ? 300 : 0),
          height: 190.h,
          padding: EdgeInsets.zero,
          child: WalletHeader(
            opacity: _opacity,
            balanceOption: walletState.selectedBalanceOption,
            onBalanceTap: _showBalanceSheet,
          ),
        ),
      ),
      SliverPersistentHeader(
        pinned: true,
        delegate: TabBarDelegate(
          Material(
            color: Colors.white,
            child: AnimatedContainer(
              duration: Duration(milliseconds: _isAnimatingHeader ? 300 : 0),
              padding: const EdgeInsets.only(),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          transitionBuilder: (Widget child, Animation<double> animation) => FadeTransition(opacity: animation, child: child),
                          child: walletState.isMoreButtonSelected
                              ? Container(
                                  key: const ValueKey('sort'),
                                  height: 48.h,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                                  child: GestureDetector(
                                    onTap: _showSortSheet,
                                    child: TweenAnimationBuilder<double>(
                                      tween: Tween<double>(begin: 0, end: 1),
                                      duration: const Duration(milliseconds: 150),
                                      key: ValueKey(sortTypeText),
                                      builder: (context, value, child) => Opacity(
                                        opacity: value,
                                        child: child,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            (walletState.isSortAscending
                                                ? 'assets/icons/sort-ascending.png'
                                                : 'assets/icons/sort-descending.png'),
                                            width: 18.sp,
                                            height: 18.sp,
                                          ),
                                          Gap(8.w),
                                          Text(
                                            sortTypeText,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.greyDark,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : CustomTabBar(
                                  key: const ValueKey('tabs'),
                                  tabController: _tabController,
                                  tabs: const <String>['Token', 'NFT'],
                                ),
                        ),
                      ),
                      if (!walletState.isMoreButtonSelected)
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(
                            begin: 0.0, 
                            end: walletState.isBalanceHidden ? 1.0 : 0.0
                          ),
                          duration: const Duration(milliseconds: 900),
                          builder: (context, value, child) => Opacity(
                            opacity: value,
                            child: child,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Text(
                              r'$1,038.56',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      Gap(9.w),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder: (Widget child, Animation<double> animation) => FadeTransition(opacity: animation, child: child),
                        child: walletState.isMoreButtonSelected
                            ? Row(
                                key: const ValueKey('done'),
                                children: [
                                  TextButton(
                                    onPressed: () => ref.read(walletNotifierProvider.notifier).applyChanges(),
                                    child: TweenAnimationBuilder<double>(
                                      tween: Tween<double>(begin: 0, end: 1),
                                      duration: const Duration(milliseconds: 350),
                                      builder: (context, value, child) => Opacity(
                                        opacity: value,
                                        child: child,
                                      ),
                                      child: Text(
                                        'Done',
                                        style: TextStyle(color: AppColors.blue, fontSize: 18.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Padding(
                                key: const ValueKey('more'),
                                padding: EdgeInsets.only(right: 3.w),
                                child: GestureDetector(
                                  onTap: () => ref.read(walletNotifierProvider.notifier).toggleMoreButton(),
                                  child: Icon(
                                    PhosphorIconsBold.dotsThreeVertical,
                                    color: AppColors.greyLight,
                                    size: 22.sp,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 350.w,
                      height: 1,
                      color: AppColors.greyVeryLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
    body: TabBarView(
      controller: _tabController,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 13.h),
          child: _buildTokensTab(),
        ),
        _buildNFTsTab(),
      ],
    ),
  );
}
  Widget _buildQrScannerOverlay(Size screenSize, double appBarHeight) {
    ref.watch(walletNotifierProvider);
    
    return Positioned(
      top: screenSize.height - appBarHeight,
      left: 0,
      right: 0,
      height: screenSize.height,
      child: SlideTransition(
        position: _slideAnimation,
        child: const QrScannerScreen(),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    final WalletState walletState = ref.watch(walletNotifierProvider);
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: CustomNavBar(
        pageIndex: walletState.currentTabIndex,
        onTabChange: (int index) => ref.read(walletNotifierProvider.notifier).setCurrentTab(index),
        isMoreOptionsSelected: walletState.isMoreButtonSelected,
        onHidePressed: () => ref.read(walletNotifierProvider.notifier).activateHiding(),
        onSortPressed: _showFilterSheet,
        onWatchlistPressed: _showWatchlistBottomSheet,
      ),
    );
  }

  // Update the _buildTokensTab method
  Widget _buildTokensTab() {
    final WalletState walletState = ref.watch(walletNotifierProvider);
    final List<Token> tokensToShow = walletState.isMoreButtonSelected 
        ? walletState.allTokens 
        : walletState.displayedTokens;
    
    return ListView.builder(
      itemCount: tokensToShow.length,
      itemBuilder: (BuildContext context, int index) {
        final Token token = tokensToShow[index];
        final int actualIndex = walletState.allTokens.indexOf(token);
        
        // Check if this token is in the hidden selection list
        final bool isSelected = walletState.selectedTokens.contains(actualIndex);
        
        // Determine if this token should be hidden in normal mode
        final bool isHidden = walletState.hideSelected && isSelected;
        
        final bool isInWatchlist = walletState.watchlistTokens.contains(actualIndex);

        // Only hide tokens in normal mode, show all tokens in "More" mode
        if (isHidden && !walletState.isMoreButtonSelected) {
          return const SizedBox.shrink();
        }

        return TokenItem(
          token: token,
          // Mark as selected if it's in the selection list
          isSelected: isSelected,
          isInWatchlist: isInWatchlist,
          showSelection: walletState.isMoreButtonSelected,
          // Pass isHiding based on whether hiding is active OR if this is a hidden item in "More" mode
          isHiding: walletState.isHidingActive || (walletState.isMoreButtonSelected && isHidden),
          onCheckboxTap: () {
            ref.read(walletNotifierProvider.notifier).toggleTokenSelection(actualIndex);
          },
          onTap: walletState.isMoreButtonSelected
              ? () {
                  ref.read(walletNotifierProvider.notifier).toggleTokenSelection(actualIndex);
                }
              : () {
                // Set the selected token first, then navigate
                ref.read(selectedTokenNotifierProvider.notifier).selectTokenByIndex(actualIndex);
                
                // Replace direct navigation with custom page route
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const TokensInfoScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 0.1); // Start slightly below target position
                      const end = Offset.zero;
                      const curve = Curves.easeOutCubic;
                      
                      // Create combined slide-up and fade-in transition
                      final Animation<Offset> slideAnimation = Tween(begin: begin, end: end).animate(
                        CurvedAnimation(parent: animation, curve: curve),
                      );
                      
                      final Animation<double> fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(parent: animation, curve: curve),
                      );
                      
                      return FadeTransition(
                        opacity: fadeAnimation,
                        child: SlideTransition(
                          position: slideAnimation,
                          child: child,
                        ),
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 350),
                  ),
                );
              },
        );
      },
    );
  }
  Widget _buildNFTsTab() {
    final WalletState walletState = ref.watch(walletNotifierProvider);
    final List<NFTCollection> collectionsToShow = walletState.isMoreButtonSelected 
        ? walletState.allNFTCollections 
        : walletState.displayedNFTCollections;
    
    return ListView.builder(
      itemCount: collectionsToShow.length,
      itemBuilder: (BuildContext context, int collectionIndex) {
        final NFTCollection collection = collectionsToShow[collectionIndex];
        final int actualIndex = walletState.allNFTCollections.indexOf(collection);
        
        final bool isExpanded = walletState.expandedStates[actualIndex] ?? true;
        final bool isCollectionSelected = walletState.allCollectionNFTsSelected[actualIndex] ?? false;

        if (isCollectionSelected && !walletState.isMoreButtonSelected) {
          return Container();
        }

        return _buildNFTCollectionItem(actualIndex, collection, isExpanded, isCollectionSelected);
      },
    );
  }
  
  Widget _buildNFTCollectionItem(int collectionIndex, NFTCollection collection, bool isExpanded, bool isCollectionSelected) {
    final WalletState walletState = ref.watch(walletNotifierProvider);
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gap(walletState.isMoreButtonSelected ? 20.h : 12.h),
          // Collection Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: const AssetImage('assets/images/nft1.png'),
                    radius: 14.r,
                  ),
                  Gap(8.w),
                  Text(
                    collection.name,
                    style: TextStyle(
                      fontSize: 18.sp, 
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  if (walletState.isMoreButtonSelected) 
                  Row(
                    children: <Widget>[
                      Text(
                        collection.count.toString(),
                        style: TextStyle(
                          fontSize: 16.sp, 
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(28.w),
                      CustomCheckbox(
                        isChecked: isCollectionSelected,
                        isRound: true,
                        onTap: () {
                          ref.read(walletNotifierProvider.notifier).toggleCollectionSelection(collectionIndex);
                        },
                      ),
                    ],
                  ) else 
                    Row(
                      children: <Widget>[
                        Text(
                          collection.count.toString(),
                          style: TextStyle(
                            fontSize: 16.sp, 
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton( 
                          padding: EdgeInsets.zero,
                          alignment:  Alignment.centerRight,

                          highlightColor: Colors.transparent,
                          onPressed: () {
                            ref.read(walletNotifierProvider.notifier).toggleCollectionExpanded(collectionIndex);
                          },
                          icon: Icon(
                            isExpanded ? PhosphorIconsBold.caretDown : PhosphorIconsBold.caretUp,
                            size: 16.sp,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          if(walletState.isMoreButtonSelected) Gap(walletState.isMoreButtonSelected ? 8.h : 14.h),

          Gap(6.h),
          _buildNFTGrid(collectionIndex, collection, isExpanded),
        ],
      ),
    );
  }
  Widget _buildNFTGrid(int collectionIndex, NFTCollection collection, bool isExpanded) {
    final WalletState walletState = ref.watch(walletNotifierProvider);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: isExpanded || walletState.isMoreButtonSelected
          ? (collection.nfts.length / 2).ceil() * 215.h
          : 0,
      child: ClipRect(
        child: AnimatedOpacity(
          opacity: isExpanded ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            width: double.infinity,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                mainAxisExtent: 250.h,
              ),
              itemCount: collection.nfts.length,
              itemBuilder: (BuildContext context, int nftIndex) {
                final NFT nft = collection.nfts[nftIndex];
                final bool isSelected = walletState.selectedNFTs.containsKey(collectionIndex) &&
                    walletState.selectedNFTs[collectionIndex]!.contains(nftIndex);
                final bool isHidden = walletState.hideSelected && isSelected;

                if (isHidden && !walletState.isMoreButtonSelected) {
                  return const SizedBox.shrink();
                }

                return NFTItem(
                  nft: nft,
                  isSelected: isSelected || isHidden, // Important change: also select if hidden
                  showCheckbox: walletState.isMoreButtonSelected,
                  // The important fix: pass isHiding as true when item is hidden, even in More mode
                  isHiding: walletState.isHidingActive || (walletState.isMoreButtonSelected && isHidden),
                  onCheckboxChanged: walletState.isMoreButtonSelected
                      ? (bool newValue) {
                          ref.read(walletNotifierProvider.notifier).toggleNFTSelection(collectionIndex, nftIndex);
                        }
                      : null,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}