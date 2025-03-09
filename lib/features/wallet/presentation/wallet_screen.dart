// ignore_for_file: always_specify_types

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../app/routes/router.dart';
import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_check_box.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../../shared/presentation/widgets/nft_item.dart';
import '../../watchlist/presentation/watchlist_avatar_nft_screen.dart';
import '../../watchlist/presentation/watchlist_cute_nft_screen.dart';
import '../../watchlist/presentation/watchlist_safety_tokens_screen.dart';
import '../data/models/nft_model.dart';
import '../data/models/token_model.dart';
import '../presentation/providers/wallet_provider.dart';
import '../widgets/balance_sheet.dart';

import '../widgets/sort_sheet.dart';
import '../widgets/token_item.dart';
import '../widgets/wallet_header.dart';
import '../widgets/watchlist_sheet.dart';
import 'custom_nav_bar.dart';
import 'providers/wallet_state.dart';

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
  }

  void _initControllers() {
    _tabController = TabController(length: 2, vsync: this);
    _scrollController2 = ScrollController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
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

  void _toggleQrScanner() {
    ref.read(walletNotifierProvider.notifier).toggleQrScanner();
    
    if (ref.read(walletNotifierProvider).isQrScannerOpen) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _showBalanceSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => BalanceSheet(
        selectedOption: ref.read(walletNotifierProvider).selectedBalanceOption,
        onOptionSelected: (String option) {
          ref.read(walletNotifierProvider.notifier).setBalanceOption(option);
        },
      ),
    );
  }

  void _showSortSheet() {
    ref.read(walletNotifierProvider.notifier).showSortSheet();
    
    final WalletState walletState = ref.read(walletNotifierProvider);
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => SortSheet(
        isSortPriceButtonSelected: walletState.isSortPriceButtonSelected,
        isSortBalanceButtonSelected: walletState.isSortBalanceButtonSelected,
        isSortAlphabetButtonSelected: walletState.isSortAlphabetButtonSelected,
        isSort24hrButtonSelected: walletState.isSort24hrButtonSelected,
        onPriceToggled: () {
          ref.read(walletNotifierProvider.notifier).toggleSortPrice();
        },
        onBalanceToggled: () {
          ref.read(walletNotifierProvider.notifier).toggleSortBalance();
        },
        onAlphabetToggled: () {
          ref.read(walletNotifierProvider.notifier).toggleSortAlphabet();
        },
        on24hrToggled: () {
          ref.read(walletNotifierProvider.notifier).toggleSort24hr();
        },
        onDismiss: _hideSortSheet,
      ),
    ).then((_) {
      if (mounted) {
        ref.read(walletNotifierProvider.notifier).hideSortSheet();
      }
    });
  }
  
  void _hideSortSheet() {
    Navigator.pop(context);
  }
  
  void _showWatchlistBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
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
        bottom: 120,
        left: 35,
        right: 35,
        child: Material(
          elevation: 4,
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
                  Image.asset('assets/icons/watchlist-logo2.png', width: 32, height: 32),
                  const Text(
                    'Tokens Added to Watchlist',
                    style: TextStyle(color: AppColors.greyDark, fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 20, color: AppColors.greyLight),
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
    Future.delayed(const Duration(seconds: 3), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = kToolbarHeight;
    final Size screenSize = MediaQuery.of(context).size;
    final WalletState walletState = ref.watch(walletNotifierProvider);
    
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: _buildAppBar(),
          body: Stack(
            children: <Widget>[
              _buildMainContent(screenSize, appBarHeight),
              // _buildQrScannerOverlay(screenSize, appBarHeight),
            ],
          ),
          bottomNavigationBar: _buildBottomNavBar(),
        ),
        if (walletState.isSortSheetVisible)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: GestureDetector(
              onTap: _hideSortSheet,
              child: Container(
                color: Colors.transparent,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
      ],
    );
  }

  AppBar _buildAppBar() => AppBar(
    title: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: <Widget>[
          Image.asset('assets/icons/star-struck.png', width: 44),
          const Gap(12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Allan Jerrold', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Row(
                children: <Widget>[
                  Text(
                    'Business',
                    style: TextStyle(fontSize: 14, color: AppColors.greyLight),
                  ),
                  Icon(PhosphorIconsRegular.caretRight, size: 8),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(PhosphorIconsBold.magnifyingGlass),
        onPressed: () {
          const WalletSearchScreenRoute().push(context);
        },
      ),
      IconButton(
        icon: const Icon(PhosphorIconsBold.clockCounterClockwise),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(PhosphorIconsBold.qrCode),
        onPressed: _toggleQrScanner,
      ),
      const Gap(12),
    ],
  );

  Widget _buildMainContent(Size screenSize, double appBarHeight) {
    final WalletState walletState = ref.watch(walletNotifierProvider);
    
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
        SliverToBoxAdapter(
          child: WalletHeader(
            opacity: _opacity,
            balanceOption: walletState.selectedBalanceOption,
            onBalanceTap: _showBalanceSheet,
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: TabBarDelegate(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.greyVeryLight,
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomTabBar(   
                        tabController: _tabController,
                        tabs: const <String>[
                          'Token',
                          'NFT',
                        ],
                      ),
                    ),
                    if(!walletState.isMoreButtonSelected)
                      AnimatedOpacity(
                        opacity: walletState.isBalanceHidden && _isUserScrolling ? 1 : 0,
                        duration: const Duration(milliseconds: 250),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            r'$1,038.56',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                      const Gap(9),
                    if (walletState.isMoreButtonSelected)
                      TextButton(
                        onPressed: () => ref.read(walletNotifierProvider.notifier).applyChanges(),
                        child: const Text(
                          'Done',
                          style: TextStyle(color: AppColors.blue, fontSize: 18),
                        ),
                      )
                    else
                      GestureDetector(
                        onTap: () => ref.read(walletNotifierProvider.notifier).toggleMoreButton(),
                        child: const Icon(
                          PhosphorIconsBold.dotsThreeVertical,
                          color: AppColors.greyLight,
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
          _buildTokensTab(),
          _buildNFTsTab(),
        ],
      ),
    );
  }

  // Widget _buildQrScannerOverlay(Size screenSize, double appBarHeight) {
  //   ref.watch(walletNotifierProvider);
    
  //   return Positioned(
  //     top: screenSize.height - appBarHeight,
  //     left: 0,
  //     right: 0,
  //     height: screenSize.height,
  //     child: SlideTransition(
  //       position: _slideAnimation,
  //       child: const QrScannerScreen(),
  //     ),
  //   );
  // }

  Widget _buildBottomNavBar() {
    final WalletState walletState = ref.watch(walletNotifierProvider);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: CustomNavBar(
        pageIndex: walletState.currentTabIndex,
        onTabChange: (int index) => ref.read(walletNotifierProvider.notifier).setCurrentTab(index),
        isMoreOptionsSelected: walletState.isMoreButtonSelected,
        onHidePressed: () => ref.read(walletNotifierProvider.notifier).activateHiding(),
        onSortPressed: _showSortSheet,
        onWatchlistPressed: _showWatchlistBottomSheet,
      ),
    );
  }

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
        final bool isSelected = walletState.selectedTokens.contains(actualIndex);
        final bool isHidden = walletState.hideSelected && isSelected;
        final bool isInWatchlist = walletState.watchlistTokens.contains(actualIndex);

        if (isHidden && !walletState.isMoreButtonSelected) {
          return const SizedBox.shrink();
        }

        return TokenItem(
          token: token,
          isSelected: isSelected,
          isInWatchlist: isInWatchlist,
          showSelection: walletState.isMoreButtonSelected,
          onCheckboxTap: () {
            ref.read(walletNotifierProvider.notifier).toggleTokenSelection(actualIndex);
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Gap(8),
          // Collection Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/nft1.png'),
                    radius: 14,
                  ),
                  const Gap(8),
                  Text(
                    collection.name,
                    style: const TextStyle(
                      fontSize: 18, 
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
                        style: const TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(28),
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
                          style: const TextStyle(
                            fontSize: 18, 
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton( 
                          padding: EdgeInsets.zero,
                          alignment:  Alignment.centerRight,
                          onPressed: () {
                            ref.read(walletNotifierProvider.notifier).toggleCollectionExpanded(collectionIndex);
                          },
                          icon: Icon(
                            isExpanded ? PhosphorIconsBold.caretDown : PhosphorIconsBold.caretUp,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          if(walletState.isMoreButtonSelected) const Gap(12),

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
      height: isExpanded || walletState.isMoreButtonSelected ? (collection.nfts.length / 2).ceil() * 240 : 0,
      child: ClipRect(
        child: AnimatedOpacity(
          opacity: isExpanded ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            width: double.infinity,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 250,
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
                  isSelected: isSelected,
                  showCheckbox: walletState.isMoreButtonSelected,
                  onCheckboxChanged: walletState.isMoreButtonSelected ? (bool newValue) {
                    ref.read(walletNotifierProvider.notifier).toggleNFTSelection(collectionIndex, nftIndex);
                  } : null,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
