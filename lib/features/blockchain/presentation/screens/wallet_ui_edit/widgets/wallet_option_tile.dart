import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WalletOptionTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback? onTap;

  const WalletOptionTile({
    super.key,
    required this.label,
    required this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
      ),
      child: ListTile(
        onTap: onTap ?? () {},
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        leading: Icon(
          iconData,
          size: 26,
          color: AppColors.black,
        ),
        title: Text(label),
        titleTextStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.black),
        trailing: Icon(
          PhosphorIconsBold.caretRight,
          size: 18,
          color: AppColors.greyLight,
        ),
      ),
    );
  }
}
