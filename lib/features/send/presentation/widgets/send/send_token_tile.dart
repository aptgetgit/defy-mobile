import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../common/presentation/widgets/custom_checkbox.dart';

class SendTokenTile extends ConsumerStatefulWidget {
  final bool isSelectionMode;
  final String? asset;
  final String heading;
  final String subHeading;
  final bool tileSelected;
  final String value;
  final Function() selectTile;

  const SendTokenTile({
    super.key,
    required this.asset,
    required this.heading,
    required this.subHeading,
    required this.isSelectionMode,
    required this.tileSelected,
    required this.value,
    required this.selectTile,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SendTokenTileState();
}

class _SendTokenTileState extends ConsumerState<SendTokenTile> {
  @override
  Widget build(BuildContext context) {
    final String? assetPath = widget.asset;
    final String headingText = widget.heading;
    final String subHeadingText = widget.subHeading;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          if (assetPath == null)
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  headingText.substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            )
          else
            Image.asset(
              assetPath,
              height: 40,
            ),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                headingText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subHeadingText,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            widget.value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (widget.isSelectionMode) const Gap(12),
          if (widget.isSelectionMode)
            CustomCheckbox(
              isChecked: widget.tileSelected,
              isRound: true,
              onTap: widget.selectTile,
            ).animate().slideX(
                  begin: 1,
                  end: 0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                ),
        ],
      ),
    );
  }
}
