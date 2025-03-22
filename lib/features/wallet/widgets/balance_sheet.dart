import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class BalanceSheet extends StatefulWidget {
  const BalanceSheet({
    super.key,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  final String selectedOption;
  final Function(String) onOptionSelected;

  @override
  State<BalanceSheet> createState() => _BalanceSheetState();
}

class _BalanceSheetState extends State<BalanceSheet> {
  late String _currentSelection;

  @override
  void initState() {
    super.initState();
    _currentSelection = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // This ensures clicking outside dismisses the sheet
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(32.r)),
                  ),
                  padding: EdgeInsets.only(bottom: 22.h, top: 22.h, left: 26.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 14.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Balances',
                              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(PhosphorIconsBold.x, color: AppColors.black, size: 22.sp),
                            ),
                          ],
                        ),
                      ),
                      Gap(16.h),
                      Padding(
                        padding: EdgeInsets.only(right: 6.w),
                        child: _buildOptionRow('🚀', 'Total Balance', _currentSelection, _handleOptionSelected, fontSize: 18.sp),
                      ),
                      Gap(16.h),
                      Padding(
                        padding: EdgeInsets.only(right: 6.w),
                        child: _buildOptionRow('🏋', 'NFT Only', _currentSelection, _handleOptionSelected, fontSize: 18.sp),
                      ),
                      Gap(16.h),
                      Padding(
                        padding: EdgeInsets.only(right: 6.w),
                        child: _buildOptionRow('🚀', 'Token Only', _currentSelection, _handleOptionSelected, fontSize: 18.sp),
                      ),
                      Gap(22.h),
                      Padding(
                        padding: EdgeInsets.only(right: 24.w),
                        child: ElevatedButton(
                          onPressed: () {
                            // Call the parent's callback with the selected option
                            widget.onOptionSelected(_currentSelection);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(44.w),
                            ),
                            backgroundColor: AppColors.blue,
                            minimumSize: Size(double.infinity, 54.h),
                          ),
                          child: Text(
                            'Confirm',
                            style: TextStyle(color: AppColors.white, fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  // Handler for option selection
  void _handleOptionSelected(String value) {
    setState(() {
      _currentSelection = value;
    });
  }

  Widget _buildOptionRow(
    String emoji, 
    String title, 
    String selectedOption, 
    Function(String) onTap, 
    {double? fontSize}
  ) => Row(
    children: <Widget>[
      Text(
        title, 
        style: TextStyle(
          fontSize: fontSize ?? 16.sp, 
          fontWeight: FontWeight.w500
        )
      ),
      const Spacer(),
      // Custom radio button that updates immediately
      Transform.scale(
        scale: 1.25,
        child: Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: AppColors.greyLight, // Set inactive color to grey
            radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.blue; // Active color
                }
                return AppColors.greyLight; // Inactive color
              }),
            ),
          ),
          child: Radio<String>(
            activeColor: AppColors.blue,
            visualDensity: VisualDensity.compact,
            value: title,
            groupValue: selectedOption,
            onChanged: (String? value) {
              if (value != null) {
                onTap(value);
              }
            },
          ),
        ),
      ),
      Gap(12.w),
    ],
  );
}