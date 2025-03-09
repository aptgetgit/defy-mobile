import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../config/theme/colors.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({
    required this.name,
    required this.logoPath,
    required this.percentage,
    required this.scrollProgress, 
    required this.screenWidth, 
    required this.percentageTextWidth, 
    this.investors,
    this.showInvestorsAsRow = false,
    this.showPercentageWithArrow = false,
    this.percentageValue,
    super.key,
  });
  final String name;
  final String logoPath;
  final String percentage;
  final String? investors;
  final double scrollProgress;
  final double screenWidth;
  final double percentageTextWidth;
  final bool showInvestorsAsRow;
  final bool showPercentageWithArrow;
  final String? percentageValue;

  @override
  Widget build(BuildContext context) {
    final double textSize = 24 - (8 * scrollProgress);
    final double percentageTextSize = 24 - (12 * scrollProgress);
    final double imageSize = 32 - (2 * scrollProgress);
    final double investorsOpacity = 1.0 - scrollProgress;
    final double returnsOpacity = 1.0 - scrollProgress;

    // Name animation
    const double startX = 16;
    const double startY = 185;
    final double endX = (screenWidth - 100) / 2 - 40;
    const double endY = 70;
    final double animatedX = startX + (endX - startX) * scrollProgress;
    final double animatedY = startY - (startY - endY) * scrollProgress;

    // Percentage animation
    final double percentageStartX = screenWidth - percentageTextWidth - 10;
    const double percentageStartY = 185;
    final double percentageEndX = (screenWidth - 200) / 2 + 10;
    const double percentageEndY = 90;
    final double animatedPercentageX = percentageStartX + (percentageEndX - percentageStartX) * scrollProgress;
    final double animatedPercentageY = percentageStartY - (percentageStartY - percentageEndY) * scrollProgress;

    // Image animation
    final double imageStartX = screenWidth / 2 - 180;
    const double imageStartY = 135;
    const double imageEndX = 60;
    const double imageEndY = 75;
    final double animatedImageX = imageStartX + (imageEndX - imageStartX) * scrollProgress;
    final double animatedImageY = imageStartY - (imageStartY - imageEndY) * scrollProgress;

    return Stack(
      children: <Widget>[
        Positioned(
          left: animatedX,
          top: animatedY,
          child: Text(
            name,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Instead of showing percentage here, show investors if available
        if (investors != null)
          Positioned(
            left: 16,
            top: 230,
            child: Opacity(
              opacity: investorsOpacity,
              child: showInvestorsAsRow
                ? Row(
                    children: <Widget>[
                      Text(
                        investors!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.greyLight,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(4),
                      const Icon(
                        PhosphorIconsRegular.caretRight,
                        size: 14,
                        color: AppColors.greyLight,
                      ),
                    ],
                  )
                : Text(
                    investors!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.greyLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            ),
          ),
        // The animated percentage (this will be the only percentage shown)
        Positioned(
          left: animatedPercentageX,
          top: animatedPercentageY,
          child: Text(
            percentage,
            style: TextStyle(
              fontSize: percentageTextSize,
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          left: animatedImageX,
          top: animatedImageY,
          child: SizedBox(
            width: imageSize,
            height: imageSize,
            child: Image.asset(logoPath),
          ),
        ),
        Positioned(
          left: screenWidth / 2 + 108,
          top: 230,
          child: Opacity(
            opacity: returnsOpacity,
            child: const Text(
              '1Y Returns',
              style: TextStyle(color: AppColors.greyLight, fontSize: 14),
            ),
          ),
        ),
        // Add the percentage with arrow if needed
        if (showPercentageWithArrow && percentageValue != null)
          Positioned(
            right: 16,
            top: 230,
            child: Opacity(
              opacity: returnsOpacity,
              child: Row(
                children: <Widget>[
                  Text(
                    percentageValue!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(4),
                  const Icon(PhosphorIconsBold.arrowDown, size: 14, color: Colors.green),
                ],
              ),
            ),
          ),
      ],
    );
  }
}