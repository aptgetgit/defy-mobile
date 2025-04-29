import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../config/theme/colors.dart';

class CartItemTile extends StatefulWidget {
  final Map<String, String> itemData;
  final bool deleteMode;
  final bool isSelected;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const CartItemTile({
    Key? key,
    required this.itemData,
    required this.deleteMode,
    this.isSelected = false,
    required this.onDelete,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  static bool _globalDeleteMode = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Initialize state based on delete mode
    _globalDeleteMode = widget.deleteMode;
    
    // If we're starting in delete mode, initialize the animation accordingly
    if (widget.deleteMode) {
      _controller.value = 1.0;
    }
    
    // If item is already selected, set the animation value
    if (widget.isSelected) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(CartItemTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Handle animation when the MODE changes
    if (oldWidget.deleteMode != widget.deleteMode) {
      _globalDeleteMode = widget.deleteMode;
      
      if (widget.deleteMode) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
    
    // Handle animation when item selection changes
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        margin: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 16.w, right: 6.w),
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide.none,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
          child: Row(
            children: <Widget>[
              // NFT Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 44.w,
                  height: 44.h,
                  imageUrl: widget.itemData['imageUrl']!,
                  errorWidget: (BuildContext ctx, String str, Object obj) =>
                      Container(color: Colors.amber),
                  progressIndicatorBuilder: (BuildContext ctx, String str, DownloadProgress download) =>
                      CircularProgressIndicator(strokeWidth: 2.w),
                ),
              ),
              
              Gap(16.w),
              
              // NFT Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.itemData['name']!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Floor Price',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Increase the gap between NFT details and price info
              const Spacer(),
              
              // Price info
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: widget.isSelected || widget.deleteMode ? 85.w : 100.w,
                transform: Matrix4.translationValues(
                  widget.isSelected || widget.deleteMode ? -12.w : 0, 
                  0, 
                  0
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.itemData['usdValue']!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Gap(4.h),
                    Text(
                      widget.itemData['price']!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ],
                ),
              ),
              
              Gap(16.w),
              
              // Selection/delete icon with slide animation
              if (widget.deleteMode)
                SlideTransition(
                  position: _offsetAnimation,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(
                      minWidth: 24.w,
                      minHeight: 24.h,
                    ),
                    onPressed: widget.onDelete,
                    icon: Icon(
                      PhosphorIconsFill.trash,
                      color: AppColors.red,
                      size: 22.sp,
                    ),
                  ),
                )
              else
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: _controller,
                    curve: Curves.easeOutQuad,
                  )),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: widget.isSelected ? 1.0 : 0.0,
                    child: widget.isSelected
                      ? Icon(
                          PhosphorIconsFill.checkCircle,
                          color: AppColors.blue,
                          size: 22.sp,
                        )
                      : Icon(
                          PhosphorIconsFill.checkCircle,
                          color: AppColors.blue.withOpacity(0),
                          size: 22.sp,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}