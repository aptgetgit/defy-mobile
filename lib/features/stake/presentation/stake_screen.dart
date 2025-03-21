import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../widgets/provider_item.dart';
import 'providers/stake_provider.dart';
import 'stake_info_screen.dart';

class StakeScreen extends ConsumerStatefulWidget {
  const StakeScreen({super.key});

  @override
  ConsumerState<StakeScreen> createState() => _StakeScreenState();
}

class _StakeScreenState extends ConsumerState<StakeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool _isSearchIconVisible = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController.addListener(_onScroll);
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      ref.read(stakeNotifierProvider.notifier).setCurrentTab(_tabController.index);
    }
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
  Widget build(BuildContext context){
    ref.watch(stakeNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Stake', style: TextStyle(fontSize: 20.sp)),
        elevation: 0,
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Top card section with gradient
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color.fromARGB(255, 65, 64, 64), // Left side (grey)
                          Colors.black, // Right side (black)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/aptos.png',
                          width: 40.w,
                          height: 40.h,
                        ),
                        Gap(8.h),
                        Text(
                          'Earn 100% APY',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(4.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.w),
                          child: Text(
                            'Choose and earn fast with these simple offers',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.greyLight,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Gap(18.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                padding: EdgeInsets.zero,
                                side: BorderSide(color: Colors.white, width: 1.w),
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                maximumSize: Size(82.w, 44.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'View',
                                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                                  ),
                                  Gap(8.w),
                                  Icon(PhosphorIconsBold.arrowCircleUpRight, size: 16.sp),
                                ],
                              ),
                            ),
                            FilledButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                minimumSize: Size(237.w, 42.h),
                              ),
                              child: Text('Stake APT', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gap(20.h),
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
                            borderRadius: BorderRadius.circular(40.r),
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(
                            color: AppColors.greyLight,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          fillColor: AppColors.greyVeryLight,
                          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                      ),
                      Positioned(
                        left: 90.w,
                        child: Icon(
                          PhosphorIconsBold.magnifyingGlass,
                          color: AppColors.greyLight,
                          size: 24.sp,
                        ),
                      ),
                    ],
                  ),
                  Gap(8.h),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: TabBarDelegate(
              CustomTabBar(
                tabController: _tabController,
                tabs: const <String>[
                  'All',
                  'Native',
                  'Delegate',
                ],
                trailing: Padding(
                padding: EdgeInsets.only(right: 8.w),
                  child: Row(
                    children: <Widget>[
                      AnimatedOpacity(
                        opacity: _isSearchIconVisible ? 0 : 1,
                        duration: const Duration(milliseconds: 200),
                        child: Icon(PhosphorIconsBold.magnifyingGlass, size: 20.sp, color: AppColors.greyLight),
                      ),
                      Gap(15.w),
                      Icon(PhosphorIconsBold.funnelSimple, size: 20.sp, color: AppColors.greyLight),
                    ],
                  ),
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
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                  Gap(10.h),
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
                  Gap(10.h),
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
                  Gap(10.h),
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
                  Gap(10.h),
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
              padding: EdgeInsets.all(20.w),
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
              padding: EdgeInsets.all(20.w),
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
}
