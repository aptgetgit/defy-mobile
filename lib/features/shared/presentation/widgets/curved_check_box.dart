import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/colors.dart';

class CurvedCheckbox extends StatefulWidget   {
  const CurvedCheckbox({
    super.key,
    required this.isChecked,
    this.isRound = false,
    this.onTap,
  });

  final bool isRound;
  final bool isChecked;
  final VoidCallback? onTap;
  @override
  CurvedCheckboxState createState() => CurvedCheckboxState();
}

class CurvedCheckboxState extends State<CurvedCheckbox> {
  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(
          borderRadius: widget.isRound
              ? BorderRadius.circular(30.r)
              : BorderRadius.circular(6.r),
          border: Border.all(
            width: 1.5.w,
            color: AppColors.grey,
          ),
          color: Colors.transparent,
        ),
        child: widget.isChecked
            ? Container(
                height: 12.h,
                width: 12.w,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: widget.isRound
                      ? BorderRadius.circular(30.r)
                      : BorderRadius.circular(4.r),
                ),
              )
            : null,
      ),
    );
}
