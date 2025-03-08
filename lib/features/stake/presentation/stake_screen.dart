import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../widgets/provider_item.dart';
import 'stake_info_screen.dart';

class StakeScreen extends StatefulWidget {
  const StakeScreen({super.key});

  @override
  State<StakeScreen> createState() => _StakeScreenState();
}

class _StakeScreenState extends State<StakeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool _isSearchIconVisible = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController..removeListener(_onScroll)
    ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 320 && _isSearchIconVisible) {
      setState(() {
        _isSearchIconVisible = false;
      });
    } else if (_scrollController.offset <= 320 && !_isSearchIconVisible) {
      setState(() {
        _isSearchIconVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text('Stake', style: TextStyle(fontSize: 20)),
      elevation: 0,
    ),
    body: NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Top card section with gradient
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Color.fromARGB(255, 65, 64, 64), // Left side (grey)
                        Colors.black, // Right side (black)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/aptos.png',
                        width: 40,
                        height: 40,
                      ),
                      const Gap(8),
                      const Text(
                        'Earn 100% APY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(4),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          'Choose and earn fast with these simple offers',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.greyLight,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Gap(18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.zero,
                              side: const BorderSide(color: Colors.white),
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              maximumSize: const Size(82, 44),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'View',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                Gap(8),
                                Icon(PhosphorIconsBold.arrowCircleUpRight),
                              ],
                            ),
                          ),
                          FilledButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              minimumSize: const Size(237, 42),
                            ),
                            child: const Text('Stake APT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                // Search bar
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Search a provider',
                        //corner radius
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: const TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: AppColors.greyVeryLight,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                    const Positioned(
                      left: 90,
                      child: Icon(
                        PhosphorIconsBold.magnifyingGlass,
                        color: AppColors.greyLight,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const Gap(8),
              ],
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _TabBarDelegate(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TabBar(
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
                      Tab(text: 'All'),
                      Tab(text: 'Native'),
                      Tab(text: 'Delegate'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      children: <Widget>[
                        AnimatedOpacity(
                          opacity: _isSearchIconVisible ? 0 : 1,
                          duration: const Duration(milliseconds: 200),
                          child: const Icon(PhosphorIconsBold.magnifyingGlass, size: 20,color: AppColors.greyLight,),
                        ),
                        const Gap(15),
                        const Icon(PhosphorIconsBold.funnelSimple, size: 20,color: AppColors.greyLight,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          // All tab content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                ProviderItem(
                  name: 'Everstake',
                  percentage: '40%',
                  imagePath: 'assets/icons/staking-default.png',
                  isLiquid: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const StakeInfoScreen(
                          name: 'Everstake',
                          logoPath: 'assets/icons/staking-default.png',
                          percentage: '2.12%', // Updated percentage from the screenshot
                          investors: '25.12k investors',
                          returnPeriod: '1Y Returns',
                        ),
                      ),
                    );
                  },
                ),
                const Gap(10),
                ProviderItem(
                  name: 'Marble X',
                  percentage: '23%',
                  imagePath: 'assets/icons/marble.png',
                  isLocked: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const StakeInfoScreen(
                          name: 'Marble X',
                          logoPath: 'assets/icons/marble.png',
                          percentage: '1.5%', // Example percentage, adjust as needed
                          investors: '15k investors', // Example, adjust as needed
                          returnPeriod: '1Y Returns',
                        ),
                      ),
                    );
                  },
                ),
                const Gap(10),
                ProviderItem(
                  name: '9279x28...9082',
                  percentage: '102%',
                  imagePath: 'assets/icons/unkown.png',
                  isLiquid: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const StakeInfoScreen(
                          name: '9279x28...9082',
                          logoPath: 'assets/icons/unkown.png',
                          percentage: '3.0%', // Example percentage, adjust as needed
                          investors: '10k investors', // Example, adjust as needed
                          returnPeriod: '1Y Returns',
                        ),
                      ),
                    );
                  },
                ),
                const Gap(10),
                ProviderItem(
                  name: 'Koinly',
                  percentage: '54%',
                  imagePath: 'assets/icons/koinly.png',
                  isLocked: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const StakeInfoScreen(
                          name: 'Koinly',
                          logoPath: 'assets/icons/koinly.png',
                          percentage: '2.8%', // Example percentage, adjust as needed
                          investors: '20k investors', // Example, adjust as needed
                          returnPeriod: '1Y Returns',
                        ),
                      ),
                    );
                  },
                ),
                const Gap(10),
                ProviderItem(
                  name: '9279x28...9082',
                  percentage: '46%',
                  imagePath: 'assets/icons/unkown.png',
                  isLiquid: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const StakeInfoScreen(
                          name: '9279x28...9082',
                          logoPath: 'assets/icons/unkown.png',
                          percentage: '2.5%', // Example percentage, adjust as needed
                          investors: '12k investors', // Example, adjust as needed
                          returnPeriod: '1Y Returns',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Native tab content (you can customize this list)
          Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              children: const <Widget>[
                ProviderItem(
                  name: 'Everstake',
                  percentage: '40%',
                  imagePath: 'assets/icons/staking-default.png',
                  isLiquid: true,
                ),
              ],
            ),
          ),
          // Delegate tab content (you can customize this list)
          Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                ProviderItem(
                  name: 'Marble X',
                  percentage: '23%',
                  imagePath: 'assets/icons/marble.png',
                  isLocked: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const StakeInfoScreen(
                          name: 'Marble X',
                          logoPath: 'assets/icons/marble.png',
                          percentage: '2.5%', // Example percentage, adjust as needed
                          investors: '≈ 12k investors', // Example, adjust as needed
                          returnPeriod: '1Y Returns',
                          isDelegate: true,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  _TabBarDelegate(this.tabBar);
  final Widget tabBar;

  @override
  double get minExtent => kToolbarHeight - 10; // Minimum height for tab bar

  @override
  double get maxExtent => kToolbarHeight - 10; // Maximum height remains same

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Material(
      color: Colors.white,
      elevation: overlapsContent ? 4 : 0, // Add elevation when overlapping
      shadowColor: Colors.black.withOpacity(0.1),
      child: tabBar, // The entire row containing balance + tabs
    );

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}