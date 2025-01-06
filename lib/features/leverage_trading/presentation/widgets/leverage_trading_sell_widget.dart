import 'dart:async';
import 'dart:math';

import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/leverage_trading/domain/leverage_trading_view_state.dart';
import 'package:defy/features/leverage_trading/presentation/providers/leverage_trading_provider.dart';
import 'package:defy/features/leverage_trading/presentation/screens/leverage_trading_pair_view.dart';
import 'package:defy/features/shared/presentation/widgets/custom_slider.dart';
import 'package:defy/features/transaction/presentation/screens/transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LeverageTradingSellWidget extends ConsumerStatefulWidget {
  const LeverageTradingSellWidget({super.key});

  @override
  ConsumerState<LeverageTradingSellWidget> createState() =>
      _LeverageTradingSellWidgetState();
}

class _LeverageTradingSellWidgetState
    extends ConsumerState<LeverageTradingSellWidget>
    with TickerProviderStateMixin {
  late AnimationController _shakeAnimationController;
  late Animation<double> _shakeAnimation;
  Timer? errorTimer;

  @override
  void initState() {
    super.initState();
    _shakeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: _shakeAnimationController,
        curve: Curves.elasticIn,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _shakeAnimationController.reverse();
        }
      });
  }

  @override
  void dispose() {
    _shakeAnimationController.dispose();
    errorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(leverageTradingProvider);
    final controller = ref.watch(leverageTradingProvider.notifier);
    double fontSize = 54;

    String payAmount =
        !state.priceInputMode ? state.priceAmount : state.payAmount;
    if (payAmount.length > 8) {
      fontSize = 48 - (payAmount.length - 8) * 2;
      fontSize = fontSize.clamp(16.0, 54.0);
    }
    return Material(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                _buildMarketLimitOption("Market", state.toggleMarketAndLimit,
                    !state.toggleMarketAndLimit, () {
                  if (!state.toggleMarketAndLimit) {
                    controller.toggleMarketAndLimit();
                    if (state.toggleSlMode) {
                      controller.toggleSlMode();
                    }
                    if (state.toggleTpMode) {
                      controller.toggleTpMode();
                    }
                    if (state.togglePriceMode) {
                      controller.togglePriceMode();
                    }
                    if (!state.togglePayMode) {
                      controller.togglePayMode();
                    }
                  }
                }),
                const SizedBox(width: 20),
                _buildMarketLimitOption("Limit", !state.toggleMarketAndLimit,
                    state.toggleMarketAndLimit, () {
                  if (state.toggleMarketAndLimit) {
                    controller.toggleMarketAndLimit();

                    if (state.togglePayMode) {
                      controller.togglePayMode();
                    }
                    if (state.toggleSlMode) {
                      controller.toggleSlMode();
                    }
                    if (state.toggleTpMode) {
                      controller.toggleTpMode();
                    }
                    if (!state.togglePriceMode) {
                      controller.togglePriceMode();
                    }
                  }
                }),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (!state.sltp) {
                      if (!state.toggleMarketAndLimit &&
                          (state.priceAmount == "0.00" ||
                              state.priceAmount == "0" ||
                              state.priceAmount.isEmpty)) {
                        _showError('Enter price before enabling SL/TP', state,
                            controller);
                      } else if (state.payAmount == "0.00" ||
                          state.payAmount == "0" ||
                          state.payAmount.isEmpty) {
                        _showError('Enter pay amount before enabling SL/TP',
                            state, controller);
                      } else {
                        controller.toggleSlMode();
                        controller.toggleSltp();
                      }
                    } else {
                      controller.toggleSltp();
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: state.sltp
                          ? const Color(0xff2071EE)
                          : AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        state.sltp ? "SL/TP ON" : "SL/TP OFF",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color:
                              state.sltp ? Colors.white : AppColors.greyLight,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: state.toggleMarketAndLimit
                    ? state.toggleSlMode || state.toggleTpMode
                        ? SizedBox(height: 36)
                        : SizedBox(height: 24)
                    : state.toggleSlMode || state.toggleTpMode
                        ? SizedBox(height: 20)
                        : state.togglePayMode
                            ? SizedBox(
                                height: 32,
                              )
                            : SizedBox(height: 40)),
            Consumer(
              builder: (context, ref, _) {
                final state = ref.watch(leverageTradingProvider);
                final controller = ref.watch(leverageTradingProvider.notifier);
                return _buildPriceAndPayRow(state, controller);
              },
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: state.sltp
                  ? Column(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: state.toggleMarketAndLimit
                              ? SizedBox(height: 20)
                              : state.toggleSlMode || state.toggleTpMode
                                  ? SizedBox(height: 20)
                                  : SizedBox(height: 40),
                        ),
                        AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: state.toggleMarketAndLimit
                                ? _buildStopLossTakeProfitColumn(
                                    state, controller)
                                : _buildStopLossTakeProfitRow(
                                    state, controller)),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.toggleMarketAndLimit
                  ? SizedBox(height: 48)
                  : state.toggleSlMode || state.toggleTpMode
                      ? SizedBox(height: 12)
                      : SizedBox(height: 24),
            ),
            _buildLeverageSection(state, controller),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color(0xff2071EE),
                inactiveTrackColor: AppColors.blueLight,
                thumbColor: Colors.white,
                thumbShape: const CustomThumbShape(),
                overlayColor: const Color(0xff2071EE).withOpacity(0.2),
                trackHeight: 6.0,
                trackShape: CustomTrackShape(),
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 16.0,
                ),
                showValueIndicator: ShowValueIndicator.always,
                tickMarkShape: SliderTickMarkShape.noTickMark,
              ),
              child: Slider(
                value: state.leverage,
                min: 1,
                max: 10,
                divisions: 9,
                onChanged: (value) {
                  controller.updateLeverage(value);
                },
              ),
            ),
            SizedBox(height: 12),
            AnimatedSize(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutQuart,
              child: controller.isKeyboardVisible()
                  ? Column(
                      children: [
                        SizedBox(height: 5),
                        _buildRowButtons(['1', '2', '3'], state, controller),
                        _buildRowButtons(['4', '5', '6'], state, controller),
                        _buildRowButtons(['7', '8', '9'], state, controller),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildButton('.', null, state, controller),
                            _buildButton('0', null, state, controller),
                            _buildButton('cancel', PhosphorIconsBold.backspace,
                                state, controller),
                          ],
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            SizedBox(height: 20),
            _buildNextOrSellButton(state, controller),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndPayRow(
      LeverageTradingViewState state, LeverageTrading controller) {
    if (state.toggleMarketAndLimit) {
      // Market order: only show Pay
      return state.togglePayMode
          ? _buildExpandedPayWidget(state, controller)
          : _buildPayWidget(state, controller);
    } else {
      // Limit order
      if (state.togglePriceMode) {
        return Column(
          children: [
            _buildExpandedPriceWidget(state, controller),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (state.toggleSlMode) {
                  controller.toggleSlMode();
                } else if (state.toggleTpMode) {
                  controller.toggleTpMode();
                } else if (state.togglePriceMode) {
                  controller.togglePriceMode();
                }
                controller.togglePayMode();
              },
              child: _buildPayWidget(state, controller),
            ),
          ],
        );
      } else if (state.togglePayMode) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                if (state.toggleSlMode) {
                  controller.toggleSlMode();
                } else if (state.toggleTpMode) {
                  controller.toggleTpMode();
                } else if (state.togglePayMode) {
                  controller.togglePayMode();
                }
                controller.togglePriceMode();
              },
              child: _buildPriceWidget(state, controller),
            ),
            SizedBox(height: 20),
            _buildExpandedPayWidget(state, controller),
          ],
        );
      } else if (!state.sltp) {
        // When neither SL nor TP is active, use Column layout
        return Column(
          children: [
            _buildPriceWidget(state, controller),
            SizedBox(height: 20),
            _buildPayWidget(state, controller),
          ],
        );
      } else {
        // When either SL or TP is active, use Row layout
        return Row(
          children: [
            Expanded(child: _buildPriceWidget(state, controller)),
            SizedBox(width: 40),
            Expanded(child: _buildPayWidget(state, controller)),
          ],
        );
      }
    }
  }

  Widget _buildPriceWidget(
      LeverageTradingViewState state, LeverageTrading controller) {
    return GestureDetector(
      onTap: () {
        if (!state.togglePriceMode) {
          if (state.toggleSlMode) {
            controller.toggleSlMode();
          } else if (state.toggleTpMode) {
            controller.toggleTpMode();
          } else if (state.togglePayMode) {
            controller.togglePayMode();
          }
          controller.togglePriceMode();
        }
      },
      child: Row(
        children: [
          Text(
            "Price",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: state.toggleMarketAndLimit ? Colors.grey : Colors.black,
            ),
          ),
          const Spacer(),
          Container(
            height: 35,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: state.toggleMarketAndLimit
                  ? Colors.grey.withOpacity(0.1)
                  : AppColors.greyVeryLight,
            ),
            child: Center(
              child: Text(
                state.priceAmount,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color:
                      state.toggleMarketAndLimit ? Colors.grey : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPayWidget(
      LeverageTradingViewState state, LeverageTrading controller) {
    return GestureDetector(
      onTap: () {
        if (!state.togglePayMode) {
          if (state.toggleSlMode) {
            controller.toggleSlMode();
          } else if (state.toggleTpMode) {
            controller.toggleTpMode();
          } else if (state.togglePriceMode) {
            controller.togglePriceMode();
          }
          controller.togglePayMode();
        }
      },
      child: Row(
        children: [
          Text(
            "Pay",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Container(
            width: 100,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.greyVeryLight,
            ),
            child: Center(
              child: Text(
                state.payAmount,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedPriceWidget(
      LeverageTradingViewState state, LeverageTrading controller) {
    return GestureDetector(
      onTap: () {
        controller.togglePriceMode();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            state.priceAmount,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 54,
                color: state.priceAmount == '0.0' ||
                        state.priceAmount == '0' ||
                        state.priceAmount == '0.00' ||
                        state.priceAmount == '.00' ||
                        state.priceAmount == '.0'
                    ? AppColors.greyLight
                    : Colors.black),
          ),
          SizedBox(height: 8),
          Center(
            child: AnimatedBuilder(
              animation: _shakeAnimationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_shakeAnimation.value, 0),
                  child: Text(
                    state.isError ? state.buttonText : "Enter Price Limit",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: state.isError ? Colors.red : AppColors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedPayWidget(
      LeverageTradingViewState state, LeverageTrading controller) {
    return GestureDetector(
      onTap: () {
        if (state.toggleSlMode) {
          controller.toggleSlMode();
        } else if (state.toggleTpMode) {
          controller.toggleTpMode();
        } else if (state.togglePriceMode) {
          controller.togglePriceMode();
        }

        controller.togglePayMode();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            state.payAmount,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 54,
                color: state.payAmount == '0.0' ||
                        state.payAmount == '0' ||
                        state.payAmount == '0.00' ||
                        state.payAmount == '.00' ||
                        state.payAmount == '.0'
                    ? AppColors.greyLight
                    : Colors.black),
          ),
          SizedBox(height: 16),
          AnimatedBuilder(
            animation: _shakeAnimationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(_shakeAnimation.value, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.isError
                          ? state.buttonText
                          : "Pay ${state.selectedPair.token2}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: state.isError ? Colors.red : AppColors.greyLight,
                      ),
                    ),
                    if (!state.isError) ...[
                      const Gap(5),
                      Image.asset(
                        state.selectedPair.token2Asset,
                        height: 12,
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStopLossTakeProfitColumn(
      LeverageTradingViewState state, LeverageTrading controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Stop Loss
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: state.toggleSlMode
              ? _buildExpandedStopLossProfit(state, controller,
                  isStopLoss: true)
              : _buildStopLossProfit(
                  label: "SL",
                  amount: state.slAmount,
                  color: Colors.red,
                  onTap: () {
                    if (state.toggleSlMode &&
                        state.priceAmount != null &&
                        state.slAmount != null) {
                      final slAmount = double.tryParse(state.slAmount);
                      final priceAmount = double.tryParse(state.priceAmount);
                      if (slAmount != null &&
                          priceAmount != null &&
                          slAmount <= priceAmount) {
                        controller.updateSlAmount('0');
                      }
                    }
                    controller.toggleSlMode();
                  },
                  isToggled: state.toggleSlMode,
                  state: state,
                ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: (state.toggleSlMode || state.toggleTpMode) ? 0 : 20,
          child: const SizedBox(),
        ),
        // Take Profit
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: state.toggleTpMode
              ? _buildExpandedStopLossProfit(state, controller,
                  isStopLoss: false)
              : _buildStopLossProfit(
                  label: "TP",
                  amount: state.tpAmount,
                  color: Colors.green,
                  onTap: () {
                    if (state.toggleSlMode &&
                        state.priceAmount != null &&
                        state.slAmount != null) {
                      final slAmount = double.tryParse(state.slAmount);
                      final priceAmount = double.tryParse(state.priceAmount);
                      if (slAmount != null &&
                          priceAmount != null &&
                          slAmount <= priceAmount) {
                        controller.updateSlAmount('0');
                      }
                    }
                    controller.toggleTpMode();
                  },
                  isToggled: state.toggleTpMode,
                  state: state,
                ),
        ),
      ],
    );
  }

  Widget _buildStopLossTakeProfitRow(
      LeverageTradingViewState state, LeverageTrading controller) {
    if (state.toggleSlMode || state.toggleTpMode) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Stop Loss
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.toggleSlMode
                ? _buildExpandedStopLossProfit(state, controller,
                    isStopLoss: true)
                : _buildStopLossProfit(
                    label: "SL",
                    amount: state.slAmount,
                    color: Colors.red,
                    onTap: () {
                      controller.toggleSlMode();
                      if (state.toggleSlMode &&
                          state.priceAmount != null &&
                          state.slAmount != null) {
                        final slAmount = double.tryParse(state.slAmount);
                        final priceAmount = double.tryParse(state.priceAmount);
                        if (slAmount != null &&
                            priceAmount != null &&
                            slAmount <= priceAmount) {
                          controller.updateSlAmount('0');
                        }
                      }
                    },
                    isToggled: false,
                    state: state,
                  ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 20,
            child: const SizedBox(),
          ),
          // Take Profit
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.toggleTpMode
                ? _buildExpandedStopLossProfit(state, controller,
                    isStopLoss: false)
                : _buildStopLossProfit(
                    label: "TP",
                    amount: state.tpAmount,
                    color: Colors.green,
                    onTap: () {
                      print('toggleTpMode');
                      if (state.toggleSlMode &&
                          state.priceAmount != null &&
                          state.slAmount != null) {
                        final slAmount = double.tryParse(state.slAmount);
                        final priceAmount = double.tryParse(state.priceAmount);
                        if (slAmount != null &&
                            priceAmount != null &&
                            slAmount <= priceAmount) {
                          controller.updateSlAmount('0');
                        }
                      }
                      controller.toggleTpMode();
                    },
                    isToggled: false,
                    state: state,
                  ),
          ),
        ],
      );
    } else {
      // Both collapsed, show in a row
      return Row(
        children: [
          Expanded(
            child: _buildStopLossProfit(
              label: "SL",
              amount: state.slAmount,
              color: Colors.red,
              onTap: () => controller.toggleSlMode(),
              isToggled: false,
              state: state,
            ),
          ),
          SizedBox(width: 40),
          Expanded(
            child: _buildStopLossProfit(
              label: "TP",
              amount: state.tpAmount,
              color: Colors.green,
              onTap: () => controller.toggleTpMode(),
              isToggled: false,
              state: state,
            ),
          ),
        ],
      );
    }
  }

  Widget _buildExpandedStopLossProfit(
      LeverageTradingViewState state, LeverageTrading controller,
      {required bool isStopLoss}) {
    final amount = isStopLoss ? state.slAmount : state.tpAmount;
    final label = isStopLoss ? "Enter SL" : "Enter TP";
    final color = isStopLoss
        ? (double.tryParse(state.slAmount) ?? 0) > 0
            ? Colors.red
            : Colors.red.withOpacity(0.5)
        : (double.tryParse(state.tpAmount) ?? 0) > 0
            ? Colors.green
            : Colors.green.withOpacity(0.5);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (isStopLoss) {
                controller.toggleSlMode();
                if (state.toggleSlMode &&
                    state.priceAmount != null &&
                    state.slAmount != null) {
                  final slAmount = double.tryParse(state.slAmount);
                  final priceAmount = double.tryParse(state.priceAmount);
                  if (slAmount != null &&
                      priceAmount != null &&
                      slAmount <= priceAmount) {
                    controller.updateSlAmount('0');
                  }
                }
              } else {
                controller.toggleTpMode();
              }
            },
            child: Text(
              amount,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 48, color: color),
            ),
          ),
          SizedBox(height: 10),
          AnimatedBuilder(
            animation: _shakeAnimationController,
            builder: (context, child) {
              return Transform.translate(
                  offset: Offset(_shakeAnimation.value, 0), child: child);
            },
            child: Text(
              state.isError ? state.buttonText : label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: state.isError ? Colors.red : Colors.grey[600]!,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
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
      child: Row(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: label == 'SL'
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
    );
  }

  Widget _buildMarketLimitOption(
      String label, bool isSelected, bool isNotSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        opacity: isSelected ? 1.0 : 0.3,
        duration: const Duration(milliseconds: 300),
        child: Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: isSelected ? 18 : 16),
        ),
      ),
    );
  }

  Widget _buildTogglePayModeWidget(
    bool isSmall,
    Function() onTapContainer,
    bool togglePayMode,
    String payAmount,
    Function() onTapAmount,
    LeverageTradingViewState state,
  ) {
    bool isPayDisabled = !state.toggleMarketAndLimit &&
        (state.priceAmount == "0.00" ||
            state.priceAmount == "0" ||
            state.priceAmount.isEmpty ||
            state.priceAmount == "0." ||
            state.priceAmount == "0.0" ||
            state.priceAmount == ".00" ||
            state.priceAmount == "." ||
            state.priceAmount == ".0");

    double fontSize = 54;
    if (payAmount.length > 8) {
      fontSize = 48 - (payAmount.length - 8) * 2;
      fontSize = fontSize.clamp(16.0, 54.0);
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: togglePayMode == false
          ? Row(
              children: [
                Text(
                  "Pay",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: isPayDisabled ? Colors.grey : Colors.black,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: isPayDisabled ? null : onTapContainer,
                  child: Container(
                    width: isSmall ? 100 : 140,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isPayDisabled
                          ? Colors.grey.withOpacity(0.3)
                          : AppColors.greyVeryLight,
                    ),
                    child: Center(
                      child: Text(
                        payAmount,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: isPayDisabled ? Colors.grey : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: onTapAmount,
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize,
                              color: Colors.black,
                            ),
                            child: Text(
                              payAmount,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  AnimatedBuilder(
                    animation: _shakeAnimationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(_shakeAnimation.value, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.isError
                                  ? state.buttonText
                                  : "Pay ${state.selectedPair.token2}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: state.isError
                                    ? Colors.red
                                    : AppColors.greyLight,
                              ),
                            ),
                            if (!state.isError) ...[
                              const Gap(5),
                              Image.asset(
                                state.selectedPair.token2Asset,
                                height: 12,
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildLeverageSection(
      LeverageTradingViewState state, LeverageTrading controller) {
    return Row(
      children: [
        Text("Leverage",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        const Spacer(),
        Text("${state.leverage.toStringAsFixed(0)}x",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.black)),
      ],
    );
  }

  Widget _buildRowButtons(List<String> items, state, controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items
          .map(
            (e) => _buildButton(e, null, state, controller),
          )
          .toList(),
    );
  }

  Widget _buildButton(String label, IconData? icon,
      LeverageTradingViewState state, LeverageTrading controller) {
    return Expanded(
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          _handleSinglePress(label, state, controller);
        },
        onLongPress: label == 'cancel'
            ? () {
                if (state.togglePayMode) {
                  controller.clearPayAmount();
                }
                if (state.togglePriceMode) {
                  controller.clearPriceAmount();
                }
                if (state.toggleSlMode) {
                  controller.clearSlAmount();
                }
                if (state.toggleTpMode) {
                  controller.clearTpAmount();
                }
              }
            : null,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: icon == null ? 16 : 8,
              vertical: icon == null ? 12 : 10),
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

  void _handleSinglePress(String label, LeverageTradingViewState state,
      LeverageTrading controller) {
    if (state.togglePayMode) {
      _handleButtonPress(
        label,
        state.payAmount,
        (amount) => controller.updatePayAmount(amount),
        controller.clearPayAmount,
        controller.removeLastCharacterFromPayAmount,
        state,
        controller,
      );
    } else if (state.togglePriceMode) {
      _handleButtonPress(
        label,
        state.priceAmount,
        (amount) => controller.updatePriceAmount(amount),
        controller.clearPriceAmount,
        controller.removeLastCharacterFromPriceAmount,
        state,
        controller,
      );
    } else if (state.toggleSlMode) {
      _handleButtonPress(
        label,
        state.slAmount,
        (amount) => controller.updateSlAmount(amount),
        controller.clearSlAmount,
        controller.removeLastCharacterFromSlAmount,
        state,
        controller,
      );
    } else if (state.toggleTpMode) {
      _handleButtonPress(
        label,
        state.tpAmount,
        (amount) => controller.updateTpAmount(amount),
        controller.clearTpAmount,
        controller.removeLastCharacterFromTpAmount,
        state,
        controller,
      );
    }
  }

  void _handleButtonPress(
      String label,
      String currentAmount,
      Function(String) updateAmount,
      VoidCallback clearAmount,
      VoidCallback removeLastCharacter,
      LeverageTradingViewState state,
      LeverageTrading controller) {
    if (label == "Clear") {
      clearAmount();
    } else if (label == "cancel") {
      removeLastCharacter();
    } else {
      String newAmount = currentAmount == "0" ? label : currentAmount + label;
      List<String> parts = newAmount.split('.');
      if (parts.length > 1 && parts[1].length > 2) {
        parts[1] = parts[1].substring(0, 2);
        newAmount = parts.join('.');
      }
      updateAmount(newAmount);

      double? newValue = double.tryParse(newAmount);
      double? currentPrice = double.tryParse(state.priceAmount);

      if (state.togglePayMode && (newValue ?? 0) < 2) {
        _showError('Pay value can not be less than 2', state, controller);
      }

      if (state.toggleSlMode && currentPrice != null && newValue != null) {
        if (newValue <= currentPrice) {
          _showError(
              'SL must be higher than the current price', state, controller);
        }
      }

      if (state.toggleTpMode && currentPrice != null && newValue != null) {
        if (newValue >= currentPrice) {
          _showError(
              'TP must be lower than the current price', state, controller);
        }
      }
    }
  }

  Widget _buildNextOrSellButton(
      LeverageTradingViewState state, LeverageTrading controller) {
    Color buttonColor = AppColors.red;
    if (state.buttonText == "Sell Order") {
      buttonColor = AppColors.red;
    }

    bool showLiquidatesAt = controller.showLiquidatesAt();

    return GestureDetector(
      onTap: () => _handleNextOrSell(state, controller),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: buttonColor,
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        height: 60,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.isError ? "Sell Order" : state.buttonText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              if (showLiquidatesAt) ...[
                Text(
                  "Liquidates at ${state.liquidatesAt}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _handleNextOrSell(
      LeverageTradingViewState state, LeverageTrading controller) {
    AppLogger.debug("Entering _handleNextOrSell");

    if (state.isError) {
      AppLogger.debug("Exiting due to error state");
      return;
    }

    double? currentPrice = double.tryParse(state.priceAmount);
    double? slPrice = double.tryParse(state.slAmount);
    double? tpPrice = double.tryParse(state.tpAmount);

    if (state.togglePriceMode && (currentPrice == null || currentPrice <= 0)) {
      AppLogger.debug("Showing error for invalid price");
      _showError("Enter a valid price", state, controller);
      return;
    }

    if (state.togglePayMode && (double.tryParse(state.payAmount) ?? 0) <= 0) {
      AppLogger.debug("Showing error for invalid pay amount");
      _showError("Enter a valid pay amount", state, controller);
      return;
    }

    if (state.togglePayMode && ((double.tryParse(state.payAmount) ?? 0) < 2)) {
      AppLogger.debug("Showing error for pay amount less than 2");
      _showError('Pay value can not be less than 2', state, controller);
      return;
    }

    if (state.toggleSlMode && (slPrice == null || slPrice <= currentPrice!)) {
      AppLogger.debug("Showing error for invalid SL");
      _showError('SL must be higher than the current price', state, controller);
      return;
    }

    if (state.toggleTpMode && (tpPrice == null || tpPrice >= currentPrice!)) {
      AppLogger.debug("Showing error for invalid TP");
      _showError('TP must be lower than the current price', state, controller);
      return;
    }

    AppLogger.debug(
        "Current state: togglePriceMode=${state.togglePriceMode}, togglePayMode=${state.togglePayMode}, toggleSlMode=${state.toggleSlMode}, toggleTpMode=${state.toggleTpMode}, sltp=${state.sltp}");

    if (state.togglePriceMode) {
      AppLogger.debug("Toggling from price mode to pay mode");
      controller.togglePriceMode();
      controller.togglePayMode();
    } else if (state.togglePayMode) {
      if (state.sltp) {
        AppLogger.debug("Toggling from pay mode to SL mode");
        controller.togglePayMode();
        controller.toggleSlMode();
      } else {
        AppLogger.debug("Moving to transaction screen");
        _navigateToTransactionScreen(state, controller);
      }
    } else if (state.toggleSlMode) {
      AppLogger.debug("Toggling from SL mode to TP mode");
      controller.toggleSlMode();
      controller.toggleTpMode();
    } else if (state.toggleTpMode) {
      AppLogger.debug("Exiting TP mode and updating button text");
      controller.toggleTpMode();
      controller.updateButtonText("Sell Order");
    } else {
      // Final validation before proceeding to transaction
      if (state.sltp) {
        if (slPrice == null || slPrice <= currentPrice!) {
          _showError(
              'Set a valid SL (higher than current price)', state, controller);
          return;
        }
        if (tpPrice == null || tpPrice >= currentPrice!) {
          _showError(
              'Set a valid TP (lower than current price)', state, controller);
          return;
        }
      }
      AppLogger.debug("Moving to transaction screen");
      _navigateToTransactionScreen(state, controller);
    }

    AppLogger.debug("Exiting _handleNextOrSell");
  }

  void _navigateToTransactionScreen(
      LeverageTradingViewState state, LeverageTrading controller) {
    AppLogger.debug("Attempting to navigate to TransactionView");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionView(
          heading: 'Leverage Trading',
          image: state.selectedPair.token1Asset,
          name: state.selectedPair.token1 + state.selectedPair.token2,
          value: state.payAmount,
          onTransactionComplete: () {
            AppLogger.debug(
                "Transaction complete, navigating to LeverageTradingPairView");
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LeverageTradingPairView()));
          },
        ),
      ),
    );
    AppLogger.info("Sell Order Executed");
    controller.clearAll();
  }

  void _showError(String errorMessage, LeverageTradingViewState state,
      LeverageTrading controller) {
    controller.toggleError(true);
    controller.updateButtonText(errorMessage);
    _shakeAnimationController.forward(from: 0);
    HapticFeedback.vibrate();
    errorTimer?.cancel();
    errorTimer = Timer(Duration(seconds: 3), () {
      controller.toggleError(false);
      controller.updateButtonText("Sell Order");
    });
  }
}
