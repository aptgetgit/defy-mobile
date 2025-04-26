import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../config/theme/colors.dart';
import '../../data/models/token.dart';

class TokenContainer extends StatelessWidget {
  const TokenContainer({
    super.key,
    required this.token,
    required this.isLarge,
    required this.amount,
    required this.onTap,
    required this.onUseMax,
    required this.isLimit,
  });

  final Token token;
  final bool isLarge;
  final String amount;
  final VoidCallback onTap;
  final VoidCallback onUseMax;
  final bool isLimit;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: isLarge ? (isLimit ? 200.h : 240.h) : (isLimit ? 142.h : 80.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            if (isLarge)
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            token.icon,
                            width: 44.w,
                            height: 44.h,
                          ),
                          Gap(8.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                token.name,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${token.amount.toStringAsFixed(2)} ${token.symbol}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.greyLight,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              width: 77.w, // Constrain the button width
                              height: 34.h,
                              child: ElevatedButton(
                                onPressed: onUseMax,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.black,
                                  foregroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                                ),
                                child: Center(child: Text('Use Max', style: TextStyle(fontSize: 14.sp))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  const Divider(color: AppColors.white),
                  Gap(isLimit ? 0 : 14),
                  Text(
                    '\$$amount',
                    style: TextStyle(
                      fontSize: 54.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$amount ${token.symbol}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.black,
                        ),
                      ),
                      Gap(4.w),
                      const Icon(
                        PhosphorIconsBold.arrowsDownUp,
                        size: 14,
                      ),
                    ],
                  ),
                ],
              ),
            if (!isLarge && isLimit)
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            token.icon,
                            width: 44.w,
                            height: 44.h,
                          ),
                          Gap(8.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                token.name,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                token.symbol,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.greyLight,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        amount, // Display the provided amount instead of '0'
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Gap(3.5.h),
                  const Divider(color: AppColors.white),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Swap Rate Limit',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.greyLight,
                            ),
                          ),
                          Text(
                            'Default at Market Rate',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.black,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 13.w),
                          minimumSize: Size(0, 34.h),
                        ),
                        child: Text('Set Now', style: TextStyle(fontSize: 14.sp)),
                      ),
                    ],
                  ),
                ],
              ),
            if (!isLarge && !isLimit)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        token.icon,
                        width: 44.w,
                        height: 44.h,
                      ),
                      Gap(8.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            token.name,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${token.amount.toStringAsFixed(2)} ${token.symbol}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.greyLight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    amount, // Display the provided amount instead of '0'
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    ),
  );    
}