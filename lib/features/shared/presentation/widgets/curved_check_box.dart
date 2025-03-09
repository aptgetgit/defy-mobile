import 'package:flutter/material.dart';

import '../../../../config/theme/colors.dart';

class CurvedCheckbox extends StatefulWidget   {
  const CurvedCheckbox({
    super.key,
    required this.isChecked,
    this.isRound = false,
    this.onTap,
  });

  final bool isRound;
  final bool isChecked;
  final VoidCallback? onTap;
  @override
  CurvedCheckboxState createState() => CurvedCheckboxState();
}

class CurvedCheckboxState extends State<CurvedCheckbox> {
  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: widget.isRound
              ? BorderRadius.circular(30)
              : BorderRadius.circular(6),
          border: Border.all(
            width: 1.5,
            color: AppColors.grey,
          ),
          color: Colors.transparent,
        ),
        child: widget.isChecked
            ? Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: widget.isRound
                      ? BorderRadius.circular(30)
                      : BorderRadius.circular(4),
                ),
              )
            : null,
      ),
    );
}
