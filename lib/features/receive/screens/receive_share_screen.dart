import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../config/theme/colors.dart';

class ReceiveShareScreen extends StatelessWidget {
  const ReceiveShareScreen({super.key});

  final String walletAddress = '0x1234567890abcdef'; // Wallet address

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  QrImageView( // Use QrImageView
                    data: walletAddress, // The data for the QR code
                    size: 300.w, // Adjust size as needed
                    embeddedImageStyle: QrEmbeddedImageStyle( // Style embedded image
                      size: Size(99.w, 99.h), // Size of embedded image
                    ),
                    embeddedImage:
                        const AssetImage('assets/images/avatar-7.png'), // Embedded image
                  ),
                ],
              ),
            ),
            Gap(32.h),
            Text(
              'Expires in 24 hours.',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            ),
            Gap(14.h),
            // Link Display
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 15.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'defy.app/request/10/maharsipatel',
                    style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight),
                    textAlign: TextAlign.start,
                  ),
                  Icon(
                    PhosphorIconsBold.clipboard,
                    color: AppColors.greyLight,
                    size: 24.sp,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
}
