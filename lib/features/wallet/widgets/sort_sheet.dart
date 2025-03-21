// Remove the filter section and related methods

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class SortSheet extends StatefulWidget {
  const SortSheet({
    super.key,
    required this.isSortPriceButtonSelected,
    required this.isSortBalanceButtonSelected,
    required this.isSortAlphabetButtonSelected,
    required this.isSort24hrButtonSelected,
    required this.onPriceToggled,
    required this.onBalanceToggled,
    required this.onAlphabetToggled,
    required this.on24hrToggled,
    required this.onDismiss,
  });
  final bool isSortPriceButtonSelected;
  final bool isSortBalanceButtonSelected;
  final bool isSortAlphabetButtonSelected;
  final bool isSort24hrButtonSelected;
  final VoidCallback onPriceToggled;
  final VoidCallback onBalanceToggled;
  final VoidCallback onAlphabetToggled;
  final VoidCallback on24hrToggled;
  final VoidCallback onDismiss;

  @override
  State<SortSheet> createState() => _SortSheetState();
}

enum SortOption { price, balance, alphabet, change24hr }

class _SortSheetState extends State<SortSheet> {
  // Define enum for sort options
  
  // Selected sort option
  SortOption? _selectedSortOption;

  @override
  void initState() {
    super.initState();
    // Initialize with the values provided - set only one as selected
    if (widget.isSortPriceButtonSelected) {
      _selectedSortOption = SortOption.price;
    } else if (widget.isSortBalanceButtonSelected) {
      _selectedSortOption = SortOption.balance;
    } else if (widget.isSortAlphabetButtonSelected) {
      _selectedSortOption = SortOption.alphabet;
    } else if (widget.isSort24hrButtonSelected) {
      _selectedSortOption = SortOption.change24hr;
    }
  }

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(32.r)),
        ),
        padding: EdgeInsets.only(left: 24.w, top: 12.h, bottom: 20.h),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ), // Adjust for safe area
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Sort', 
                  style: TextStyle(
                    fontSize: 18.sp, 
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: IconButton(
                    onPressed: widget.onDismiss, 
                    icon: Icon(
                      PhosphorIconsBold.x, 
                      color: AppColors.greyLight, 
                      size: 24.sp,
                    ),
                  ),
                ),
              ],
            ),
            _buildSortButtons(),
            Gap(24.h),
            Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: _buildApplyButton(context),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildSortButtons() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          _buildSortButton(
            'Price',
            _selectedSortOption == SortOption.price,
            () {
              _selectSortOption(SortOption.price);
              widget.onPriceToggled();
            },
            Icon(
              PhosphorIconsBold.trendUp,
              size: 16.sp,
            ),
          ),
          Gap(12.w),
          _buildSortButton(
            'Balance',
            _selectedSortOption == SortOption.balance,
            () {
              _selectSortOption(SortOption.balance);
              widget.onBalanceToggled();
            },
          ),
          Gap(12.w),
          _buildSortButton(
            'Alphabet Order',
            _selectedSortOption == SortOption.alphabet,
            () {
              _selectSortOption(SortOption.alphabet);
              widget.onAlphabetToggled();
            },
          ),
        ],
      ),
      Gap(6.h),
      _buildSortButton(
        '24 hr price change',
        _selectedSortOption == SortOption.change24hr,
        () {
          _selectSortOption(SortOption.change24hr);
          widget.on24hrToggled();
        },
        null,
        150.w,
      ),
    ],
  );
  
  // Helper method to select only one option
  void _selectSortOption(SortOption option) {
    setState(() {
      _selectedSortOption = option;
    });
  }

  Widget _buildSortButton(
    String label,
    bool isSelected,
    VoidCallback onToggled, [
    Widget? icon,
    double? fixedWidth,
  ]) => FilledButton(
    style: FilledButton.styleFrom(
      backgroundColor: isSelected ? AppColors.blue : AppColors.greyVeryLight,
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 7.h),
      fixedSize: fixedWidth != null ? Size(fixedWidth, 36.h) : null,
    ),
    onPressed: onToggled,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.white : AppColors.greyLight,
          ),
        ),
        if (icon != null) ...<Widget>[
          Gap(4.w),
          IconTheme(
            data: IconThemeData(
              color: isSelected ? AppColors.white : AppColors.greyLight,
              size: 16.sp,
            ),
            child: icon,
          ),
        ],
      ],
    ),
  );

  Widget _buildApplyButton(BuildContext context) => ElevatedButton(
    onPressed: () {
      // Apply changes and dismiss
      widget.onDismiss();
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      minimumSize: Size(double.infinity, 54.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.r),
      ),
    ),
    child: Text(
      'Apply',
      style: TextStyle(color: Colors.white, fontSize: 16.sp),
    ),
  );
}