import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../config/theme/colors.dart';
import '../providers/receive_page_provider.dart';
import '../providers/selected_wallet_option.dart';
import '../widgets/share_sheet.dart';
import 'receive_flow_screen.dart';

class ReceiveScreen extends ConsumerStatefulWidget {
  const ReceiveScreen({super.key});

  @override
  ConsumerState<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends ConsumerState<ReceiveScreen> {
  final String walletAddress = '0x31ff....9212dh';
  bool _showCopiedMessage = false;
  
  @override
  void initState() {
    super.initState();
    // No need to initialize _selectedWallet here since we use the provider
  }

  @override
  Widget build(BuildContext context) {
    // Get the selected wallet and available wallets from providers
    final Wallet selectedWallet = ref.watch(selectedWalletProvider);
    ref.watch(availableWalletsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Receive', style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(PhosphorIconsBold.caretLeft, size: 22.sp),
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
              Gap(60.h),
              Stack(
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
                      data: walletAddress,
                      size: 300.w,
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(99.w, 99.h),
                      ),
                      embeddedImage:
                          const AssetImage('assets/icons/qr-logo.png'),
                    ),
                  ),
                ],
              ),
              Gap(48.h),
              //Address Container
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  // Use a calculated fixed width instead of double.infinity
                  width: _showCopiedMessage ? 300.w : MediaQuery.of(context).size.width - 16.w,
                  height: _showCopiedMessage ? 50.h : 66.h, // Smaller height in copied state
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          // Wallet icon with size animation
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            width: _showCopiedMessage ? 36.w : 44.w,
                            height: _showCopiedMessage ? 36.h : 44.h,
                            padding: EdgeInsets.only(left: _showCopiedMessage ? 0 : 7.w),
                            child: Image.asset(
                              selectedWallet.imagePath,
                              width: _showCopiedMessage ? 36.w : 44.w,
                              height: _showCopiedMessage ? 36.h : 44.h,
                            ),
                          ),
                          Gap(12.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // AnimatedSwitcher for text content
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 250),
                                transitionBuilder: (Widget child, Animation<double> animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(0.1, 0.0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    ),
                                  );
                                },
                                child: _showCopiedMessage
                                  ? Row(
                                      key: const ValueKey('copied'),
                                      children: [
                                        Text(
                                          "Address copied",
                                          style: TextStyle(
                                            fontSize: 16.sp, // Smaller text in copied state
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      key: const ValueKey('normal'),
                                      children: [
                                        Text(
                                          selectedWallet.name,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        Gap(4.w),
                                        GestureDetector(
                                          onTap: () {
                                            _showWalletBottomSheet(context);
                                          },
                                          child: Icon(
                                            PhosphorIconsBold.caretDown,
                                            color: AppColors.black,
                                            size: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                              ),
                              // Address text with animated size and opacity
                              AnimatedSize(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInOut,
                                child: _showCopiedMessage
                                  ? const SizedBox.shrink() // Completely hide when copied
                                  : Padding(
                                      padding: EdgeInsets.only(top: 2.h),
                                      child: Text(
                                        walletAddress,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.greyLight,
                                        ),
                                      ),
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Right icon with animated switch
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                        child: _showCopiedMessage
                          ? Icon(
                              key: const ValueKey('check'),
                              PhosphorIconsFill.checkCircle,
                              color: AppColors.green,
                              size: 22.sp,
                            )
                          : GestureDetector(
                              key: const ValueKey('copy'),
                              onTap: _copyAddressToClipboard,
                              child: Icon(
                                PhosphorIconsBold.copySimple,
                                color: AppColors.black,
                                size: 22.sp,
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
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const ReceiveFlowScreen(),
                        ),
                        );
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        fixedSize: Size(164.w, 56.h),
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
                    Gap(14.w),
                    FilledButton(
                      onPressed: () => _showShareBottomSheet(context),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        fixedSize: Size(164.w, 56.h),
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
  }

  void _showWalletBottomSheet(BuildContext context) {
    final Wallet selectedWallet = ref.read(selectedWalletProvider);
    final List<Wallet> wallets = ref.read(availableWalletsProvider);
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => Padding(
        // Updated padding to match balance sheet
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                elevation: 8,
                // Updated border radius to match balance sheet
                borderRadius: BorderRadius.circular(32.r),
                color: Colors.white,
                child: Padding(
                  // Updated padding to match balance sheet
                  padding: EdgeInsets.only(bottom: 22.h, top: 22.h, left: 26.w, right: 26.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Title - Updated font and spacing
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Choose wallet',
                            // Updated font size and weight to match balance sheet
                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              PhosphorIconsBold.x,
                              size: 22.sp, // Updated size
                              color: AppColors.black, // Updated color to match
                            ),
                          ),
                        ],
                      ),
                      // Updated gap to match balance sheet
                      Gap(16.h),
                      
                      // Wallet options - unchanged functionality but updated spacing
                      ...List.generate(
                        wallets.length,
                        (int index) {
                          // Add gap between items
                          if (index > 0) {
                            return Column(
                              children: [
                                Gap(12.h), // Added consistent spacing
                                _buildWalletOption(
                                  wallet: wallets[index],
                                  isSelected: selectedWallet.name == wallets[index].name,
                                  onTap: () {
                                    ref.read(selectedWalletProvider.notifier).selectWallet(wallets[index]);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          } else {
                            return _buildWalletOption(
                              wallet: wallets[index],
                              isSelected: selectedWallet.name == wallets[index].name,
                              onTap: () {
                                ref.read(selectedWalletProvider.notifier).selectWallet(wallets[index]);
                                Navigator.pop(context);
                              },
                            );
                          }
                        },
                      ),
                      
                      // Add confirm button with updated styling
                      
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pop(context);
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     elevation: 0,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(44.r),
                      //     ),
                      //     backgroundColor: AppColors.blue,
                      //     minimumSize: Size(double.infinity, 54.h),
                      //   ),
                      //   child: Text(
                      //     'Confirm',
                      //     style: TextStyle(color: AppColors.white, fontSize: 16.sp),
                      //   ),
                      // ),
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

  // Updated wallet option builder that takes a Wallet object and onTap callback
  Widget _buildWalletOption({
    required Wallet wallet,
    required bool isSelected,
    required VoidCallback onTap,
  }) => ListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      title: Text(
        wallet.name,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        wallet.balance,
        style: TextStyle(
          fontSize: 14.sp,
          color: const Color.fromARGB(255, 100, 109, 128),
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Image.asset(wallet.imagePath, width: 36.w, height: 36.h),
      trailing: isSelected
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                  'Selected',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          )
          : null,
      onTap: onTap, // Use the provided callback
    );

  // Function to copy address to clipboard
  void _copyAddressToClipboard() {
    const String walletAddress = '0x31ff....9212dh'; // Or get the actual address
    Clipboard.setData(const ClipboardData(text: walletAddress));
    
    // Set state to show copied confirmation
    setState(() {
      _showCopiedMessage = true;
    });
    
    // Reset after 2 seconds (changed from 3 seconds)
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showCopiedMessage = false;
        });
      }
    });
  }

  // Function to show the share bottom sheet
  void _showShareBottomSheet(BuildContext context) {
    ref.watch(receiveProvider);
    const String qrData = '0x31ff....9212dh';

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
            SizedBox(
              height: 110.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                // Add explicit padding to the ListView
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                children: <Widget>[
                  _buildShareOption(
                    icon: PhosphorIconsRegular.downloadSimple,
                    label: 'Save',
                    onPressed: () {},
                  ),
                  SizedBox(width: 24.w), // Explicit spacing between items
                  _buildShareOption(
                    icon: PhosphorIconsRegular.clipboard,
                    label: 'Copy',
                    onPressed: () {},
                  ),
                  SizedBox(width: 24.w),
                  _buildShareOption(
                    imagePath: 'assets/icons/whatsapp.png',
                    label: 'Whatsapp',
                    onPressed: () {},
                  ),
                  SizedBox(width: 24.w),
                  _buildShareOption(
                    imagePath: 'assets/icons/telegram.png',
                    label: 'Telegram',
                    onPressed: () {},
                  ),
                  SizedBox(width: 24.w),
                  _buildShareOption(
                    imagePath: 'assets/icons/x.png',
                    label: 'X',
                    onPressed: () {},
                  ),
                  SizedBox(width: 24.w),
                  _buildShareOption(
                    icon: PhosphorIconsFill.dotsThreeOutline,
                    label: 'More',
                    onPressed: () {},
                  ),
                  // No need for extra padding, ListView.padding handles it
                ],
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

// Add this class at the bottom of the file, outside the ReceiveScreen class
class _DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashHeight;
  final double dashSpace;

  _DashedLinePainter({
    required this.color,
    required this.dashHeight,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.width
      ..strokeCap = StrokeCap.round;

    // Calculate total dashes that will fit
    final dashCount = size.height / (dashHeight + dashSpace);
    
    // Distribute dashes evenly
    for (int i = 0; i < dashCount.floor(); i++) {
      // Draw each dash
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      // Move to next dash position
      startY += dashHeight + dashSpace;
    }
    
    // Add a final dash if there's space
    if (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, min(startY + dashHeight, size.height)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
