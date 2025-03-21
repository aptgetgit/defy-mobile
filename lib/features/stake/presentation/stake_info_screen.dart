import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../app/routes/router.dart';
import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../../shared/presentation/widgets/info_header.dart';
import '../widgets/stake_chart.dart';

class StakeInfoScreen extends StatefulWidget {
  const StakeInfoScreen({
    required this.name,
    required this.logoPath,
    required this.percentage,
    required this.investors,
    required this.returnPeriod,
    this.isDelegate = false,
    super.key,
  });

  final String name;
  final String logoPath;
  final String percentage;
  final String investors;
  final String returnPeriod;
  final bool isDelegate;

  @override
  _StakeInfoScreenState createState() => _StakeInfoScreenState();
}

class _StakeInfoScreenState extends State<StakeInfoScreen> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  double _investmentAmount = 10000;
  String _timePeriod = '1M';
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(() {
      setState(() => _scrollOffset = _scrollController.offset);
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

    // Calculate percentage text width
    final TextSpan percentageTextSpan = TextSpan(
      text: widget.percentage,
      style: TextStyle(fontSize: 24.sp, color: Colors.green, fontWeight: FontWeight.w600),
    );
    final TextPainter percentageTextPainter = TextPainter(
      text: percentageTextSpan,
      textDirection: TextDirection.ltr,
    )..layout();

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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h, right: 4.w),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('100 APT', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                    Text('Invested', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(r'+312.21$', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.green)),
                                        Text('PnL', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                                      ],
                                    ),
                                    Gap(16.w),
                                    Icon(PhosphorIconsRegular.caretRight, size: 16.sp, color: Colors.grey[600]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Gap(34.h),
                          if (!widget.isDelegate)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Details', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                                Gap(20.h),
                                Padding(
                                  padding: EdgeInsets.only(right: 93.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Stakers', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                                          Text('14.28M APT', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Total Stakers', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                                          Text('56.7M', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(18.h),
                                Padding(
                                  padding: EdgeInsets.only(right: 90.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Commission', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                                          Text('3.02%', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Rewards', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                                          Text('652.90 APT', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          if (widget.isDelegate)
                            Column(
                              children: <Widget>[
                                Text('Next Unlock in', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                                Gap(20.h),
                                Row(
                                  children: <Widget>[
                                    Image.asset('assets/icons/lock.png', width: 38.w),
                                    Gap(4.w),
                                    Text('12 D : 11 H : 21 M', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ],
                            ),
                          Gap(32.h),
                          Text('Return Calculator', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                          Gap(16.h),
                          CustomTabBar(tabController: _tabController, tabs: const <String>['Monthly', 'One Time']),
                          SizedBox(
                            height: 125.h,
                            child: TabBarView(
                              controller: _tabController,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Gap(24.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Invested per month', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
                                        Text('\$${_investmentAmount.round()}', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    Gap(12.h),
                                    SliderTheme(
                                      data: SliderThemeData(
                                        trackHeight: 4.h, 
                                        overlayShape: SliderComponentShape.noOverlay,
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Slider(
                                          value: _investmentAmount,
                                          max: 50000,
                                          divisions: 500,
                                          label: '\$${_investmentAmount.round()}',
                                          onChanged: (double value) => setState(() => _investmentAmount = value),
                                          activeColor: AppColors.blue,
                                          inactiveColor: AppColors.blue.withOpacity(0.25),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Gap(24.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Invested per month', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
                                        Text('\$${_investmentAmount.round()}', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    Gap(12.h),
                                    SliderTheme(
                                      data: SliderThemeData(
                                        trackHeight: 4.h, 
                                        overlayShape: SliderComponentShape.noOverlay,
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Slider(
                                          value: _investmentAmount,
                                          max: 50000,
                                          divisions: 500,
                                          label: '\$${_investmentAmount.round()}',
                                          onChanged: (double value) => setState(() => _investmentAmount = value),
                                          activeColor: AppColors.blue,
                                          inactiveColor: AppColors.blue.withOpacity(0.25),
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
                              Text('Over the past', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
                              Gap(21.h),
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () => setState(() => _timePeriod = '1M'),
                                    child: Container(
                                      width: 54.w,
                                      height: 32.h,
                                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: _timePeriod == '1M' ? AppColors.blue : AppColors.transparent),
                                        borderRadius: BorderRadius.circular(40.r),
                                        color: AppColors.greyVeryLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '1M',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: _timePeriod == '1M' ? Colors.blue : AppColors.greyLight,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(13.w),
                                  GestureDetector(
                                    onTap: () => setState(() => _timePeriod = '3M'),
                                    child: Container(
                                      width: 54.w,
                                      height: 32.h,
                                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: _timePeriod == '3M' ? AppColors.blue : AppColors.transparent),
                                        borderRadius: BorderRadius.circular(40.r),
                                        color: AppColors.greyVeryLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '3M',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: _timePeriod == '3M' ? Colors.blue : AppColors.greyLight,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(13.w),
                                  GestureDetector(
                                    onTap: () => setState(() => _timePeriod = '6M'),
                                    child: Container(
                                      width: 54.w,
                                      height: 32.h,
                                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: _timePeriod == '6M' ? AppColors.blue : AppColors.transparent),
                                        borderRadius: BorderRadius.circular(40.r),
                                        color: AppColors.greyVeryLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '6M',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: _timePeriod == '6M' ? Colors.blue : AppColors.greyLight,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(13.w),
                                  GestureDetector(
                                    onTap: () => setState(() => _timePeriod = '1Y'),
                                    child: Container(
                                      width: 54.w,
                                      height: 32.h,
                                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: _timePeriod == '1Y' ? AppColors.blue : AppColors.transparent),
                                        borderRadius: BorderRadius.circular(40.r),
                                        color: AppColors.greyVeryLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '1Y',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: _timePeriod == '1Y' ? Colors.blue : AppColors.greyLight,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(24.h),
                          Row(
                            children: <Widget>[
                              Text('\$${_investmentAmount.round()}', style: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w500)),
                              Gap(4.w),
                              Text('would have become', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
                              Gap(4.w),
                              Text(r'$432.23', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                              Gap(4.w),
                              Text('(+2.12%)', style: TextStyle(fontSize: 14.sp, color: Colors.green, fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Gap(16.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          InfoHeader(
            name: widget.name,
            logoPath: widget.logoPath,
            percentage: widget.percentage,
            investors: widget.investors,
            scrollProgress: scrollProgress,
            screenWidth: screenWidth,
            percentageTextWidth: percentageTextPainter.width,
            showInvestorsAsRow: true,
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
        buttonText1: 'Stake Now',
        buttonColor1: AppColors.black,
        onTap1: () => widget.isDelegate
            ? const StakeAmountDelegateRoute().push(context)
            : const StakeAmountRoute().push(context),
        image1: 'avatar-1.png',
        image2: 'avatar-2.png',
        image3: 'avatar-3.png',
        headerText: 'James, Jane and 14+ hold >',
      ),
    );
  }
}
