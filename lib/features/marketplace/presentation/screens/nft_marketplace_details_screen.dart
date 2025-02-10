import 'dart:ui';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../widgets/nft_marketplace/expandable_nft_about_tile.dart';
import '../widgets/nft_marketplace/expandable_nft_schedule_tile.dart';


class NFTMarketplaceDetailsScreen extends StatefulWidget {
  const NFTMarketplaceDetailsScreen({super.key});

  @override
  State<NFTMarketplaceDetailsScreen> createState() =>
      _NFTMarketplaceDetailsScreenState();
}

class _NFTMarketplaceDetailsScreenState
    extends State<NFTMarketplaceDetailsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/NFT-Details-Bg.png'),
                    ),),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 72,
                          left: 24,
                          child: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(100),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),),
                                child: const Center(
                                  child: Icon(
                                    PhosphorIconsBold.caretLeft,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 600,
                            height: 80,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: <Color>[
                                Colors.white.withOpacity(0),
                                Colors.white,
                              ],
                              begin: FractionalOffset.topLeft,
                              end: const FractionalOffset(0, 1.5),
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const ClipRRect(
                              child: Image(
                                height: 64,
                                width: 64,
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/Dope-Kid.png'),
                              ),
                            ),
                            const Gap(6),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Drunk & Dope Kid',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'By Jerrold',
                                      style: TextStyle(
                                          color: AppColors.greyDark,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,),
                                    ),
                                    Gap(2),
                                    Image(
                                      height: 20,
                                      width: 20,
                                      image: AssetImage(
                                          'assets/images/Blue-Check.png',),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: AppColors.greyVeryLight,
                                      borderRadius: BorderRadius.circular(32),),
                                  child: const Center(
                                    child: Icon(
                                      PhosphorIconsBold.share,
                                      size: 20,
                                      color: AppColors.greyDark,
                                    ),
                                  ),
                                ),
                                const Gap(16),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: AppColors.greyVeryLight,
                                      borderRadius: BorderRadius.circular(32),),
                                  child: const Center(
                                    child: Icon(
                                      PhosphorIconsBold.dotsThreeVertical,
                                      size: 20,
                                      color: AppColors.greyDark,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(16),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: const Image(
                            width: double.infinity,
                            image: AssetImage(
                              'assets/images/NFT-Placeholder-XL.png',
                            ),
                          ),
                        ),
                        const ExpandableNFTAboutTile(),
                        const Gap(24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: <Widget>[
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Public Stage',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        '0.007 ETH',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        r'~$26.34',
                                        style:TextStyle(
                                          color: AppColors.greyLight,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Limit 45 per wallet',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.greyLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(20),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Also Minted by',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyDark,),
                                ),
                              ),
                              const Gap(6),
                              Row(
                                children: <Widget>[
                                  RowSuper(
                                    innerDistance: -4,
                                    children: const <Widget?>[
                                      Image(
                                          height: 20,
                                          width: 20,
                                          image: AssetImage(
                                              'assets/images/Doge-Circle.png',),),
                                      Image(
                                          height: 20,
                                          width: 20,
                                          image: AssetImage(
                                              'assets/images/Doge-Circle.png',),),
                                      Image(
                                          height: 20,
                                          width: 20,
                                          image: AssetImage(
                                              'assets/images/Doge-Circle.png',),),
                                    ],
                                  ),
                                  const Gap(6),
                                  const Text(
                                    'James, Jane +2 others',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,),
                                  ),
                                ],
                              ),
                              const Gap(20),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '13.4% Minted',
                                    style: TextStyle(
                                        color: AppColors.greyDark,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,),
                                  ),
                                  Text(
                                    '54 / 404',
                                    style: TextStyle(
                                      color: AppColors.greyLight,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(20),
                              Stack(
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    height: 16,
                                    decoration: BoxDecoration(
                                        color: AppColors.greyVeryLight,
                                        borderRadius:
                                            BorderRadius.circular(60),),
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: 0.4,
                                    child: Container(
                                      height: 16,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        gradient: const LinearGradient(
                                          colors: <Color>[
                                            Color(0xFF2071EE),
                                            Color(0xFF65A2FF),
                                          ],
                                          begin:
                                              FractionalOffset.topLeft,
                                          end: FractionalOffset.bottomRight,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(32),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Mint Schedule',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,),
                                ),
                              ),
                              const ExpandableNFTScheduleTile(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // const Gap(16),
          ColoredBox(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Gap(20),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.greyVeryLight,
                            borderRadius: BorderRadius.circular(6),),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            PhosphorIconsBold.minus,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Gap(20),
                      const Text(
                        '1',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,),
                      ),
                      const Gap(20),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.greyVeryLight,
                            borderRadius: BorderRadius.circular(6),),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            PhosphorIconsBold.plus,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 48, vertical: 16,),
                        child: Text(
                          'Mint',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 16,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(16),
        ],
      ),
    );
}
