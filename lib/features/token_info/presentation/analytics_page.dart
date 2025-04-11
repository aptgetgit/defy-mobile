import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../../core/extensions/context_extensions.dart';
import '../widgets/addressholdings_table.dart';
import '../widgets/price_range_section.dart';
import '../widgets/transactions_table.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  bool _showAllExchanges = false;

  final List<Map<String, String>> exchanges = <Map<String, String>>[
    <String, String>{'assets': 'assets/icons/kraken.png', 'dex': 'Kraken', 'vol': r'$100M', 'price': r'$14,232.84'},
    <String, String>{'assets': 'assets/icons/coinbase.png', 'dex': 'Coinbase', 'vol': r'$100M', 'price': r'$14,232.84'},
    <String, String>{'assets': 'assets/icons/binance.png', 'dex': 'Binance', 'vol': r'$100M', 'price': r'$14,232.84'},
    <String, String>{'assets': 'assets/icons/binance.png', 'dex': 'Binance', 'vol': r'$100M', 'price': r'$14,232.84'},
    <String, String>{'assets': 'assets/icons/binance.png', 'dex': 'Binance', 'vol': r'$100M', 'price': r'$14,232.84'},
  ];

  List<Map<String, String>> get visibleExchanges => 
    _showAllExchanges ? exchanges : exchanges.take(3).toList();

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.all(context.screenWidth * 0.04),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('LISTED AT (${exchanges.length})', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(height: context.screenHeight * 0.0125),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...visibleExchanges.map((Map<String, String> type) => Padding(
              padding: EdgeInsets.only(bottom: context.screenHeight * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(type['assets']!, height: 32.h, width: 32.w),
                  SizedBox(width: context.screenWidth * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(type['dex']!, style: context.bodyMedium),
                      Row(
                        children: <Widget>[
                          Text('VOL ', style: context.bodyMedium?.copyWith(color: Colors.black.withValues(alpha: 0.5))),
                          Text(type['vol']!, style: context.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(type['price']!, style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
            ),),
            if (visibleExchanges.length < exchanges.length)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: context.screenHeight * 0.025),
                    child: Opacity(
                      opacity: 0.4, // Fade effect for the fourth item
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset(visibleExchanges.last['assets']!, height: 32.h, width: 32.w),
                          SizedBox(width: context.screenWidth * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(visibleExchanges.last['dex']!, style: context.bodyMedium),
                              Row(
                                children: <Widget>[
                                  Text('VOL ', style: context.bodyMedium?.copyWith(color: Colors.black.withValues(alpha: 0.5))),
                                  Text(visibleExchanges.last['vol']!, style: context.bodyMedium),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(visibleExchanges.last['price']!, style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: context.screenHeight * 0.025),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showAllExchanges = true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'See all',
                            style: context.labelLarge?.copyWith(
                              color: AppColors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Icon(PhosphorIconsRegular.caretRight, size: 16, color: AppColors.blue),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        Row(
          children: <Widget>[
            Text('24 HR TRADING ACTIVITY', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(height: context.screenHeight * 0.025),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.05,
                    vertical: context.screenHeight * 0.01,
                  ),
                  height: context.screenHeight * 0.195,
                  width: context.screenWidth * 0.58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey[300]!,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('TXN', style: context.titleMedium?.copyWith(color: Colors.grey)),
                              Text('5,034', style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: context.screenHeight * 0.04,
                            width: context.screenHeight * 0.04,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[300]!),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Icon(PhosphorIconsRegular.bank, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: context.screenHeight * 0.0125),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                        height: context.screenHeight * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.grey[300]!.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.0375),
                              child: Row(
                                children: <Widget>[
                                  Text('Buy', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.black.withValues(alpha: 0.5))),
                                  const Spacer(),
                                  Text('5,034', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.green)),
                                ],
                              ),
                            ),
                            const Divider(color: AppColors.greyLight),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.0375),
                              child: Row(
                                children: <Widget>[
                                  Text('Sell', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.black.withValues(alpha: 0.5))),
                                  const Spacer(),
                                  Text('5,034', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.red)),
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
              Gap(10.w),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.05,
                  vertical: context.screenHeight * 0.01,
                ),
                height: context.screenHeight * 0.195,
                width: context.screenWidth * 0.58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFFFFFFF),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey[300]!,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('VOLUME', style: context.titleMedium?.copyWith(color: Colors.grey)),
                            Text('5,034', style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: context.screenHeight * 0.04,
                          width: context.screenHeight * 0.04,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Icon(PhosphorIconsRegular.bank, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: context.screenHeight * 0.0125),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                      height: context.screenHeight * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.grey[300]!.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.0375),
                            child: Row(
                              children: <Widget>[
                                Text('Buy', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.black.withValues(alpha: 0.5))),
                                const Spacer(),
                                Text('5,034', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.green)),
                              ],
                            ),
                          ),
                          const Divider(color: AppColors.greyLight),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.0375),
                            child: Row(
                              children: <Widget>[
                                Text('Sell', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.black.withValues(alpha: 0.5))),
                                const Spacer(),
                                Text('5,034', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.red)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.screenHeight * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'PRICE RANGE',
              style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            Row(
              children: <String>['ALL', '1D', '1M', '1Y'].map((String period) => Padding(
                  padding: EdgeInsets.only(left: context.screenWidth * 0.050),
                  child: Text(
                    period,
                    style: context.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: period == 'ALL' ? Colors.black : AppColors.greyLight,
                    ),
                  ),
                ),).toList(),
            ),
          ],
        ),
        SizedBox(height: context.screenHeight * 0.0250),
        const PriceRangeSection(
          lowPrice: 14000.00,
          highPrice: 23000.00,
          lastTradedPrice: 18500.54,
        ),
        SizedBox(height: context.screenHeight * 0.025),
        Text('24 HR TRANSACTIONS', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
        SizedBox(height: context.screenHeight * 0.025),
        TransactionsTable(),
        SizedBox(height: context.screenHeight * 0.025),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'ADDRESS BY HOLDINGS (5202)',
              style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: context.screenHeight * 0.0250),
            Row(
              children: <Widget>[
                _buildCategory(context, r'$0-$1k', 2.36, AppColors.blue),
                Gap(20.w),
                _buildCategory(context, r'$1k-$100k', 8.6, AppColors.green),
                Gap(20.w),
                _buildCategory(context, r'$100k+', 0.85, AppColors.orange),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.025),
            AddressHoldingsTable(),
          ],
        ),
      ],
    ),
  );
}

Widget _buildCategory(BuildContext context, String range, double percentage, Color color) => Container(
  decoration: BoxDecoration(
    color: AppColors.greyVeryLight,
    borderRadius: BorderRadius.circular(8),
  ),
  width: 96.w,
  height: 65.h,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: context.screenHeight * 0.01),
          Text(
            range,
            style: context.bodySmall?.copyWith(color: AppColors.greyDark),
          ),
        ],
      ),
      Text(
        '${percentage.toStringAsFixed(2)}%',
        style: context.bodyMedium,
      ),
    ],
  ),
);
