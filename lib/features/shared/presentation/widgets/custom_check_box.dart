import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    required this.isChecked,
    this.isRound = false,
    this.onTap,
  });

  final bool isRound;
  final bool isChecked;
  final VoidCallback? onTap;
  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: 20.0,
        height: 20.0,
        decoration: !widget.isChecked
            ? BoxDecoration(
                borderRadius: widget.isRound
                    ? BorderRadius.circular(30.0)
                    : BorderRadius.circular(6.0),
                border: Border.all(
                  width: 1.5,
                  color: AppColors.grey,
                ),
                color: Colors.transparent,
              )
            : null,
        child: widget.isChecked
            ? Align(
                alignment: Alignment.center,
                child: Icon(
                  PhosphorIconsFill.checkCircle,
                  size: 20,
                  color: AppColors.blue,
                ))
            : null,
      ),
    );
  }
}
