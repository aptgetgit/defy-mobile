
import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomSearchBar extends StatefulWidget {
  final String title;
  const CustomSearchBar({this.title = "Search Token", super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
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
              borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(8.0)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(8.0)),
          prefixIcon: const Icon(
            PhosphorIconsBold.magnifyingGlass,
            size: 20,
            color: AppColors.greyLight,
          ),
        ),
      ),
    );
  }
}
