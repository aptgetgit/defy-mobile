import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../app/routes/router.dart';
import '../../../config/theme/colors.dart';



import '../../shared/presentation/widgets/custom_check_box.dart';
import '../../shared/presentation/widgets/nft_item.dart';
import '../../watchlist/presentation/watchlist_avatar_nft_screen.dart';
import '../../watchlist/presentation/watchlist_cute_nft_screen.dart';
import '../../watchlist/presentation/watchlist_safety_tokens_screen.dart';

import '../data/models/nft_models.dart';
import '../data/models/token_data.dart';

import '../data/models/token_models.dart';

import '../widgets/watchlist_sheet.dart';
import 'custom_nav_bar.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  bool _isMoreButtonSelected = false;
  final ScrollController _scrollController = ScrollController();
  late ScrollController _scrollController2;
  double _opacity = 1;
  bool _isBalanceHidden = false;
  final Set<int> _selectedTokens = <int>{};
  bool _hideSelected = false;
  bool _isHidingActive = false;
  List<Token> _displayedTokens = List.from(tokens);
  bool _isSortSheetVisible = false;
  bool _isSortPriceButtonSelected = false;
  bool _isSortBalanceButtonSelected = false;
  bool _isSortAlphabetButtonSelected = false;
  bool _isSort24hrButtonSelected = false;
  bool _isUserScrolling = false;
  String _selectedBalanceOption = 'Total Balance';
  final Map<int, Set<int>> _selectedNFTs = <int, Set<int>>{};
  List<NFTCollection> _displayedNFTCollections = <NFTCollection>[];
  final Map<int, bool> _expandedStates = <int, bool>{};
  final Map<int, bool> _allCollectionNFTsSelected = <int, bool>{}; // New map to track collection checkbox states
  final Set<int> _watchlistTokens = <int>{}; // Track the watchlist tokens
  OverlayEntry? _overlayEntry;

  final Map<int, Widget> _collectionScreens = {
    0: const WatchlistSafetyTokensScreen(), // Replace with your actual screen widgets
    1: const WatchlistAvatarNFTScreen(),
    2: const WatchlistCuteNFTScreen(),
  };

  void _onMoreButtonPressed() {
    setState(() {
      _isMoreButtonSelected = !_isMoreButtonSelected; // Toggle the state

      if (_isMoreButtonSelected) {
        _scrollController.animateTo(
          170,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _displayedTokens = List.from(tokens);
    _displayedNFTCollections = _buildNFTCollections();
    _scrollController2 = ScrollController();

    _scrollController..addListener(() {
      if (_scrollController.position.userScrollDirection != ScrollDirection.idle) {
        setState(() {
          _isUserScrolling = true;
        });
      } else {
        setState(() {
          _isUserScrolling = false;
        });
      }
    })

    ..addListener(() {
      final double offset = _scrollController.offset;
      final double newOpacity = (1 - (offset / 100)).clamp(0.0, 1.0);

      if (newOpacity != _opacity) {
        setState(() {
          _opacity = newOpacity;
        });
      }

      // Show text when balance section is not visible
      if (offset > 120 && !_isBalanceHidden) {
        setState(() {
          _isBalanceHidden = true;
        });
      } else if (offset <= 120 && _isBalanceHidden) {
        setState(() {
          _isBalanceHidden = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose(); // Dispose the scroll controller
    _scrollController2.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _isMoreButtonSelected = false;
    });
    // Add navigation logic here if needed
  }

  void _onHidePressed() {
    setState(() {
      _isHidingActive = true;
    });
  }

  void _onDonePressed() {
    setState(() {
      _isMoreButtonSelected = false;
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      if (_isHidingActive) { 
        _hideSelected = true; 

        // Remove selected tokens
        _displayedTokens = List.from(tokens);
        _displayedTokens.removeWhere((Token token) => _selectedTokens.contains(tokens.indexOf(token)));

        // Update NFT Collections (Fixed)
        final List<NFTCollection> allCollections = _buildNFTCollections();
        _displayedNFTCollections = allCollections.map((NFTCollection collection) {
          final int collectionIndex = allCollections.indexOf(collection);
          return NFTCollection(
            name: collection.name,
            count: collection.count,
            nfts: collection.nfts.where((NFT nft) {
              final int nftIndex = collection.nfts.indexOf(nft);
              return !_selectedNFTs.containsKey(collectionIndex) || 
                    !_selectedNFTs[collectionIndex]!.contains(nftIndex);
            }).toList(),
          );
        }).toList();

        _selectedTokens.clear();
        _selectedNFTs.clear();
        _isHidingActive = false; // Reset hide active
      } else {
        // If Hide was not pressed, just clear selection
        _selectedTokens.clear();
        _selectedNFTs.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: <Widget>[
      Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: <Widget>[
                  Image.asset('assets/icons/star-struck.png', width: 44),
                  const Gap(12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Allan Jerrold', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                      Row(
                        children: <Widget>[
                          Text(
                            'Business',
                            style: TextStyle(fontSize: 14, color: AppColors.greyLight),
                          ),
                          Icon(PhosphorIconsRegular.caretRight, size: 8,),
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
                  WalletSearchScreenRoute().push(context);
                },
              ),
              IconButton(
                icon: const Icon(PhosphorIconsBold.clockCounterClockwise),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(PhosphorIconsBold.qrCode),
                onPressed: () {},
              ),
              const Gap(12),
            ],
          ),
          body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
              SliverToBoxAdapter(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _opacity,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 26),
                        child: GestureDetector(
                          onTap: _showBalanceSheet,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                _selectedBalanceOption,
                                style: const TextStyle(fontSize: 16, color: AppColors.greyLight, fontWeight: FontWeight.w500),
                              ),
                              const Gap(4),
                              const Icon(PhosphorIconsBold.caretDown, color: AppColors.greyLight, size: 10),
                            ],
                          ),
                        ),
                      ),
                      const Gap(5),
                      const Text(
                        r'$1,038.56',
                        style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
                      ),
                      const Gap(16),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 233, 243, 236),
                          borderRadius: BorderRadius.circular(33),
                        ),
                        width: 79,
                        height: 28,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(PhosphorIconsBold.arrowUp, color: Colors.green, size: 14),
                            Text(
                              '18.73%',
                              style: TextStyle(color: Colors.green, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const Gap(35),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            child: TabBar(   
                              controller: _tabController,
                              isScrollable: true,
                              indicatorColor: Colors.black,
                              indicator: const UnderlineTabIndicator(
                                borderSide: BorderSide(width: 2),
                              ),
                              tabAlignment: TabAlignment.start,
                              labelColor: Colors.black,
                              unselectedLabelColor: AppColors.greyLight,
                              labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.zero,
                              indicatorWeight: 1,
                              dividerHeight: 1,
                              dividerColor: AppColors.greyVeryLight,
                              tabs: const <Widget>[
                                Tab(text: 'Token'),
                                Tab(text: 'NFT'),
                              ],
                            ),
                          ),
                          if(!_isMoreButtonSelected)
                            // Show the balance text only when it's hidden from the main UI
                            AnimatedOpacity(
                              opacity: _isBalanceHidden && _isUserScrolling ? 1 : 0,
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
                          // More options button
                          if (_isMoreButtonSelected)
                            TextButton(
                              onPressed: _onDonePressed,
                              child: const Text(
                                'Done',
                                style: TextStyle(color: AppColors.blue, fontSize: 18),
                              ),
                            )
                          else
                            GestureDetector(
                              onTap: _onMoreButtonPressed,
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
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: CustomNavBar(
              pageIndex: _currentIndex,
              onTabChange: _onTabTapped,
              isMoreOptionsSelected: _isMoreButtonSelected,
              onHidePressed: _onHidePressed,
              onSortPressed: _showSortSheet,
              onWatchlistPressed: _showWatchlistBottomSheet,
            ),
          ),
        ),
        if (_isSortSheetVisible)
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
    void _showSortSheet() {
      setState(() {
        _isSortSheetVisible = true;
      });
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) => _buildSortSheetContent(), // Call the content builder
      ).then((_) { // This is important to reset visibility when sheet is dismissed
          if (mounted) { // Check if the widget is still mounted before calling setState
            setState(() {
              _isSortSheetVisible = false;
            });
          }
      });
    }

    void _hideSortSheet() {
      Navigator.pop(context); // Dismiss the bottom sheet
    }

    Widget _buildSortSheetContent() => Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(32)),
              ),
              padding: const EdgeInsets.all(20),
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,), // Adjust for safe area
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Sort', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,),),
                      IconButton(
                        onPressed: _hideSortSheet, 
                        icon: const Icon(PhosphorIconsBold.x, color: AppColors.greyLight, size: 24),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: _isSortPriceButtonSelected ? AppColors.blue : AppColors.greyVeryLight,
                          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                        ),
                        onPressed: () {
                          setState(() {
                            _isSortPriceButtonSelected = !_isSortPriceButtonSelected;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text('Price', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: _isSortPriceButtonSelected ? AppColors.white : AppColors.greyLight),),
                            const Gap(4),
                            Icon(PhosphorIconsBold.trendUp, size: 16,color: _isSortPriceButtonSelected ? AppColors.white : AppColors.greyLight),
                          ],
                        ),
                      ),
                      const Gap(12),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: _isSortBalanceButtonSelected ? AppColors.blue : AppColors.greyVeryLight,
                          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                        ),
                        onPressed: () {
                          setState(() {
                            _isSortBalanceButtonSelected = !_isSortBalanceButtonSelected;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text('Balance', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: _isSortBalanceButtonSelected ? AppColors.white : AppColors.greyLight),),
                          ],
                        ),
                      ),
                      const Gap(12),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: _isSortAlphabetButtonSelected ? AppColors.blue : AppColors.greyVeryLight,
                          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                        ),
                        onPressed: () {
                          setState(() {
                            _isSortAlphabetButtonSelected = !_isSortAlphabetButtonSelected;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text('Alphabet Order', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: _isSortAlphabetButtonSelected ? AppColors.white : AppColors.greyLight),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: _isSort24hrButtonSelected ? AppColors.blue : AppColors.greyVeryLight,
                      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                      fixedSize: const Size(150, 36),
                    ),
                    onPressed: () {
                      setState(() {
                        _isSort24hrButtonSelected = !_isSort24hrButtonSelected;
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Text('24 hr price change', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: _isSort24hrButtonSelected ? AppColors.white : AppColors.greyLight),),
                      ],
                    ),
                  ),
                  const Gap(16),
                  const Text(
                    'Filter',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(r'Hide small balances (0.1$)', style: TextStyle(color: AppColors.greyLight),),
                      Checkbox(
                        value: false,
                        side: const BorderSide(color: AppColors.greyLight, width: 2),
                        onChanged: (bool? value) {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Filter spam tokens', style: TextStyle(color: AppColors.greyLight),),
                      Checkbox(
                        value: false,
                        side: const BorderSide(color: AppColors.greyLight, width: 2),
                        onChanged: (bool? value) {},
                      ),
                    ],
                  ),
                  const Gap(20),
                  ElevatedButton(
                    onPressed: _hideSortSheet,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 54),),
                    child: const Text(
                      'Apply',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  
  void _showBalanceSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => _buildBalanceSheetContent()
    ).then((_) {
      setState(() {});
    });
  }

  void _showWatchlistBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => WatchlistBottomSheet(
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
        child: Material( // Wrap with Material for shadow
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
                if (collectionIndex != null && _collectionScreens.containsKey(collectionIndex)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => _collectionScreens[collectionIndex]!),
                  );
                } else {
                  // Handle the case where the collection index is null or not found in the map
                  print("Invalid collection index or screen not found.");
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('assets/icons/watchlist-logo2.png', width: 32, height: 32,),
                  const Text(
                    'Tokens Added to Watchlist',
                    style: TextStyle(color: AppColors.greyDark, fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 20, color: AppColors.greyLight,),
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


  Widget _buildBalanceSheetContent() => StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) => Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(28)),
              ),
              padding: const EdgeInsets.only(bottom: 20, top:10, left: 20),
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Balances',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(PhosphorIconsBold.x, color: AppColors.black, size: 20),
                        ),
                      ],
                    ),
                  ),
                  const Gap(12),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Text('🚀', style: TextStyle(fontSize: 24)),
                            const Gap(12),
                            const Text('Total Balance', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            CustomCheckbox(
                              isChecked: _selectedBalanceOption == 'Total Balance',
                              isRound: true,
                              onTap: () {
                                setState(() {
                                  _selectedBalanceOption = 'Total Balance';
                                });
                              },
                            ),
                            const Gap(12),
                          ],
                        ),
                        const Gap(18),
                        Row(
                          children: <Widget>[
                            const Text('🏋', style: TextStyle(fontSize: 24)),
                            const Gap(12),
                            const Text('NFT Only', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            CustomCheckbox(
                              isChecked: _selectedBalanceOption == 'NFT Only',
                              isRound: true,
                              onTap: () {
                                setState(() {
                                  _selectedBalanceOption = 'NFT Only';
                                });
                              },
                            ),
                            const Gap(12),
                          ],
                        ),
                        const Gap(18),
                        Row(
                          children: <Widget>[
                            const Text('🚀', style: TextStyle(fontSize: 24)),
                            const Gap(12),
                            const Text('Token Only', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            CustomCheckbox(
                              isChecked: _selectedBalanceOption == 'Token Only',
                              isRound: true,
                              onTap: () {
                                setState(() {
                                  _selectedBalanceOption = 'Token Only';
                                });
                              },
                            ),
                            const Gap(12),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: const Color(0x192071EE),
                        minimumSize: const Size(double.infinity, 54),
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: AppColors.blue, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );

  Widget _buildTokensTab() => ListView.builder(
    itemCount: _isMoreButtonSelected ? tokens.length : _displayedTokens.length,
    itemBuilder: (BuildContext context, int index) {
      final Token token = _isMoreButtonSelected ? tokens[index] : _displayedTokens[index];
      final int actualIndex = tokens.indexOf(token);
      final bool isSelected = _selectedTokens.contains(actualIndex);
      final bool isHidden = _hideSelected && isSelected;
      final bool isInWatchlist = _watchlistTokens.contains(actualIndex);

      if (isHidden && !_isMoreButtonSelected) {
        return const SizedBox.shrink(); // Hide the item
      }

      return Padding(
        padding: const EdgeInsets.only(left: 8,),
        child: ListTile(
          title: Text(token.name, style: TextStyle(fontSize: 18, color: isSelected ? Colors.grey : Colors.black)),
          subtitle: Text('${token.amount} ${token.currency}', style: TextStyle(fontSize: 14, color: isSelected ? Colors.grey : AppColors.greyLight)),
          leading: Stack(
            children: <Widget>[
              Opacity(
                opacity: isSelected ? 0.5 : 1,
                child: ClipOval(
                  child: Image.asset(token.imagePath, width: 44, height: 44,),
                ),
              ),
              if (isInWatchlist && _isMoreButtonSelected) // Show star if watchlisted
                Positioned(
                  top: -4, // Adjust position as needed
                  left: -4,
                  child: Image.asset('assets/icons/watchlist-logo2.png', width: 21, height: 21,),
                ),
            ],
          ),
          trailing: _isMoreButtonSelected
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('\$${token.balance}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: isSelected ? Colors.grey : Colors.black)),
                        Text(
                          '${token.percentageChange}%',
                          style: TextStyle(
                            color: token.percentageChange >= 0 ? Colors.green : Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ).animate().slideX(duration: const Duration(milliseconds: 300), begin: 0.5, end: 0),
        
                    const Gap(16),
                    CustomCheckbox(
                      isChecked: isSelected,
                      isRound: true,
                      onTap: () {
                        setState(() {
                          if (_selectedTokens.contains(actualIndex)) {
                            _selectedTokens.remove(actualIndex);
                          } else {
                            _selectedTokens.add(actualIndex);
                          }
                        });
                      },
                    )
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('\$${token.balance}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        Text(
                          '${token.percentageChange}%',
                          style: TextStyle(
                            color: token.percentageChange >= 0 ? Colors.green : Colors.red,
                            fontSize: 14,
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

  List<NFTCollection> _buildNFTCollections() {
    final List<NFTCollection> nftCollections = <NFTCollection>[
      NFTCollection(
        name: 'Chum Chums NFT',
        count: 2,
        nfts: <NFT>[
          NFT(id: '#4147', price: '0.02 APT', imageUrl: 'assets/images/Mask group.png'),
          NFT(id: '#4147', price: '0.02 APT', imageUrl: 'assets/images/Mask group (1).png'),
        ],
      ),
      NFTCollection(
        name: 'Chum Chums NFT',
        count: 2,
        nfts: <NFT>[
          NFT(id: '#4147', price: '0.02 APT', imageUrl: 'assets/images/Mask group (2).png'),
          NFT(id: '#4147', price: '0.02 APT', imageUrl: 'assets/images/Mask group (3).png'),
        ],
      ),
    ];
    return nftCollections;
  }

  Widget _buildNFTsTab() => ListView.builder(
    itemCount: _isMoreButtonSelected ? _buildNFTCollections().length : _displayedNFTCollections.length,
    itemBuilder: (BuildContext context, int collectionIndex) {
      final NFTCollection collection = _isMoreButtonSelected 
        ? _buildNFTCollections()[collectionIndex] 
        : _displayedNFTCollections[collectionIndex];

      final bool isExpanded = _expandedStates[collectionIndex] ?? true;
      bool isCollectionSelected = _allCollectionNFTsSelected[collectionIndex] ?? false;

      final bool areAllItemsSelected = _selectedNFTs[collectionIndex]?.length == collection.nfts.length;
      if (areAllItemsSelected && !isCollectionSelected) {
        _allCollectionNFTsSelected[collectionIndex] = true;
        isCollectionSelected = true;
      }

      if (isCollectionSelected && !_isMoreButtonSelected) {
        return Container(); // Return an empty container to hide the collection header and items
      }

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
                    if (_isMoreButtonSelected) 
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
                        CustomCheckbox( // Use your CustomCheckbox
                          isChecked: isCollectionSelected,
                          isRound: true,
                          onTap: () {
                            setState(() {
                              _allCollectionNFTsSelected[collectionIndex] = !isCollectionSelected; // Toggle the state
                              if (_allCollectionNFTsSelected[collectionIndex]!) { // Check if it's now selected
                                _selectedNFTs[collectionIndex] = Set.from(List.generate(collection.nfts.length, (int index) => index));
                              } else {
                                _selectedNFTs.remove(collectionIndex);
                              }
                            });
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
                              setState(() {
                                _expandedStates[collectionIndex] = !isExpanded;
                              });
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
            if(_isMoreButtonSelected) const Gap(12),

            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: isExpanded || _isMoreButtonSelected ? (collection.nfts.length / 2).ceil() * 240 : 0,
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
                        final bool isSelected = _selectedNFTs.containsKey(collectionIndex) && 
                                            _selectedNFTs[collectionIndex]!.contains(nftIndex);
                        final bool isHidden = _hideSelected && isSelected;
                  
                        // Hide the item if it's selected and hide is active (but not in selection mode)
                        if (isHidden && !_isMoreButtonSelected) {
                          return const SizedBox.shrink();
                        }
                  
                        return NFTItem(
                          nft: nft,
                          isSelected: isSelected,
                          showCheckbox: _isMoreButtonSelected, // Only show checkbox when in selection mode
                          onCheckboxChanged: _isMoreButtonSelected ? (bool newValue) {
                            setState(() {
                              if (!_selectedNFTs.containsKey(collectionIndex)) {
                                _selectedNFTs[collectionIndex] = <int>{};
                              }
                              if (newValue) {
                                _selectedNFTs[collectionIndex]!.add(nftIndex);
                              } else {
                                _selectedNFTs[collectionIndex]!.remove(nftIndex);
                              }
                            });
                          } : null,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {

  _TabBarDelegate(this.tabBar);
  final Widget tabBar;

  @override
  double get minExtent => kToolbarHeight - 10; // Minimum height for tab bar

  @override
  double get maxExtent => kToolbarHeight - 10; // Maximum height remains same

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Material(
      color: Colors.white,
      elevation: overlapsContent ? 4 : 0, // Add elevation when overlapping
      shadowColor: Colors.black.withOpacity(0.1),
      child: tabBar, // The entire row containing balance + tabs
    );

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}