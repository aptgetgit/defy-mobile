import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class StakeAmountDelegateScreen extends StatefulWidget {
  const StakeAmountDelegateScreen({super.key});

  @override
  _StakeAmountDelegateScreenState createState() => _StakeAmountDelegateScreenState();
}

class _StakeAmountDelegateScreenState extends State<StakeAmountDelegateScreen> {
  String _amount = '0'; // Track the entered amount

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Stake', style: TextStyle(fontSize: 18.sp, color: AppColors.black)),
          Gap(4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/icons/unkown.png', width: 20.w),
              Gap(4.w),
              Text('Everstake', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: AppColors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30.r),
            ), 
            child: Text('100% APY', style: TextStyle(color: AppColors.green, fontSize: 12.sp)),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You receive', style: TextStyle(color: AppColors.greyLight, fontSize: 14.sp)),
                Gap(4.w),
                Text('1021.82 stAPT', style: TextStyle(color: AppColors.green, fontSize: 14.sp, fontWeight: FontWeight.w600)),
                Gap(4.w),
                Text('Learn about', style: TextStyle(color: AppColors.greyLight, fontSize: 14.sp)),
                Gap(4.w),
                Text('atAPT', style: TextStyle(color: AppColors.blue, fontSize: 14.sp, decoration: TextDecoration.underline)),
              ],
            ),
            Gap(90.h),

            // Amount Display
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '\$$_amount', // Display the dynamic amount
                    style: TextStyle(fontSize: 54.sp, fontWeight: FontWeight.w600, color: _amount == '0' ? AppColors.greyLight : AppColors.black),
                  ),
                  Gap(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/icons/aptos.png', width: 18.w),
                      Gap(4.w),
                      Text(
                        '0 APT',
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
                          color: AppColors.greyLight.withOpacity(0.2),
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
                                backgroundImage: const AssetImage('assets/icons/aptos.png'),
                                radius: 22.r,
                              ),
                              Gap(12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Aptos',
                                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '100.21 APT',
                                    style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(8.w),
                          FilledButton(
                            onPressed: () {
                            },
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
                  Gap(20.h),

                  // Number Pad
                  Column(
                    children: <Widget>[
                      _buildRowButtons(<String>['1', '2', '3']),
                      _buildRowButtons(<String>['4', '5', '6']),
                      _buildRowButtons(<String>['7', '8', '9']),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _buildButton('.'),
                          _buildButton('0'),
                          _buildButton('cancel', PhosphorIconsBold.backspace),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(24.h),
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                fixedSize: Size(double.maxFinite, 56.h),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ), 
              child: Text('Continue', style: TextStyle(fontSize: 16.sp)),
            ),
          ],
        ),
      ),
    );

  // Helper function to build a row of buttons
  Widget _buildRowButtons(List<String> items) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items.map(_buildButton).toList(),
    );

  // Helper function to build a single button
  Widget _buildButton(String label, [IconData? icon]) => Expanded(
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          _handleSinglePress(label);
        },
        onLongPress: label == 'cancel'
            ? () {
                // Handle long press for cancel button
                setState(() {
                  _amount = '0';
                });
              }
            : null,
        borderRadius: BorderRadius.circular(100.r),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: icon == null ? 16.w : 8.w,
            vertical: icon == null ? 12.h : 10.h,
          ),
          child: icon == null
              ? Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : Icon(icon, size: 22.sp),
        ),
      ),
    );
    
  // Handle button press
  void _handleSinglePress(String label) {
    setState(() {
      if (label == 'cancel') {
        // Clear the amount
        _amount = '0';
      } else if (label == '.') {
        // Add a decimal point if it doesn't already exist
        if (!_amount.contains('.')) {
          _amount += '.';
        }
      } else {
        // Append the digit to the amount
        if (_amount == '0') {
          _amount = label; // Replace '0' with the first digit
        } else {
          _amount += label;
        }
      }
    });
  }
}
