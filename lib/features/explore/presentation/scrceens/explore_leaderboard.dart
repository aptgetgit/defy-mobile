import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExploreLeaderboardScreen extends StatefulWidget {
  const ExploreLeaderboardScreen({super.key});

  @override
  State<ExploreLeaderboardScreen> createState() =>
      _ExploreLeaderboardScreenState();
}

class _ExploreLeaderboardScreenState extends State<ExploreLeaderboardScreen> {
  final TextEditingController _searchConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight;
    final width = context.screenWidth;
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f6),
      appBar: AppBar(
        backgroundColor: Color(0xffd1d0c9),
        centerTitle: true,
        title: Text(
          'Leaderboard',
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
              Container(
                color: Color(0xffd1d0c9),
                height: height * .44,
                child: Column(
                  children: [
                    //search bar
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
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
                    const Gap(16),

                    //filters scroll
                    SizedBox(
                      height: 38,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          _buildLeaderBoardFilter(
                              context, 'Top Coins', () {}, true),
                          _buildLeaderBoardFilter(
                              context, 'Top Referrals', () {}, false),
                          _buildLeaderBoardFilter(
                              context, 'Top XP', () {}, false),
                          _buildLeaderBoardFilter(
                              context, 'Top TVL', () {}, false),
                        ],
                      ),
                    ),

                    const Spacer(),
                    //leaderboard
                    _buildLeaderBoard(context),
                  ],
                ),
              ),

              //user rankings
              const Gap(10),
              _buildRankingList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderBoardFilter(
      BuildContext context, String label, VoidCallback onTap, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      margin: EdgeInsets.only(
        left: 14,
      ),
      decoration: BoxDecoration(
        border: isSelected
            ? null
            : Border.all(color: AppColors.greyLight, width: 1.5),
        borderRadius: BorderRadius.circular(30),
        color: isSelected ? AppColors.black : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isSelected ? AppColors.white : AppColors.greyLight,
        ),
      ),
    );
  }

  Widget _buildLeaderBoard(BuildContext context) {
    final height = context.screenHeight;
    final width = context.screenWidth;
    return SizedBox(
      height: height * .44 * .62,
      width: width * .8,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Assets.icons.exploreLeaderboardPodium.image(
              width: width * .8,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: width * .7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Gap(16),
                      Image.network(
                        "https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png",
                        width: width * .1,
                      ),
                      const Gap(4),
                      Text(
                        'USDC',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(PhosphorIconsBold.alien, size: 16),
                              const Gap(3),
                              Text(
                                '3022',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.greyLight,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
                        width: width * .1,
                      ),
                      const Gap(4),
                      Text(
                        'Aptos',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(PhosphorIconsBold.alien, size: 16),
                              const Gap(3),
                              Text(
                                '3022',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.greyLight,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      const Gap(18),
                      Image.network(
                        "https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png",
                        width: width * .1,
                      ),
                      const Gap(4),
                      Text(
                        'Doge',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(PhosphorIconsBold.alien, size: 16),
                              const Gap(3),
                              Text(
                                '3022',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.greyLight,
                                ),
                              ),
                            ],
                          )),
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
    final width = context.screenWidth;
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(18),
    ),  
    child : ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (ctx, index) {
                  final coinsLogos = [
                    "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
                    "https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png",
                    "https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png",
                    "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
                    "https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png",
                    "https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png",
                    "https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png",
                  ];
                  return ListTile(
                    horizontalTitleGap: 12,
                    leading: Image.network(
                      coinsLogos[index],
                      width: width * .12,
                    ),
                    title: Text(
                          'Boomer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    subtitle: Text(
                      'x0090901...123',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyLight),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '#3',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(PhosphorIconsBold.alien, size: 16),
                              const Gap(3),
                              Text(
                                '3.8M',
                                style: TextStyle(
                                  fontSize: 14,
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
