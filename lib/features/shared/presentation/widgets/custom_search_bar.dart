
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({this.title = 'Search Token', super.key});
  final String title;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.zero,
      child: TextField(
        cursorColor: AppColors.greyLight,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: AppColors.greyVeryLight,
          hintText: widget.title,
          hintStyle:  Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.greyLight,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.circular(8.r),),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.circular(8.r),),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.circular(8.r),),
          prefixIcon: const Icon(
            PhosphorIconsBold.magnifyingGlass,
            size: 20,
            color: AppColors.greyLight,
          ),
        ),
      ),
    );
}
