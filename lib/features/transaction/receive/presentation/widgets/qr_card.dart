// import 'package:defy_mobile/src/core/core.dart';
// import 'package:flutter/material.dart';
// import 'package:pretty_qr_code/pretty_qr_code.dart';

// class QrCard extends StatelessWidget {
//   const QrCard({super.key, required this.data});

//   final String data;

//   @override
//   Widget build(BuildContext context) {
//     final qrCode = QrCode.fromData(
//   data: data,
//   errorCorrectLevel: QrErrorCorrectLevel.L,
// );
//     final (width, _) = context.screenSize;
//     return Container(
//       margin: const EdgeInsets.all(16),
//           padding: const EdgeInsets.all(12),
//           height: width * .6,
//           width: width * .6,
//           decoration: BoxDecoration(
//             color: whiteColor,
//             borderRadius: BorderRadius.circular(24),
//           ),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//           margin: const EdgeInsets.all(12),
//           padding: const EdgeInsets.all(8),
//           height: width * .45,
//           width: width * .45,
//           decoration: BoxDecoration(
              
//               borderRadius: BorderRadius.circular(20)),
//           child: PrettyQrView(qrImage: QrImage(qrCode), decoration: PrettyQrDecoration(
//             image: PrettyQrDecorationImage(image: Assets.images.maleMoji.provider(),),
//           )),
//         ),
//         Positioned.fill(
//           child: Align(
//             alignment: Alignment.center,
//             child: CustomPaint(
//               foregroundPainter: BorderPainter(),
//               child: SizedBox(
//                 width: width * .45 +25,
//                 height: width * .45 +25,
//               ),
//             ),
//           ),
//         ),
//         ],
//       ),
//     );
//   }
// }

// class BorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     const width = 4.0;
//     const radius = 20.0;
//     const tRadius = 3 * radius;
//     final rect = Rect.fromLTWH(
//       width,
//       width,
//       size.width - 2 * width,
//       size.height - 2 * width,
//     );
//     final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(radius));
//     const clippingRect0 = Rect.fromLTWH(
//       00,
//       0,
//       tRadius,
//       tRadius,
//     );
//     final clippingRect1 = Rect.fromLTWH(
//       size.width - tRadius,
//       0,
//       tRadius,
//       tRadius,
//     );
//     final clippingRect2 = Rect.fromLTWH(
//       0,
//       size.height - tRadius,
//       tRadius,
//       tRadius,
//     );
//     final clippingRect3 = Rect.fromLTWH(
//       size.width - tRadius,
//       size.height - tRadius,
//       tRadius,
//       tRadius,
//     );

//     final path = Path()
//       ..addRect(clippingRect0)
//       ..addRect(clippingRect1)
//       ..addRect(clippingRect2)
//       ..addRect(clippingRect3);

//     canvas.clipPath(path);
//     canvas.drawRRect(
//       rrect,
//       Paint()
//         ..color = blackColor
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = width,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
