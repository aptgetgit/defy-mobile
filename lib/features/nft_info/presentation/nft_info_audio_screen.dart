import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
import '../models/audio.dart';
import '../models/audio_player_provider.dart';
import '../shared/nft_info_bottom_navbar.dart';

import 'nft_gif_screen.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
    const double appBarExpandedHeight = 188;
    const double imageWidth = 353;
    const double imageHeight = 353;
    const double appBarImageSize = 32;
    const double maxScrollExtent = appBarExpandedHeight - kToolbarHeight;
    final AudioPlayerProvider audioProvider = ref.watch(audioPlayerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ColoredBox(
        color: Colors.white,
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                _buildSliverAppBar(context),
                SliverToBoxAdapter(
                  child: ColoredBox(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap:() {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const NftGifScreen()));
                          },
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              // Image.asset(
                              //   'assets/images/cyborg2.png',
                              //   width: imageWidth,
                              //   height: imageHeight,
                              //   fit: BoxFit.cover,
                              // ),
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
                          
                                  const double imageXOffset = (353 - imageWidth) / 2;
                                  const double targetXOffset = 16; // Position in the app bar
                          
                                  final double animatedX = imageXOffset +
                                      (targetXOffset - imageXOffset) * scrollProgress;
                          
                                  const double imageYOffset = 0;
                                  const double targetYOffset = 16;
                          
                                  final double animatedY = imageYOffset +
                                      (targetYOffset - imageYOffset) * scrollProgress;
                          
                                  return SizedBox(
                                    
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24),
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
                                  const Gap(16),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: <Widget>[
                              //song duration progress
                              Column(
                                children: <Widget>[
                                  //song progress bar
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: SliderTheme(
                                      data: SliderThemeData(
                                        overlayShape: SliderComponentShape.noOverlay,
                                        trackHeight: 14,
                                        trackShape: const RectangularSliderTrackShape(),
                                        thumbShape:
                                            const RoundSliderThumbShape(enabledThumbRadius: 0),
                                      ),
                                      child: Slider(
                                        max: audioProvider.totalDuration.inSeconds.toDouble(),
                                        value: audioProvider.currentDuration.inSeconds.toDouble(),
                                        onChanged: (double value) {
                                          audioProvider.seekTo(Duration(seconds: value.toInt()));
                                        },
                                        activeColor: Colors.grey[100],
                                        inactiveColor: Colors.grey[100],
                                        thumbColor: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        //start time
                                        Text(formatTime(audioProvider.currentDuration), style: const TextStyle(color: Colors.grey)),

                                        //shuffe icon

                                        //repeat icon

                                        //end time
                                        Text(formatTime(audioProvider.totalDuration), style: const TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const Gap(20),

                              //playback controls
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: IconButton(
                                      iconSize: 40,
                                      icon: const Icon(Icons.replay_10),
                                      onPressed: audioProvider.seekBackward,
                                    ),
                                  ),
                                  const Gap(20),

                                  //play/pause button
                                  Expanded(
                                    child: IconButton(
                                      iconSize: 50,
                                      icon: Icon(audioProvider.isPlaying
                                          ? PhosphorIconsFill.pause
                                          :  PhosphorIconsFill.play,),
                                      onPressed: () {
                                        if (!audioProvider.isPlaying) {
                                          audioProvider.playAudio(song.audioPath);
                                        } else {
                                          audioProvider.pauseOrResume();
                                        }
                                      },
                                    ),
                                  ),
                                  const Gap(20),

                                  //+15 seconds
                                  Expanded(
                                    child: IconButton(
                                      iconSize: 40,
                                      icon: const Icon(Icons.forward_10),
                                      onPressed: audioProvider.seekForward,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Gap(30),
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
            
            // Add the slim progress bar that appears when scrolled
            Positioned(
              top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: _showTitle ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    height: 2,
                    color: Colors.grey[200], // Background color
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: audioProvider.totalDuration.inMilliseconds > 0
                          ? audioProvider.currentDuration.inMilliseconds / 
                            audioProvider.totalDuration.inMilliseconds
                          : 0.0,
                      child: Container(
                        color: Colors.black, // Progress color
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NftInfoBottomNavBar(),
    );
  }

  Widget _buildInfoContainer(String value, String label) => Container(
        height: 65,
        width: 170,
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
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
        child: const Icon(
          PhosphorIconsBold.caretLeft,
          color: AppColors.black,
          size: 24,
        ),
      ),
      collapsedHeight: 60,
      centerTitle: false,
      actions: <Widget>[
        // Conditionally show icons based on scroll position
        if (!_showTitle)
          IconButton(
            icon: const Icon(
              PhosphorIconsRegular.star,
              color: AppColors.black,
            ),
            onPressed: _showWatchlistBottomSheet,
          ),
        if (!_showTitle)
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
        // Play button that appears when scrolled (when _showTitle is true)
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
                size: 20,
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
        const Gap(14),
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
        bottom: 120, // Adjust position as needed
        left: 35,
        right: 35,
        child: Material(
          // Wrap with Material for shadow
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

    // Hide the message after a delay
    Future.delayed(const Duration(seconds: 3), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  Widget _buildPoolLogo({bool small = false}) => Image.asset(
        'assets/images/cyborg2.png',
        height: small ? 24 : 32,
      );
}
