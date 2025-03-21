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
                  'Filter', 
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
            _buildFilterSection(),
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

  Widget _buildFilterSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _buildFilterOption(r'Hide small balances (0.1$)', _hideSmallBalances, (bool? value) {
        setState(() {
          _hideSmallBalances = !_hideSmallBalances;
          widget.onHideSmallBalancesChanged(_hideSmallBalances);
        });
      }),
      _buildFilterOption('Filter spam tokens', _filterSpamTokens, (bool? value) {
        setState(() {
          _filterSpamTokens = !_filterSpamTokens;
          widget.onFilterSpamTokensChanged(_filterSpamTokens);
        });
      }),
    ],
  );

  Widget _buildFilterOption(String label, bool isChecked, ValueChanged<bool?> onChanged) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        label, 
        style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight),
      ),
      Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Transform.scale(
          scale: 0.9,
          child: Checkbox(
            value: isChecked,
            activeColor: AppColors.blue,
            side: BorderSide(color: AppColors.greyLight, width: 2.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    ],
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