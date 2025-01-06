import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          borderRadius: widget.isRound
              ? BorderRadius.circular(30.0)
              : BorderRadius.circular(6.0),
          border: Border.all(
            width: 1.5,
            color: AppColors.grey,
          ),
          color: Colors.transparent,
        ),
        child: widget.isChecked
            ? Container(
                height: 12.0,
                width: 12.0,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: widget.isRound
                      ? BorderRadius.circular(30.0)
                      : BorderRadius.circular(4.0),
                ),
              )
            : null,
      ),
    );
  }
}
