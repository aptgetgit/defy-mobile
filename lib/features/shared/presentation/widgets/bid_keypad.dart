import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class BidKeypad extends StatelessWidget {
  final Function(String) onButtonPress;
  final String? continueText;
  final VoidCallback? onContinuePressed;
  final bool isContinueEnabled;
  final int currentIndex;
  final int totalItems;

  const BidKeypad({
    required this.onButtonPress,
    this.continueText,
    this.onContinuePressed,
    this.isContinueEnabled = true,
    this.currentIndex = 0,
    this.totalItems = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 320.h,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildRowButtons(<String>['1', '2', '3']),
                _buildRowButtons(<String>['4', '5', '6']),
                _buildRowButtons(<String>['7', '8', '9']),
                _buildRowButtons(<String>['.', '0', 'delete']),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.h, top: 8.h),
            child: FilledButton(
              onPressed: isContinueEnabled ? onContinuePressed : null,
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 56.h),
                backgroundColor: Colors.black,
                disabledBackgroundColor: Colors.black.withOpacity(1.0),
                disabledForegroundColor: AppColors.white.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Text(
                    continueText ?? (currentIndex < totalItems - 1 ? 'Continue' : 'Review Bids'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        totalItems.toString(),
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  Widget _buildRowButtons(List<String> items) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((String item) => _buildButton(item, item == 'delete' ? PhosphorIconsBold.backspace : null)).toList(),
      );

  Widget _buildButton(String label, [IconData? icon]) => Expanded(
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            onButtonPress(label);
          },
          onLongPress: label == 'delete'
              ? () => onButtonPress('cancelLongPress')
              : null,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: icon == null ? 16.w : 8.w, vertical: icon == null ? 12.h : 10.h),
            child: icon == null
                ? Center(child: Text(label, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600)))
                : Center(child: Icon(icon)),
          ),
        ),
      );
}