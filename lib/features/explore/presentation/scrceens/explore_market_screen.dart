import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExploreMarketScreen extends StatefulWidget {
  const ExploreMarketScreen({super.key});

  @override
  State<ExploreMarketScreen> createState() => _ExploreMarketScreenState();
}

class _ExploreMarketScreenState extends State<ExploreMarketScreen> {
  final TextEditingController _searchConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Market Explore',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //search bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xfff4f4f6),
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
              const Gap(12),

              //banners scroll
              _buildTopBanner(context),

              //vaults
              _buildCategoryHeader('Vaults', () {}),
              _buildVaultTile(context),

              //yield strategies
              _buildCategoryHeader('Yield Strategies', () {}),
              _buildYieldStrategies(context),

              //leverage trades
              _buildCategoryHeader('Leverage Trade', () {}),
              _buildYLeverageTrade(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryHeader(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
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
                color: Colors.grey,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.white.withOpacity(.2),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            PhosphorIcons.usersThree(),
                            color: AppColors.white,
                          ),
                          const Gap(6),
                          Text(
                            '562',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget _buildVaultTile(BuildContext context) {
    final width = context.screenWidth;
    final coinsLogos = [
      "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
      "https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png",
      "https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png",
      "https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png"
    ];
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (ctx, index) {
        return Container(
          padding: EdgeInsets.all(14),
          margin: EdgeInsets.only(left: 18, right: 18, bottom: 16),
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight2,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basket of memes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(4),
              Row(
                children: [
                  SizedBox(
                    height: width * .06,
                    width: width * .055 * 4,
                    child: Stack(
                      children: [
                        for (int i = 0; i < 4; i++)
                          Positioned(
                            left: i * width * .045,
                            child: Image.network(
                              coinsLogos[i],
                              width: width * .06,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    '+2',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyLight,
                    ),
                  )
                ],
              ),
              const Gap(14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Investors',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyLight,
                    ),
                  ),
                  Text(
                    'All time Returns',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyLight,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '562',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Icon(PhosphorIconsFill.caretUp, color: AppColors.green),
                  Text(
                    '22.71%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.green,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildYieldStrategies(BuildContext context) {
    final width = context.screenWidth;
    final coinsLogos = [
      "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
      "https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png",
      "https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png",
      "https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png"
    ];
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: coinsLogos.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            horizontalTitleGap: 12,
            leading: Image.network(
              coinsLogos[index],
              width: width * .1,
            ),
            title: Text(
              'APTOS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              '\$76.56M TVL',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyLight),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '56% APR',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Variable',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.greyLight),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildYLeverageTrade(BuildContext context) {
    final width = context.screenWidth;
    final coinsLogos = [
      "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
      "https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png",
      "https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png",
      "https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png"
    ];
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: coinsLogos.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          horizontalTitleGap: 12,
          leading: SizedBox(
            width: width * .08 * 1.5,
            child: Stack(children: [
              for (int i = 0; i < 2; i++)
                Positioned(
                  left: i * (width * .08) / 2,
                  child: Image.network(
                    coinsLogos[i],
                    width: width * .08,
                  ),
                ),
            ]),
          ),
          title: Text(
            'APT/USDC',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: RichText(
            text: TextSpan(
              text: 'VOL ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.greyLight,
              ),
              children: [
                TextSpan(
                    text: '\$89M',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.greyDark,
                    )),
              ],
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '56% APR',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '+0.023%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.green,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
