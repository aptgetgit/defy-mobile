import 'dart:math' as math;


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../shared/presentation/widgets/base_screen_nav.dart';
import '../providers/explore_provider.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> with SingleTickerProviderStateMixin {
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
    print('ExploreScreen build');
    return BaseScreenWithNav(
      currentIndex: 1, // Explore screen index is 1
      onTabChange: (int index) {
        print("ExploreScreen: Tab change requested to index=$index");
        if (index == 1) {
          print("Already on explore screen");
          // Optional: Scroll to top or refresh
        } else if (index == 2) {
          print("Navigating to wallet");
          GoRouter.of(context).go('/wallet');
        }
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
                        print('Search bar tapped');
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
                                  fontWeight: FontWeight.w500,
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
                    height: context.screenHeight / 2,
                    child: GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4.h,
                        crossAxisSpacing: 4.w,
                        mainAxisExtent: context.screenHeight / 4,
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
    );
  }

  Widget _buildMarket(BuildContext context) {
    final Animation<Offset> slideAnimation1 = slideAnimation(begin: Offset.zero, end: const Offset(-1, -0.3));
    final double width = context.screenWidth;
    return GestureDetector(
      onTap: () {
        print('Market tapped');
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
        print('Dapps tapped');
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
    final exploreState = ref.watch(exploreNotifierProvider);

    return GestureDetector(
      onTap: () {
        print('Coins tapped');
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
                exploreState.allTokens.isNotEmpty
                    ? exploreState.allTokens.first.logo ?? 'default_image_url'
                    : 'default_image_url',
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
  }

  Widget _buildNFTs(BuildContext context) {
    final Animation<Offset> slideAnimation2 = slideAnimation(begin: Offset.zero, end: const Offset(1, -0.3));
    final double width = context.screenWidth;
    final double imageSize = width * 0.35; // Square size

    return SlideTransition(
      position: slideAnimation2,
      child: GestureDetector(
        onTap: () {
          print('NFTs tapped');
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
                    child: Image.asset(
                      'assets/images/nft_image1.png',
                      width: imageSize * 0.85,
                      height: imageSize * 0.85,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Hero(
                  tag: 'nft-hero-image',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      'assets/images/nft_image1.png',
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: math.pi / 14,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      'assets/images/nft_image1.png',
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
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
      onTap: () {
        print('Rankings tapped');
        const ExploreLeaderboardScreenRoute().push(context);
      },
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