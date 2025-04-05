import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../app/routes/router.dart';
import '../widgets/qr_scanner_overlay.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  String? scannedData;
  MobileScannerController? cameraController;
  bool hasPermission = false;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      if (result.isGranted) {
        _initializeScanner();
      } else {
        setState(() {
          hasPermission = false;
        });
      }
    } else {
      _initializeScanner();
    }
  }

  void _initializeScanner() {
    cameraController = MobileScannerController();
    setState(() {
      hasPermission = true;
    });
  }

  Future<void> _pickImageAndNavigate(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null && result.files.isNotEmpty) {
        await const ReceiveScreenRoute().push(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image selected')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            if (hasPermission && cameraController != null)
              MobileScanner(
                controller: cameraController!,
                onDetect: (BarcodeCapture capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  setState(() {
                    scannedData = barcodes.first.rawValue;
                  });
                },
              )
            else
              const Center(
                child: Text(
                  'Camera permission required',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            const Align(
              alignment: Alignment.center,
              child: QRScannerOverlay(overlayColour: Colors.transparent),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Text(
                          'Scan a QR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 40.w),
                      ],
                    ),
                  ),
                  const Spacer(),
                  if (scannedData != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      child: Text(
                        'Scanned Data: $scannedData',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FilledButton(
                          onPressed: () => const ReceiveScreenRoute().push(context),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 52.5.w,
                              vertical: 17.h,
                            ),
                          ),
                          child: Text(
                            'Your QR',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        FilledButton(
                          onPressed: () => _pickImageAndNavigate(context),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 52.5.w,
                              vertical: 17.h,
                            ),
                          ),
                          child: Text(
                            'Upload',
                            style: TextStyle(
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
          ],
        ),
      );

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}