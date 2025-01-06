import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExplorePumpFunTokenTransactionsScreen extends StatefulWidget {
  const ExplorePumpFunTokenTransactionsScreen({super.key});

  @override
  State<ExplorePumpFunTokenTransactionsScreen> createState() =>
      _ExplorePumpFunTokenTransactionsScreenState();
}

class _ExplorePumpFunTokenTransactionsScreenState
    extends State<ExplorePumpFunTokenTransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    return Scaffold(
      appBar : AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
                      "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
                      width: width * .08,
                    ),
                    const Gap(4),
                    Text('APTMAN (APTMAN)',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Gap(8),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                        color: AppColors.greyVeryLight2,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      'Sell',
                      style: TextStyle(
                        color: AppColors.greyLight,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                        color: AppColors.greyVeryLight2,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      'Buy',
                      style: TextStyle(
                        color: AppColors.greyLight,
                      ),
                    ),
                  )
                ],
              ),
            ),

            //transactions

            Expanded(
              child: ListView.builder(
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
                      width: width * .08,
                    ),
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '0x1a2b3c',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap(12),
                        Text(
                          'SELL',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      '2 mins ago',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyLight),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '4.55 APT',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '1832272860',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyLight,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
