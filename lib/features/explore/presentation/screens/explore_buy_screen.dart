import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../config/theme/colors.dart';

class ExploreBuyScreen extends StatefulWidget {
  final Map<String, String> selectedItem;
  final List<Map<String, String>>? allSelectedItems;

  const ExploreBuyScreen({
    super.key,
    required this.selectedItem,
    this.allSelectedItems,
  });

  @override
  State<ExploreBuyScreen> createState() => _ExploreBuyScreenState();
}

class _ExploreBuyScreenState extends State<ExploreBuyScreen> {
  late PageController _pageController;
  late List<Map<String, String>> _items;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    
    // Initialize items list - use all selected items if provided, otherwise just the single item
    _items = widget.allSelectedItems ?? [widget.selectedItem];
    
    // Find the index of the selected item
    _currentPage = _items.indexWhere((item) => 
      item['name'] == widget.selectedItem['name'] && 
      item['imageUrl'] == widget.selectedItem['imageUrl']
    );
    
    // If for some reason the item isn't found, default to first item
    if (_currentPage < 0) _currentPage = 0;
    
    // Initialize page controller with the selected item's index
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 12.h,
        leading: IconButton(
          icon: Icon(
            PhosphorIconsBold.caretLeft,
            color: Colors.black,
            size: 22.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            Text(
              'Shopping Cart',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: Colors.white, width: 1.w),
                    image: DecorationImage(
                      image: NetworkImage(_items[_currentPage]['imageUrl']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(4.w),
                Text(
                  '${_items.length} ${_items.length == 1 ? 'item' : 'items'}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(20.w),
              ],
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Column(
            children: [
              Gap(8.h),
              Container(
                color: AppColors.greyVeryLight,
                height: 1.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _items.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final item = _items[index];
                
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Selected item display
                        Center(
                          child: Column(
                            children: [
                              // Only apply Hero animation to the first selected item
                              index == _items.indexWhere((i) => 
                                i['name'] == widget.selectedItem['name'] && 
                                i['imageUrl'] == widget.selectedItem['imageUrl']) 
                              ? Hero(
                                  tag: 'nft_image_${item['name']}',
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: CachedNetworkImage(
                                        imageUrl: item['imageUrl']!,
                                        width: 350.w,
                                        height: 350.w, // Square image
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) => Container(
                                          color: Colors.grey[300],
                                          child: Icon(
                                            Icons.error,
                                            color: Colors.grey[600],
                                            size: 40.sp,
                                          ),
                                        ),
                                        progressIndicatorBuilder: (context, url, progress) => Center(
                                          child: CircularProgressIndicator(
                                            value: progress.progress,
                                            strokeWidth: 2.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: CachedNetworkImage(
                                    imageUrl: item['imageUrl']!,
                                    width: 350.w,
                                    height: 350.w, // Square image
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) => Container(
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.error,
                                        color: Colors.grey[600],
                                        size: 40.sp,
                                      ),
                                    ),
                                    progressIndicatorBuilder: (context, url, progress) => Center(
                                      child: CircularProgressIndicator(
                                        value: progress.progress,
                                        strokeWidth: 2.w,
                                      ),
                                    ),
                                  ),
                                ),
                              Gap(16.h),
                              Text(
                                item['name'] ?? 'Selected NFT',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Gap(2.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Floor Price ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyLight,
                                    ),
                                  ),
                                  Text(
                                    item['price'] ?? '',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Gap(8.h),
                              Text(
                                item['usdValue'] ?? '',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Pagination indicator
          if (_items.length > 1)
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_items.length, (index) {
                  return Container(
                    width: 8.w,
                    height: 8.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index 
                          ? Colors.black 
                          : Colors.grey.withOpacity(0.3),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}