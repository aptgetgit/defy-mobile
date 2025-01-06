import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/routes/router.dart';
import 'package:defy/features/leverage_trading/domain/trading_pair_model.dart';
import 'package:defy/features/leverage_trading/presentation/providers/leverage_trading_provider.dart';
import 'package:defy/features/leverage_trading/presentation/screens/leverage_trading_view.dart';
import 'package:defy/features/leverage_trading/presentation/widgets/leverage_trade_pair_view_sort_bottom_sheet.dart';
import 'package:defy/features/shared/presentation/widgets/black_button.dart';
import 'package:defy/features/shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LeverageTradingPairView extends ConsumerWidget {
  const LeverageTradingPairView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(leverageTradingProvider);
    final controller = ref.watch(leverageTradingProvider.notifier);

    final List<TradingPairModel> tradingPair = [
      TradingPairModel(
          token1: 'ETH',
          token2: 'USDC',
          token1Asset: 'assets/icons/ethereum-circular.png',
          token2Asset: 'assets/icons/usdc.png',
          volume: '\$89M',
          value: '\$14900.84',
          change: '0.12%'),
      TradingPairModel(
          token1: 'USDC',
          token2: 'ETH',
          token1Asset: 'assets/icons/usdc.png',
          token2Asset: 'assets/icons/ethereum-circular.png',
          volume: '\$89M',
          value: '\$14900.84',
          change: '0.12%'),
      TradingPairModel(
          token1: 'MATIC',
          token2: 'DAI',
          token1Asset: 'assets/icons/polygon.png',
          token2Asset: 'assets/icons/dai.png',
          volume: '\$89M',
          value: '\$14900.84',
          change: '0.12%'),
      TradingPairModel(
          token1: 'MATIC',
          token2: 'ETH',
          token1Asset: 'assets/icons/polygon.png',
          token2Asset: 'assets/icons/ethereum-circular.png',
          volume: '\$89M',
          value: '\$14900.84',
          change: '0.12%'),
      TradingPairModel(
          token1: 'APT',
          token2: 'USDC',
          token1Asset: 'assets/icons/aptos.png',
          token2Asset: 'assets/icons/usdc.png',
          volume: '\$89M',
          value: '\$14900.84',
          change: '0.12%'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Leverage Trade",
          style: context.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'All',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const Gap(16),
                  Text(
                    'Crypto',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.grey,
                    ),
                  ),
                  const Gap(16),
                  Text(
                    'Forex',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.grey,
                    ),
                  ),
                  const Gap(16),
                  Text(
                    'Comm',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.grey,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LeverageTradingView(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.greyVeryLight,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.bold),
                        color: AppColors.greyMedium,
                        size: 18,
                      ),
                    ),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (context) =>
                            LeverageTradePairViewSortBottomSheet(),
                      ).then((result) {
                        if (result != null) {
                          print(
                              'Sort by: ${result['sortBy']}, Ascending: ${result['isAscending']}');
                        }
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LeverageTradingView(),
                      //   ),
                      // );
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.greyVeryLight,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        PhosphorIcons.funnelSimple(PhosphorIconsStyle.bold),
                        color: AppColors.greyMedium,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(4),
              const Divider(
                color: AppColors.greyVeryLight,
                thickness: 2,
              ),
              ...tradingPair.asMap().entries.map((entry) {
                final pair = entry.value;

                return GestureDetector(
                  onTap: () {
                    controller.updateSelectedPair(pair);
                    LeverageTradingViewRoute().push(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        Image.asset(
                          pair.token1Asset,
                          height: 44,
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${pair.token1}${pair.token2}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '+${pair.change}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              pair.value,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
          buttonText1: 'Cancel', buttonColor1: AppColors.black, onTap1: () {}),
    );
  }
}
