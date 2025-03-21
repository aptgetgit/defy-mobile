import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/keypad.dart';
import '../providers/borrow_provider.dart';
import '../providers/borrow_state_model.dart';

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
                Text('Borrow', style: TextStyle(fontSize: 18.sp, color: AppColors.black)),
                Gap(4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(borrowState.assetIconPath, width: 20.w),
                    Gap(4.w),
                    Text(borrowState.selectedAsset, style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
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
              child: Text('${borrowState.apy} APY', style: TextStyle(color: AppColors.green, fontSize: 12.sp)),
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
                  Text('Your Health Factor change', style: TextStyle(color: AppColors.greyLight, fontSize: 14.sp)),
                  Gap(4.w),
                  if(borrowState.borrowAmount == '0')
                    Text('--', style: TextStyle(color: AppColors.greyLight, fontSize: 14.sp, fontWeight: FontWeight.w600)),
                  if(borrowState.borrowAmount != '0')
                    Row(
                      children: <Widget>[
                        Text('${borrowState.currentHealthFactor}', style: TextStyle(color: AppColors.red, fontSize: 14.sp, fontWeight: FontWeight.w600)),
                        Gap(4.w),
                        Text('-->', style: TextStyle(color: AppColors.greyLight, fontSize: 14.sp, fontWeight: FontWeight.w600)),
                        Gap(4.w),
                        Text('${borrowState.projectedHealthFactor}', style: TextStyle(color: AppColors.green, fontSize: 14.sp, fontWeight: FontWeight.w600)),
                      ],
                    ),
                ],
              ),
              Gap(90.h),

              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      '\$${borrowState.borrowAmount}',
                      style: TextStyle(fontSize: 54.sp, fontWeight: FontWeight.w600, color: borrowState.borrowAmount == '0' ? AppColors.greyLight : AppColors.black),
                    ),
                    Gap(8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(borrowState.assetIconPath, width: 18.w),
                        Gap(4.w),
                        Text(
                          '0 ${borrowState.maxAmountUnit}',
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

                    Container(
                      height: 66.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: AppColors.greyLight.withValues(alpha: 0.2),
                            blurRadius: 10.r,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(borrowState.assetIconPath),
                                  radius: 22.r,
                                ),
                                Gap(12.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      borrowState.selectedAsset,
                                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '${borrowState.maxAmount} ${borrowState.maxAmountUnit}',
                                      style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Gap(8.w),
                            FilledButton(
                              onPressed: () {
                                ref.read(borrowNotifierProvider.notifier).useMaxAmount();
                              },
                              style: FilledButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                fixedSize: Size(80.w, 36.h),
                                backgroundColor: AppColors.transparent,
                                foregroundColor: AppColors.blue,
                                side: const BorderSide(
                                  color: AppColors.blue,
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
