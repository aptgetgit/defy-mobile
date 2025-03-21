import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_check_box.dart';

class CategorySelectionPopup extends StatefulWidget {

  const CategorySelectionPopup({
    super.key,
    required this.categories,
    required this.onCategorySelected,
    required this.onEnableNow,
  });
  final List<Map<String, dynamic>> categories;
  final Function(Map<String, dynamic>) onCategorySelected;
  final VoidCallback onEnableNow;

  @override
  _CategorySelectionPopupState createState() => _CategorySelectionPopupState();
}

class _CategorySelectionPopupState extends State<CategorySelectionPopup> {
  int _selectedIndex = 0; // Track selected category index, default to 0

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Title
          Text(
            'Select Category',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(16.h), // Spacing

          // Category List with Custom Checkboxes
          ...widget.categories.map((Map<String, dynamic> category) {
            final int index = widget.categories.indexOf(category);
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    category['name'] as String,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(4.h), // Spacing
                  Text(
                    (category['items'] as List<dynamic>).join(', '),
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyLight,
                    ),
                  ),
                ],
              ),
              trailing: CustomCheckbox(
                isChecked: _selectedIndex == index,
                isRound: true,
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
            );
          }),
          Gap(24.h), // Spacing

          // Enable Now Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Return the selected category through the navigator
                widget.onCategorySelected(widget.categories[_selectedIndex]);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.h),
              ),
              child: Text(
                'Enable Now',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Gap(16.h), // Spacing (for bottom padding)
        ],
      ),
    );
}
