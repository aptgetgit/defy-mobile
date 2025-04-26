import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                Text(
                  'Lend', 
                  style: TextStyle(fontSize: 18.sp, color: AppColors.black),
                ),
                Gap(4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(lendState.assetIconPath, width: 20.w),
                    Gap(4.w),
                    Text(
                      lendState.selectedAsset, 
                      style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 23.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 2.25.h),
              decoration: BoxDecoration(
                color: AppColors.green.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(30.r),
              ), 
              child: Text(
                '${lendState.apy} APY', 
                style: TextStyle(color: AppColors.green, fontSize: 12.sp),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gap(24.h),
            Row(
              children: <Widget>[
                Gap(8.w),
                Text(
                  'Your Health Factor change', 
                  style: TextStyle(color: AppColors.greyLight, fontSize: 14.sp),
                ),
                Gap(4.w),
                if(lendState.lendAmount == '0')
                  Text(
                    '--', 
                    style: TextStyle(color: AppColors.greyLight, fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                if(lendState.lendAmount != '0')
                  Row(
                    children: <Widget>[
                      Text(
                        '${lendState.currentHealthFactor}', 
                        style: TextStyle(color: AppColors.red, fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      Gap(4.w),
                      Text(
                        '-->', 
                        style: TextStyle(color: AppColors.greyLight, fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      Gap(4.w),
                      Text(
                        '${lendState.projectedHealthFactor}', 
                        style: TextStyle(color: AppColors.green, fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
              ],
            ),
            Gap(90.h),

            // Amount Display
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '\$${lendState.lendAmount}', // Display the dynamic amount from provider
                    style: TextStyle(
                      fontSize: 54.sp, 
                      fontWeight: FontWeight.w600, 
                      color: lendState.lendAmount == '0' ? AppColors.greyLight : AppColors.black,
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(lendState.assetIconPath, width: 18.w),
                      Gap(4.w),
                      Text(
                        '0 ${lendState.maxAmountUnit}',
                        style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight, fontWeight: FontWeight.w600),
                      ),
                      Gap(4.w),
                      Icon(
                        PhosphorIconsBold.caretUpDown,
                        size: 16.sp,
                        color: AppColors.greyLight,
                      ),
                    ],
                  ),
                  Gap(85.h),

                  // Asset Selection
                  Container(
                    height: 66.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: AppColors.greyLight.withValues(alpha: 0.2),
                          blurRadius: 10.r,
                          offset: Offset(0, 2.h),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(lendState.assetIconPath),
                                radius: 22.r,
                              ),
                              Gap(12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    lendState.selectedAsset,
                                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '${lendState.maxAmount} ${lendState.maxAmountUnit}',
                                    style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(8.w),
                          FilledButton(
                            onPressed: () => ref.read(lendNotifierProvider.notifier).useMaxAmount(),
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              fixedSize: Size(80.w, 36.h),
                              backgroundColor: AppColors.transparent,
                              foregroundColor: AppColors.blue,
                              side: BorderSide(
                                color: AppColors.blue,
                                width: 1.w,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            child: Text(
                              'Max',
                              style: TextStyle(color: AppColors.blue, fontSize: 16.sp),
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
