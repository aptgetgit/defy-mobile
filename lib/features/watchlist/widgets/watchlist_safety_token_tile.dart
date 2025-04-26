import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config/theme/colors.dart';
import '../presentation/watchlist_safety_tokens_screen.dart';

class WatchlistSafetyTokenTile extends StatelessWidget {
  const WatchlistSafetyTokenTile({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const WatchlistSafetyTokensScreen(),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              color: AppColors.greyVeryLight,
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.4),
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(right: 30.w, bottom: 30.h),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/icons/aptos.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(left: 30.w, bottom: 30.h),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/icons/gui-inu.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(right: 30.w, top: 20.h),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/icons/bluemove.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(left: 30.w, top: 20.h),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/icons/usdc.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(12.h),
          Text(
            'Safety Tokens 🤩',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          RichText(
            text: TextSpan(
              text: '6 Tokens',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
}
