import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../../config/theme/font.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../shared/presentation/widgets/base_screen_nav.dart';
import '../providers/explore_ui_provider.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Animation<Offset> slideAnimation({
    required Offset begin,
    required Offset end,
  }) =>
      Tween<Offset>(
        begin: begin,
        end: end,
      ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = context.screenHeight;
    // const double appBarHeight = kToolbarHeight;
    // final Size screenSize = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        BaseScreenWithNav(
          currentIndex: 1,
          onTabChange: (int index) {
            if (index == 1) {
              GoRouter.of(context).go('/explore');
            } else if (index == 2) {
              GoRouter.of(context).go('/wallet');            }
          },
          isMoreOptionsSelected: false,
          onHidePressed: () {},
          onSortPressed: () {},
          onWatchlistPressed: () {},
          onMoreOptionsChanged: (_) {},
          child: Scaffold(
            backgroundColor: const Color(0xfff4f4f6),
            extendBody: true,
            body: SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(58.r),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            const ExploreSearchScreenRoute().push(context);
                          },
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
                                  enabled: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search browser or in-app',
                                    hintStyle: TextStyle(
                                      fontWeight: AppFont.medium,
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
                      ),
                      Gap(16.h),
                      SizedBox(
                        height: height / 4 * 2,
                        child: GridView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4.h,
                            crossAxisSpacing: 4.w,
                            mainAxisExtent: height / 4,
                          ),
                          children: <Widget>[
                            _buildMarket(context),
                            _buildDapps(context),
                            _buildCoins(context),
                            _buildNFTs(context),
                          ],
                        ),
                      ),
                      _buildRankings(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMarket(BuildContext context) {
    final Animation<Offset> slideAnimation1 = slideAnimation(begin: Offset.zero, end: const Offset(-1, -0.3));
    final double width = context.screenWidth;
    return GestureDetector(
      onTap: () {
        _controller
          ..reset()
          ..forward();
        Future<void>.delayed(_controller.duration!, () {
          const ExploreMarketScreenRoute().push(context);
        });
      },
      child: SlideTransition(
        position: slideAnimation1,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Assets.icons.marketExploreLogo.image(
                width: width * 1.34,
              ),
              Transform.rotate(
                angle: -math.pi / 38,
                child: Text(
                  'Invest',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDapps(BuildContext context) {
    final double width = context.screenWidth;
    final double height = context.screenHeight;
    return GestureDetector(
      onTap: () {
        const ExploreDappsScreenRoute().push(context);
      },
      child: Column(
        children: <Widget>[
          SizedBox(
            height: height / 4.5 * 0.63,
            width: width * .4,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Assets.icons.uniswapDexLogo.image(
                  width: width * .2,
                ),
                Positioned(
                  top: width * .065,
                  left: width * .4 * .15,
                  child: Assets.icons.rainbowWalletLogo.image(
                    width: width * .1,
                  ),
                ),
                Positioned(
                  top: 1,
                  right: width * .4 * .22,
                  child: Assets.icons.petraWalletLogo.image(
                    width: width * .14,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Dapps',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.greyLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoins(BuildContext context) {
    final Animation<Offset> slideAnimation1 = slideAnimation(begin: Offset.zero, end: const Offset(-1, 0.3));
    final double width = context.screenWidth;
    final List<String> coinsLogos = <String>[
      'https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png',
      'https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png',
      'https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png',
      'https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png',
    ];
    return Consumer(
      builder: (BuildContext ctx, WidgetRef ref, Widget? child) {
        final int index = ref.watch(coinsAnimationIndexProvider);
        return GestureDetector(
          onTap: () {
            const ExploreTokensScreenRoute().push(context);
          },
          child: SlideTransition(
            position: slideAnimation1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: Image.network(
                    coinsLogos[index],
                    width: width * .15,
                  ),
                ),
                Gap(6.h),
                Text(
                  'Coins',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLight,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNFTs(BuildContext context) {
    final Animation<Offset> slideAnimation2 = slideAnimation(begin: Offset.zero, end: const Offset(1, -0.3));
    final double width = context.screenWidth;
    final List<String> nftImages = <String>[
      'https://i.seadn.io/s/raw/files/10ccabdfb75f075c6a86e80c2c8ab33b.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/96008751ea35fab46c85f688f521054b.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/6e8b6e53ca87016580ec4bb58a66466a.png?auto=format&dpr=1&w=1000',
    ];

    return SlideTransition(
      position: slideAnimation2,
      child: GestureDetector(
        onTap: () {
          const ExploreNFTScreenRoute().push(context);
        },
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Transform.rotate(
                  angle: -math.pi / 14,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      width: width * 0.3,
                      height: width * 0.45,
                      imageUrl: nftImages[0],
                      errorWidget: (BuildContext ctx, String str, Object obg) => Container(color: Colors.amber),
                      progressIndicatorBuilder: (BuildContext ctx, String str, DownloadProgress download) =>
                          CircularProgressIndicator(strokeWidth: 2.w),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: CachedNetworkImage(
                    width: width * 0.35,
                    height: width * 0.4,
                    imageUrl: nftImages[1],
                    fit: BoxFit.cover,
                    errorWidget: (BuildContext ctx, String str, Object obg) => Container(color: Colors.amber),
                    progressIndicatorBuilder: (BuildContext ctx, String str, DownloadProgress download) =>
                        CircularProgressIndicator(strokeWidth: 2.w),
                  ),
                ),
                Transform.rotate(
                  angle: math.pi / 14,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      width: width * 0.35,
                      height: width * 0.4,
                      imageUrl: nftImages[2],
                      fit: BoxFit.cover,
                      errorWidget: (BuildContext ctx, String str, Object obg) => Container(color: Colors.amber),
                      progressIndicatorBuilder: (BuildContext ctx, String str, DownloadProgress download) =>
                          CircularProgressIndicator(strokeWidth: 2.w),
                    ),
                  ),
                ),
              ],
            ),
            Gap(8.h),
            Text(
              'NFTs',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.greyLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankings(BuildContext context) {
    final double width = context.screenWidth;
    return GestureDetector(
      onTap: () => const ExploreLeaderboardScreenRoute().push(context),
      child: Transform.rotate(
        angle: math.pi / 22,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Assets.icons.exploreRankingsBanner.image(
                  width: width * .78,
                ),
              ],
            ),
            Text(
              'Rankings',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.greyLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
