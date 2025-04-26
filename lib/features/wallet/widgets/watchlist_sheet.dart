import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../watchlist/widgets/watchlist_new_collection.dart';

class WatchlistBottomSheet extends StatefulWidget {
  final Function(Set<int>) onAddToWatchlist;

  const WatchlistBottomSheet({super.key, required this.onAddToWatchlist});

  @override
  State<WatchlistBottomSheet> createState() => _WatchlistBottomSheetState();
}

class _WatchlistBottomSheetState extends State<WatchlistBottomSheet> {
  // Add your selection logic here
  Set<int> _selectedCollections = {}; // Track multiple selected collections
  bool _isCreatingCollection = false;

  @override
  Widget build(BuildContext context) => Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // This ensures clicking outside dismisses the sheet
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            // Your existing content
            _buildMainBottomSheet(),
          ],
        ),
      ),
    );

  Widget _buildMainBottomSheet() => Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        // Updated padding to match balance sheet
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // Updated border radius to match balance sheet
            borderRadius: BorderRadius.all(Radius.circular(32.r)),
          ),
          // Updated padding to match balance sheet
          padding: EdgeInsets.only(
            bottom: 22.h,
            top: 22.h,
            left: 26.w,
            right: 8.w,
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
                    // Updated font style to match balance sheet
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.only(right: 22.w),
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      PhosphorIconsBold.x,
                      color: AppColors.black,
                      // Updated icon size to match balance sheet
                      size: 22.sp,
                    ),
                  ),
                ],
              ),
              // Updated gap to match balance sheet
              Gap(16.h),
              Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: Column(
                  children: <Widget>[
                    _buildCollectionItem(
                      title: 'Safety Tokens 🤩',
                      count: 4,
                      index: 0, // Add an index for each collection
                      onTap: () {
                        setState(() {
                          if (_selectedCollections.contains(0)) {
                            _selectedCollections.remove(0);
                          } else {
                            _selectedCollections.add(0);
                          }
                        });
                      },
                    ),
                    _buildCollectionItem(
                      title: 'Avatar NFT',
                      count: 8,
                      index: 1,
                      onTap: () {
                        setState(() {
                          if (_selectedCollections.contains(1)) {
                            _selectedCollections.remove(1);
                          } else {
                            _selectedCollections.add(1);
                          }
                        });
                      },
                    ),
                    _buildCollectionItem(
                      title: 'Cute NFTs 🐣',
                      count: 8,
                      index: 2,
                      onTap: () {
                        setState(() {
                          if (_selectedCollections.contains(2)) {
                            _selectedCollections.remove(2);
                          } else {
                            _selectedCollections.add(2);
                          }
                        });
                      },
                    ),
                    Gap(10.h),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isCreatingCollection = true; // Navigate to create screen
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => const WatchListNewCollectionScreen()),
                            );
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
                                Gap(16.w), // Updated gap
                                Icon(PhosphorIconsFill.plusCircle, size: 28.sp),
                                Gap(12.w), // Updated gap
                                Text(
                                  'Create new collection', 
                                  // Updated font style
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyLight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(22.h), // Updated gap before button
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement add to watchlist logic, using _selectedCollections
                          if (_selectedCollections.isNotEmpty) {
                            widget.onAddToWatchlist(_selectedCollections);
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedCollections.isNotEmpty
                              ? AppColors.blue // Updated to match balance sheet
                              : AppColors.greyMedium,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(44.r), // Updated radius
                          ),
                          minimumSize: Size(double.infinity, 54.h),
                        ),
                        child: Text(
                          'Add to Watchlist',
                          // Updated font style
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
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
                  Text(
                    'Collection name', 
                    style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight),
                  ),
                  Gap(4.h),
                  Container(
                    height: 54.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 16.sp),
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
    required int index,
    required VoidCallback onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Padding(
          // Updated vertical padding to match balance sheet
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title, 
                    // Updated font style to match balance sheet
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '$count Tokens',
                    // Updated font style to match balance sheet
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Theme(
                data: Theme.of(context).copyWith(
                  
                  unselectedWidgetColor: AppColors.blue,
                  checkboxTheme: CheckboxThemeData(
                    fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return AppColors.blue; // Active color
                      }
                      return AppColors.white; // Inactive color
                    }),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
                child: Checkbox(
                  activeColor: AppColors.blue,
                  value: _selectedCollections.contains(index),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        _selectedCollections.add(index);
                      } else {
                        _selectedCollections.remove(index);
                      }
                    });
                  },
                ),
              ),
              Gap(12.w), // Added consistent gap at the end
            ],
          ),
        ),
      );
}