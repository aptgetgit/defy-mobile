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
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(28.r)),
            ),
            padding: EdgeInsets.only(bottom: 20.h, top: 10.h, left: 20.w),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Balances',
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(PhosphorIconsBold.x, color: AppColors.black, size: 20.sp),
                      ),
                    ],
                  ),
                ),
                Gap(12.h),
                _buildOptionRow('🚀', 'Total Balance', _currentSelection, _handleOptionSelected),
                Gap(18.h),
                _buildOptionRow('🏋', 'NFT Only', _currentSelection, _handleOptionSelected),
                Gap(18.h),
                _buildOptionRow('🚀', 'Token Only', _currentSelection, _handleOptionSelected),
                Gap(20.h),
                Padding(
                  padding: EdgeInsets.only(right: 20.w),//
                  child: ElevatedButton(
                    onPressed: () {
                      // Call the parent's callback with the selected option
                      widget.onOptionSelected(_currentSelection);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.r),
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
      );

  // Handler for option selection
  void _handleOptionSelected(String value) {
    setState(() {
      _currentSelection = value;
    });
  }

  Widget _buildOptionRow(String emoji, String title, String selectedOption, Function(String) onTap) => Row(
    children: <Widget>[
      Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
      const Spacer(),
      // Custom radio button that updates immediately
      Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: AppColors.greyLight, // Set inactive color to grey
          radioTheme: RadioThemeData(
            fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
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
      Gap(12.w),
    ],
  );
}