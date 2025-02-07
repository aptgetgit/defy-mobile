
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../shared/presentation/widgets/custom_check_box.dart';

class SendTile extends ConsumerStatefulWidget {
  final bool isSelectionMode;
  final String? asset;
  final String heading;
  final String subHeading;
  final bool tileSelected;
  final Function() selectTile;

  const SendTile({
    super.key,
    required this.asset,
    required this.heading,
    required this.subHeading,
    required this.isSelectionMode,
    required this.tileSelected,
    required this.selectTile,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SendTileState();
}

class _SendTileState extends ConsumerState<SendTile> {
  @override
  Widget build(BuildContext context) {
    final String? assetPath = widget.asset;
    final String? headingText = widget.heading;
    final String? subHeadingText = widget.subHeading;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          if (assetPath == null)
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  headingText?.substring(0, 1).toUpperCase() ?? 'L',
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            )
          else
            Image.asset(
              assetPath,
              height: 50,
            ),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headingText ?? 'Loading...',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subHeadingText ?? 'Loading...',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (widget.isSelectionMode)
            CustomCheckbox(
              isChecked: widget.tileSelected,
              isRound: true,
              onTap: widget.selectTile,
            ).animate().slideX(
                  begin: 1,
                  end: 0,
                  duration: const Duration(milliseconds: 100),
                ),
        ],
      ),
    );
  }
}
