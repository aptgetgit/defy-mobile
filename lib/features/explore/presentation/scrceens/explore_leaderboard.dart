import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/extensions/context_extensions.dart';

class ExploreLeaderboardScreen extends StatefulWidget {
  const ExploreLeaderboardScreen({super.key});

  @override
  State<ExploreLeaderboardScreen> createState() =>
      _ExploreLeaderboardScreenState();
}

class _ExploreLeaderboardScreenState extends State<ExploreLeaderboardScreen> {
  final TextEditingController _searchConroller = TextEditingController();
  
  @override
  void dispose() {
    _searchConroller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final double height = context.screenHeight;
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f6),
      appBar: AppBar(
        backgroundColor: const Color(0xffd1d0c9),
        centerTitle: true,
        title: Text(
          'Leaderboard',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: const Color(0xffd1d0c9),
                height: height * .44,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      width: double.infinity,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(58.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Gap(16.w),
                          Icon(
                            PhosphorIconsBold.magnifyingGlass,
                            color: AppColors.greyMedium,
                            size: 18.sp,
                          ),
                          Gap(8.w),
                          Expanded(
                            child: TextField(
                              controller: _searchConroller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search or paste URL',
                                hintStyle: TextStyle(
                                  color: AppColors.greyMedium,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            PhosphorIconsBold.cards,
                            color: AppColors.greyMedium,
                            size: 18.sp,
                          ),
                          Gap(16.w),
                        ],
                      ),
                    ),
                    Gap(16.h),

                    SizedBox(
                      height: 38.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          _buildLeaderBoardFilter(
                            context, 'Top Coins', () {}, true,),
                          _buildLeaderBoardFilter(
                            context, 'Top Referrals', () {}, false,),
                          _buildLeaderBoardFilter(
                            context, 'Top XP', () {}, false,),
                          _buildLeaderBoardFilter(
                            context, 'Top TVL', () {}, false,),
                        ],
                      ),
                    ),

                    const Spacer(),
                    _buildLeaderBoard(context),
                  ],
                ),
              ),

              Gap(10.h),
              _buildRankingList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderBoardFilter(
    BuildContext context, String label, VoidCallback onTap, bool isSelected,) => Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 6.h,
      ),
      margin: EdgeInsets.only(
        left: 14.w,
      ),
      decoration: BoxDecoration(
        border: isSelected
            ? null
            : Border.all(color: AppColors.greyLight, width: 1.5.w),
        borderRadius: BorderRadius.circular(30.r),
        color: isSelected ? AppColors.black : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: isSelected ? AppColors.white : AppColors.greyLight,
        ),
      ),
    );

  Widget _buildLeaderBoard(BuildContext context) {
    final double height = context.screenHeight;
    final double width = context.screenWidth;
    return SizedBox(
      height: height * .44 * .62,
      width: width * .8,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Assets.icons.exploreLeaderboardPodium.image(
              width: width * .8,
            ),
          ),
          Align(
            child: SizedBox(
              width: width * .7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Gap(16.h),
                      Image.network(
                        'https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png',
                        width: width * .1,
                      ),
                      Gap(4.h),
                      Text(
                        'USDC',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: AppColors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(PhosphorIconsBold.alien, size: 16.sp),
                            Gap(3.w),
                            Text(
                              '3022',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.greyLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.network(
                        'https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png',
                        width: width * .1,
                      ),
                      Gap(4.h),
                      Text(
                        'Aptos',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: AppColors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(PhosphorIconsBold.alien, size: 16.sp),
                            Gap(3.w),
                            Text(
                              '3022',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.greyLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Gap(18.h),
                      Image.network(
                        'https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png',
                        width: width * .1,
                      ),
                      Gap(4.h),
                      Text(
                        'Doge',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: AppColors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(PhosphorIconsBold.alien, size: 16.sp),
                            Gap(3.w),
                            Text(
                              '3022',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.greyLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankingList(BuildContext context) {
    final double width = context.screenWidth;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
      ),  
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (BuildContext ctx, int index) {
          final List<String> coinsLogos = <String>[
            'https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png',
            'https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png',
            'https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png',
            'https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png',
            'https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png',
            'https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png',
            'https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png',
          ];
          return ListTile(
            horizontalTitleGap: 12.w,
            leading: Image.network(
              coinsLogos[index],
              width: width * .12,
            ),
            title: Text(
              'Boomer',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'x0090901...123',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.greyLight,
              ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '#3',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(PhosphorIconsBold.alien, size: 16.sp),
                      Gap(3.w),
                      Text(
                        '3.8M',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
