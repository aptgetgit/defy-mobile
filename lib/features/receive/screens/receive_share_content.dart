import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../config/theme/colors.dart';
import '../providers/receive_page_provider.dart';
import '../widgets/share_sheet.dart';

class ReceiveShareContent extends ConsumerStatefulWidget {
  final VoidCallback onSharePressed;

  const ReceiveShareContent({super.key, required this.onSharePressed});

  @override
  ConsumerState<ReceiveShareContent> createState() => _ReceiveShareContentState();
}

class _ReceiveShareContentState extends ConsumerState<ReceiveShareContent> {
  final String walletAddress = '0x1234567890abcdef';
  bool _showCopiedMessage = false;

  @override
  Widget build(BuildContext context) {
    final ReceiveState receiveState = ref.watch(receiveProvider);
    final Asset? selectedAsset = receiveState.selectedAsset;

    final qrData = 'defy.app/request?asset=${selectedAsset?.symbol}&address=$walletAddress';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.transparent,
                    border: Border.all(
                      width: 10.w,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: QrImageView(
                    backgroundColor: AppColors.black,
                    foregroundColor: AppColors.white,
                    padding: EdgeInsets.all(10.w),
                    data: qrData,
                    size: 280.w,
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      size: Size(99.w, 99.h),
                    ),
                    embeddedImage: const AssetImage('assets/icons/qr-logo.png'),
                  ),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(14.w, 12.h, 10.w, 12.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (_showCopiedMessage)
                    Text(
                      'Address copied to clipboard',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.greyDark,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    )
                  else
                    Text(
                      'Address : 0x31ff....9212dh',
                      style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight),
                      textAlign: TextAlign.start,
                    ),
                  if (_showCopiedMessage)
                    Center(
                      child: Icon(
                        PhosphorIconsFill.checkCircle,
                        color: AppColors.green,
                        size: 30.sp,
                      ),
                    )
                  else
                    GestureDetector(
                      onTap: _copyAddressToClipboard,
                      child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: AppColors.black,
                        child: Center(
                          child: Icon(
                            PhosphorIconsBold.copySimple,
                            color: AppColors.white,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 32.h),
            child: SizedBox(
              width: double.infinity,
              height: 62.h,
              child: ElevatedButton(
                onPressed: () {
                  _showShareBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                ),
                child: Text(
                  'Share Link',
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _copyAddressToClipboard() {
    Clipboard.setData(ClipboardData(text: walletAddress));

    setState(() {
      _showCopiedMessage = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showCopiedMessage = false;
        });
      }
    });
  }

  void _showShareBottomSheet(BuildContext context) {
    final ReceiveState receiveState = ref.watch(receiveProvider);
    final Asset? selectedAsset = receiveState.selectedAsset;
    final qrData = 'defy.app/request?asset=${selectedAsset?.symbol}&address=$walletAddress';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(14.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 24.h, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Share this page',
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(PhosphorIconsRegular.x, size: 24.sp),
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
              child: CustomQrShareWidget(qrData: qrData),
            ),
            Gap(24.h),
            // Share Options
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: Row(
                  children: <Widget>[
                    _buildShareOption(
                      icon: PhosphorIconsRegular.downloadSimple,
                      label: 'Save',
                      onPressed: () {},
                    ),
                    Gap(30.w),
                    _buildShareOption(
                      icon: PhosphorIconsRegular.clipboard,
                      label: 'Copy',
                      onPressed: () {},
                    ),
                    Gap(30.w),
                    _buildShareOption(
                      imagePath: 'assets/icons/whatsapp.png',
                      label: 'Whatsapp',
                      onPressed: () {},
                    ),
                    Gap(30.w),
                    _buildShareOption(
                      imagePath: 'assets/icons/telegram.png',
                      label: 'Telegram',
                      onPressed: () {},
                    ),
                    Gap(30.w),
                    _buildShareOption(
                      imagePath: 'assets/icons/x.png',
                      label: 'X',
                      onPressed: () {},
                    ),
                    Gap(30.w),
                    _buildShareOption(
                      icon: PhosphorIconsFill.dotsThreeOutline,
                      label: 'More',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Gap(24.h),
          ],
        ),
      ),
    );
  }

  // Helper function to build share option buttons
  Widget _buildShareOption({
    required String label,
    required VoidCallback onPressed,
    IconData? icon,
    String? imagePath,
  }) =>
      Column(
        children: <Widget>[
          CircleAvatar(
            radius: 24.r,
            backgroundColor: Colors.grey.shade200,
            child: ClipOval(
              child: imagePath != null
                  ? Image.asset(
                      imagePath,
                      width: 48.w,
                      height: 48.h,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      icon,
                      size: 24.sp,
                      color: Colors.black,
                    ),
            ),
          ),
          Gap(8.h),
          Text(
            label,
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      );
}
