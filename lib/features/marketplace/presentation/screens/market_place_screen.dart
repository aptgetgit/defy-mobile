import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import 'nft_marketplace_screen.dart';
import '../../../shared/presentation/widgets/black_button.dart';


class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({super.key});

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 24,
                ),
                Text(
                  'Market',
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 24,
                  child: Icon(
                    PhosphorIconsBold.storefront,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Gap(26),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const YieldView()));
                      // const YieldViewRoute().push(context);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xff8E9FA7),
                            Color(0xffCCBCB1),
                          ], // Gradient from https://learnui.design/tools/gradient-generator.html
                          tileMode: TileMode.mirror,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 20,),
                        child: Column(
                          children: <Widget>[
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Yield\nAggregator ',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,),
                              ),
                            ),
                            SizedBox(
                              height: 120,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    bottom: 30,
                                    left: 0,
                                    child: SizedBox(
                                      height: 64,
                                      width: 64,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.32),
                                            borderRadius:
                                                BorderRadius.circular(50),),
                                        child: const Center(
                                          child: Text(
                                            '🤯',
                                            style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w700,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.32),
                                            borderRadius:
                                                BorderRadius.circular(50),),
                                        child: const Center(
                                          child: Text(
                                            '🚀',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: SizedBox(
                                      height: 55,
                                      width: 55,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.32),
                                            borderRadius:
                                                BorderRadius.circular(50),),
                                        child: const Center(
                                          child: Text(
                                            '💸',
                                            style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w700,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Gap(22),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Earn 100% APY',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.greyVeryLight,),
                                ),
                                Icon(
                                  PhosphorIconsBold.arrowCircleUpRight,
                                  size: 32,
                                  color: AppColors.greyVeryLight,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          // const LeverageTradingViewRoute().push(context);
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xffBAA0FF),),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14, vertical: 20,),
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Leverage',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,),
                                      ),
                                      Text(
                                        'Trading',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Image(
                                      height: 52,
                                      image: AssetImage(
                                          'assets/images/Leverage-Bar.png',),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Gap(8),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => const NFTMarketplaceScreen(),),);
                          // const NFTMarketplaceScreenRoute().push(context);
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xffE1C3E1),
                                Color(0xffDFE4FF),
                                Color(0xffB2DCE8),
                              ], // Gradient from https://learnui.design/tools/gradient-generator.html
                              tileMode: TileMode.mirror,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 14, top: 20,),
                            child: Stack(
                              children: <Widget>[
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'NFT',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.greyDark,),
                                      ),
                                      Text(
                                        'Marketplace',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.greyDark,),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: const Image(
                                        height: 92,
                                        image: AssetImage(
                                            'assets/images/Nft-Marketplace.png',),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(24),
            DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.greyVeryLight,),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text.rich(TextSpan(
                            text: 'Co-Invest\n',
                            style: TextStyle(
                                color: AppColors.greyDark,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,),
                            children: <InlineSpan>[
                              TextSpan(
                                  text: 'on Collectables',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,),),
                            ],),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              PhosphorIconsFill.sparkle,
                              size: 24,
                              color: AppColors.blue,
                            ),
                            Gap(6),
                            Text(
                              'New Feature',
                              style: TextStyle(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image(
                          height: 52,
                          image: AssetImage('assets/images/Co-Invest.png'),
                        ),
                        BlackButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),),
    );
}
