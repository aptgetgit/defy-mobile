import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:video_player/video_player.dart';

import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../../token_info/presentation/about_page.dart';
import '../../token_info/presentation/activity_page.dart';
import '../../token_info/presentation/analytics_page.dart';
import '../../token_info/presentation/price_alert_page.dart';
import '../../token_info/presentation/shared/token_watchlist_bottom_sheet.dart';
import '../../token_info/providers/token_info_controller.dart';
import '../../watchlist/presentation/watchlist_avatar_nft_screen.dart';
import '../../watchlist/presentation/watchlist_cute_nft_screen.dart';
import '../../watchlist/presentation/watchlist_safety_tokens_screen.dart';
import '../models/video_player_provider.dart';
import '../shared/nft_info_bottom_navbar.dart';

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
    _tabController = TabController(length: 3, vsync: this);
    
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

  void _showPopupVideoPlayer() {
    final VideoPlayerProvider videoProvider = ref.read(videoPlayerProvider(_videoPath));

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        bottom: 20,
        right: 20,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: videoProvider.isInitialized
                ? AspectRatio(
                    aspectRatio: videoProvider.videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(videoProvider.videoPlayerController),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hidePopupVideoPlayer() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    const double imageWidth = 353;
    const double imageHeight = 353;
    final VideoPlayerProvider videoProvider = ref.watch(videoPlayerProvider(_videoPath));

    return Scaffold(
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
                        ));
                      },
                      onVerticalDragEnd: (DragEndDetails details) {
                        if (details.primaryVelocity! < 0) {
                          // Swipe up
                          _showPopupVideoPlayer();
                        } else if (details.primaryVelocity! > 0) {
                          // Swipe down
                          _hidePopupVideoPlayer();
                        }
                      },
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          // Video player
                          Container(
                            width: imageWidth,
                            height: imageHeight,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: videoProvider.isInitialized
                                ? AspectRatio(
                                    aspectRatio: videoProvider.videoPlayerController.value.aspectRatio,
                                    child: VideoPlayer(videoProvider.videoPlayerController),
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(),
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
                                    iconSize: 50,
                                    icon: const Icon(PhosphorIconsFill.play),
                                    onPressed: videoProvider.pauseOrResume,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const Gap(12),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text('Cyborg 2078 #5623',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),),
                              ),
                            ),
                            const Gap(2),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: <Widget>[
                                  RowSuper(
                                    innerDistance: -12,
                                    children: <Widget?>[
                                      Image.asset('assets/images/avatar-1.png',
                                          height: 22,),
                                      Image.asset('assets/images/avatar-2.png',
                                          height: 22,),
                                      Image.asset('assets/images/avatar-3.png',
                                          height: 22,),
                                    ],
                                  ),
                                  const Gap(10),
                                  Text(
                                    'James, Jane and 14+ hold',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.greyLight,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 46,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: AppColors.greyVeryLight,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(child: Text('1x', style: TextStyle(fontSize: 14,color: AppColors.greyLight, fontWeight: FontWeight.w500),)),
                              ),
                              const Gap(10),
                              const Icon(
                                PhosphorIconsRegular.shareNetwork,
                                color: AppColors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(26),
                    
                    // Replace info containers with video controls
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          // Video duration progress bar
                          SliderTheme(
                            data: SliderThemeData(
                              overlayShape: SliderComponentShape.noOverlay,
                              trackHeight: 14,
                              trackShape: const RectangularSliderTrackShape(),
                              thumbShape:
                                  const RoundSliderThumbShape(enabledThumbRadius: 0),
                            ),
                            child: Slider(
                              max: videoProvider.totalDuration.inSeconds.toDouble(),
                              value: videoProvider.currentDuration.inSeconds.toDouble(),
                              onChanged: (double value) {
                                videoProvider.seekTo(Duration(seconds: value.toInt()));
                              },
                              activeColor: Colors.black,
                              inactiveColor: Colors.grey[100],
                            ),
                          ),
                          const Gap(8),
                          
                          // Time indicators
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  _formatTime(videoProvider.currentDuration),
                                  style: const TextStyle(
                                    color: AppColors.greyLight,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  _formatTime(videoProvider.totalDuration),
                                  style: const TextStyle(
                                    color: AppColors.greyLight,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(16),
                          
                          // Playback controls
                          Row(
                            children: <Widget>[
                              // Rewind button
                              Expanded(
                                child: IconButton(
                                  iconSize: 40,
                                  icon: const Icon(Icons.replay_10),
                                  onPressed: videoProvider.seekBackward,
                                ),
                              ),
                              const Gap(20),
                              
                              // Play/pause button
                              Expanded(
                                child: IconButton(
                                  iconSize: 50,
                                  icon: Icon(videoProvider.isPlaying
                                      ? PhosphorIconsFill.pause
                                      : PhosphorIconsFill.play,),
                                  onPressed: videoProvider.pauseOrResume,
                                ),
                              ),
                              const Gap(20),
                              
                              Expanded(
                                child: IconButton(
                                  iconSize: 40,
                                  icon: const Icon(Icons.forward_10),
                                  onPressed: videoProvider.seekForward,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
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
                height: MediaQuery.of(context).size.height * 1.3,
                child: TabBarView(
                  controller: _tabController,
                  children: const <Widget>[
                    SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: AboutPage(),
                    ),
                    ActivityPage(),
                    AnalyticsPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NftInfoBottomNavBar(),
    );
  }
  
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
        child: const Icon(
          PhosphorIconsBold.caretLeft,
          color: AppColors.black,
          size: 24,
        ),
      ),
      collapsedHeight: 60,
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            PhosphorIconsRegular.star,
            color: AppColors.black,
          ),
          onPressed: _showWatchlistBottomSheet,
        ),
        Stack(
          children: <Widget>[
            IconButton(
              icon: const Icon(
                PhosphorIconsRegular.bell,
                color: AppColors.black,
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
                top: 8,
                right: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        const Gap(8),
      ],
      titleSpacing: 0,
      title: _showTitle
          ? AnimatedOpacity(
              opacity: _showTitle ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Row(
                children: <Widget>[
                  _buildPoolLogo(),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          nftName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(4),
                        Row(
                          children: <Widget>[
                            Text(
                              owner,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.greyLight,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Gap(6),
                            const Icon(
                              PhosphorIconsFill.sealCheck,
                              color: AppColors.blue,
                              size: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/Fantasy-Ruins.png',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
                const Gap(8),
                const Text('Fantasy Ruins',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),),
                const Gap(4),
                const Icon(
                  PhosphorIconsFill.sealCheck,
                  color: AppColors.blue,
                  size: 20,
                ),
              ],
            ),);

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
                    width: 32,
                    height: 32,
                  ),
                  const Text(
                    'Tokens Added to Watchlist',
                    style: TextStyle(
                        color: AppColors.greyDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 20,
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
    width: small ? 24 : 32,
    height: small ? 24 : 32,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
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
                : const CircularProgressIndicator(color: Colors.white),
          ),
          Positioned(
            top: 52,
            left: 12,
            child: IconButton(
              icon: const Icon(PhosphorIconsBold.caretLeft, color: Colors.white),
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
                    iconSize: 60,
                    color: Colors.white,
                    icon: const Icon(PhosphorIconsFill.play),
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
void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: NftVideoScreen(),
      ),
    ),
  );
}