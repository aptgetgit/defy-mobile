import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/extensions/context_extensions.dart';

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
    final double width = context.screenWidth;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(
              'https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png',
              width: width * .08,
            ),
            Gap(4.w),
            Text(
              'APTMAN (APTMAN)',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Gap(8.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 8.w),
                    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8.w),
                    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight2,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text(
                      'Sell',
                      style: TextStyle(
                        color: AppColors.greyLight,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8.w),
                    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight2,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text(
                      'Buy',
                      style: TextStyle(
                        color: AppColors.greyLight,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Transactions
            Expanded(
              child: ListView.builder(
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
                      width: width * .08,
                    ),
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          '0x1a2b3c',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(12.w),
                        Text(
                          'SELL',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      '2 mins ago',
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
                          '4.55 APT',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '1832272860',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyLight,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
