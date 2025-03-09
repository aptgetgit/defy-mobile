import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/keypad.dart';
import '../providers/borrow_provider.dart';
import '../providers/borrow_state_model.dart';  // Add this import

class BorrowAmountScreen extends ConsumerWidget {
  const BorrowAmountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    final BorrowState borrowState = ref.watch(borrowNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Borrow', style: TextStyle(fontSize: 18, color: AppColors.black),),
                const Gap(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(borrowState.assetIconPath, width: 20),
                    const Gap(4),
                    Text(borrowState.selectedAsset, style: const TextStyle(fontSize: 14,color: AppColors.greyLight),),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 23),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 2.25),
              decoration: BoxDecoration(
                color: AppColors.green.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(30),
              ), 
              child: Text('${borrowState.apy} APY', style: const TextStyle(color: AppColors.green),),
            ),
          ),
        ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Gap(24),
              Row(
                children: <Widget>[
                  const Gap(8),
                  const Text('Your Health Factor change', style: TextStyle(color: AppColors.greyLight, fontSize: 14),),
                  const Gap(4),
                  if(borrowState.borrowAmount == '0')
                    const Text('--', style: TextStyle(color: AppColors.greyLight, fontSize: 14, fontWeight: FontWeight.w600),),
                  if(borrowState.borrowAmount != '0')
                    Row(
                      children: <Widget>[
                        Text('${borrowState.currentHealthFactor}', style: const TextStyle(color: AppColors.red, fontSize: 14, fontWeight: FontWeight.w600),),
                        const Gap(4),
                        const Text('-->', style: TextStyle(color: AppColors.greyLight, fontSize: 14, fontWeight: FontWeight.w600),),
                        const Gap(4),
                        Text('${borrowState.projectedHealthFactor}', style: const TextStyle(color: AppColors.green, fontSize: 14, fontWeight: FontWeight.w600),),
                      ],
                    ),
                ],
              ),
              const Gap(90),

              // Amount Display
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      '\$${borrowState.borrowAmount}', // Display the dynamic amount
                      style: TextStyle(fontSize: 54, fontWeight: FontWeight.w600, color: borrowState.borrowAmount == '0' ? AppColors.greyLight : AppColors.black),
                    ),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(borrowState.assetIconPath, width: 18),
                        const Gap(4),
                        Text(
                          '0 ${borrowState.maxAmountUnit}',
                          style: const TextStyle(fontSize: 14, color: AppColors.greyLight, fontWeight: FontWeight.w600),
                        ),
                        const Gap(4),
                        const Icon(
                          PhosphorIconsBold.caretUpDown,
                          size: 16,
                          color: AppColors.greyLight,
                        ),
                      ],
                    ),
                    const Gap(85),

                    // Asset Selection
                    Container(
                      height: 66,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: AppColors.greyLight.withValues(alpha: 0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(borrowState.assetIconPath),
                                  radius: 22,
                                ),
                                const Gap(12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      borrowState.selectedAsset,
                                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '${borrowState.maxAmount} ${borrowState.maxAmountUnit}',
                                      style: const TextStyle(fontSize: 14, color: AppColors.greyLight),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Gap(8),
                            FilledButton(
                              onPressed: () {
                                ref.read(borrowNotifierProvider.notifier).useMaxAmount();
                              },
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                fixedSize: const Size(80, 36),
                                backgroundColor: AppColors.transparent,
                                foregroundColor: AppColors.blue,
                                side: const BorderSide(
                                  color: AppColors.blue,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Max',
                                style: TextStyle(color: AppColors.blue, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Replaced the custom keypad implementation with your Keypad widget
              Expanded(
                child: Keypad(
                  onButtonPress: (String label) {
                    if (label == 'cancelLongPress') {
                      ref.read(borrowNotifierProvider.notifier).setBorrowAmount('0');
                    } else {
                      ref.read(borrowNotifierProvider.notifier).handleKeypadInput(label);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
  }

}
