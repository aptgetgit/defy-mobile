import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_tab_bar.dart';

class ExploreDappsScreen extends StatefulWidget {
  const ExploreDappsScreen({super.key});

  @override
  State<ExploreDappsScreen> createState() => _ExploreDappsScreenState();
}

class _ExploreDappsScreenState extends State<ExploreDappsScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _slideAnimation = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, -0.03),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, -0.03),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 20,
      ),
    ]).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Dapps',
            style: TextStyle(
              fontSize: 20.sp, // Updated to use screenutil
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h), // Updated to use screenutil
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Search bar
                  Container(
                    width: double.infinity,
                    height: 48.h, // Updated to use screenutil
                    decoration: BoxDecoration(
                      color: const Color(0xfff4f4f6),
                      borderRadius: BorderRadius.circular(58.r), // Updated to use screenutil
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Gap(16.w), // Updated to use screenutil
                        Icon(
                          PhosphorIconsBold.magnifyingGlass,
                          color: AppColors.greyMedium,
                          size: 18.sp, // Updated to use screenutil
                        ),
                        Gap(8.w), // Updated to use screenutil
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search or paste URL',
                              hintStyle: TextStyle(
                                color: AppColors.greyMedium,
                                fontSize: 16.sp, // Updated to use screenutil
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          PhosphorIconsBold.cards,
                          color: AppColors.greyMedium,
                          size: 18.sp, // Updated to use screenutil
                        ),
                        Gap(16.w), // Updated to use screenutil
                      ],
                    ),
                  ),
                  Gap(8.h), // Updated to use screenutil

                  SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      children: <Widget>[
                        _buildDappTile(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildDappTile(BuildContext context) {
    late TabController _dappsTabController = TabController(length: 3, vsync: this);

    return Column(
      children: [
        // Tab Bar
        CustomTabBar(
          tabController: _dappsTabController,
          tabs: const <String>['DeFi', 'Emojis', 'AI Agents'],
        ),
        Positioned(
              bottom: 0,
              child: Container(
                width: 350.w,
                height: 1,
                color: AppColors.greyVeryLight,
              ),
            ),

        // Tab Content
        Container(
          height: 500.h, // Adjust height as needed
          child: TabBarView(
            controller: _dappsTabController,
            children: [
              // DeFi Tab
              _buildDappList(context, category: 'DeFi'),

              // Emojis Tab
              _buildDappList(context, category: 'Emojis'),

              // AI Agents Tab
              _buildDappList(context, category: 'AI Agents'),
            ],
          ),
        ),
      ],
    );
  }

  // Helper method to build the dapp list for each tab
  Widget _buildDappList(BuildContext context, {required String category}) {
    final List<AssetGenImage> dapps = <AssetGenImage>[
      Assets.icons.uniswapDappLogo,
      Assets.icons.uniswapDappLogo,
      Assets.icons.uniswapDappLogo,
    ];
    final List<String> dappNames = <String>[
      'Uniswap',
      'Petra Wallet',
      'Rainbow',
    ];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dapps.length,
      itemBuilder: (BuildContext ctx, int index) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: _buildDappModalSheet,
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            children: <Widget>[
              dapps[index].image(width: 0.12.sw),
              SizedBox(width: 12.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        dappNames[index],
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(12.w),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight2,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyDark,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight2,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Text(
                          'Staking',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 0.7.sw),
                    child: Text(
                      'Uniswap allows direct crypto swapping without middlemen, using automated...',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDappModalSheet(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // This ensures clicking outside dismisses the sheet
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(32.r)),
                ),
                padding: EdgeInsets.only(bottom: 22.h, top: 22.h, left: 26.w, right: 26.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Assets.icons.uniswapDexLogo.image(width: 40.w),
                            Gap(12.w),
                            Text(
                              'Uniswap',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            PhosphorIconsBold.x,
                            size: 22.sp,
                            color: AppColors.black,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),

                    // Description
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Text(
                        "Swap cryptocurrencies directly without intermediaries on Uniswap's automated platform.",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyLight,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Gap(16.h),

                    // Category
                    Row(
                      children: <Widget>[
                        Icon(
                          PhosphorIconsBold.shareNetwork,
                          color: AppColors.greyLight,
                          size: 20.sp,
                        ),
                        Gap(12.w),
                        Text(
                          'Category',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyLight,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              decoration: BoxDecoration(
                                color: AppColors.greyVeryLight2,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Text(
                                'DeFi',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyDark,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              decoration: BoxDecoration(
                                color: AppColors.greyVeryLight2,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Text(
                                'Staking',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyDark,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Gap(16.h),

                    // Socials
                    Row(
                      children: <Widget>[
                        Icon(
                          PhosphorIconsBold.cellSignalHigh,
                          color: AppColors.greyLight,
                          size: 20.sp,
                        ),
                        Gap(12.w),
                        Text(
                          'Socials',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyLight,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(6.w),
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              decoration: const BoxDecoration(
                                color: AppColors.greyVeryLight2,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                PhosphorIconsBold.globe,
                                size: 18.sp,
                                color: AppColors.greyLight,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(6.w),
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              decoration: const BoxDecoration(
                                color: AppColors.greyVeryLight2,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                PhosphorIconsBold.twitterLogo,
                                size: 18.sp,
                                color: AppColors.greyLight,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(6.w),
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              decoration: const BoxDecoration(
                                color: AppColors.greyVeryLight2,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                PhosphorIconsBold.discordLogo,
                                size: 18.sp,
                                color: AppColors.greyLight,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Gap(22.h),

                    // Skip page description
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Transform.scale(
                          scale: 1.25,
                          child: Checkbox(
                            value: false,
                            onChanged: (bool? v) {},
                            side: const BorderSide(
                              color: AppColors.greyMedium,
                            ),
                          ),
                        ),
                        Gap(4.w),
                        Flexible(
                          child: Text(
                            'Skip the popup next time for this app.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyDark,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Gap(22.h),

                    // Launch button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(44.w),
                        ),
                        backgroundColor: AppColors.blue,
                        minimumSize: Size(double.infinity, 54.h),
                      ),
                      child: Text(
                        'Launch App',
                        style: TextStyle(color: AppColors.white, fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
