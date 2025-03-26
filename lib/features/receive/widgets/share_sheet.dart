import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../config/theme/colors.dart';
import '../providers/selected_wallet_option.dart';

// Update CustomQrShareWidget to use ConsumerWidget to access the provider
class CustomQrShareWidget extends ConsumerWidget {
  final String qrData;

  const CustomQrShareWidget({super.key, required this.qrData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the selected wallet from the provider
    final Wallet selectedWallet = ref.watch(selectedWalletProvider);
    
    return Container(
      width: 380.w,
      height: 502.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: const DecorationImage(
          image: AssetImage('assets/icons/share_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 44.h),
            child: Text(
              'Send assets to Alan',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
          Gap(24.h),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.white, 
                width: 4.w
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: QrImageView(
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.black,
              padding: EdgeInsets.all(10.w),
              data: qrData,
              size: 240.w,
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: Size(99.w, 99.h),
              ),
              embeddedImage: const AssetImage('assets/icons/qr-logo.png'),
            ),
          ),
          Gap(90.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // Replace CircleAvatar with the selected wallet image from provider
                    ClipOval(
                      child: Image.asset(
                        selectedWallet.imagePath,
                        width: 32.w,
                        height: 32.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Gap(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Allan Jerrold',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          selectedWallet.name, // Use the wallet name from provider
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.greyLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
