// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class QrScannerScreen extends StatefulWidget {
//   const QrScannerScreen({super.key});

//   @override
//   State<QrScannerScreen> createState() => _QrScannerScreenState();
// }

// class _QrScannerScreenState extends State<QrScannerScreen> {
//   String? scannedData;
//   MobileScannerController cameraController = MobileScannerController();

//   @override
//   Widget build(BuildContext context) => Scaffold(
//       backgroundColor: Colors.transparent, // Make background transparent
//       body: Stack(
//         children: <Widget>[
//           MobileScanner(
//             // fit: BoxFit.contain,
//             controller: cameraController,
//             onDetect: (BarcodeCapture capture) {
//               final List<Barcode> barcodes = capture.barcodes;
//               setState(() {
//                 scannedData = barcodes.first.rawValue;
//               });
//             },
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   'Scan QR Code',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 if (scannedData != null)
//                   Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Text(
//                       'Scanned Data: $scannedData',
//                       style: const TextStyle(color: Colors.white, fontSize: 16),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
// }
