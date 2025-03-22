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

class _SortSheetState extends State<SortSheet> {
  late SortOption _selectedSortOption;

  @override
  void initState() {
    super.initState();
    // Initialize with the proper selected option
    _selectedSortOption = _getCurrentSortOption();
  }

  // Get the current sort option based on props
  SortOption _getCurrentSortOption() {
    if (widget.isSortPriceButtonSelected) {
      return SortOption.price;
    } else if (widget.isSortBalanceButtonSelected) {
      return SortOption.balance;
    } else if (widget.isSortAlphabetButtonSelected) {
      return SortOption.alphabet;
    } else if (widget.isSort24hrButtonSelected) {
      return SortOption.change24hr;
    }
    return SortOption.balance; // Default to balance
  }

  @override
  void didUpdateWidget(SortSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update the selected option if props change
    _selectedSortOption = _getCurrentSortOption();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        // This ensures taps on the sheet don't dismiss the modal
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // This ensures clicking outside dismisses the sheet
            Expanded(
              child: GestureDetector(
                onTap: widget.onDismiss,
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
                              'Sort',
                              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                              onPressed: widget.onDismiss,
                              icon: Icon(PhosphorIconsBold.x, color: AppColors.black, size: 22.sp),
                            ),
                          ],
                        ),
                      ),
                      Gap(16.h),
                      _buildSortOptions(),
                      Gap(22.h),
                      Padding(
                        padding: EdgeInsets.only(right: 24.w),
                        child: ElevatedButton(
                          onPressed: widget.onDismiss,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(44.w),
                            ),
                            backgroundColor: AppColors.blue,
                            minimumSize: Size(double.infinity, 54.h),
                          ),
                          child: Text(
                            'Apply',
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
      ),
    );
  }

  Widget _buildSortOptions() => Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 6.w),
        child: _buildSortOptionRow(
          'Price',
          _selectedSortOption == SortOption.price,
          () {
            setState(() {
              _selectedSortOption = SortOption.price;
            });
            widget.onPriceToggled();
          },
        ),
      ),
      Gap(16.h),
      Padding(
        padding: EdgeInsets.only(right: 6.w),
        child: _buildSortOptionRow(
          'Balance',
          _selectedSortOption == SortOption.balance,
          () {
            setState(() {
              _selectedSortOption = SortOption.balance;
            });
            widget.onBalanceToggled();
          },
        ),
      ),
      Gap(16.h),
      Padding(
        padding: EdgeInsets.only(right: 6.w),
        child: _buildSortOptionRow(
          'Alphabet Order',
          _selectedSortOption == SortOption.alphabet,
          () {
            setState(() {
              _selectedSortOption = SortOption.alphabet;
            });
            widget.onAlphabetToggled();
          },
        ),
      ),
      Gap(16.h),
      Padding(
        padding: EdgeInsets.only(right: 6.w),
        child: _buildSortOptionRow(
          '24 hr price change',
          _selectedSortOption == SortOption.change24hr,
          () {
            setState(() {
              _selectedSortOption = SortOption.change24hr;
            });
            widget.on24hrToggled();
          },
        ),
      ),
    ],
  );

  Widget _buildSortOptionRow(
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) => Row(
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: isSelected ? AppColors.blue : AppColors.black,
        ),
      ),
      const Spacer(),
      Transform.scale(
        scale: 1.25,
        child: Radio<bool>(
          value: true,
          groupValue: isSelected,
          activeColor: AppColors.blue,
          onChanged: (_) => onTap(),
        ),
      ),
      Gap(12.w),
    ],
  );
}

enum SortOption { price, balance, alphabet, change24hr }