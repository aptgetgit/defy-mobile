import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


import '../../../../config/theme/colors.dart';
import '../../../../core/navigation/routes/router.dart';
import '../../../shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import '../../../shared/presentation/widgets/info_header.dart';
import '../../../stake/widgets/stake_chart.dart';

class BorrowInfoScreen extends ConsumerStatefulWidget {
  const BorrowInfoScreen({
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
  ConsumerState<BorrowInfoScreen> createState() => _BorrowInfoScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(StringProperty('name', name))
    ..add(StringProperty('logoPath', logoPath))
    ..add(StringProperty('percentage', percentage))
    ..add(StringProperty('investors', investors))
    ..add(StringProperty('returnPeriod', returnPeriod))
    ..add(DiagnosticsProperty<bool>('isDelegate', isDelegate));
  }
}

class _BorrowInfoScreenState extends ConsumerState<BorrowInfoScreen> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
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

    final TextSpan percentageTextSpan = TextSpan(
      text: widget.percentage,
      style: TextStyle(
        fontSize: 24.sp,
        color: Colors.green,
        fontWeight: FontWeight.w600,
      ),
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
                                    Text('100 USDT', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                    Text('Lent', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(r'+312.21$', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.green)),
                                        Text('Earned', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
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
                                        Text('Total Reserve', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                                        Text('14.28M APT', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Max LTV', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                                        Text('56.7M', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Gap(18.h),
                              Padding(
                                padding: EdgeInsets.only(right: 62.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Liq. Threshold', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                                        Text('3.02%', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Liq. Penalty', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                                        Text('652.90 APT', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Gap(32.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('E-Mode', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                                  Gap(28.w),
                                  Row(
                                    children: <Widget>[
                                      Icon(PhosphorIconsFill.checkCircle, size: 20.sp, color: Colors.green),
                                      Gap(4.w),
                                      Text('Available', style: TextStyle(fontSize: 14.sp, color: Colors.green)),
                                    ],
                                  ),
                                ],
                              ),
                              Gap(16.h),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text('75.68%', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                                        Gap(7.h),
                                        Text('Max LTV', style: TextStyle(fontSize: 12.6.sp, color: AppColors.greyLight)),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text('90.5%', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                                        Gap(7.h),
                                        Text('Liq. Threshold', style: TextStyle(fontSize: 12.6.sp, color: AppColors.greyLight)),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text('5.23%', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                                        Gap(7.h),
                                        Text('Liq. Penalty', style: TextStyle(fontSize: 12.6.sp, color: AppColors.greyLight)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Gap(32.h),
                              Text('Utilization Rate', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                              Gap(20.h),
                              Padding(
                                padding: EdgeInsets.only(right: 65.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Current Rate', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
                                        Text('85%', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Optimal Rate', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
                                        Text('90%', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.green)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Gap(35.h),
                              Text('More Details', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                              Gap(17.h),
                              Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('USDT Price', style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight)),
                                      Text(r'$1.01', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  Gap(14.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Contract Address', style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight)),
                                      Text('0x12...bxju', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  Gap(14.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Platform', style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight)),
                                      Row(
                                        children: <Widget>[
                                          Image.asset('assets/icons/aries.png', width: 20.w),
                                          Gap(8.w),
                                          Text('Aries', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Gap(14.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Rank', style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight)),
                                      Text('#4', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ],
                              ),
                              Gap(16.h),
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
            showInvestorsAsRow: true,
            scrollProgress: scrollProgress,
            screenWidth: screenWidth,
            investors: 'USDT',
            percentageTextWidth: percentageTextPainter.width,
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
        buttonText1: 'Borrow Now',
        buttonColor1: AppColors.black,
        onTap1: () => const BorrowAmountRoute().push(context),
        image1: 'avatar-1.png',
        image2: 'avatar-2.png',
        image3: 'avatar-3.png',
        headerText: 'James, Jane and 14+ hold >',
      ),
    );
  }
}
