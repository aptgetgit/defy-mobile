import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../app/routes/router.dart';
import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import '../../../shared/presentation/widgets/info_header.dart';
import '../../../stake/widgets/stake_chart.dart';

class LendInfoScreen extends ConsumerStatefulWidget {
  const LendInfoScreen({
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
  ConsumerState<LendInfoScreen> createState() => _LendInfoScreenState();
}

class _LendInfoScreenState extends ConsumerState<LendInfoScreen> with SingleTickerProviderStateMixin {
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

    // Calculate percentage text width
    final TextSpan percentageTextSpan = TextSpan(
      text: widget.percentage,
      style: const TextStyle(
        fontSize: 24,
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
                                    const Text('100 USDT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                    Text('Lent', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        const Text(r'+312.21$', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green)),
                                        Text('Earned', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
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
                                        Text('Total Reserve', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                        const Text('14.28M APT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Max LTV', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                        const Text('56.7M', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(18),
                              Padding(
                                padding: const EdgeInsets.only(right: 62),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Liq. Threshold', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                        const Text('3.02%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Liq. Penalty', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                        const Text('652.90 APT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Gap(32),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('E-Mode', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                  Gap(28),
                                  Row(
                                    children: <Widget>[
                                      Icon(PhosphorIconsFill.checkCircle, size: 20, color: Colors.green),
                                      Gap(4),
                                      Text('Available', style: TextStyle(fontSize: 14, color: Colors.green)),
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(16),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text('75.68%', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                        Gap(7),
                                        Text('Max LTV', style: TextStyle(fontSize: 12.6, color: AppColors.greyLight)),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text('90.5%', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                        Gap(7),
                                        Text('Liq. Threshold', style: TextStyle(fontSize: 12.6, color: AppColors.greyLight)),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text('5.23%', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                        Gap(7),
                                        Text('Liq. Penalty', style: TextStyle(fontSize: 12.6, color: AppColors.greyLight)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(32),
                              const Text('Utilization Rate', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                              const Gap(20),
                              const Padding(
                                padding: EdgeInsets.only(right: 65),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Current Rate', style: TextStyle(fontSize: 14, color: AppColors.greyLight)),
                                        Text('85%', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Optimal Rate', style: TextStyle(fontSize: 14, color: AppColors.greyLight)),
                                        Text('90%', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.green)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(35),
                              const Text('More Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                              const Gap(17),
                              Column(
                                children: <Widget>[
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('USDT Price', style: TextStyle(fontSize: 16, color: AppColors.greyLight)),
                                      Text(r'$1.01', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  const Gap(14),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Contract Address', style: TextStyle(fontSize: 16, color: AppColors.greyLight)),
                                      Text('0x12...bxju', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  const Gap(14),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text('Platform', style: TextStyle(fontSize: 16, color: AppColors.greyLight)),
                                      Row(
                                        children: <Widget>[
                                          Image.asset('assets/icons/aries.png', width: 20),
                                          const Gap(8),
                                          const Text('Aries', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Gap(14),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Rank', style: TextStyle(fontSize: 16, color: AppColors.greyLight)),
                                      Text('#4', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(16),
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
            scrollProgress: scrollProgress,
            screenWidth: screenWidth,
            percentageTextWidth: percentageTextPainter.width,
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
        buttonText1: 'Lend Now',
        buttonColor1: AppColors.black,
        onTap1: () => const LendAmountRoute().push(context),
        image1: 'avatar-1.png',
        image2: 'avatar-2.png',
        image3: 'avatar-3.png',
        headerText: 'James, Jane and 14+ hold >',
      ),
    );
  }
}
