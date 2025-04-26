import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart';

class CustomBottomNavBarWithHolders extends StatelessWidget {
  final String? image1;
  final String? image2;
  final String? image3;
  final String? headerText;
  final String buttonText1;
  final String? buttonText2;
  final bool dualButton;
  final VoidCallback onTap1;
  final VoidCallback? onTap2;
  final Color buttonColor1;
  final Color? buttonColor2;
  final bool showImageRow;
  final bool showHoldersRow;
  final Widget? upperWidget;
  final bool isLeftWidgetCustom;
  final Widget? leftCustomWidget;

  const CustomBottomNavBarWithHolders({
    super.key,
    this.image1,
    this.image2,
    this.image3,
    this.headerText,
    required this.buttonText1,
    required this.buttonColor1,
    this.buttonColor2,
    this.buttonText2,
    this.dualButton = false,
    required this.onTap1,
    this.onTap2,
    this.showImageRow = true,
    this.showHoldersRow = true,
    this.upperWidget,
    this.isLeftWidgetCustom = false,
    this.leftCustomWidget,
  });

  @override
  Widget build(BuildContext context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Gap(10.h),
        if (upperWidget != null) upperWidget!,
        if (showImageRow &&
            (image1 != null || image2 != null || image3 != null))
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: <Widget>[
                RowSuper(
                  innerDistance: -12,
                  children: <Widget?>[
                    if (image1 != null)
                      Image.asset('assets/images/$image1', height: 24.h),
                    if (image2 != null)
                      Image.asset('assets/images/$image2', height: 24.h),
                    if (image3 != null)
                      Image.asset('assets/images/$image3', height: 24.h),
                  ],
                ),
                if (headerText != null) ...<Widget>[
                  SizedBox(width: 10.w),
                  Text(
                    headerText!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyLight,
                        ),
                  ),
                ],
              ],
            ),
          ),
        if (showHoldersRow)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const Divider(
              color: AppColors.greyVeryLight,
              thickness: 2,
            ),
          ),
        if (dualButton)
          _buildDualButtons(context)
        else
          _buildSingleButton(context),
      ],
    );

  Widget _buildSingleButton(BuildContext context) => GestureDetector(
      onTap: onTap1,
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: buttonColor1,
          border: Border(top: BorderSide(color: AppColors.grey, width: 0.5.w)),
        ),
        height: 60.h,
        child: Center(
          child: Text(
            buttonText1,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
          ),
        ),
      ),
    );

  Widget _buildDualButtons(BuildContext context) => Row(
      children: <Widget>[
        Expanded(
          child: isLeftWidgetCustom && leftCustomWidget != null
              ? leftCustomWidget!
              : GestureDetector(
                  onTap: onTap1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.w, bottom: 20.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: buttonColor1,
                      border: Border(
                          top: BorderSide(color: AppColors.grey, width: 0.5.w),),
                    ),
                    height: 60.h,
                    child: Center(
                      child: Text(
                        buttonText1,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                      ),
                    ),
                  ),
                ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: GestureDetector(
            onTap: onTap2,
            child: Container(
              margin: EdgeInsets.only(right: 20.w, bottom: 20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                color: buttonColor2,
                border:
                    Border(top: BorderSide(color: AppColors.grey, width: 0.5.w)),
              ),
              height: 60.h,
              child: Center(
                child: Text(
                  buttonText2 ?? '',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
}
