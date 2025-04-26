import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/colors.dart';

class NftInfoBottomNavBar extends StatelessWidget {
  const NftInfoBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 26.h, top: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.r,
            offset: Offset(0, -4.h),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'assets/icons/aptos.png',
            width: 32.w,
            height: 32.h,
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '89.02 APT',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                '+ 2.98',
                style: TextStyle(fontSize: 14.sp, color: AppColors.green),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    // Handle Bid action
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(95.w, 45.h), // Explicit minimum size
                    maximumSize: Size(150.w, 48.h), // Explicit maximum size
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    side: BorderSide(width: 1.w),
                  ),
                  child: Text('Bid', style: TextStyle(color: Colors.black, fontSize: 18.sp)),
                ),
                SizedBox(width: 10.w),
                ElevatedButton(
                  onPressed: () {
                    // Handle Buy action
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(95.w, 45.h), // Explicit minimum size
                    maximumSize: Size(150.w, 48.h), // Explicit maximum size
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: Text('Buy', style: TextStyle(color: Colors.white, fontSize: 18.sp)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}
