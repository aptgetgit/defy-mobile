// import 'package:flutter/material.dart';

// class TestScreen extends StatelessWidget {
//   const TestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('Test Screen'),
//       ),
//     );
//   }
// }

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class NFTDetailScreen extends StatelessWidget {
  final Map<String, String> nft;
  
  const NFTDetailScreen({
    Key? key,
    required this.nft,
  }) : super(key: key);
  
  Widget _buildStat(String value, String label, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16.sp, color: AppColors.greyMedium),
            SizedBox(width: 4.w),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            color: AppColors.greyMedium,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image with Icons
            Stack(
              children: [
                Container(
                  height: 300.h,
                  child: nft['imageUrl'] != null && nft['imageUrl']!.isNotEmpty
                      ? Image.network(
                          nft['imageUrl']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 300.h,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: Center(
                                child: Icon(
                                  Icons.broken_image,
                                  size: 50.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ?? 1)
                                    : null,
                              ),
                            );
                          },
                        )
                      : Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 50.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                ),
                Positioned(
                  top: 40.h,
                  left: 16.w,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          color: Colors.white.withOpacity(0.2),
                          child: Icon(
                            PhosphorIcons.caretLeft(),
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40.h,
                  right: 16.w,
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        color: Colors.white.withOpacity(0.2),
                        child: Icon(
                          PhosphorIcons.shareNetwork(),
                          color: Colors.white,
                          size: 22.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Title and Creator
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nft['name'] ?? 'Fantasy Ruins',
                        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                      Icon(PhosphorIcons.star(), color: AppColors.greyMedium),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'By ALLAN',
                        style: TextStyle(color: AppColors.greyMedium, fontSize: 14.sp),
                      ),
                      SizedBox(width: 4.w),
                      Icon(PhosphorIcons.acorn(), color: Colors.blue, size: 16.sp),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Take the red bean to join the garden. View the collection at azuki.com/gallery_more',
                    style: TextStyle(color: AppColors.greyMedium, fontSize: 14.sp),
                  ),
                  SizedBox(height: 16.h),
                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStat('5 ETH', 'Total Volume', PhosphorIcons.chartPie()),
                      _buildStat(nft['price'] ?? '0.0023 ETH', 'Floor Price', PhosphorIcons.wallet()),
                      _buildStat('--', 'Best Offer', PhosphorIcons.tag()),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(12.r),
                          backgroundColor: Colors.green,
                        ),
                        child: Icon(
                          PhosphorIcons.dotsThree(),
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  // Tabs
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.greyVeryLight),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Items', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
                        Text('Activity', style: TextStyle(color: AppColors.greyMedium, fontSize: 16.sp)),
                        Text('Analytics', style: TextStyle(color: AppColors.greyMedium, fontSize: 16.sp)),
                        Icon(PhosphorIcons.funnelSimple(), color: AppColors.greyMedium, size: 18.sp),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Grid of Images
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.w,
                    children: List.generate(4, (index) {
                      return Container(
                        margin: EdgeInsets.all(4.r),
                        child: nft['imageUrl'] != null && nft['imageUrl']!.isNotEmpty
                            ? Image.network(
                                nft['imageUrl']!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    child: Center(
                                      child: Icon(
                                        Icons.broken_image,
                                        size: 30.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Container(
                                color: Colors.grey[300],
                                child: Center(
                                  child: Icon(
                                    Icons.image_not_supported,
                                    size: 30.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20.h),
                  // Bottom Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          backgroundColor: AppColors.greyVeryLight,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('NFT Spin', style: TextStyle(fontSize: 12.sp)),
                            Text('Win in 1%', style: TextStyle(fontSize: 10.sp)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(16.r),
                          backgroundColor: Colors.grey[800],
                        ),
                        child: Text('Sell', style: TextStyle(fontSize: 12.sp)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(16.r),
                          backgroundColor: Colors.grey[800],
                        ),
                        child: Text('Buy', style: TextStyle(fontSize: 12.sp)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(16.r),
                          backgroundColor: Colors.blue,
                        ),
                        child: Text('Bid', style: TextStyle(fontSize: 12.sp)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(16.r),
                          backgroundColor: AppColors.greyVeryLight,
                          foregroundColor: Colors.black,
                        ),
                        child: Icon(PhosphorIcons.wallet(), size: 18.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}