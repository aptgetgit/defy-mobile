import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_tab_bar.dart';
import '../providers/explore_provider.dart';
import '../widgets/search_bar_toggle_widget.dart';
import '../widgets/nft_hero_carousel.dart';

import '../widgets/nft_grid.dart';

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
    final List<Map<String, String>> nftItems = [
      {
        'imageUrl': 'https://i.seadn.io/gcs/files/3a5633d4f4374535efe8760919229b0e.png?auto=format&dpr=1&w=1000',
        'name': 'Cyberpunk kid #6823',
        'price': '0.0APT',
      },
      {
        'imageUrl': 'https://i.seadn.io/s/raw/files/96008751ea35fab46c85f688f521054b.png?auto=format&dpr=1&w=1000',
        'name': 'Cyberpunk kid #6823',
        'price': '0.0APT',
      },
      {
        'imageUrl': 'https://i.seadn.io/s/raw/files/6e8b6e53ca87016580ec4bb58a66466a.png?auto=format&dpr=1&w=1000',
        'name': 'Cyberpunk kid #6823',
        'price': '0.0APT',
      },
      {
        'imageUrl': 'https://i.seadn.io/s/raw/files/3469b206cc467c4d30a30d5fb01c3ed5.png?auto=format&dpr=1&w=1000',
        'name': 'Cyberpunk kid #6823',
        'price': '0.0APT',
      },
    ];

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
        child: Column(
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
                                ? PhosphorIcons.squaresFour()
                                : PhosphorIcons.rows(),
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
            
            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Top NFTs Tab
                  _buildNFTTabContent(
                    nftItems: nftItems, 
                    isGridView: _isGridView,
                    title: 'Top NFTs',
                  ),
                  
                  // New NFTs Tab
                  _buildNFTTabContent(
                    nftItems: nftItems, 
                    isGridView: _isGridView,
                    title: 'New NFTs',
                  ),
                  
                  // Trending NFTs Tab
                  _buildNFTTabContent(
                    nftItems: nftItems, 
                    isGridView: _isGridView,
                    title: 'Trending NFTs',
                  ),
                  
                  // Mint NFTs Tab
                  _buildNFTTabContent(
                    nftItems: nftItems, 
                    isGridView: _isGridView,
                    title: 'Mint NFTs',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildNFTTabContent({
    required List<Map<String, String>> nftItems,
    required bool isGridView,
    required String title,
  }) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SlideTransition(
              position: _slideAnimation,
              child: Column(
                children: <Widget>[
                  // We don't need the section title anymore since we have tabs
                  // But we can show a section-specific card or feature here if needed
                  NFTGrid(
                    nftItems: nftItems, 
                    isGridView: isGridView,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
