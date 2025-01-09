// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class QRScanScreen extends StatefulWidget {
//   @override
//   _QRScanScreenState createState() => _QRScanScreenState();
// }

// class _QRScanScreenState extends State<QRScanScreen> {
//   String scannedResult = "Scan a QR code"; // Default message

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Scanner'),
//         backgroundColor: Colors.blue,
//         elevation: 0,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//               width: 300,
//               height: 300,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: MobileScanner(
//                   onDetect: (barcode, args) {
//                     if (barcode.rawValue != null) {
//                       setState(() {
//                         scannedResult = barcode.rawValue!;
//                       });
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             scannedResult,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanScreen extends StatefulWidget {
  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  String scannedResult = "Scan a QR code"; // Default message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('QR Scanner'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: MobileScanner(
                  onDetect: (BarcodeCapture capture) {
                    final List<Barcode> barcodes = capture.barcodes;
                    for (final barcode in barcodes) {
                      if (barcode.rawValue != null) {
                        setState(() {
                          scannedResult = barcode.rawValue!;
                        });
                        break; // Handle only the first barcode detected
                      }
                    }
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            scannedResult,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
