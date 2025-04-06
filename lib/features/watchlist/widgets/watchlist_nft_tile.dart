import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class WatchlistNFTTile extends StatefulWidget {
  const WatchlistNFTTile({
    required this.nftData,
    required this.deleteNft,
    this.onDelete,
    super.key,
  });
  final Map<String, String> nftData;
  final bool deleteNft;
  final VoidCallback? onDelete;

  @override
  State<WatchlistNFTTile> createState() => _WatchlistNFTTileState();
}

class _WatchlistNFTTileState extends State<WatchlistNFTTile> with SingleTickerProviderStateMixin {
  bool clickDelete = false;
  bool isDeleted = false;
  bool _previousDeleteState = false;
  static bool _globalDeleteMode = false; // Track global delete mode state

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-0.2, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    
    // Initialize state
    _previousDeleteState = widget.deleteNft;
    
    // Track global delete mode - only trigger animations on initial toggle
    if (widget.deleteNft && !_globalDeleteMode) {
      _globalDeleteMode = true;
      // Only forward animation when we first enter delete mode
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(WatchlistNFTTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Important: Only handle animation when the MODE changes, not individual tile changes
    if (oldWidget.deleteNft != widget.deleteNft) {
      _previousDeleteState = oldWidget.deleteNft;
      
      // Update global state
      _globalDeleteMode = widget.deleteNft;
      
      if (widget.deleteNft) {
        // Entering delete mode - all tiles show delete icon without animation
        _controller.value = 1.0; // Skip animation, just set the end value
      } else {
        // Exiting delete mode - all tiles hide delete icon without animation
        _controller.value = 0.0; // Skip animation, just set the start value
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Modify delete function
  void delete() {
    // No animation trigger here, just handle state
    setState(() {
      clickDelete = !clickDelete;
    });

    // Reduced to 2 seconds for faster response
    Future.delayed(const Duration(seconds: 2), () {
      if (clickDelete && mounted) {
        setState(() {
          isDeleted = true;
        });

        // Call onDelete callback
        if (widget.onDelete != null) {
          widget.onDelete!();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                                    if (widget.deleteNft)
                                      Text(
                                        nativeValue.split(' ')[0],
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ).animate().slideX(duration: const Duration(milliseconds: 300), begin: 0.5, end: 0),
                                    if (!widget.deleteNft)
                                      Text(
                                        nativeValue.split(' ')[0],
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
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
                                    if (widget.deleteNft)
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
                                    if (!widget.deleteNft)
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
                          widget.deleteNft
                              ? GestureDetector(
                                  onTap: delete,
                                  child: Icon(
                                    PhosphorIconsFill.minusCircle,
                                    color: AppColors.red,
                                    size: 20.sp,
                                  ),
                                )
                              : SizedBox(width: 0),
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
                                      colors: <Color>[AppColors.greyDark, AppColors.greyLight.withOpacity(0.6)],
                                      stops: <double>[_controller.value, _controller.value],
                                    ).createShader(bounds),
                                    child: Text(
                                      'Removing from collection',
                                      style: TextStyle(
                                        color: AppColors.greyLight.withOpacity(0.6),
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