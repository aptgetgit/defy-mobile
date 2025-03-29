import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

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
  
  // Create a GlobalKey for the QR share widget to capture it as image
  final GlobalKey _qrShareKey = GlobalKey();
  bool _isProcessing = false; // Add state to track processing

  @override
  Widget build(BuildContext context) {
    final ReceiveState receiveState = ref.watch(receiveProvider);
    final Asset? selectedAsset = receiveState.selectedAsset;

    final String qrData = 'defy.app/request?asset=${selectedAsset?.symbol}&address=$walletAddress';

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
    final String qrData = 'defy.app/request?asset=${selectedAsset?.symbol}&address=$walletAddress';

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
            // Wrap the CustomQrShareWidget with RepaintBoundary to capture it as image
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
              child: RepaintBoundary(
                key: _qrShareKey,
                child: CustomQrShareWidget(qrData: qrData),
              ),
            ),
            Gap(24.h),
            // Share Options with loading indicator
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // Show loading indicator during processing
                if (_isProcessing)
                  Container(
                    color: Colors.white.withOpacity(0.7),
                    child: const Center(
                      child: CircularProgressIndicator(color: AppColors.blue),
                    ),
                  ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Row(
                      children: <Widget>[
                        _buildShareOption(
                          icon: PhosphorIconsRegular.downloadSimple,
                          label: 'Save',
                          onPressed: () => _handleSave(context, qrData),
                        ),
                        Gap(30.w),
                        _buildShareOption(
                          icon: PhosphorIconsRegular.clipboard,
                          label: 'Copy',
                          onPressed: () => _handleCopy(context, qrData),
                        ),
                        Gap(30.w),
                        _buildShareOption(
                          imagePath: 'assets/icons/whatsapp.png',
                          label: 'Whatsapp',
                          onPressed: () => _handleShare(context, qrData, 'whatsapp'),
                        ),
                        Gap(30.w),
                        _buildShareOption(
                          imagePath: 'assets/icons/telegram.png',
                          label: 'Telegram',
                          onPressed: () => _handleShare(context, qrData, 'telegram'),
                        ),
                        Gap(30.w),
                        _buildShareOption(
                          imagePath: 'assets/icons/x.png',
                          label: 'X',
                          onPressed: () => _handleShare(context, qrData, 'twitter'),
                        ),
                        Gap(30.w),
                        _buildShareOption(
                          icon: PhosphorIconsFill.dotsThreeOutline,
                          label: 'More',
                          onPressed: () => _handleShare(context, qrData, 'more'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gap(24.h),
          ],
        ),
      ),
    );
  }

  // Function to capture the QR widget as an image
  Future<Uint8List?> _captureQrWidget() async {
    try {
      // Find the render object
      final RenderRepaintBoundary boundary = _qrShareKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      
      // Capture the widget as image
      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      
      // Convert to byte data
      final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      
      if (byteData != null) {
        return byteData.buffer.asUint8List();
      }
      return null;
    } catch (e) {
      debugPrint('Error capturing image: $e');
      return null;
    }
  }

  // Handle save to gallery
  Future<void> _handleSave(BuildContext context, String qrData) async {
    setState(() {
      _isProcessing = true;
    });
    
    try {
      final Uint8List? imageBytes = await _captureQrWidget();
      if (imageBytes != null) {
        // Save to gallery
        final result = await ImageGallerySaver.saveImage(
          imageBytes,
          quality: 100,
          name: 'defy_qr_${DateTime.now().millisecondsSinceEpoch}',
        );
        
        // Show success message
        if (result != null && result is Map && result['isSuccess'] == true) {
          _showSnackBar(context, 'QR Code saved to gallery');
        } else {
          _showSnackBar(context, 'Failed to save QR Code');
        }
      }
    } catch (e) {
      _showSnackBar(context, 'Error saving image: $e');
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  // Handle copy to clipboard
  Future<void> _handleCopy(BuildContext context, String qrData) async {
    // Simply copy the QR data to clipboard
    await Clipboard.setData(ClipboardData(text: qrData));
    _showSnackBar(context, 'QR code link copied to clipboard');
  }

  // Handle share with specific apps
  Future<void> _handleShare(BuildContext context, String qrData, String platform) async {
    setState(() {
      _isProcessing = true;
    });
    
    try {
      final Uint8List? imageBytes = await _captureQrWidget();
      if (imageBytes != null) {
        // Create a temporary file
        final Directory tempDir = await getTemporaryDirectory();
        final File file = File('${tempDir.path}/defy_qr_${DateTime.now().millisecondsSinceEpoch}.png');
        await file.writeAsBytes(imageBytes);
        
        switch (platform) {
          case 'whatsapp':
            await Share.shareXFiles(
              <XFile>[XFile(file.path)],
              subject: 'Send assets to my Defy wallet',
              text: 'Scan this QR code to send me assets on Defy: $qrData',
            );
          case 'telegram':
            await Share.shareXFiles(
              <XFile>[XFile(file.path)],
              subject: 'Send assets to my Defy wallet',
              text: 'Scan this QR code to send me assets on Defy: $qrData',
            );
          case 'twitter':
            await Share.shareXFiles(
              <XFile>[XFile(file.path)],
              subject: 'Send assets to my Defy wallet',
              text: 'Scan this QR code to send me assets on Defy: $qrData',
            );
          case 'more':
          default:
            await Share.shareXFiles(
              <XFile>[XFile(file.path)],
              subject: 'Send assets to my Defy wallet',
              text: 'Scan this QR code to send me assets on Defy: $qrData',
            );
        }
      }
    } catch (e) {
      _showSnackBar(context, 'Error sharing image: $e');
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  // Helper function to show snackbar
  void _showSnackBar(BuildContext context, String message) {
    // Pop the bottom sheet first
    Navigator.of(context).pop();
    
    // Then show the snackbar using the main scaffold
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating, // Make it floating for better visibility
        margin: EdgeInsets.only(
          bottom: 16.h,
          left: 16.w,
          right: 16.w,
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
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onPressed,
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