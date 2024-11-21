import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExploreCoinsScreen extends StatefulWidget {
  const ExploreCoinsScreen({super.key});

  @override
  State<ExploreCoinsScreen> createState() => _ExploreCoinsScreenState();
}

class _ExploreCoinsScreenState extends State<ExploreCoinsScreen> {
  final TextEditingController _searchConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyVeryLight2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //search bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Icon(PhosphorIconsBold.caretLeft),
                    const Gap(12),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(58),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Gap(16),
                            Icon(
                              PhosphorIconsBold.magnifyingGlass,
                              color: AppColors.greyMedium,
                            ),
                            const Gap(8),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.start,
                                controller: _searchConroller,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search or paste URL",
                                  hintStyle: TextStyle(
                                    color: AppColors.greyMedium,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              PhosphorIconsBold.cards,
                              color: AppColors.greyMedium,
                            ),
                            const Gap(16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(12),

              //banners scroll
              _buildTopBanner(context),

              //pump.uptos.fun
              _buildCategoryHeader('pump.uptos.fun', () {}),
              _buildPumpFunTile(context),

              //mcap coins
              _buildCategoryHeader('Top MCAP Coins', () {}),
              _buildTopMCAPCoin(context),

              //top meme coins
              _buildCategoryHeader('Top Meme Coins', () {}),
              _buildTopMemeCoins(context),

              //top volume
              _buildCategoryHeader('Top Volume', () {}),
              _buildTopVolume(context),

              //mcap coins
              _buildCategoryHeader('Highest Gainers', () {}),
              _buildHighestGainers(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryHeader(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(left : 18,right:18,bottom : 14,top :22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(PhosphorIcons.caretRight(), color: AppColors.blue),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTopBanner(BuildContext context) {
    final width = context.screenWidth;
    return SizedBox(
      height: width * .6,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (ctx, index) {
            return Container(
              margin: EdgeInsets.only(left: 18),
              width: width * .55,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 43, 123, 188),
                borderRadius: BorderRadius.circular(18),
              ),
              //child:
            );
          }),
    );
  }

  Widget _buildPumpFunTile(BuildContext context) {
    final width = context.screenWidth;
    final nftImages = [
      "https://i.seadn.io/gcs/files/3a5633d4f4374535efe8760919229b0e.png?auto=format&dpr=1&w=1000",
      "https://i.seadn.io/s/raw/files/96008751ea35fab46c85f688f521054b.png?auto=format&dpr=1&w=1000",
    ];
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (ctx, index) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: width * .28,
                  height: width * .28,
                  imageUrl: nftImages[index],
                  errorWidget: (ctx, str, obg) =>
                      Container(color: Colors.amber),
                  progressIndicatorBuilder: (ctx, str, download) =>
                      const CircularProgressIndicator(),
                ),
              ),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'APTMAN (APTMAN)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Are you APTMAN?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.greyLight),
                  ),
                  const Gap(6),
                  RichText(
                    text: TextSpan(
                      text: 'Created by ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.greyLight,
                      ),
                      children: [
                        TextSpan(
                          text: 'TheWeimals',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'MCAP:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyLight,
                          ),
                          children: [
                            TextSpan(
                              text: '313',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Replies:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyLight,
                          ),
                          children: [
                            TextSpan(
                              text: '1,322',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTopMCAPCoin(BuildContext context) {
    final coinsLogos = [
      "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
      "https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png",
      "https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png",
      "https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png"
    ];
    final width = context.screenWidth;
    return SizedBox(
      height: width * .33,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: coinsLogos.length,
          itemBuilder: (ctx, index) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(left: 16),
              width: width * .45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          width: width * .4 * .23,
                          height: width * .4 * .23,
                          imageUrl: coinsLogos[index],
                          errorWidget: (ctx, str, obg) =>
                              Container(color: Colors.amber),
                          progressIndicatorBuilder: (ctx, str, download) =>
                              const CircularProgressIndicator(),
                        ),
                      ),
                      const Gap(6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aptos',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'APT',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyLight),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: AppColors.greyVeryLight2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MCAP',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyLight),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$3.15M',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Icon(PhosphorIconsFill.caretUp,
                                color: AppColors.green, size: 18),
                            Text(
                              '2.5%',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget _buildTopMemeCoins(BuildContext context) {
    final coinsLogos = [
      "https://cryptologos.cc/logos/bonk1-bonk-logo.png?v=035",
      "https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png",
      "https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png",
      "https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png"
    ];
    final width = context.screenWidth;
    return SizedBox(
      height: width * .33,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: coinsLogos.length,
          itemBuilder: (ctx, index) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(left: 16),
              width: width * .45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          width: width * .4 * .23,
                          height: width * .4 * .23,
                          imageUrl: coinsLogos[index],
                          errorWidget: (ctx, str, obg) =>
                              Container(color: Colors.amber),
                          progressIndicatorBuilder: (ctx, str, download) =>
                              const CircularProgressIndicator(),
                        ),
                      ),
                      const Gap(6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bonk',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'BONK',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyLight),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$0.00002348',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(PhosphorIconsFill.caretUp,
                                color: AppColors.green, size: 18),
                            Text(
                              '2.5%',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget _buildTopVolume(BuildContext context) {
    final coinsLogos = [
      "https://cryptologos.cc/logos/bonk1-bonk-logo.png?v=035",
      "https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png",
      "https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png",
      "https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png"
    ];
    final colors = [
      AppColors.black,
      AppColors.blue,
      AppColors.green,
      AppColors.red,
    ];
    final width = context.screenWidth;
    return SizedBox(
      height: width * .33,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: coinsLogos.length,
          itemBuilder: (ctx, index) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(left: 16),
              width: width * .45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: colors[index],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          width: width * .4 * .23,
                          height: width * .4 * .23,
                          imageUrl: coinsLogos[index],
                          errorWidget: (ctx, str, obg) =>
                              Container(color: Colors.amber),
                          progressIndicatorBuilder: (ctx, str, download) =>
                              const CircularProgressIndicator(),
                        ),
                      ),
                      const Gap(8),
                      Text(
                        'APTOS',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Text(
                          '\$32M',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                        const Spacer(),
                        Icon(PhosphorIconsBold.arrowCircleUpRight,
                            color: AppColors.white, size: 28),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget _buildHighestGainers(BuildContext context) {
    final coinsLogos = [
      "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
      "https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png",
      "https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png",
      "https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png"
    ];
    final width = context.screenWidth;
    return SizedBox(
      height: width * .33,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: coinsLogos.length,
          itemBuilder: (ctx, index) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(left: 16),
              width: width * .45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          width: width * .4 * .23,
                          height: width * .4 * .23,
                          imageUrl: coinsLogos[index],
                          errorWidget: (ctx, str, obg) =>
                              Container(color: Colors.amber),
                          progressIndicatorBuilder: (ctx, str, download) =>
                              const CircularProgressIndicator(),
                        ),
                      ),
                      const Gap(6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aptos',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'APT',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyLight),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: AppColors.greyVeryLight2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MCAP',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyLight),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$3.15M',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Icon(PhosphorIconsFill.caretUp,
                                color: AppColors.green, size: 18),
                            Text(
                              '2.5%',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
