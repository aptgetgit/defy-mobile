import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SwapRouteTile extends StatefulWidget {
  const SwapRouteTile({super.key, required this.changeRoutes});

  final VoidCallback changeRoutes;

  @override
  State<SwapRouteTile> createState() => _SwapRouteTileState();
}

class _SwapRouteTileState extends State<SwapRouteTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 38,
          height: 38,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.blue,
                    AppColors.blue.withOpacity(0.9),
                    AppColors.blue.withOpacity(0.8),
                    AppColors.blue.withOpacity(0.6),
                  ]),
              borderRadius: BorderRadius.circular(6)),
          child: const Icon(
            PhosphorIconsBold.path,
            size: 24,
            color: AppColors.white,
          ),
        ),
        const Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Via ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: 'Cellena, Cetus',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.yellow),
              ),
            ])),
            Text(
              '2.5% Cheaper',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.green),
            )
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: widget.changeRoutes,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0x332071EE),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'Change',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
