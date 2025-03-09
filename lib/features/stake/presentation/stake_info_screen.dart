import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../shared/presentation/widgets/info_header.dart';
import '../../../app/routes/router.dart';
import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';
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
      style: const TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.w600),
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
                expandedHeight: 200,
                pinned: true,
                actions: <Widget>[
                  IconButton(icon: const Icon(PhosphorIconsBold.bell), onPressed: () {}),
                  IconButton(icon: const Icon(PhosphorIconsBold.shareNetwork), onPressed: () {}),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const StakeChart(),
                    const Gap(40),
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
                                    const Text('100 APT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text('Invested', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        const Text(r'+312.21$', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green)),
                                        Text('PnL', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                      ],
                                    ),
                                    const Gap(16),
                                    Icon(PhosphorIconsRegular.caretRight, size: 16, color: Colors.grey[600]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Gap(34),
                          if (!widget.isDelegate)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text('Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                const Gap(20),
                                Padding(
                                  padding: const EdgeInsets.only(right: 93),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Stakers', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                          const Text('14.28M APT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Total Stakers', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                          const Text('56.7M', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(18),
                                Padding(
                                  padding: const EdgeInsets.only(right: 90),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Commission', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                          const Text('3.02%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Rewards', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                          const Text('652.90 APT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
                                const Text('Next Unlock in', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                const Gap(20),
                                Row(
                                  children: <Widget>[
                                    Image.asset('assets/icons/lock.png', width: 38),
                                    const Gap(4),
                                    const Text('12 D : 11 H : 21 M', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ],
                            ),
                          const Gap(32),
                          const Text('Return Calculator', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                          const Gap(16),
                          CustomTabBar(tabController: _tabController, tabs: const <String>['Monthly', 'One Time']),
                          SizedBox(
                            height: 125,
                            child: TabBarView(
                              controller: _tabController,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    const Gap(24),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text('Invested per month', style: TextStyle(fontSize: 14, color: AppColors.greyLight)),
                                        Text('\$${_investmentAmount.round()}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    const Gap(12),
                                    SliderTheme(
                                      data: SliderThemeData(trackHeight: 4, overlayShape: SliderComponentShape.noOverlay),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Slider(
                                          value: _investmentAmount,
                                          max: 50000,
                                          divisions: 500,
                                          label: '\$${_investmentAmount.round()}',
                                          onChanged: (double value) => setState(() => _investmentAmount = value),
                                          activeColor: AppColors.blue,
                                          inactiveColor: AppColors.blue.withValues(alpha: 0.25),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    const Gap(24),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text('Invested per month', style: TextStyle(fontSize: 14, color: AppColors.greyLight)),
                                        Text('\$${_investmentAmount.round()}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    const Gap(12),
                                    SliderTheme(
                                      data: SliderThemeData(trackHeight: 4, overlayShape: SliderComponentShape.noOverlay),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Slider(
                                          value: _investmentAmount,
                                          max: 50000,
                                          divisions: 500,
                                          label: '\$${_investmentAmount.round()}',
                                          onChanged: (double value) => setState(() => _investmentAmount = value),
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
                              const Gap(21),
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () => setState(() => _timePeriod = '1M'),
                                    child: Container(
                                      width: 54,
                                      height: 32,
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: _timePeriod == '1M' ? AppColors.blue : AppColors.transparent),
                                        borderRadius: BorderRadius.circular(40),
                                        color: AppColors.greyVeryLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '1M',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: _timePeriod == '1M' ? Colors.blue : AppColors.greyLight,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(13),
                                  GestureDetector(
                                    onTap: () => setState(() => _timePeriod = '3M'),
                                    child: Container(
                                      width: 54,
                                      height: 32,
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: _timePeriod == '3M' ? AppColors.blue : AppColors.transparent),
                                        borderRadius: BorderRadius.circular(40),
                                        color: AppColors.greyVeryLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '3M',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: _timePeriod == '3M' ? Colors.blue : AppColors.greyLight,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(13),
                                  GestureDetector(
                                    onTap: () => setState(() => _timePeriod = '6M'),
                                    child: Container(
                                      width: 54,
                                      height: 32,
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: _timePeriod == '6M' ? AppColors.blue : AppColors.transparent),
                                        borderRadius: BorderRadius.circular(40),
                                        color: AppColors.greyVeryLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '6M',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: _timePeriod == '6M' ? Colors.blue : AppColors.greyLight,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(13),
                                  GestureDetector(
                                    onTap: () => setState(() => _timePeriod = '1Y'),
                                    child: Container(
                                      width: 54,
                                      height: 32,
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: _timePeriod == '1Y' ? AppColors.blue : AppColors.transparent),
                                        borderRadius: BorderRadius.circular(40),
                                        color: AppColors.greyVeryLight,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '1Y',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: _timePeriod == '1Y' ? Colors.blue : AppColors.greyLight,
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
                          const Gap(24),
                          Row(
                            children: <Widget>[
                              Text('\$${_investmentAmount.round()}', style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
                              const Gap(4),
                              const Text('would have become', style: TextStyle(fontSize: 14, color: AppColors.greyLight)),
                              const Gap(4),
                              const Text(r'$432.23', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black)),
                              const Gap(4),
                              const Text('(+2.12%)', style: TextStyle(fontSize: 14, color: Colors.green, fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const Gap(16),
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
