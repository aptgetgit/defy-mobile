import 'package:defy/config/theme/colors.dart';
import 'package:flutter/foundation.dart';
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
  Widget build(BuildContext context) => GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: 20,
        height: 20,
        decoration: !widget.isChecked
            ? BoxDecoration(
                borderRadius: widget.isRound
                    ? BorderRadius.circular(30)
                    : BorderRadius.circular(6),
                border: Border.all(
                  width: 1.5,
                  color: AppColors.grey,
                ),
                color: Colors.transparent,
              )
            : null,
        child: widget.isChecked
            ? const Align(
                child: Icon(
                  PhosphorIconsFill.checkCircle,
                  size: 20,
                  color: AppColors.blue,
                ),)
            : null,
      ),
    );
}