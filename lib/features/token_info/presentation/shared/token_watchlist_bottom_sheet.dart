import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_check_box.dart';

class TokenWatchlistBottomSheet extends StatefulWidget {
  const TokenWatchlistBottomSheet({required this.onAddToWatchlist, super.key});
  final Function(int?) onAddToWatchlist;

  @override
  State<TokenWatchlistBottomSheet> createState() => _TokenWatchlistBottomSheetState();
}

class _TokenWatchlistBottomSheetState extends State<TokenWatchlistBottomSheet> {
  // Add your selection logic here.  For example:
  int? _selectedCollectionIndex; // Track the selected collection
  bool _isCreatingCollection = false;

  @override
  Widget build(BuildContext context) {
    return _isCreatingCollection // Show create collection screen if true
        ? _buildCreateCollectionScreen()
        : _buildMainBottomSheet(); // Otherwise, show the main bottom sheet
  }

  Widget _buildMainBottomSheet() => Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(21.r),
            topRight: Radius.circular(21.r),
          ),
        ),
        padding: EdgeInsets.only(
          top: 12.h,
          left: 20.w,
          right: 4.w,
          bottom: 32.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Choose Collection',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(PhosphorIconsBold.x, color: Colors.black, size: 24.sp),
                ),
              ],
            ),
            Gap(4.h),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Column(
                children: <Widget>[
                  _buildCollectionItem(
                    title: 'Safety Tokens 🤩',
                    count: 4,
                    index: 0, // Add an index for each collection
                    onTap: () {
                      setState(() {
                        _selectedCollectionIndex = 0;
                      });
                    },
                  ),
                  _buildCollectionItem(
                    title: 'Avatar NFT',
                    count: 8,
                    index: 1,
                    onTap: () {
                      setState(() {
                        _selectedCollectionIndex = 1;
                      });
                    },
                  ),
                  _buildCollectionItem(
                    title: 'Cute NFTs 🐣',
                    count: 8,
                    index: 2,
                    onTap: () {
                      setState(() {
                        _selectedCollectionIndex = 2;
                      });
                    },
                  ),
                  Gap(10.h),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isCreatingCollection = true; // Navigate to create screen
                      });
                    },
                    child: Container(
                      height: 54.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.greyVeryLight,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: <Widget>[
                          Gap(10.w),
                          Icon(PhosphorIconsFill.plusCircle, size: 28.sp),
                          Gap(10.w),
                          Text(
                            'Create new collection', 
                            style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () {
                      // Implement add to watchlist logic, using _selectedCollectionIndex
                      if (_selectedCollectionIndex != null) {
                        widget.onAddToWatchlist(_selectedCollectionIndex);
                        const WalletScreenRoute().pushReplacement(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedCollectionIndex != null
                          ? AppColors.black
                          : AppColors.greyMedium,
                      elevation: 0,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 54.h),
                      textStyle: TextStyle(fontSize: 16.sp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                    ),
                    child: const Text('Add to Watchlist'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  Widget _buildCreateCollectionScreen() => Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(21.r),
            topRight: Radius.circular(21.r),
          ),
        ),
        padding: EdgeInsets.only(top: 12.h, bottom: 32.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isCreatingCollection = false; // Go back to main sheet
                      });
                    },
                    icon: Icon(PhosphorIconsBold.caretLeft, size: 24.sp), // Back button
                  ),
                  Text(
                    'New Token Collection',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the whole sheet
                    },
                    icon: Icon(PhosphorIconsBold.x, color: Colors.black, size: 24.sp),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Gap(8.h),
                  Text(
                    'Collections helps you to group tokens and keep track on them',
                    style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight),
                  ),
                  Gap(20.h),
                  Text('Collection name', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
                  Gap(4.h),
                  Container(
                    height: 54.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildCollectionItem({
    required String title,
    required int count,
    required int index, // Add an index parameter
    required VoidCallback onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: TextStyle(fontSize: 18.sp)),
                  Text(
                    '$count Tokens',
                    style: TextStyle(fontSize: 14.sp, color: const Color.fromARGB(255, 100, 109, 128)),
                  ),
                ],
              ),
              const Spacer(),
              CustomCheckbox(
                isChecked: _selectedCollectionIndex == index,
                isRound: true,
                onTap: () {
                  setState(() {
                    _selectedCollectionIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      );
}
