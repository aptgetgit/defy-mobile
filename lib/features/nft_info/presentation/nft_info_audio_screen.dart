import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';


import '../../token_info/presentation/about_page.dart';
import '../../token_info/presentation/price_alert_page.dart';
import '../../token_info/presentation/shared/token_watchlist_bottom_sheet.dart';
import '../../token_info/providers/token_info_controller.dart';
import '../../watchlist/presentation/watchlist_avatar_nft_screen.dart';
import '../../watchlist/presentation/watchlist_cute_nft_screen.dart';
import '../../watchlist/presentation/watchlist_safety_tokens_screen.dart';
import '../models/audio.dart';
import '../models/audio_player_provider.dart';
import '../shared/nft_info_bottom_navbar.dart';
import 'analytics_page.dart';
import 'order_page.dart';



class NftAudioScreen extends ConsumerStatefulWidget {
  const NftAudioScreen({super.key});

  @override
  ConsumerState<NftAudioScreen> createState() => _NftInfoAudioScreenState();
}

class _NftInfoAudioScreenState extends ConsumerState<NftAudioScreen>
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
    _tabController = TabController(length: 3, vsync: this); // Changed to 3 tabs for About, Orders, Analytics
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

  //format duration
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String minutes = twoDigits(duration.inMinutes.remainder(60));
    final String seconds = twoDigits(duration.inSeconds.remainder(60));

    return '$minutes:$seconds';
  }

  Audio get song => Audio(
      audioName: 'Cyborg',
      authorName: 'Fantasy Ruins',
      nftArtPath: 'assets/images/cyborg2.png',
      audioPath: 'audios/cyborg.mp3',);

  @override
  Widget build(BuildContext context) {
    final double appBarExpandedHeight = 188.h;
    final double imageWidth = 353.w;
    final double imageHeight = 353.h;
    final double appBarImageSize = 32.w;
    final double maxScrollExtent = appBarExpandedHeight - kToolbarHeight;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double safeTopPosition = statusBarHeight + 12.h;
    final AudioPlayerProvider audioProvider = ref.watch(audioPlayerProvider);
    
    // Calculate positions for NFT name text
    final double nameStartX = 24.w;
    final double nameStartY = appBarExpandedHeight - 65.h;
    final double nameEndY = safeTopPosition - 6.h;
    final double nameEndX = 100.w;
    
    // Calculate positions for Fantasy Ruins text
    final double ownerStartX = 24.w;
    final double ownerStartY = appBarExpandedHeight - 22.h;
    final double ownerEndY = nameEndY + 20.h;
    final double ownerEndX = nameEndX;
  
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ColoredBox(
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
                        Gap(100.h),
                        Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            AnimatedBuilder(
                              animation: _scrollController,
                              builder: (BuildContext context, Widget? child) {
                                final double scrollProgress = _scrollController.hasClients
                                    ? (_scrollController.offset / maxScrollExtent)
                                        .clamp(0.0, 1.0)
                                    : 0.0;
                        
                                final double animatedWidth =
                                    imageWidth - (imageWidth - appBarImageSize) * scrollProgress;
                                final double animatedHeight =
                                    imageHeight - (imageHeight - appBarImageSize) * scrollProgress;
                        
                                final double imageXOffset = (353.w - imageWidth) / 2;
                                final double targetXOffset = 16.w;
                        
                                final double animatedX = imageXOffset +
                                    (targetXOffset - imageXOffset) * scrollProgress;
                        
                                const double imageYOffset = 0;
                                final double targetYOffset = 16.h;
                        
                                final double animatedY = imageYOffset +
                                    (targetYOffset - imageYOffset) * scrollProgress;
                        
                                return SizedBox(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                                      child: AnimatedPositioned(
                                        duration: const Duration(milliseconds: 300),
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
                        Gap(26.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: <Widget>[
                              //song duration progress
                              Column(
                                children: <Widget>[
                                  //song progress bar
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                                    child: SliderTheme(
                                      data: SliderThemeData(
                                        overlayShape: SliderComponentShape.noOverlay,
                                        trackHeight: 4.h,
                                        trackShape: const RectangularSliderTrackShape(),
                                        thumbShape:
                                            RoundSliderThumbShape(enabledThumbRadius: 3.r),
                                      ),
                                      child: Slider(
                                        max: audioProvider.totalDuration.inSeconds.toDouble(),
                                        value: audioProvider.currentDuration.inSeconds.toDouble(),
                                        onChanged: (double value) {
                                          audioProvider.seekTo(Duration(seconds: value.toInt()));
                                        },
                                        activeColor: Colors.black,
                                        inactiveColor: Colors.grey[100],
                                        thumbColor: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        //start time
                                        Text(
                                          formatTime(audioProvider.currentDuration),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.sp,
                                          ),
                                        ),
    
                                        //end time
                                        Text(
                                          formatTime(audioProvider.totalDuration),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
    
                              Gap(20.h),
    
                              //playback controls
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: IconButton(
                                      iconSize: 40.sp,
                                      icon: Icon(Icons.replay_10, size: 40.sp),
                                      onPressed: audioProvider.seekBackward,
                                    ),
                                  ),
                                  Gap(20.w),
    
                                  //play/pause button
                                  Expanded(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      radius: 27.r,
                                      child: Center(
                                        child: IconButton(
                                          iconSize: 30.sp,
                                          icon: Icon(
                                            audioProvider.isPlaying
                                              ? PhosphorIconsFill.pause
                                              : PhosphorIconsFill.play,
                                            size: 30.sp,
                                          ),
                                          onPressed: () {
                                            if (!audioProvider.isPlaying) {
                                              audioProvider.playAudio(song.audioPath);
                                            } else {
                                              audioProvider.pauseOrResume();
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(20.w),
    
                                  //+15 seconds
                                  Expanded(
                                    child: IconButton(
                                      iconSize: 32.sp,
                                      icon: Icon(PhosphorIconsRegular.shareNetwork, size: 32.sp),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Gap(35.h),
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
                        'About',    // Keep the About tab
                        'Orders',   // Add Orders tab
                        'Analytics' // Add Analytics tab
                      ],
                    ),
                  ),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 1.3,
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        const AboutPage(), // Keep the About page
                        OrderPage(),      // Add Orders page
                        const AnalyticsOverviewPage(), // Add Analytics page
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _scrollController,
            builder: (BuildContext context, Widget? child) {
              // Recalculate positions based on current scroll
              final double scrollProgress = _scrollController.hasClients
                  ? (_scrollController.offset / maxScrollExtent).clamp(0.0, 1.0)
                  : 0.0;
              
              final double nameAnimatedX = nameStartX + (nameEndX - nameStartX) * scrollProgress;
              final double nameAnimatedY = nameStartY + (nameEndY - nameStartY) * scrollProgress;
              final double nameTextSize = (22 - (8 * scrollProgress)).sp;
              
              final double ownerAnimatedX = ownerStartX + (ownerEndX - ownerStartX) * scrollProgress;
              final double ownerAnimatedY = ownerStartY + (ownerEndY - ownerStartY) * scrollProgress;
              final double ownerTextSize = (14 - (2 * scrollProgress)).sp;
              
              return Stack(
                children: <Widget>[
                  Positioned(
                    left: nameAnimatedX,
                    top: nameAnimatedY,
                    child: Text(
                      'Monkey #1212',
                      style: TextStyle(
                        fontSize: nameTextSize,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: ownerAnimatedX,
                    top: ownerAnimatedY,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/Fantasy-Ruins.png',
                          width: 16.w,
                          height: 16.h,
                        ),
                        Gap(4.w),
                        Text(
                          'Fantasy Ruins',
                          style: TextStyle(
                            fontSize: ownerTextSize,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyLight,
                          ),
                        ),
                        Gap(4.w),
                        Icon(
                          PhosphorIconsFill.sealCheck,
                          color: AppColors.blue,
                          size: 16.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: appBarExpandedHeight - 65.h, // Position below app bar
            right: 24.w,
            child: AnimatedOpacity(
              opacity: _showTitle ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    r'$201.21',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  Gap(12.h),
                  Text(
                    'Floor Price',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NftInfoBottomNavBar(),
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

  Widget _buildSliverAppBar(BuildContext context) {
    final AudioPlayerProvider audioProvider = ref.watch(audioPlayerProvider);
    
    return SliverAppBar(
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
          icon: Icon(
            PhosphorIconsRegular.star,
            color: AppColors.black,
            size: 24.sp,
          ),
          onPressed: _showWatchlistBottomSheet,
        ),
        Stack(
          children: <Widget>[
            IconButton(
              icon: Icon(
                PhosphorIconsRegular.bell,
                color: AppColors.black,
                size: 24.sp,
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
        // Play button that appears when scrolled
        if (_showTitle)
          AnimatedOpacity(
            opacity: _showTitle ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              icon: Icon(
                audioProvider.isPlaying
                  ? PhosphorIconsFill.pause
                  : PhosphorIconsFill.play,
                color: AppColors.black,
                size: 20.sp,
              ),
              onPressed: () {
                if (!audioProvider.isPlaying) {
                  audioProvider.playAudio(song.audioPath);
                } else {
                  audioProvider.pauseOrResume();
                }
              },
            ),
          ),
        Gap(8.w),
      ],
      titleSpacing: 0,
      title: AnimatedOpacity(
        opacity: _showTitle ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: Row(
          children: <Widget>[
            _buildPoolLogo(),
          ],
        ),
      ),
    );
  }

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
        bottom: 120.h, // Adjust position as needed
        left: 35.w,
        right: 35.w,
        child: Material(
          // Wrap with Material for shadow
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
                _overlayEntry?.remove(); // Remove the overlay
                _overlayEntry = null;

                // Navigate to the appropriate screen based on the collection index
                if (collectionIndex != null &&
                    _collectionScreens.containsKey(collectionIndex)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            _collectionScreens[collectionIndex]!,),
                  );
                } else {
                  // Handle the case where the collection index is null or not found in the map
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
                        fontSize: 16.sp,),
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