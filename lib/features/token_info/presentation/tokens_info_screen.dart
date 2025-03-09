import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../app/routes/router.dart';
import '../../../config/theme/colors.dart';
import '../../explore/presentation/scrceens/explore_screen.dart';
import '../../shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../../token_info/presentation/shared/staking_chart.dart';
import '../../watchlist/presentation/watchlist_avatar_nft_screen.dart';
import '../../watchlist/presentation/watchlist_cute_nft_screen.dart';
import '../../watchlist/presentation/watchlist_safety_tokens_screen.dart';
import 'about_page.dart';
import 'activity_page.dart';
import 'analytics_page.dart';
import 'price_alert_page.dart';
import 'shared/token_watchlist_bottom_sheet.dart';

class TokensInfoScreen extends StatefulWidget {
  const TokensInfoScreen({super.key});

  @override
  _TokensInfoScreenState createState() => _TokensInfoScreenState();
}

class _TokensInfoScreenState extends State<TokensInfoScreen> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  final double _investmentAmount = 10000;
  final String _timePeriod = '1M';
  double _scrollOffset = 0;
  OverlayEntry? _overlayEntry;
  final Set<int> _watchlistTokens = <int>{};
  final Set<int> _selectedTokens = <int>{};

  final Map<int, Widget> _collectionScreens = <int, Widget>{
    0: const WatchlistSafetyTokensScreen(),
    1: const WatchlistAvatarNFTScreen(),
    2: const WatchlistCuteNFTScreen(),
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double scrollProgress = (_scrollOffset / 200).clamp(0.0, 1.0);

    const double startX = 16;
    const double startY = 190;
    final double endX = (screenWidth - 100) / 2 - 40;
    const double endY = 70;

    final double animatedX = startX + (endX - startX) * scrollProgress;
    final double animatedY = startY - (startY - endY) * scrollProgress;
    final double textSize = 24 - (8 * scrollProgress);

    const double investorsStartX = 16;
    const double investorsStartY = 226;
    final double investorsEndX = (screenWidth - 200) / 2 + 60;
    const double investorsEndY = 73;

    final double animatedInvestorsX = investorsStartX + (investorsEndX - investorsStartX) * scrollProgress;
    final double animatedInvestorsY = investorsStartY - (investorsStartY - investorsEndY) * scrollProgress;
    final double investorsTextSize = 14 - (2 * scrollProgress);

    final TextPainter investorsTextPainter = TextPainter(
      text: TextSpan(
        text: r'$2,212.21',
        style: TextStyle(fontSize: investorsTextSize, color: Colors.grey[600]),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final double amountStartX = screenWidth - 120;
    const double amountStartY = 193;
    final double amountEndX = (screenWidth - 200) / 2 + 11;
    const double amountEndY = 90;

    final double animatedAmountX = amountStartX + (amountEndX - amountStartX) * scrollProgress;
    final double animatedAmountY = amountStartY - (amountStartY - amountEndY) * scrollProgress;
    final double amountTextSize = 24 - (12 * scrollProgress);

    final double percentageStartX = screenWidth - 67;
    const double percentageStartY = 226;
    final double percentageEndX = investorsStartX + investorsTextPainter.width + 98;
    const double percentageEndY = 90;

    final double animatedPercentageX = percentageStartX + (percentageEndX - percentageStartX) * scrollProgress;
    final double animatedPercentageY = percentageStartY - (percentageStartY - percentageEndY) * scrollProgress;
    final double percentageTextSize = 14 - (2 * scrollProgress);

    final double imageStartX = screenWidth / 2 - 180;
    const double imageStartY = 140;
    const double imageEndX = 60;
    const double imageEndY = 75;

    final double animatedImageX = imageStartX + (imageEndX - imageStartX) * scrollProgress;
    final double animatedImageY = imageStartY - (imageStartY - imageEndY) * scrollProgress;
    final double imageSize = 40 - (10 * scrollProgress);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 200,
                leading: IconButton(
                  icon: const Icon(
                    PhosphorIconsBold.caretLeft, // Corrected to use PhosphorIconsBold
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ExploreScreen()),
                    );
                  },
                ),
                pinned: true,
               actions: <Widget>[
                IconButton(
                  icon: Icon(PhosphorIcons.star()),
                  onPressed: _showWatchlistBottomSheet,
                ),
                IconButton(
                  icon:  Icon(PhosphorIcons.bell()),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => const PriceAlertPage()),
                    );
                  },
                ),
              ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const StakingChart(),
                      const Gap(16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _buildInfoContainer('100 APT', 'Balance'),
                            _buildInfoContainer(r'$10.09', 'AVG BUY PRICE'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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
              SliverFillRemaining(
                child: TabBarView(
                  controller: _tabController,
                  children: const <Widget>[
                    AboutPage(),
                    ActivityPage(),
                    AnalyticsPage(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: animatedX,
            top: animatedY,
            child: Text(
              'Aptos',
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: animatedInvestorsX,
            top: animatedInvestorsY,
            child: Text(
              'APT',
              style: TextStyle(
                fontSize: investorsTextSize,
                color: Colors.grey[600],
              ),
            ),
          ),
          Positioned(
            left: animatedAmountX,
            top: animatedAmountY,
            child: Text(
              r'$2,212.21',
              style: TextStyle(
                fontSize: amountTextSize,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: animatedImageX,
            top: animatedImageY,
            child: SizedBox(
              width: imageSize,
              height: imageSize,
              child: Image.asset('assets/icons/aptos.png'),
            ),
          ),
          Positioned(
            left: animatedPercentageX,
            top: animatedPercentageY,
            child: Row(
              children: <Widget>[
                Text(
                  '3.16%',
                  style: TextStyle(
                    fontSize: percentageTextSize,
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(4),
                Icon(
  PhosphorIcons.arrowDown(), // Call the function with a style
  size: 14,
  color: Colors.green,
),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
        buttonText1: 'Stake Now',
        buttonColor1: AppColors.black,
        onTap1: () {
          const StakeAmountRoute().push(context);
        },
        image1: 'avatar-1.png',
        image2: 'avatar-2.png',
        image3: 'avatar-3.png',
        headerText: 'James, Jane and 14+ hold >',
      ),
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

  void _showWatchlistBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) =>  TokenWatchlistBottomSheet(
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

                if (collectionIndex != null && _collectionScreens.containsKey(collectionIndex)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => _collectionScreens[collectionIndex]!),
                  );
                } else {
                  print('Invalid collection index or screen not found.');
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

    Future.delayed(const Duration(seconds: 3), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  Widget _buildPoolLogo({bool small = false}) => Image.asset(
      'assets/icons/aptos.png',
      height: small ? 24 : 32,
    );
}
