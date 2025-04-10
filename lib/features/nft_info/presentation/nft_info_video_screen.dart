import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:video_player/video_player.dart';

import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';

import '../../token_info/presentation/about_page.dart';
import '../../token_info/presentation/price_alert_page.dart';
import '../../token_info/presentation/shared/token_watchlist_bottom_sheet.dart';
import '../../token_info/providers/token_info_controller.dart';
import '../../watchlist/presentation/watchlist_avatar_nft_screen.dart';
import '../../watchlist/presentation/watchlist_cute_nft_screen.dart';
import '../../watchlist/presentation/watchlist_safety_tokens_screen.dart';
import '../models/video_player_provider.dart';
import '../shared/nft_info_bottom_navbar.dart';
import 'analytics_page.dart';
import 'order_page.dart';

// Create a provider for VideoPlayerProvider
final ChangeNotifierProviderFamily<VideoPlayerProvider, String> videoPlayerProvider = ChangeNotifierProvider.family<VideoPlayerProvider, String>(
  (Ref<VideoPlayerProvider> ref, String videoPath) => VideoPlayerProvider(videoPath),
);

class NftVideoScreen extends ConsumerStatefulWidget {
  const NftVideoScreen({super.key});

  @override
  ConsumerState<NftVideoScreen> createState() => _NftInfoVideoScreenState();
}

class _NftInfoVideoScreenState extends ConsumerState<NftVideoScreen>
    with TickerProviderStateMixin {
  bool _showMiniPlayer = false;
  final double _miniPlayerHeight = 180.h;
  final double _miniPlayerWidth = 180.w;
  String coinLogoUrl = '';
  String nftName = 'Monkey #1212'; // Changed from Cyborg to Monkey
  String owner = 'Fantasy Ruins';
  String priceUsd = '\$201.21'; // Added price
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
  final String _videoPath = 'assets/videos/nft_video.mp4';

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
    _tabController = TabController(length: 3, vsync: this); // Changed to 3 tabs for About, Orders, Analytics
    
    // Initialize the video player early
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(videoPlayerProvider(_videoPath));
    });
  }

  @override
  void dispose() {
    _scrollController..removeListener(_onScroll)
    ..dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Threshold should be around where the video player disappears from view
    final double miniPlayerThreshold = 370.h; // Adjust based on your layout
    
    if (_scrollController.offset > 100 && !_showTitle) {
      setState(() {
        _showTitle = true;
      });
    } else if (_scrollController.offset <= 100 && _showTitle) {
      setState(() {
        _showTitle = false;
      });
    }
    
    // Control mini player visibility
    if (_scrollController.offset > miniPlayerThreshold && !_showMiniPlayer) {
      setState(() {
        _showMiniPlayer = true;
      });
    } else if (_scrollController.offset <= miniPlayerThreshold && _showMiniPlayer) {
      setState(() {
        _showMiniPlayer = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double appBarExpandedHeight = 188.h;
    final double imageWidth = 353.w;
    final double imageHeight = 353.h;
    // final double appBarImageSize = 32.w;
    final double maxScrollExtent = appBarExpandedHeight - kToolbarHeight;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double safeTopPosition = statusBarHeight + 12.h;
    final VideoPlayerProvider videoProvider = ref.watch(videoPlayerProvider(_videoPath));
    
    // Calculate positions for NFT name text
    final double monkeyStartX = 24.w;
    final double monkeyStartY = appBarExpandedHeight - 65.h;
    final double monkeyEndY = safeTopPosition - 6.h;
    final double monkeyEndX = 100.w;
    
    // Calculate positions for Fantasy Ruins text
    final double fantasyStartX = 24.w;
    final double fantasyStartY = appBarExpandedHeight - 22.h;
    final double fantasyEndY = monkeyEndY + 20.h;
    final double fantasyEndX = monkeyEndX;
  
    return Stack(
      children: [
        Scaffold(
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
                        // Video player instead of static image
                        GestureDetector(
                          onTap:() {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) => FullScreenVideoScreen(videoPath: _videoPath),
                            ),);
                          },
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              // Video player
                              Container(
                                width: imageWidth,
                                height: imageHeight,
                                margin: EdgeInsets.only(top: 90.h), // Add padding at top for text
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: videoProvider.isInitialized
                                    ? AspectRatio(
                                        aspectRatio: videoProvider.videoPlayerController.value.aspectRatio,
                                        child: VideoPlayer(videoProvider.videoPlayerController),
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.w,
                                        ),
                                      ),
                                ),
                              ),
                              // Play button overlay
                              if (videoProvider.isInitialized && !videoProvider.isPlaying)
                                Positioned.fill(
                                  child: Center(
                                    child: DecoratedBox(
                                      decoration: const BoxDecoration(
                                        color: Colors.black38,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        iconSize: 50.sp,
                                        icon: Icon(PhosphorIconsFill.play, size: 50.sp),
                                        onPressed: videoProvider.pauseOrResume,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Gap(26.h),
                        // Replace previous controls section with our controls
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: <Widget>[
                              // Video duration progress bar
                              SliderTheme(
                                data: SliderThemeData(
                                  overlayShape: SliderComponentShape.noOverlay,
                                  trackHeight: 4.h,
                                  trackShape: const RectangularSliderTrackShape(),
                                  thumbShape:
                                      RoundSliderThumbShape(enabledThumbRadius: 3.r),
                                ),
                                child: Slider(
                                  max: videoProvider.totalDuration.inSeconds.toDouble(),
                                  value: videoProvider.currentDuration.inSeconds.toDouble(),
                                  onChanged: (double value) {
                                    videoProvider.seekTo(Duration(seconds: value.toInt()));
                                  },
                                  activeColor: Colors.black,
                                  inactiveColor: Colors.grey[100],
                                  thumbColor: Colors.black,
                                ),
                              ),
                              Gap(8.h),
                              
                              // Time indicators
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      _formatTime(videoProvider.currentDuration),
                                      style: TextStyle(
                                        color: AppColors.greyLight,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Text(
                                      _formatTime(videoProvider.totalDuration),
                                      style: TextStyle(
                                        color: AppColors.greyLight,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gap(16.h),
                              
                              // Playback controls
                              Row(
                                children: <Widget>[
                                  // Rewind button
                                  Expanded(
                                    child: IconButton(
                                      iconSize: 40.sp,
                                      icon: Icon(Icons.replay_10, size: 40.sp),
                                      onPressed: videoProvider.seekBackward,
                                    ),
                                  ),
                                  Gap(20.w),
                                  
                                  // Play/pause button
                                  Expanded(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      radius: 27.r,
                                      child: Center(
                                        child: IconButton(
                                          iconSize: 30.sp,
                                          icon: Icon(
                                            videoProvider.isPlaying
                                              ? PhosphorIconsFill.pause
                                              : PhosphorIconsFill.play,
                                            size: 30.sp,
                                          ),
                                          onPressed: () {
                                            if (!videoProvider.isPlaying) {
                                              videoProvider.playVideo();
                                            } else {
                                              videoProvider.pauseOrResume();
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(20.w),
                                  
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
                        SizedBox(height: 35.h),
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
          bottomNavigationBar: const NftInfoBottomNavBar(),
        ),
        // Add animated text elements for NFT name and creator
        AnimatedBuilder(
          animation: _scrollController,
          builder: (BuildContext context, Widget? child) {
            // Recalculate positions based on current scroll
            final double scrollProgress = _scrollController.hasClients
                ? (_scrollController.offset / maxScrollExtent).clamp(0.0, 1.0)
                : 0.0;
                
            final double monkeyAnimatedX = monkeyStartX + (monkeyEndX - monkeyStartX) * scrollProgress;
            final double monkeyAnimatedY = monkeyStartY + (monkeyEndY - monkeyStartY) * scrollProgress;
            final double monkeyTextSize = (22 - (8 * scrollProgress)).sp;
            
            final double fantasyAnimatedX = fantasyStartX + (fantasyEndX - fantasyStartX) * scrollProgress;
            final double fantasyAnimatedY = fantasyStartY + (fantasyEndY - fantasyStartY) * scrollProgress;
            final double fantasyTextSize = (14 - (2 * scrollProgress)).sp;
            
            return Material(
              type: MaterialType.transparency,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: monkeyAnimatedX,
                    top: monkeyAnimatedY,
                    child: Text(
                      nftName,
                      style: TextStyle(
                        fontSize: monkeyTextSize,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: fantasyAnimatedX,
                    top: fantasyAnimatedY,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/Fantasy-Ruins.png',
                          width: 16.w,
                          height: 16.h,
                        ),
                        Gap(4.w),
                        Text(
                          owner,
                          style: TextStyle(
                            fontSize: fantasyTextSize,
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
              ),
            );
          },
        ),
        // Add price indicator on the right
        Positioned(
          top: appBarExpandedHeight - 65.h, // Position below app bar
          right: 24.w,
          child: Material(
            type: MaterialType.transparency,
            child: AnimatedOpacity(
              opacity: _showTitle ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    priceUsd,
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
        ),
        // Keep the mini player code
        if (_showMiniPlayer)
          Positioned(
            right: 16.w,
            bottom: 16.h + (_miniPlayerHeight / 2),
            child: _buildMiniPlayer(context, videoProvider),
          ),
      ],
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

  Widget _buildMiniPlayer(BuildContext context, VideoPlayerProvider videoProvider) => AnimatedOpacity(
      opacity: _showMiniPlayer ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          // Scroll back to the top when mini player is tapped
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Container(
          width: _miniPlayerWidth,
          height: _miniPlayerHeight,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10.r,
                offset: Offset(0, 5.h),
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              // Mini video player
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: videoProvider.isInitialized
                  ? SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: videoProvider.videoPlayerController.value.size.width,
                          height: videoProvider.videoPlayerController.value.size.height,
                          child: VideoPlayer(videoProvider.videoPlayerController),
                        ),
                        ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.w,
                      ),
                    ),
              ),
              
              // Play/pause button overlay
              Positioned.fill(
                child: Center(
                  child: AnimatedOpacity(
                    opacity: videoProvider.isPlaying ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        videoProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
              
              // Video title and progress indicator
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.r),
                      bottomRight: Radius.circular(8.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Monkey',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      // Video progress bar
                      LinearProgressIndicator(
                        value: videoProvider.isInitialized
                            ? videoProvider.currentDuration.inMilliseconds / 
                              videoProvider.totalDuration.inMilliseconds
                            : 0,
                        backgroundColor: Colors.grey[700],
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                        minHeight: 2.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
    );
  
  // Format duration helper
  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String minutes = twoDigits(duration.inMinutes.remainder(60));
    final String seconds = twoDigits(duration.inSeconds.remainder(60));
    
    return '$minutes:$seconds';
  }

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
              ref.watch(videoPlayerProvider(_videoPath)).isPlaying
                ? PhosphorIconsFill.pause
                : PhosphorIconsFill.play,
              color: AppColors.black,
              size: 20.sp,
            ),
            onPressed: () {
              final videoProvider = ref.read(videoPlayerProvider(_videoPath));
              if (!videoProvider.isPlaying) {
                videoProvider.playVideo();
              } else {
                videoProvider.pauseOrResume();
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

    Future.delayed(const Duration(seconds: 3), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  Widget _buildPoolLogo({bool small = false}) => Container(
    width: small ? 24.w : 32.w,
    height: small ? 24.h : 32.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.r),
      image: const DecorationImage(
        image: AssetImage('assets/images/cyborg2.png'),
        fit: BoxFit.cover,
      ),
    ),
  );
}

// Full screen video player screen
class FullScreenVideoScreen extends ConsumerWidget {
  const FullScreenVideoScreen({required this.videoPath, super.key});

  final String videoPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VideoPlayerProvider videoProvider = ref.watch(videoPlayerProvider(videoPath));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Center(
            child: videoProvider.isInitialized
                ? GestureDetector(
                    onTap: videoProvider.pauseOrResume,
                    child: AspectRatio(
                      aspectRatio: videoProvider.videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(videoProvider.videoPlayerController),
                    ),
                  )
                : CircularProgressIndicator(color: Colors.white, strokeWidth: 2.w),
          ),
          Positioned(
            top: 52.h,
            left: 12.w,
            child: IconButton(
              icon: Icon(PhosphorIconsBold.caretLeft, color: Colors.white, size: 24.sp),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Add play/pause button in center when video is paused
          if (!videoProvider.isPlaying)
            Positioned.fill(
              child: Center(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    iconSize: 60.sp,
                    color: Colors.white,
                    icon: Icon(PhosphorIconsFill.play, size: 60.sp),
                    onPressed: videoProvider.pauseOrResume,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}