import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class WatchlistNFTTile extends StatefulWidget { // Add this parameter
  
  const WatchlistNFTTile({
    required this.nftData, // Make it required
    required this.deleteNft, 
    this.onDelete,  // Make it optional
    super.key
  });
  final Map<String, String> nftData; // Add this parameter
  final bool deleteNft;
  final VoidCallback? onDelete;

  @override
  State<WatchlistNFTTile> createState() => _WatchlistNFTTileState();
}

class _WatchlistNFTTileState extends State<WatchlistNFTTile> with SingleTickerProviderStateMixin {
  bool clickDelete = false;
  bool isDeleted = false;

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-0.2, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ),);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void delete() {
    _controller.forward(from: 0);

    setState(() {
      clickDelete = !clickDelete;
    });

    Future.delayed(const Duration(seconds: 6), () {
      if (clickDelete) {
        setState(() {
          isDeleted = true;
        });
        
        // Call the onDelete callback if provided
        if (widget.onDelete != null) {
          widget.onDelete!();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.deleteNft) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    // Get values from nftData map with fallbacks
    final String name = widget.nftData['name'] ?? 'Funky Monkey';
    final String imagePath = widget.nftData['imagePath'] ?? 'assets/images/onboarding-nft-6.png';
    final String usdValue = widget.nftData['usdValue'] ?? r'$123.39';
    final String nativeValue = widget.nftData['nativeValue'] ?? '32 APT';

    return Column(
      children: <Widget>[
        Visibility(
          visible: !isDeleted,
          child: SizedBox(
            width: 1.sw,
            height: 70.h,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  right: clickDelete ? 1.sw : 0,
                  top: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 55.h,
                    width: 1.sw,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 10.w),
                      child: Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image(
                                height: 55.h,
                                width: 55.w,
                                fit: BoxFit.cover,
                                image: AssetImage(imagePath),
                              ),
                            ],
                          ),
                          Gap(12.w),
                          Expanded(
                           
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                        text: name,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    if(widget.deleteNft)
                                      Text(
                                        nativeValue.split(' ')[0], // First part of native value (e.g., "32" from "32 APT")
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ).animate().slideX(duration: const Duration(milliseconds: 300), begin: 0.5, end: 0),
                                    if(!widget.deleteNft)
                                      Text(
                                        nativeValue.split(' ')[0],
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                  ],
                                ),
                                Gap(4.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                        text: usdValue,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    if(widget.deleteNft)
                                      Text.rich(
                                        TextSpan(
                                          text: nativeValue,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ).animate().slideX(duration: const Duration(milliseconds: 300), begin: 0.3, end: 0),
                                    if(!widget.deleteNft)
                                      Text.rich(
                                        TextSpan(
                                          text: nativeValue,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Gap(12.w),
                          Visibility(
                            visible: widget.deleteNft,
                            child: GestureDetector(
                              onTap: delete,
                              child: Icon(
                                PhosphorIconsFill.minusCircle,
                                color: AppColors.red,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: clickDelete ? 0 : 1.sw,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 6),
                    height: clickDelete ? 45.h : 65.h,
                    width: 1.sw,
                    child: Container(
                      color: Colors.grey[200],
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Visibility(
                                visible: clickDelete,
                                child: AnimatedBuilder(
                                  animation: _controller,
                                  builder: (BuildContext context, Widget? child) => ShaderMask(
                                      shaderCallback: (Rect bounds) => LinearGradient(
                                        // colors: <Color>[Colors.grey, Colors.grey.withOpacity(0.6)],
                                           colors: <Color>[AppColors.greyDark, AppColors.greyLight.withValues(alpha: 0.6),],
                                        stops: <double>[_controller.value, _controller.value],
                                      ).createShader(bounds),
                                      child: Text(
                                        'Removing from collection',
                                        style: TextStyle(
                                          color: AppColors.greyLight.withValues(alpha: 0.6),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                ),
                              ),
                              GestureDetector(
                                onTap: delete,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    border: Border.all(),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                                    child: Text(
                                      'undo',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}