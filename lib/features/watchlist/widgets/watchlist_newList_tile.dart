import 'package:flutter/material.dart';

import 'package:phosphor_flutter/phosphor_flutter.dart';

class WatchlistNewListTile extends StatelessWidget {
  const WatchlistNewListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 164,
      height: 164,
      child: CustomPaint(
        painter: DashedCirclePainter(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              PhosphorIcons.listPlus(),
              size: 48,
              color: Colors.grey,
            ),
            const SizedBox(height: 2),
            const Text(
              "New List",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dashWidth = 8, dashSpace = 4;
    final Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    final double radius = size.width / 2;
    const double circumference = 2 * 3.141592653589793 * 82; // Approximate circle circumference

    double distance = 0;
    while (distance < circumference) {
      path.addArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        (distance / radius),
        (dashWidth / radius),
      );
      distance += (dashWidth + dashSpace);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}