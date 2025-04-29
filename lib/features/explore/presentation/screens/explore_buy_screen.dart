import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../config/theme/colors.dart';

class ExploreBuyScreen extends StatelessWidget {
  final Map<String, String> selectedItem;

  const ExploreBuyScreen({
    super.key,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 12.h,
        leading: IconButton(
          icon: Icon(
            PhosphorIconsBold.caretLeft,
            color: Colors.black,
            size: 22.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            Text(
              'Shopping Cart',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: Colors.white, width: 1.w),
                    image: DecorationImage(
                      image: NetworkImage(selectedItem['imageUrl']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(4.w),
                Text(
                  '1 item',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(20.w),
              ],
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Column(
            children: [
              Gap(8.h),
              Container(
                color: AppColors.greyVeryLight,
                height: 1.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Selected item display
              Center(
                child: Column(
                  children: [
                    Hero(
                      tag: 'nft_image_${selectedItem['name']}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Material(
                          color: Colors.transparent,
                          child: CachedNetworkImage(
                            imageUrl: selectedItem['imageUrl']!,
                            width: 350.w,
                            height: 350.w, // Square image
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.error,
                                color: Colors.grey[600],
                                size: 40.sp,
                              ),
                            ),
                            progressIndicatorBuilder: (context, url, progress) => Center(
                              child: CircularProgressIndicator(
                                value: progress.progress,
                                strokeWidth: 2.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(16.h),
                    Text(
                      selectedItem['name'] ?? 'Selected NFT',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Floor Price ",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.greyLight,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}