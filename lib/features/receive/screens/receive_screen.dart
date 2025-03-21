import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../config/theme/colors.dart';
import '../../../app/routes/router.dart';

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({super.key});

  final String walletAddress = '0xWalletAddress';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Receive', style: TextStyle(fontSize: 18.sp)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(PhosphorIconsBold.caretLeft, size: 24.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: <Widget>[
              Gap(100.h),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  QrImageView( 
                    data: walletAddress,
                    size: 245.w,
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      size: Size(99.w, 99.h),
                    ),
                    embeddedImage:
                        const AssetImage('assets/icons/qr-logo.png'),
                  ),
                ],
              ),
              Gap(15.h),
              GestureDetector(
                onTap: () {
                  _showWalletBottomSheet(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    //  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/star-struck.png',
                      width: 24.w,
                      height: 24.h,
                    ),
                    Gap(7.w),
                    Text(
                      'Business',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyDark,
                      ),
                    ),
                    Gap(5.w),
                    Center(
                      // padding:  EdgeInsets.only(top: 20.h),
                      child: Icon(
                        PhosphorIconsRegular.caretDown,
                        size: 16.sp,
                        color: AppColors.greyDark,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(14.w, 15.h, 12.w, 15.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '0x121271218..................2817218281',
                        style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight),
                        textAlign: TextAlign.start,
                      ),
                      GestureDetector(
                        onTap: () {
                          _copyAddressToClipboard(context);
                        },
                        child: CircleAvatar(
                          radius: 12.r,
                          backgroundColor: AppColors.black,
                          child: Center(
                            child: Icon(
                              PhosphorIconsBold.copySimple,
                              color: AppColors.white,
                              size: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              // Bottom Row
              Padding(
                padding: EdgeInsets.only(bottom: 16.h, left: 12.w, right: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FilledButton(
                      onPressed: () => const ReceiveSelectScreenRoute().push(context),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        fixedSize: Size(150.w, 56.h)
                      ),
                      child: Text(
                        'Request',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    FilledButton(
                      onPressed: () => _showShareBottomSheet(context),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        fixedSize: Size(150.w, 56.h)
                      ),
                      child: Text(
                        'Share',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  void _showWalletBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Choose wallet',
                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              PhosphorIconsBold.x,
                              size: 24.sp,
                              color: AppColors.greyLight,
                            ),
                          ),
                        ],
                      ),
                      Gap(12.h),

                      // Wallet Options
                      _buildWalletOption(
                        imagePath: 'assets/icons/star-struck.png',
                        title: 'Business',
                        balance: r'$324.00',
                        isDefault: true,
                      ),
                      _buildWalletOption(
                        imagePath: 'assets/icons/face-blowing-kiss.png',
                        title: 'Savings',
                        balance: r'$60.20',
                      ),
                      _buildWalletOption(
                        imagePath: 'assets/icons/star-struck.png',
                        title: 'Business',
                        balance: r'$324.00',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build wallet option
  Widget _buildWalletOption({
    required String imagePath,
    required String title,
    required String balance,
    bool isDefault = false,
  }) => ListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        balance,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.greyLight,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Image.asset(imagePath, width: 32.w, height: 32.h),
      trailing: isDefault
          ? Text(
              'Default',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.greyLight,
                fontWeight: FontWeight.w500,
              ),
            )
          : null,
      onTap: () {
        // Handle wallet selection
      },
    );

  // Function to copy address to clipboard
  void _copyAddressToClipboard(BuildContext context) {
    const String walletAddress = '0x0'; // Or get the actual address
    Clipboard.setData(const ClipboardData(text: walletAddress));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Address copied to clipboard',
              style: TextStyle(
                color: AppColors.greyDark,
                fontSize: 16.sp,
              ),
            ),
            Gap(6.w),
            Icon(
              PhosphorIconsFill.checkCircle,
              size: 20.sp,
              color: AppColors.green,
            ),
          ],
        ),
        backgroundColor: AppColors.greyVeryLight,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        margin: EdgeInsets.only(bottom: 100.h, left: 72.w, right: 72.w),
        padding: EdgeInsets.fromLTRB(12.w, 8.h, 6.w, 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }

  // Function to show the share bottom sheet
  void _showShareBottomSheet(BuildContext context) {
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
              child: Image.asset(
                'assets/images/share-qr.png',
                width: 380.w,
                height: 502.h,
              ),
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
  }) => Column(
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
