import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WatchlistCuteTile extends StatelessWidget {
  const WatchlistCuteTile({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {
        // Navigate to WatchListNFTScreen
      },
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            child: Stack(
              children: <Widget>[
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(right: 30.w, bottom: 30.h),
                    child: Center(
                      child: Image(
                        height: 36.h,
                        width: 36.w,
                        image: const AssetImage('assets/images/watchlist1.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(left: 30.w, bottom: 30.h),
                    child: Center(
                      child: Image(
                        height: 36.h,
                        width: 36.w,
                        image: const AssetImage('assets/images/watchlist2.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(right: 30.w, top: 20.h),
                    child: Center(
                      child: Image(
                        height: 36.h,
                        width: 36.w,
                        image: const AssetImage('assets/images/watchlist3.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(left: 30.w, top: 20.h),
                    child: Center(
                      child: Image(
                        height: 36.h,
                        width: 36.w,
                        image: const AssetImage('assets/images/watchlist4.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(right: 15.w, top: 40.h),
                    child: Center(
                      child: Image(
                        height: 36.h,
                        width: 36.w,
                        image: const AssetImage('assets/images/watchlist1.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(left: 15.w, top: 40.h),
                    child: Center(
                      child: Image(
                        height: 36.h,
                        width: 36.w,
                        image: const AssetImage('assets/images/watchlist3.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(12.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Cute NFTs🐣',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              Gap(6.w),
              Container(
                width: 16.25.w,
                height: 16.25.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Icon(
                  PhosphorIconsBold.minus,
                  color: Colors.white,
                  size: 12.sp,
                ),
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              text: '6 NFTs',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: Colors.grey,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: '   Jan 2 2024',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}
