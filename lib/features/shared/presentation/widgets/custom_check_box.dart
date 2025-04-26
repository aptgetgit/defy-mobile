import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    required this.isChecked,
    this.isRound = false,
    this.onTap,
  });

  final bool isRound;
  final bool isChecked;
  final VoidCallback? onTap;
  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: 20.w,
        height: 20.h,
        decoration: !widget.isChecked
            ? BoxDecoration(
                borderRadius: widget.isRound
                    ? BorderRadius.circular(30.r)
                    : BorderRadius.circular(6.r),
                border: Border.all(
                  width: 1.5.w,
                  color: AppColors.grey,
                ),
                color: Colors.transparent,
              )
            : null,
        child: widget.isChecked
            ? const Align(
                child: Icon(
                  PhosphorIconsFill.checkCircle,
                  size: 20,
                  color: AppColors.blue,
                ),)
            : null,
      ),
    );
}
