import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/keypad.dart';
import '../../data/models/token.dart';
import '../providers/swap_provider.dart';
import '../widgets/token_container.dart';

class SwapAmountScreen extends ConsumerStatefulWidget {
  const SwapAmountScreen({super.key});

  @override
  _SwapAmountScreenState createState() => _SwapAmountScreenState();
}

class _SwapAmountScreenState extends ConsumerState<SwapAmountScreen> {
  void _handleButtonPress(String label) {
    final SwapState swapState = ref.read(swapProvider);
    final bool isFromActive = swapState.isFromLarge;
    final String currentAmount = isFromActive ? swapState.fromAmount : swapState.toAmount;
    String newAmount = currentAmount;

    if (label == 'cancel') {
      if (currentAmount.length > 1) {
        newAmount = currentAmount.substring(0, currentAmount.length - 1);
      } else {
        newAmount = '0.00';
      }
    } else if (label == 'cancelLongPress') {
      newAmount = '0.00';
    } else if (label == '.') {
      if (!currentAmount.contains('.') && currentAmount.isNotEmpty) {
        newAmount = '$currentAmount.';
      }
    } else {
      if (currentAmount == '0.00') {
        newAmount = label;
      } else {
        newAmount = currentAmount + label;
      }
    }

    // Update the active amount
    if (isFromActive) {
      ref.read(swapProvider.notifier).setFromAmount(newAmount);
    } else {
      ref.read(swapProvider.notifier).setToAmount(newAmount);
    }
  }

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final SwapState swapState = ref.watch(swapProvider);
          final Token? fromToken = swapState.fromToken;
          final Token? toToken = swapState.toToken;
          final String fromAmount = swapState.fromAmount;
          final String toAmount = swapState.toAmount;
          final bool isFromLarge = swapState.isFromLarge;
          final bool isLimit = swapState.isLimit;

          // Calculate the total height of the containers and the vertical position for the arrow
          final double fromHeight = isFromLarge ? (isLimit ? 200.h : 240.h) : (isLimit ? 142.h : 80.h);
          final double arrowTopPosition = fromHeight - 14.h; // Centered vertically between containers

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 24.sp),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'Swap',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: <Widget>[
                // Header with Order Type
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Order Type',
                        style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            ref.watch(swapProvider).isLimit ? 'Limit' : 'Market',
                            style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight),
                          ),
                          Gap(8.w),
                          Switch(
                            splashRadius: 24.r,
                            value: ref.watch(swapProvider).isLimit,
                            inactiveThumbColor: AppColors.white,
                            activeTrackColor: AppColors.green,
                            trackOutlineColor: WidgetStateProperty.all<Color>(AppColors.white),
                            inactiveTrackColor: const Color.fromARGB(255, 239, 239, 239),
                            onChanged: (bool value) {
                              ref.read(swapProvider.notifier).toggleLimit();
                            },
                            activeColor: AppColors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Token containers with Stack for arrow button
                SizedBox(
                  height: 360.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: <Widget>[
                            // From container - use fromAmount
                            TokenContainer(
                              token: fromToken!,
                              isLarge: isFromLarge,
                              isLimit: isLimit,
                              amount: fromAmount,  // Use fromAmount
                              onTap: () {
                                if (!isFromLarge) {
                                  ref.read(swapProvider.notifier).swapContainerSizes();
                                }
                              },
                              onUseMax: () {
                                ref.read(swapProvider.notifier).setFromAmount(fromToken.amount.toStringAsFixed(2));
                              },
                            ),
                            Gap(14.h),
                            // To container - use toAmount
                            TokenContainer(
                              token: toToken!,
                              isLarge: !isFromLarge,
                              isLimit: isLimit,
                              amount: toAmount,  // Use toAmount
                              onTap: () {
                                if (isFromLarge) {
                                  ref.read(swapProvider.notifier).swapContainerSizes();
                                }
                              },
                              onUseMax: () {
                                ref.read(swapProvider.notifier).setToAmount(toToken.amount.toStringAsFixed(2));
                              },
                            ),
                          ],
                        ),
                      ),
                      // Arrow button positioned dynamically with animation
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 500), // Match the container animation duration
                        curve: Curves.easeInOut,
                        top: arrowTopPosition,
                        left: MediaQuery.of(context).size.width / 2 - 18.w,
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.white, width: 4.w),
                            color: AppColors.greyVeryLight,
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              // Swap the sizes and values
                              ref.read(swapProvider.notifier).swapContainerSizes();
                            },
                            child: const Icon(
                              PhosphorIconsBold.caretDown,
                              size: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Keypad implementation
                Expanded(
                  child: Keypad(
                    buttonText: 'Continue',
                    onButtonPress: _handleButtonPress,
                  ),
                ),
              ],
            ),
          );
        },
      );
}