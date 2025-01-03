import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/leverage_trading/domain/trading_pair_model.dart';
import 'package:defy/features/leverage_trading/presentation/providers/leverage_trading_provider.dart';
import 'package:defy/features/leverage_trading/presentation/screens/leverage_trading_pair_search_view.dart';
import 'package:defy/features/leverage_trading/presentation/widgets/leverage_trading_chart.dart';
import 'package:defy/features/leverage_trading/presentation/widgets/leverage_trading_sell_widget.dart';
import 'package:defy/features/staking/presentation/screens/staking_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LeverageTradingSellView extends ConsumerStatefulWidget {
  final TradingPairModel selectedpair;
  final List<TradingPairModel> tradingPair;
  const LeverageTradingSellView(
      {required this.selectedpair, required this.tradingPair, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LeverageTradingSellViewState();
}

class _LeverageTradingSellViewState
    extends ConsumerState<LeverageTradingSellView> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(leverageTradingProvider);
    final controller = ref.watch(leverageTradingProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                PhosphorIcons.caretLeft(PhosphorIconsStyle.regular),
                color: Colors.black,
              ),
            ),
            const Gap(10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LeverageTradingPairSearchView(
                      tradingPair: widget.tradingPair,
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  Image.asset(state.selectedPair.token1Asset, height: 32),
                  const Gap(10),
                  Text(
                    "${state.selectedPair.token1}${state.selectedPair.token2}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  const Gap(5),
                  Text('sell',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.red)),
                ],
              ),
            ),
            const Spacer(),
            Text('90.',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.black)),
            Text('02',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.red)),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: (state.sltp && !controller.isKeyboardVisible()) ||
                    (!state.sltp && controller.isKeyboardVisible()) ||
                    (!state.sltp && !controller.isKeyboardVisible())
                ? LeverageTradingChart()
                : SizedBox.shrink(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              constraints: BoxConstraints(
                maxHeight: state.sltp
                    ? MediaQuery.of(context).size.height
                    : MediaQuery.of(context).size.height * 0.8,
              ),
              child: LeverageTradingSellWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
