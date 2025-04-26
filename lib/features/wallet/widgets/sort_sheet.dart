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
    // Add ascending parameters
    required this.isSortAscending,
    required this.onDirectionToggled,
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
  final bool isSortAscending; // New parameter
  final VoidCallback onDirectionToggled; // New parameter to toggle direction

  @override
  State<SortSheet> createState() => _SortSheetState();
}

enum SortOption { price, balance, alphabet, change24hr }

class _SortSheetState extends State<SortSheet> with SingleTickerProviderStateMixin {
  late SortOption _selectedSortOption;
  late AnimationController _animationController;
  late bool _isAscending;
  
  @override
  void initState() {
    super.initState();
    // Initialize with the proper selected option
    _selectedSortOption = _getCurrentSortOption();
    _isAscending = widget.isSortAscending;
    
    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    
    // Ensure the animation controller starts in the forward state
    _animationController.value = 1.0;
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
    _isAscending = widget.isSortAscending;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Switch to new sort option with animation
  void _selectSortOption(SortOption option, VoidCallback callback) {
    if (_selectedSortOption == option) {
      // Same option selected again - toggle direction only
      setState(() {
        // Update the local state immediately for UI feedback
        _isAscending = !_isAscending;
      });
      widget.onDirectionToggled();
    } else {
      // Different option selected - change option 
      setState(() {
        _selectedSortOption = option;
      });
      callback();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        // This prevents taps from bubbling through
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Area that can be tapped to dismiss the sheet
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
                      Gap(12.h),
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
      _buildTappableOptionRow(
        'Price',
        SortOption.price,
        () => widget.onPriceToggled(),
      ),
      Gap(7.h),
      _buildTappableOptionRow(
        'Balance',
        SortOption.balance,
        () => widget.onBalanceToggled(),
      ),
       Gap(7.h),
      _buildTappableOptionRow(
        'Alphabet Order',
        SortOption.alphabet,
        () => widget.onAlphabetToggled(),
      ),
      Gap(7.h),
      _buildTappableOptionRow(
        '24 hr price change',
        SortOption.change24hr,
        () => widget.on24hrToggled(),
      ),
    ],
  );

  Widget _buildTappableOptionRow(
    String label,
    SortOption option,
    VoidCallback onTap,
  ) {
    final bool isSelected = _selectedSortOption == option;
    
    // Make the entire row tappable
    return InkWell(
      onTap: () => _selectSortOption(option, onTap),
      child: Padding(
        padding: EdgeInsets.only(right: 6.w),
        child: Container(
          height: 44.h,
          color: Colors.transparent, // Needed for the gesture detector to work
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? AppColors.blue : AppColors.black,
                ),
              ),
              // Icon with fade animation
              if (isSelected)
                Padding(
                  padding: EdgeInsets.only(right: 18.w),
                  child: Image.asset(
                    // USE LOCAL STATE for immediate feedback
                    _isAscending
                        ? 'assets/icons/sort-ascending.png'
                        : 'assets/icons/sort-descending.png',
                    width: 18.sp,
                    height: 18.sp,
                  ),
                )
              else
                SizedBox(width: 24.sp, height: 24.sp),
            ],
          ),
        ),
      ),
    );
  }
}

