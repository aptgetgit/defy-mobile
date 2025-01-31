import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    this.color,
    this.height,
    this.fontSize,  
    this.fontWeight, 
    this.fontColor,
  });
  final String label;
  final VoidCallback onTap;
  final ButtonSize? size;
  final bool? isDarkMode;
  final bool active;
  final double? width;
  final Widget? icon;
  final Color? color;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
    

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
           backgroundColor: AppColors.blue,
               
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
                  fontWeight: FontWeight.w600,

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

class OutlineButton extends ConsumerWidget {
  const OutlineButton({
    super.key,
    required this.label,
    required this.onTap,
    this.size = ButtonSize.medium,
    this.isDarkMode,
    this.width,
  });
  final String label;
  final VoidCallback onTap;
  final ButtonSize size;
  final bool? isDarkMode;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = isDarkMode ?? context.isDarkMode;
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size.fromHeight(size.height),
          side: BorderSide(
            width: 1,
            color: darkMode ? AppColors.white : AppColors.black,
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: TextStyle(
            fontSize: size.textSize,
            fontWeight: FontWeight.w500,
            color: darkMode ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}

