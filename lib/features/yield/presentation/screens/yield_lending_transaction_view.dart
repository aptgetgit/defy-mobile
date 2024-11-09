import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/shared/presentation/widgets/custom_swipe_button.dart';
import 'package:defy/features/yield/domain/yield_lending_transaction_state.dart';
import 'package:defy_graphql/defy_graphql.dart';
import 'package:defy/features/yield/data/models/pool_data_response.dart';
import 'package:defy/features/yield/presentation/provider/yield_lending_transaction_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class YieldLendingTransactionView extends ConsumerWidget {
  final PoolDataResponse selectedTile;
  final dynamic metadata;

  const YieldLendingTransactionView({
    Key? key,
    required this.selectedTile,
    required this.metadata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(yieldLendingTransactionProvider);
    final controller = ref.watch(yieldLendingTransactionProvider.notifier);
    final width = context.screenWidth;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(context),
              const Gap(60),
              _buildAmountDisplay(context, state, width, controller),
              const Spacer(),
              _buildFeeAndMaxSection(context),
              _buildNumericKeypad(context, state, controller),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: CustomSwipeButton(
          onSwipeCompleted: () => controller.continueToLoading(context),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(PhosphorIconsBold.caretLeft, color: Colors.black),
      ),
      automaticallyImplyLeading: false,
      title: _buildAppBarTitle(context),
      actions: [
        _buildLendingBadge(context),
        const Gap(20),
      ],
    );
  }

  Widget _buildAppBarTitle(BuildContext context) {
    return Row(
      children: [
        _buildTokenLogo(),
        const Gap(10),
        Text(
          selectedTile.name,
          style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildTokenLogo() {
    if (selectedTile.stakeToken.length > 1) {
      return RowSuper(
        innerDistance: -20,
        children: [
          _buildTokenImage(metadata['coin_logo_url'].first),
          _buildTokenImage(metadata['coin_logo_url'].last),
        ],
      );
    } else {
      return _buildTokenImage(metadata['coin_logo_url']);
    }
  }

  Widget _buildTokenImage(String url) {
    return url.endsWith('.svg')
        ? SvgPicture.network(url, height: 35)
        : Image.network(url, height: 35);
  }

  Widget _buildLendingBadge(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: context.screenWidth * 0.2,
      height: context.screenHeight * 0.04,
      decoration: BoxDecoration(
        color: const Color(0xffFFEFD4),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          "Lending",
          style: context.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFFAD29),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${selectedTile.apr} APR',
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Balance ${selectedTile.name}',
              style: context.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              '\$ 637.90',
              style: context.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildAmountDisplay(BuildContext context, YieldLendingTransactionState state, double width, YieldLendingTransaction controller) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      child: Stack(
        children: [
          _buildAmountText(context, state, width, state.amountOne, state.isSwapped),
          _buildAmountText(context, state, width, state.amountTwo, !state.isSwapped),
          _buildSwapButton(state, controller),
        ],
      ),
    );
  }

  Widget _buildAmountText(BuildContext context, YieldLendingTransactionState state, double width, String amount, bool isSwapped) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
      bottom: isSwapped ? 0 : 55,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width * 0.6,
            height: 100,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: List.generate(20, (index) {
                  final char = index < amount.length ? amount[index] : "";
                  bool isNotVisible = index >= amount.length;
                  return AnimatedSlide(
                    duration: const Duration(milliseconds: 150),
                    offset: (!isNotVisible) ? Offset.zero : const Offset(0, 0.5),
                    child: AnimatedOpacity(
                      opacity: (!isNotVisible) ? 1 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: context.displayLarge!.copyWith(
                          fontWeight: isSwapped ? FontWeight.w500 : FontWeight.w700,
                          color: isSwapped ? const Color(0xff646d80) : Colors.black,
                          fontSize: isSwapped ? 14 : 80 - (amount.length * 3),
                        ),
                        child: Text(char),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwapButton(YieldLendingTransactionState state, YieldLendingTransaction controller) {
    return Positioned(
      bottom: 40,
      left: 100,
      right: 0,
      child: GestureDetector(
        onTap: controller.swap,
        child: AnimatedRotation(
          duration: const Duration(milliseconds: 300),
          turns: state.isSwapped ? 0 : 0.5,
          child: const Icon(
            PhosphorIconsBold.arrowsDownUp,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildFeeAndMaxSection(BuildContext context) {
    return Container(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  PhosphorIconsBold.gasPump,
                  color: Colors.black.withOpacity(0.5),
                  size: 20,
                ),
                const Gap(5),
                Text(
                  "Fee - ",
                  style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  "\$0.00",
                  style: context.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Container(
              height: 38,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff2071EE)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  "Max",
                  style: context.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff2071EE),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumericKeypad(BuildContext context, YieldLendingTransactionState state, YieldLendingTransaction controller) {
    return Column(
      children: [
        _buildRowButtons(context, ["1", "2", "3"], state.isSwapped, controller),
        _buildRowButtons(context, ["4", "5", "6"], state.isSwapped, controller),
        _buildRowButtons(context, ["7", "8", "9"], state.isSwapped, controller),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton(context, '.', null, state.isSwapped, controller),
              _buildButton(context, '0', null, state.isSwapped, controller),
              _buildButton(context, 'cancel', PhosphorIconsBold.backspace, state.isSwapped, controller),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRowButtons(BuildContext context, List<String> rows, bool isSwapped, YieldLendingTransaction controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: rows.map((e) => _buildButton(context, e, null, isSwapped, controller)).toList(),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, IconData? icon, bool isSwapped, YieldLendingTransaction controller) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (!isSwapped) {
            controller.onTapOne(label);
          } else {
            controller.onTapTwo(label);
          }
        },
        borderRadius: BorderRadius.circular(100),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: icon == null ? 16 : 8,
            vertical: icon == null ? 16 : 16,
          ),
          child: icon == null
              ? Center(
                  child: Text(
                    label,
                    style: context.titleLarge?.copyWith(fontSize: 22),
                  ),
                )
              : Icon(icon),
        ),
      ),
    );
  }
}
