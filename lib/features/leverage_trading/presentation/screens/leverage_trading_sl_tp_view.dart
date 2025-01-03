import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/leverage_trading/domain/leverage_trading_view_state.dart';
import 'package:defy/features/leverage_trading/presentation/providers/leverage_trading_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LeverageTradingSlTpView extends ConsumerStatefulWidget {
  const LeverageTradingSlTpView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LeverageTradingSlTpViewState();
}

class _LeverageTradingSlTpViewState
    extends ConsumerState<LeverageTradingSlTpView> {
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
              child: Row(
                children: [
                  RowSuper(innerDistance: -20, children: [
                    Image.asset(state.selectedPair.token1Asset, height: 32),
                    Image.asset(state.selectedPair.token2Asset, height: 32),
                  ]),
                  const Gap(10),
                  Text(
                    "${state.selectedPair.token1}${state.selectedPair.token2}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: AppColors.red.withOpacity(0.25),
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(8),
              child: Text('Trade',
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.red,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            _buildStopLossProfit(
              label: "Stop Loss",
              amount: state.slAmount,
              color: Colors.red,
              onTap: () => controller.toggleSlMode(),
              isToggled: state.toggleSlMode,
              state: state,
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildExpandedStopLossProfit(state, controller),
              ),
            ),
            _buildStopLossTakeProfitColumn(state, controller),
            const Gap(20),
            Column(
              children: [
                _buildRowButtons(['1', '2', '3'], state, controller, context),
                _buildRowButtons(['4', '5', '6'], state, controller, context),
                _buildRowButtons(['7', '8', '9'], state, controller, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton('.', null, state, controller, context),
                    _buildButton('0', null, state, controller, context),
                    _buildButton('cancel', PhosphorIconsBold.backspace, state,
                        controller, context),
                  ],
                ),
              ],
            ),
            const Gap(10),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.black,
                  border: const Border(
                    top: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                height: 60,
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const Gap(5),
          ],
        ),
      ),
    );
  }

  Widget _buildStopLossTakeProfitColumn(
      LeverageTradingViewState state, LeverageTrading controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        _buildPercentageTiles(state, controller),
        SizedBox(height: 20),
        _buildStopLossProfit(
          label: "Take Profit",
          amount: state.tpAmount,
          color: Colors.green,
          onTap: () => controller.toggleTpMode(),
          isToggled: state.toggleTpMode,
          state: state,
        ),
      ],
    );
  }

  Widget _buildExpandedStopLossProfit(
      LeverageTradingViewState state, LeverageTrading controller) {
    final isSlMode = state.toggleSlMode;
    final activeAmount = isSlMode ? state.slAmount : state.tpAmount;
    final activeLabel = isSlMode ? "Stop Loss" : "Take Profit";
    final activeColor = isSlMode ? Colors.red : Colors.green;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () =>
              isSlMode ? controller.toggleSlMode() : controller.toggleTpMode(),
          child: Text(
            activeAmount,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 48,
              color: activeColor,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          activeLabel,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.grey[600]!,
          ),
        ),
      ],
    );
  }

  Widget _buildPercentageTiles(
      LeverageTradingViewState state, LeverageTrading controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPercentageTile(
          label: "10%",
          onTap: () => controller.updatePayAmount("10"),
        ),
        const Gap(10),
        _buildPercentageTile(
          label: "25%",
          onTap: () => controller.updatePayAmount("25"),
        ),
        const Gap(10),
        _buildPercentageTile(
          label: "50%",
          onTap: () => controller.updatePayAmount("50"),
        ),
        const Gap(10),
        _buildPercentageTile(
          label: "75%",
          onTap: () => controller.updatePayAmount("75"),
        ),
      ],
    );
  }

  Widget _buildPercentageTile({
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.blue.withOpacity(0.25),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }

  Widget _buildStopLossProfit({
    required String label,
    required String amount,
    required Color color,
    required VoidCallback onTap,
    required bool isToggled,
    required LeverageTradingViewState state,
  }) {
    return AnimatedOpacity(
      opacity: isToggled ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: label == 'Stop Loss'
                      ? AppColors.red.withOpacity(0.25)
                      : AppColors.greenLight.withOpacity(0.25),
                ),
                child: Center(
                  child: Text(
                    amount,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildRowButtons(
    List<String> items, state, controller, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: items
        .map(
          (e) => _buildButton(e, null, state, controller, context),
        )
        .toList(),
  );
}

Widget _buildButton(
    String label,
    IconData? icon,
    LeverageTradingViewState state,
    LeverageTrading controller,
    BuildContext context) {
  return Expanded(
    child: InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        if (state.togglePayMode) {
          _handleButtonPress(
              label,
              state.payAmount,
              (amount) => controller.updatePayAmount(amount),
              controller.clearPayAmount,
              controller.removeLastCharacterFromPayAmount);
        } else if (state.togglePriceMode) {
          _handleButtonPress(
              label,
              state.priceAmount,
              (amount) => controller.updatePriceAmount(amount),
              controller.clearPriceAmount,
              controller.removeLastCharacterFromPriceAmount);
        } else if (state.toggleSlMode) {
          _handleButtonPress(
              label,
              state.slAmount,
              (amount) => controller.updateSlAmount(amount),
              controller.clearSlAmount,
              controller.removeLastCharacterFromSlAmount);
        } else if (state.toggleTpMode) {
          _handleButtonPress(
              label,
              state.tpAmount,
              (amount) => controller.updateTpAmount(amount),
              controller.clearTpAmount,
              controller.removeLastCharacterFromTpAmount);
        }
      },
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: icon == null ? 16 : 8, vertical: icon == null ? 10 : 8),
        child: icon == null
            ? Center(
                child: Text(
                  label,
                  style: context.bodyLarge
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              )
            : Icon(icon),
      ),
    ),
  );
}

void _handleButtonPress(
  String label,
  String currentAmount,
  Function(String) updateAmount,
  VoidCallback clearAmount,
  VoidCallback removeLastCharacter,
) {
  if (label == "Clear") {
    clearAmount();
  } else if (label == "cancel") {
    removeLastCharacter();
  } else {
    String newAmount = currentAmount == "0" ? label : currentAmount + label;
    updateAmount(newAmount);
  }
}
