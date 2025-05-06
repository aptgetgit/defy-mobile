import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_tab_bar.dart';
import '../../../wallet/presentation/custom_nav_bar.dart';
import '../providers/explore_provider.dart';
import '../widgets/search_bar_toggle_widget.dart';
import '../widgets/nft_hero_carousel.dart';
import 'cart_screen.dart';
import 'explore_order_screen.dart';
import 'explore_sell_screen.dart';
import 'nft_detail_screen.dart';

class ExploreNFTScreen extends ConsumerStatefulWidget {
  const ExploreNFTScreen({super.key});

  @override
  ConsumerState<ExploreNFTScreen> createState() => _ExploreNFTScreenState();
}

class _ExploreNFTScreenState extends ConsumerState<ExploreNFTScreen> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _slideAnimation2;
  late TabController _tabController;
  bool _isGridView = true; // Track if view is grid or list
  int _selectedNavIndex = 0; // Track selected nav item
  bool _isMoreOptionsSelected = false; // Track if more options are selected
  
  @override
  void initState() {
    super.initState();

    _searchController.addListener(_onSearchChanged);
    
    _tabController = TabController(
      length: 4,
      vsync: this,
    );

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _slideAnimation2 = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, 0.03),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, 0.03),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 20,
      ),
    ]).animate(_animationController);

    _slideAnimation = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, -0.03),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, -0.03),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 20,
      ),
    ]).animate(_animationController);

    _animationController.forward();
  }

  void _onSearchChanged() {
    ref.read(exploreNotifierProvider.notifier).searchTokens(_searchController.text);
  }

  void _toggleViewMode() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }
  
  void _onNavItemTapped(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
    
    // Navigate based on the selected index
    if (index == 1) { // Cart index
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CartScreen(),
        ),
      );
    } else if (index == 2) { // Orders index
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ExploreOrderScreen(),
        ),
      );
    }

    else if (index == 3) { // Spins index
      // Navigate to spins screen
    }
    else if (index == 0) { // Sell index
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ExploreSellScreen(),
      ),
    );
    } else if (index == 4) { // Sell index
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CartScreen(),
        ),
    );
      // Navigate to sell screen
    }
    // Add other navigation options as needed
  }

  void _onHidePressed() {
    // Implement hide functionality
  }

  void _onSortPressed() {
    // Implement sort functionality
  }

  void _onWatchlistPressed() {
    // Implement watchlist functionality
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _animationController.dispose();
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exploreState = ref.watch(exploreNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'NFT Explore',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: <Widget>[
                SearchBarToggleWidget(
                  searchController: _searchController,
                  exploreState: exploreState,
                ),
                const NFTHeroCarousel(),
                
                // Custom Tab Bar with trailing action buttons
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Row(
                        children: [
                          // Tab Bar
                          Expanded(
                            child: CustomTabBar(
                              tabController: _tabController,
                              tabs: const ['Top', 'New', 'Trending', 'Mint'],
                              isScrollable: true,
                              withPositionedIndicator: false,
                            ),
                          ),
                          
                          // Action buttons
                          Row(
                            children: [
                              // Filter icon
                              IconButton(
                                icon: Icon(
                                  PhosphorIcons.funnelSimple(),
                                  size: 22.sp,
                                  color: AppColors.greyDark,
                                ),
                                onPressed: () {
                                  // Implement filter functionality
                                },
                              ),
                              
                              // Grid/List view toggle
                              IconButton(
                                icon: Icon(
                                  _isGridView 
                                    ? PhosphorIcons.rows()  // Show list icon when in grid view
                                    : PhosphorIcons.squaresFour(),  // Show grid icon when in list view
                                  size: 22.sp,
                                  color: AppColors.greyDark,
                                ),
                                onPressed: _toggleViewMode,
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                      // Bottom divider
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
                
                // Tab content - add padding at the bottom to account for the nav bar
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Top NFTs Tab
                      _buildItemsTabContent(),
                      
                      // New NFTs Tab
                      _buildItemsTabContent(),
                      
                      // Trending NFTs Tab
                      _buildItemsTabContent(),
                      
                      // Mint NFTs Tab
                      _buildItemsTabContent(),
                    ],
                  ),
                ),
              ],
            ),
            
            // Custom Bottom Navigation Bar
            CustomNavBar(
              pageIndex: _selectedNavIndex,
              onTabChange: _onNavItemTapped,
              isMoreOptionsSelected: _isMoreOptionsSelected,
              onHidePressed: _onHidePressed,
              onSortPressed: _onSortPressed,
              onWatchlistPressed: _onWatchlistPressed,
              isNFTExplore: true, // <--- This flag switches the nav bar layout!
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildItemsTabContent() {
    final List<NFTItemData> nftItems = List.generate(
      6, 
      (index) => NFTItemData(
        id: 'NFT #${index + 1}',
        imageUrl: 'assets/images/nft_image1.png',
        price: '0.${(index + 1) * 5} ETH',
      ),
    );
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: _isGridView
          ? GridView.builder(
              padding: EdgeInsets.only(top: 16.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 2.h,
                mainAxisExtent: 250.h,
              ),
              itemCount: nftItems.length,
              itemBuilder: (BuildContext context, int index) {
                final NFTItemData nft = nftItems[index];
                return NFTItemCard(
                  nft: nft,
                  heroTag: index == 0 ? 'nft-hero-image' : null, // Only first item gets the hero tag
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NFTDetailScreen()),
                    );
                  },
                );
              },
            )
          : ListView.builder(
              padding: EdgeInsets.only(top: 16.h),
              itemCount: nftItems.length,
              itemBuilder: (BuildContext context, int index) {
                final NFTItemData nft = nftItems[index];
                return NFTListItem(
                  imageUrl: nft.imageUrl,
                  name: nft.id,
                  price: nft.price,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NFTDetailScreen()),
                    );
                  },
                );
              },
            ),
    );
  }
}

class NFTItemCard extends StatelessWidget {
  const NFTItemCard({
    required this.nft,
    this.onTap,
    this.heroTag,
    super.key,
  });

  final NFTItemData nft;
  final VoidCallback? onTap;
  final String? heroTag;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap ?? () {
      print('Tapped on NFT: ${nft.id}');
    },
    child: Column(
      children: <Widget>[
        heroTag != null
            ? Hero(
                tag: heroTag!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    nft.imageUrl,
                    width: 168.h,
                    height: 168.h,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 168.h,
                        height: 168.h,
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey[500],
                            size: 40.r,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  nft.imageUrl,
                  width: 168.h,
                  height: 168.h,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 168.h,
                      height: 168.h,
                      color: Colors.grey[300],
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey[500],
                          size: 40.r,
                        ),
                      ),
                    );
                  },
                ),
              ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nft.id,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                Gap(4.h),
                Text(
                  nft.price,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyLight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class NFTListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final VoidCallback? onTap;

  const NFTListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 2.h),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          child: Row(
            children: <Widget>[
              // NFT Image with rounded rectangle
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 44.w,
                  height: 44.h,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 44.w,
                      height: 44.h,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[500],
                        size: 20.r,
                      ),
                    );
                  },
                ),
              ),
              
              SizedBox(width: 16.w),
              
              // NFT Details - explicitly set to start at the leading edge
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Ensures left alignment
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Right side - Price information with trailing decoration
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_drop_up,
                        color: Colors.green,
                        size: 16.sp,
                      ),
                      Text(
                        '2.4%',  // Example percentage
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NFTItemData {
  final String id;
  final String imageUrl;
  final String price;

  NFTItemData({
    required this.id,
    required this.imageUrl,
    required this.price,
  });
}
