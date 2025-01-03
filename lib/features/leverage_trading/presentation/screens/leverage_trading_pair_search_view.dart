import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/leverage_trading/domain/trading_pair_model.dart';
import 'package:defy/features/leverage_trading/presentation/providers/leverage_trading_provider.dart';
import 'package:defy/features/shared/presentation/widgets/black_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LeverageTradingPairSearchView extends ConsumerWidget {
  final List<TradingPairModel> tradingPair;

  const LeverageTradingPairSearchView({required this.tradingPair, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(leverageTradingProvider);
    final controller = ref.watch(leverageTradingProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                PhosphorIcons.caretLeft(PhosphorIconsStyle.regular),
                color: Colors.black,
                size: 20,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Market",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
            ),
            const Spacer(),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  color: AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.bold),
                      color: Colors.black.withOpacity(0.5),
                      size: 20,
                    ),
                    const Gap(10),
                    Text(
                      "Search Token",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              ...tradingPair.asMap().entries.map((entry) {
                final pair = entry.value;

                return GestureDetector(
                  onTap: () {
                    controller.updateSelectedPair(pair);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          pair.token1Asset,
                          height: 40,
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${pair.token1}/${pair.token2}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'VOL ${pair.volume}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              pair.value, // Use the name from your model
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '+${pair.change}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.green,
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
    );
  }
}
