import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ActiveButton extends StatelessWidget {
  const ActiveButton({
    super.key,
    required this.label,
    required this.onTap,
    this.size = ButtonSize.medium,
    this.isDarkMode,
    this.active = true,
    this.width,
    this.icon,
  });
  final String label;
  final VoidCallback onTap;
  final ButtonSize? size;
  final bool? isDarkMode;
  final bool active;
  final double? width;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final darkMode = isDarkMode ?? context.isDarkMode;
    return Visibility(
      visible: darkMode,
      replacement: SizedBox(
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(size!.height),
            // backgroundColor: !active ? const Color(0xffcfd2d8) : whiteColor,
          ),
          onPressed: active ? onTap : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              SizedBox(width: icon == null ? 0 : 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: size!.textSize,
                  fontWeight: FontWeight.w500,
                  // color: !active ? whiteColor : blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
      child: SizedBox(
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(size!.height),
            backgroundColor: !active ? const Color(0xff252525) : AppColors.blue,
          ),
          onPressed: active ? onTap : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              SizedBox(width: icon == null ? 0 : 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: size!.textSize,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}