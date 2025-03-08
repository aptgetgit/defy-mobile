import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import '../../../stake/widgets/stake_chart.dart';
import '../../../token_info/presentation/about_page.dart';
import '../../../token_info/presentation/activity_page.dart';
import '../../../token_info/presentation/analytics_page.dart';


import 'explore_token_screen.dart';

class ExploreTokenInfoScreen extends StatefulWidget {
  final String name;
  final String logoPath;
  final String percentage;
  final String investors;
  final String returnPeriod;
  final bool isDelegate;

  const ExploreTokenInfoScreen({
    super.key,
    required this.name,
    required this.logoPath,
    required this.percentage,
    required this.investors,
    required this.returnPeriod,
    this.isDelegate = false,
  });

  @override
  _ExploreTokenInfoScreenState createState() => _ExploreTokenInfoScreenState();
}

class _ExploreTokenInfoScreenState extends State<ExploreTokenInfoScreen> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  double _scrollOffset = 0;

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
    const double investorsStartY = 235;

    final double percentageStartX = screenWidth - 80;
    const double percentageStartY = 193;
    final double percentageEndX = (screenWidth - 200) / 2 + 10;
    const double percentageEndY = 90;

    final double animatedPercentageX = percentageStartX + (percentageEndX - percentageStartX) * scrollProgress;
    final double animatedPercentageY = percentageStartY - (percentageStartY - percentageEndY) * scrollProgress;
    final double percentageTextSize = 24 - (12 * scrollProgress);

    final double imageStartX = screenWidth / 2 - 180;
    const double imageStartY = 140;
    const double imageEndX = 60;
    const double imageEndY = 75;

    final double animatedImageX = imageStartX + (imageEndX - imageStartX) * scrollProgress;
    final double animatedImageY = imageStartY - (imageStartY - imageEndY) * scrollProgress;
    final double imageSize = 40 - (10 * scrollProgress);

    final double returnsStartX = screenWidth / 2 + 108;
    const double returnsStartY = 235;

    final double investorsOpacity = 1.0 - scrollProgress;
    final double returnsOpacity = 1.0 - scrollProgress;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
             SliverAppBar(
  backgroundColor: Colors.white,
  expandedHeight: 200,
  pinned: true,
  leading: IconButton(
    icon: Icon(
      PhosphorIconsBold.caretLeft, // Corrected to PhosphorIconsBold
      color: Colors.black,
    ),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ExploreTokensScreen()),
      );
    },
  ),
  actions: <Widget>[
    IconButton(
      icon: Icon(PhosphorIconsBold.bell), // Corrected and removed const
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (BuildContext context) => const PriceAlertPage()),
        // );
      },
    ),
    IconButton(
      icon: Icon(PhosphorIconsBold.shareNetwork), // Corrected and removed const
      onPressed: () {},
    ),
  ],
),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const StakeChart(),
                    const Gap(40),
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: _TabBarSliverPersistentHeaderDelegate(
                  tabBar: TabBar(
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
                      Tab(text: 'About'),
                      Tab(text: 'Activity'),
                      Tab(text: 'Analytics'),
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
              widget.name,
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: investorsStartX,
            top: investorsStartY,
            child: Opacity(
              opacity: investorsOpacity,
              child: Row(
                children: [
                  // Icon(PhosphorIcons.usersBold, size: 16, color: AppColors.greyLight,),
                  Icon(
          PhosphorIconsBold.users,
          size: 16,
          color: AppColors.greyLight,
        ),
                  const Gap(4),
                  Text(
                    widget.investors,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: animatedPercentageX,
            top: animatedPercentageY,
            child: Text(
              widget.percentage,
              style: TextStyle(
                fontSize: percentageTextSize,
                color: Colors.green,
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
              child: Image.asset(widget.logoPath),
            ),
          ),
          Positioned(
            left: returnsStartX,
            top: returnsStartY,
            child: Opacity(
              opacity: returnsOpacity,
              child: Text('1Y Returns', style: TextStyle(color: AppColors.greyLight, fontSize: 14,),)),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
        buttonText1: 'Stake Now',
        buttonColor1: AppColors.black,
        onTap1: () {
          // widget.isDelegate
          //     ? const StakeAmountDelegateRoute().push(context)
          //     : const StakeAmountRoute().push(context);
        },
        showHoldersRow: true,
        showImageRow: true,
        image1: 'avatar-1.png',
        image2: 'avatar-2.png',
        image3: 'avatar-3.png',
        headerText: 'James, Jane and 14+ hold >',
      ),
    );
  }
}

class _TabBarSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  _TabBarSliverPersistentHeaderDelegate({required this.tabBar});
  final TabBar tabBar;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: tabBar
      ),
    );

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}