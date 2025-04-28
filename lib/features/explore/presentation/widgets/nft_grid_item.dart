import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../config/theme/colors.dart';

class NFTGridItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const NFTGridItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: width * .5,
              height: width * .45,
              imageUrl: imageUrl,
              errorWidget: (BuildContext ctx, String str, Object obj) => 
                  Container(color: Colors.amber),
              progressIndicatorBuilder: (BuildContext ctx, String str, 
                  DownloadProgress download) =>
                  CircularProgressIndicator(strokeWidth: 2.w),
            ),
          ),
          Gap(6.h),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width / 3),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.greyDark,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Gap(3.h),
          Text(
            price,
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