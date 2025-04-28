import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';
import '../../../../config/theme/colors.dart';

class NFTListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const NFTListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        children: [
          // NFT Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: 70.w,
              height: 70.w,
              imageUrl: imageUrl,
              errorWidget: (BuildContext ctx, String str, Object obj) => 
                  Container(color: Colors.amber),
              progressIndicatorBuilder: (BuildContext ctx, String str, 
                  DownloadProgress download) =>
                  CircularProgressIndicator(strokeWidth: 2.w),
            ),
          ),
          
          // NFT Details
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(6.h),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // More options button
          IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 22.sp,
              color: AppColors.greyDark,
            ),
            onPressed: () {
              // Implement more options menu
            },
          ),
        ],
      ),
    );
  }
}