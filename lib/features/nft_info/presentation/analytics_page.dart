import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config/theme/colors.dart';

class AnalyticsOverviewPage extends StatelessWidget {
  const AnalyticsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // FLOOR PRICE Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FLOOR PRICE',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _buildTimeButton('1D', isActive: true),
                  Gap(8.w),
                  _buildTimeButton('1W'),
                  Gap(8.w),
                  _buildTimeButton('1M'),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyLight),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                'Placeholder for Floor Price Graph',
                style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // SALES Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SALES',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _buildTimeButton('1D', isActive: true),
                  Gap(8.w),
                  _buildTimeButton('1W'),
                  Gap(8.w),
                  _buildTimeButton('1M'),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyLight),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                'Placeholder for Sales Graph',
                style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // HOLDERS Section
          Text(
            'HOLDERS',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 76.h,
            decoration: BoxDecoration(
              color: AppColors.greyVeryLight,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildHolderStat('Unique Holders', '1231'),
                _buildHolderStat('Avg Holding', '2.12'),
                _buildHolderStat('Total Staked', '789'),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // ADDRESS Table
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'ADDRESS',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark,
                    ),
                  ),
                  Gap(105.w),
                  Text(
                    'OWNED',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark,
                    ),
                  ),
                  Gap(50.w),
                  Text(
                    '% OF SUPPLY OWNED',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark,
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.greyMedium,
                height: 1.h,
              ),
              SizedBox(height: 8.h),
              ...List.generate(5, (int index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '0xaa...8a5d',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.blue,
                        ),
                      ),
                      Text(
                        index == 0 ? '303' : index == 1 || index == 2 ? '23' : index == 3 ? '21' : index == 4 ? '564' : '344',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.black,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 52.w,
                            child: LinearProgressIndicator(
                              value: 0.3, // Example progress (adjust as needed)
                              backgroundColor: Colors.grey[300],
                              color: AppColors.green,
                              borderRadius: BorderRadius.circular(6),
                              minHeight: 4,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            index == 1 ? '4.0%' : '3.0%',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              GestureDetector(
                onTap: () {
                  // Handle "See all" action
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.greyLight,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12.sp,
                        color: AppColors.greyLight,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

  // Time Button Widget
  Widget _buildTimeButton(String label, {bool isActive = false}) => CircleAvatar(
      radius: 12.r,
      backgroundColor: isActive ? AppColors.black : AppColors.greyVeryLight,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: isActive ? AppColors.white : AppColors.greyLight,
        ),
      ),
    );

  // Holder Stat Widget
  Widget _buildHolderStat(String label, String value) => Column(
      children: <Widget>[
        Text(
          value,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.greyDark,
          ),
        ),
      ],
    );
}
