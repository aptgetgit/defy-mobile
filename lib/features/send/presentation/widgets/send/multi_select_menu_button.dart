// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../config/theme/colors.dart';

class MultiSelectMenuButton extends ConsumerStatefulWidget {
  final bool isSelectionMode;
  final Function() onTap;
  const MultiSelectMenuButton({
    required this.onTap,
    super.key,
    required this.isSelectionMode,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MultiSelectMenuButtonState();
}

class _MultiSelectMenuButtonState extends ConsumerState<MultiSelectMenuButton> {
  @override
  Widget build(BuildContext context) => widget.isSelectionMode
      ? GestureDetector(
          onTap: widget.onTap,
          child: InkWell(
            onTap: widget.onTap,
            child: Container(
              width: 60,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 252, 205, 205),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'Cancel',
                style: TextTheme.of(context).bodyLarge?.copyWith(
                      color: const Color(0xffff6767),
                    ),
              ),
            ).animate().slideX(
                  begin: 1,
                  end: 0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutBack,
                ),
          ),
        )
      : GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.greyLightest,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              PhosphorIcons.dotsThreeVertical(PhosphorIconsStyle.bold),
              color: AppColors.greyDark,
              size: 20,
            ),
          ).animate().slideX(
                begin: 0.2,
                end: 0,
                duration: const Duration(milliseconds: 150),
              ),
        );
}
