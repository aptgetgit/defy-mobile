// import 'package:flutter/material.dart';

// import 'package:defy_mobile/src/core/utils/functions.dart';

// class CurveLine extends StatelessWidget {
//   const CurveLine({super.key, this.isEndTile = false});

//   final bool? isEndTile;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 60,
//       child: Stack(
//         children: [
//           Container(
//             height: isEndTile! ? 0 : 70,
//             width: 1,
//             color: colorFromHex('#CFD2D8'),
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 0.5),
//             height: isEndTile! ? 56 : 36,
//             width: 28,
//             decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(30)),
//             child: CustomPaint(
//               painter: CurveCustomPainter(isEndTile: isEndTile!),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CurveCustomPainter extends CustomPainter {
//   CurveCustomPainter({super.repaint, required this.isEndTile});
//   final bool isEndTile;

//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = colorFromHex('#CFD2D8')
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;

//     final arc1 = Path();
//     arc1.moveTo(size.width * 0, size.height * 0);
//     arc1.arcToPoint(
//         Offset(
//             size.width * 1, isEndTile ? size.height * 0.5 : size.height * 0.7),
//         radius: Radius.circular(isEndTile ? 25 : 23),
//         clockwise: false);

//     canvas.drawPath(arc1, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
