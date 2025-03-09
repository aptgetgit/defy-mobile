import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/keypad.dart'; // Import the Keypad widget
import '../providers/lend_provider.dart';
import '../providers/lend_state_model.dart';

class LendAmountScreen extends ConsumerWidget {
  const LendAmountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the lend state from the provider
    final LendState lendState = ref.watch(lendNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Lend', style: TextStyle(fontSize: 18, color: AppColors.black),),
                const Gap(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(lendState.assetIconPath, width: 20),
                    const Gap(4),
                    Text(lendState.selectedAsset, 
                      style: const TextStyle(fontSize: 14, color: AppColors.greyLight),
                    ),
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
              child: Text('${lendState.apy} APY', 
                style: const TextStyle(color: AppColors.green),
              ),
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
                if(lendState.lendAmount == '0')
                  const Text('--', style: TextStyle(color: AppColors.greyLight, fontSize: 14, fontWeight: FontWeight.w600),),
                if(lendState.lendAmount != '0')
                  Row(
                    children: <Widget>[
                      Text(
                        '${lendState.currentHealthFactor}', 
                        style: const TextStyle(color: AppColors.red, fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const Gap(4),
                      const Text('-->', style: TextStyle(color: AppColors.greyLight, fontSize: 14, fontWeight: FontWeight.w600),),
                      const Gap(4),
                      Text(
                        '${lendState.projectedHealthFactor}', 
                        style: const TextStyle(color: AppColors.green, fontSize: 14, fontWeight: FontWeight.w600),
                      ),
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
                    '\$${lendState.lendAmount}', // Display the dynamic amount from provider
                    style: TextStyle(
                      fontSize: 54, 
                      fontWeight: FontWeight.w600, 
                      color: lendState.lendAmount == '0' ? AppColors.greyLight : AppColors.black,
                    ),
                  ),
                  const Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(lendState.assetIconPath, width: 18),
                      const Gap(4),
                      Text(
                        '0 ${lendState.maxAmountUnit}',
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
                                backgroundImage: AssetImage(lendState.assetIconPath),
                                radius: 22,
                              ),
                              const Gap(12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    lendState.selectedAsset,
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '${lendState.maxAmount} ${lendState.maxAmountUnit}',
                                    style: const TextStyle(fontSize: 14, color: AppColors.greyLight),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Gap(8),
                          FilledButton(
                            onPressed: () => ref.read(lendNotifierProvider.notifier).useMaxAmount(),
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
            
            // Use the reusable Keypad widget instead of custom implementation
            Expanded(
              child: Keypad(
                onButtonPress: (String label) {
                  if (label == 'cancelLongPress') {
                    ref.read(lendNotifierProvider.notifier).setLendAmount('0');
                  } else {
                    ref.read(lendNotifierProvider.notifier).handleKeypadInput(label);
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
