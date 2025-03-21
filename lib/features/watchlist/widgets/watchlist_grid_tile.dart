import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class WatchlistGridTile extends StatelessWidget {
  const WatchlistGridTile({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {
        // Navigate to WatchListNFTScreen
      },
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.4),
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(right: 30.w, bottom: 30.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/images/watchlist1.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(left: 30.w, bottom: 30.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/images/watchlist2.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(right: 30.w, top: 20.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/images/watchlist3.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(left: 30.w, top: 20.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/images/watchlist4.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(12.h),
          Text(
            'Avatar NFTs🐣',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
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
