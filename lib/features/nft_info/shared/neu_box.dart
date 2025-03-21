import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeuBox extends StatelessWidget {
  const NeuBox({required this.child, super.key});
  final Widget? child;

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15.r,
            offset: Offset(4.w, 4.h),
          ),

          BoxShadow(
            color: Colors.white,
            blurRadius: 15.r,
            offset: Offset(-4.w, -4.h),
          ),
        ],
      ),
      padding: EdgeInsets.all(12.w),
      child: child,
    );
}
