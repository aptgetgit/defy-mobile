import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    return Card(
      margin: EdgeInsets.symmetric( vertical: 2.h),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        child: Row(
          children: <Widget>[
            // NFT Image with rounded rectangle instead of circle
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r), // Rounded rectangle
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 44.w,
                height: 44.h,
                imageUrl: imageUrl,
                errorWidget: (BuildContext ctx, String str, Object obj) => 
                    Container(color: Colors.amber),
                progressIndicatorBuilder: (BuildContext ctx, String str, 
                    DownloadProgress download) =>
                    CircularProgressIndicator(strokeWidth: 2.w),
              ),
            ),
            
            SizedBox(width: 16.w),
            
            // NFT Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Floor Price',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLight,
                  ),
                ),
              ],
            ),
            
            const Spacer(),
            
            // Right side - Price information with trailing decoration
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_drop_up,
                      color: Colors.green,
                      size: 16.sp,
                    ),
                    Text(
                      '2.4%',  // Example percentage
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}