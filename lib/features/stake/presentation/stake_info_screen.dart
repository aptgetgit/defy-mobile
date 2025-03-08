import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../app/routes/router.dart';
import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import '../widgets/stake_chart.dart';

class StakeInfoScreen extends StatefulWidget {
  final String name;
  final String logoPath;
  final String percentage;
  final String investors;
  final String returnPeriod;
  final bool isDelegate;

  const StakeInfoScreen({
    super.key,
    required this.name,
    required this.logoPath,
    required this.percentage,
    required this.investors,
    required this.returnPeriod,
    this.isDelegate = false,
  });

  @override
  _StakeInfoScreenState createState() => _StakeInfoScreenState();
}

class _StakeInfoScreenState extends State<StakeInfoScreen> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController; // TabController for investment types
  double _investmentAmount = 10000; // Default investment amount ($10,000)
  String _timePeriod = '1M'; // Default time period
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 2 tabs: Monthly, One Time
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose(); // Dispose of TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double scrollProgress = (_scrollOffset / 200).clamp(0.0, 1.0);

    // Start and end positions for the name
    const double startX = 16;
    const double startY = 190;
    final double endX = (screenWidth - 100) / 2 - 40;
    const double endY = 70;

    final double animatedX = startX + (endX - startX) * scrollProgress;
    final double animatedY = startY - (startY - endY) * scrollProgress;
    final double textSize = 24 - (8 * scrollProgress);

    // Start and end positions for investors
    const double investorsStartX = 16;
    const double investorsStartY = 235;

    // Start and end positions for percentage
    final double percentageStartX = screenWidth - 80;
    const double percentageStartY = 193;
    final double percentageEndX = (screenWidth - 200) / 2 + 10;
    const double percentageEndY = 90;

    final double animatedPercentageX =
        percentageStartX + (percentageEndX - percentageStartX) * scrollProgress;
    final double animatedPercentageY =
        percentageStartY - (percentageStartY - percentageEndY) * scrollProgress;
    final double percentageTextSize = 24 - (12 * scrollProgress);

    // Start and end positions for image
    final double imageStartX = screenWidth / 2 - 180;
    const double imageStartY = 140;
    const double imageEndX = 60;
    const double imageEndY = 75;

    final double animatedImageX = imageStartX + (imageEndX - imageStartX) * scrollProgress;
    final double animatedImageY = imageStartY - (imageStartY - imageEndY) * scrollProgress;
    final double imageSize = 40 - (10 * scrollProgress);

    // Start and end positions for returns
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
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(PhosphorIconsBold.bell),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(PhosphorIconsBold.shareNetwork),
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
                    // Investment Summary Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12, right: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text(
                                      '100 APT',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Invested',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        const Text(
                                          r'+312.21$',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green,
                                          ),
                                        ),
                                        Text(
                                          'PnL',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Gap(16),
                                    Icon(
                                      PhosphorIconsRegular.caretRight,
                                      size: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Gap(32), // Spacing
                          
                          // Details Section
                          if (!widget.isDelegate)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Details',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(20), // Spacing
                                Padding(
                                  padding: const EdgeInsets.only(right:93),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Stakers',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          const Text(
                                            '14.28M APT',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Total Stakers',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          const Text(
                                            '56.7M',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(18), // Spacing
                                Padding(
                                  padding: const EdgeInsets.only(right:90),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Commission',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          const Text(
                                            '3.02%',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Rewards',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          const Text(
                                            '652.90 APT',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          if(widget.isDelegate)
                            Column(
                              children: [
                                const Text(
                                  'Next Unlock in',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(20), // Spacing
                                Row(
                                  children: [
                                    Image.asset('assets/icons/lock.png', width: 38),
                                    const Gap(4),
                                    const Text(
                                      '12 D : 11 H : 21 M',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          const Gap(32),
                          
                          // Return Calculator Section
                          const Text(
                            'Return Calculator',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(6), // Spacing
                          // TabBar for investment types
                          TabBar(
                            controller: _tabController,
                            tabs: const <Widget>[
                              Tab(text: 'Monthly'),
                              Tab(text: 'One Time'),
                            ],
                            isScrollable: true,
                            indicatorColor: Colors.black,
                            indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(width: 2),
                            ),
                            tabAlignment: TabAlignment.start,
                            labelColor: Colors.black,
                            unselectedLabelColor: AppColors.greyLight,
                            labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                            labelPadding: const EdgeInsets.only(right: 14),
                            padding: EdgeInsets.zero,
                            indicatorWeight: 1,
                            dividerHeight: 1,
                            dividerColor: AppColors.greyVeryLight,
                          ),
                          // TabBarView for investment type content
                          SizedBox(
                            height: 125, // Adjust height as needed
                            child: TabBarView(
                              controller: _tabController,
                              children: <Widget>[
                                // Monthly tab content
                                Column(
                                  children: <Widget>[
                                    const Gap(24), // Spacing
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text(
                                          'Invested per month',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.greyLight,
                                          ),
                                        ),
                                        Text(
                                          '\$${_investmentAmount.round()}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Gap(12), // Spacing
                                    SliderTheme(
                                      data: SliderThemeData(
                                        trackHeight: 4,
                                        overlayShape: SliderComponentShape.noOverlay,
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Slider(
                                          value: _investmentAmount,
                                          min: 0,
                                          max: 50000,
                                          divisions: 500,
                                          label: '\$${_investmentAmount.round()}',
                                          onChanged: (double value) {
                                            setState(() {
                                              _investmentAmount = value;
                                            });
                                          },
                                          activeColor: AppColors.blue,
                                          inactiveColor: AppColors.blue.withValues(alpha: 0.25),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // One Time tab content
                                Column(
                                  children: <Widget>[
                                    const Gap(24), // Spacing
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text(
                                          'Invested per month',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.greyLight,
                                          ),
                                        ),
                                        Text(
                                          '\$${_investmentAmount.round()}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Gap(12), // Spacing
                                    SliderTheme(
                                      data: SliderThemeData(
                                        trackHeight: 4,
                                        overlayShape: SliderComponentShape.noOverlay,
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Slider(
                                          value: _investmentAmount,
                                          min: 0,
                                          max: 50000,
                                          divisions: 500,
                                          label: '\$${_investmentAmount.round()}',
                                          onChanged: (double value) {
                                            setState(() {
                                              _investmentAmount = value;
                                            });
                                          },
                                          activeColor: AppColors.blue,
                                          inactiveColor: AppColors.blue.withValues(alpha: 0.25),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text('Over the past', style: TextStyle(fontSize: 14, color: AppColors.greyLight)),
                              const Gap(21), // Spacing
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () => setState(() => _timePeriod = '1M'),
                                    child: Container(
                                      width: 54,
                                      height: 32,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 3,),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                        color: _timePeriod == '1M' ? AppColors.blue : AppColors.transparent,),
                                        borderRadius: BorderRadius.circular(40),
                                        color: AppColors.greyVeryLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '1M',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: _timePeriod == '1M'
                                                ? Colors.blue
                                                : AppColors.greyLight,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(13), // Spacing
                                  GestureDetector(
                                    onTap: () => setState(() => _timePeriod = '3M'),
                                    child: Container(
                                      width: 54,
                                      height: 32,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 3,),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                        color: _timePeriod == '3M' ? AppColors.blue : AppColors.transparent,),
                                        borderRadius: BorderRadius.circular(40),
                                        color: AppColors.greyVeryLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '3M',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: _timePeriod == '3M'
                                                ? Colors.blue
                                                : AppColors.greyLight,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(13), // Spacing
                                  GestureDetector(
                                    onTap: () => setState(() => _timePeriod = '6M'),
                                    child: Container(
                                      width: 54,
                                      height: 32,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 3,),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                        color: _timePeriod == '6M' ? AppColors.blue : AppColors.transparent,),
                                        borderRadius: BorderRadius.circular(40),
                                        color: AppColors.greyVeryLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '6M',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: _timePeriod == '6M'
                                                ? Colors.blue
                                                : AppColors.greyLight,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(13), // Spacing
                                  GestureDetector(
                                    onTap: () => setState(() => _timePeriod = '1Y'),
                                    child: Container(
                                      width: 54,
                                      height: 32,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 3,),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                        color: _timePeriod == '1Y' ? AppColors.blue : AppColors.transparent,),
                                        borderRadius: BorderRadius.circular(40),
                                        color: AppColors.greyVeryLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '1Y ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: _timePeriod == '1Y'
                                                ? Colors.blue
                                                : AppColors.greyLight,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Gap(24), // Spacing
                          Row(
                            children: <Widget>[
                              Text(
                                '\$${_investmentAmount.round()}', // Example calculation
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              const Gap(4), // Spacing
                              const Text(
                                'would have become', // Example calculation
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.greyLight,
                                ),
                              ),
                              const Gap(4),
                              const Text(
                                r'$432.23', // Example calculation
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const Gap(4),
                              const Text(
                                '(+2.12%)', // Example calculation
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          const Gap(16), // Spacing
                        ],
                      ),
                    ), // Placeholder for additional content
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
                  Icon(PhosphorIconsBold.users, size: 16, color: AppColors.greyLight,),
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
          widget.isDelegate
              ? const StakeAmountDelegateRoute().push(context)
              :
          const StakeAmountRoute().push(context);
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