import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import 'category_selection_popup.dart';

class EfficiencyModePopup extends StatefulWidget {

  const EfficiencyModePopup({required this.onEnableCategory, super.key,});
  final Function(String) onEnableCategory;

  @override
  _EfficiencyModePopupState createState() => _EfficiencyModePopupState();
}

class _EfficiencyModePopupState extends State<EfficiencyModePopup> {
  String selectedCategory = 'APT Collateral'; // Default selected category

  final List<Map<String, dynamic>> categories = <Map<String, dynamic>>[
    <String, dynamic>{
      'name': 'APT Collateral',
      'items': <String>['APT', 'stAPT', 'sthAPT', 'tAPT'],
    },
    <String, dynamic>{
      'name': 'Stable Collateral',
      'items': <String>['USDC', 'USDT', 'DAI', 'MOD'],
    },
  ];

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 5.r,
            blurRadius: 7.r,
            offset: Offset(0, 3.h), // Changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Title
          Text(
            'Efficiency Mode',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(16.h), // Spacing

          // Description
          Text(
            'Enabling E-Mode increases the LTV for a selected category of assets.',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.greyDark,
            ),
          ),
          Gap(16.h), // Spacing

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Select Category',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.greyLight,
                ),
              ),

              // Category Dropdown (simulated as a button for simplicity)
              GestureDetector(
                onTap: _showCategorySelection,
                child: Container(
                  width: 130.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          selectedCategory,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Gap(2.w),
                        Icon(PhosphorIconsBold.caretDown, color: Colors.black, size: 12.sp),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(24.h), // Spacing

          // Enable Now Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle Enable Now action here
                widget.onEnableCategory(selectedCategory);
                Navigator.pop(context); // Close the popup
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

  // Simplified navigation method
  Future<void> _showCategorySelection() async {
    // Calculate the screen size to position the dialog
    final Size screenSize = MediaQuery.of(context).size;
    
    // Show a dialog positioned at the bottom
    final Map<String, dynamic>? result = await showDialog<Map<String, dynamic>>(
      context: context,
      barrierColor: Colors.black54,
      builder: (BuildContext context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: screenSize.width * 0.95, // Make it slightly less than screen width
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      spreadRadius: 1.r,
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: CategorySelectionPopup(
                  categories: categories,
                  onCategorySelected: (Map<String, dynamic> category) {
                    Navigator.pop(context, category);
                  },
                  onEnableNow: () {
                    Navigator.pop(context, categories[0]);
                  },
                ),
              ),
            ],
          ),
        ),
    );
    
    if (result != null) {
      setState(() {
        selectedCategory = result['name'] as String;
      });
    }
  }
}
