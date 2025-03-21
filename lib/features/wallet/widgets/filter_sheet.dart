import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({
    super.key,
    required this.hideSmallBalances,
    required this.filterSpamTokens,
    required this.onHideSmallBalancesChanged,
    required this.onFilterSpamTokensChanged,
    required this.onDismiss,
  });
  
  final bool hideSmallBalances;
  final bool filterSpamTokens;
  final ValueChanged<bool> onHideSmallBalancesChanged;
  final ValueChanged<bool> onFilterSpamTokensChanged;
  final VoidCallback onDismiss;

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  // State for checkboxes
  late bool _hideSmallBalances;
  late bool _filterSpamTokens;

  @override
  void initState() {
    super.initState();
    // Initialize with provided values
    _hideSmallBalances = widget.hideSmallBalances;
    _filterSpamTokens = widget.filterSpamTokens;
  }

  @override
  Widget build(BuildContext context) => Align(
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
                    'Filter',
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
            _buildFilterSection(),
            Gap(22.h),
            Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: ElevatedButton(
                onPressed: () {
                  widget.onDismiss();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(44.w),
                  ),
                  backgroundColor: AppColors.blue, // Changed to blue to match balance sheet
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
  );

  Widget _buildFilterSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _buildFilterOption(r'Hide small balances (0.1$)', _hideSmallBalances, (bool? value) {
        setState(() {
          _hideSmallBalances = !_hideSmallBalances;
          widget.onHideSmallBalancesChanged(_hideSmallBalances);
        });
      }),
      Gap(16.h),
      _buildFilterOption('Filter spam tokens', _filterSpamTokens, (bool? value) {
        setState(() {
          _filterSpamTokens = !_filterSpamTokens;
          widget.onFilterSpamTokensChanged(_filterSpamTokens);
        });
      }),
    ],
  );

  Widget _buildFilterOption(String label, bool isChecked, ValueChanged<bool?> onChanged) => Row(
    children: <Widget>[
      Text(
        label, 
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.black),
      ),
      const Spacer(),
      Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Transform.scale(
          scale: 1.25,
          child: Checkbox(
            value: isChecked,
            activeColor: AppColors.blue,
            side: BorderSide(color: AppColors.greyLight, width: 1.5.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    ],
  );
}