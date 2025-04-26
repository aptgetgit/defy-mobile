import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import '../../../shared/presentation/widgets/custom_tab_bar.dart';
import '../../../stake/widgets/stake_chart.dart';
import '../../../token_info/presentation/about_page.dart';
import '../../../token_info/presentation/explore_page.dart';
import '../../../token_info/presentation/analytics_page.dart';
import '../../../token_info/presentation/history_page.dart';
import 'explore_tokens_screen.dart';

class ExploreTokenInfoScreen extends StatefulWidget {

  const ExploreTokenInfoScreen({
    super.key,
    required this.name,
    required this.logoPath,
    required this.percentage,
    required this.investors,
    required this.returnPeriod,
    this.isDelegate = false,
    this.emoji, // Add this parameter
  });
  final String name;
  final String logoPath;
  final String percentage;
  final String investors;
  final String returnPeriod;
  final bool isDelegate;
  final String? emoji; // Add this field

  @override
  State<ExploreTokenInfoScreen> createState() => _ExploreTokenInfoScreenState();
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

    final double startX = 16.w;
    final double startY = 190.h;
    final double endX = (screenWidth - 100.w) / 2 - 40.w;
    final double endY = 70.h;

    final double animatedX = startX + (endX - startX) * scrollProgress;
    final double animatedY = startY - (startY - endY) * scrollProgress;
    final double textSize = 24.sp - (8.sp * scrollProgress);

    final double investorsStartX = 16.w;
    final double investorsStartY = 235.h;

    final double percentageStartX = screenWidth - 80.w;
    final double percentageStartY = 193.h;
    final double percentageEndX = (screenWidth - 200.w) / 2 + 10.w;
    final double percentageEndY = 90.h;

    final double animatedPercentageX = percentageStartX + (percentageEndX - percentageStartX) * scrollProgress;
    final double animatedPercentageY = percentageStartY - (percentageStartY - percentageEndY) * scrollProgress;
    final double percentageTextSize = 24.sp - (12.sp * scrollProgress);

    final double imageStartX = screenWidth / 2 - 180.w;
    final double imageStartY = 140.h;
    final double imageEndX = 60.w;
    final double imageEndY = 75.h;

    final double animatedImageX = imageStartX + (imageEndX - imageStartX) * scrollProgress;
    final double animatedImageY = imageStartY - (imageStartY - imageEndY) * scrollProgress;
    final double imageSize = 40.w - (10.w * scrollProgress);

    final double returnsStartX = screenWidth / 2 + 108.w;
    final double returnsStartY = 235.h;

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
                expandedHeight: 200.h,
                pinned: true,
                leading: IconButton(
                  icon: Icon(
                    PhosphorIconsBold.caretLeft,
                    color: Colors.black,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => const ExploreTokensScreen()),
                    );
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(PhosphorIconsBold.bell, size: 24.sp),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(PhosphorIconsBold.shareNetwork, size: 24.sp),
                    onPressed: () {},
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const StakeChart(),
                    Gap(40.h),
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: TabBarDelegate(
                  CustomTabBar(
                    tabController: _tabController,
                    tabs: const <String>[
                      'About',
                      'Explore',
                      'History',
                      'Analytics',
                    ],
                  ),
                ),
                pinned: true,
              ),
              SliverFillRemaining(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    const AboutPage(),
                    const ExplorePage(),
                    HistoryPage(),
                    const AnalyticsPage(),
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
                children: <Widget>[
                  Icon(
                    PhosphorIconsBold.users,
                    size: 16.sp,
                    color: AppColors.greyLight,
                  ),
                  Gap(4.w),
                  Text(
                    widget.investors,
                    style: TextStyle(
                      fontSize: 14.sp,
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
              child: Text(
                '1Y Returns', 
                style: TextStyle(
                  color: AppColors.greyLight, 
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
        buttonText1: 'Stake Now',
        buttonColor1: AppColors.black,
        onTap1: () {},
        image1: 'avatar-1.png',
        image2: 'avatar-2.png',
        image3: 'avatar-3.png',
        headerText: 'James, Jane and 14+ hold >',
      ),
    );
  }
}