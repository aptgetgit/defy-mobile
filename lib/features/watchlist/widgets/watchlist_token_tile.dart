import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class WatchlistTokenTile extends StatefulWidget { // Add onDelete parameter
  
  const WatchlistTokenTile({
    required this.tokenData, // Make it required
    required this.deleteNft, 
    this.onDelete, // Optional callback
    super.key,
  });
  final Map<String, String> tokenData; // Add tokenData parameter
  final bool deleteNft;
  final VoidCallback? onDelete;

  @override
  State<WatchlistTokenTile> createState() => _WatchlistTokenTileState();
}

class _WatchlistTokenTileState extends State<WatchlistTokenTile> with SingleTickerProviderStateMixin {
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
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
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
        
        // Call the onDelete callback provided by parent
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
    
    // Extract values from tokenData with fallbacks
    final String name = widget.tokenData['name'] ?? 'Funky Monkey';
    final String imagePath = widget.tokenData['imagePath'] ?? 'assets/images/watchlist2.png';
    final String usdValue = widget.tokenData['usdValue'] ?? r'$123.39';
    final String nativeValue = widget.tokenData['nativeValue'] ?? '32 APT';
    final String displayValue = widget.tokenData['displayValue'] ?? '14K';

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
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                                    Text(
                                      displayValue,
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
                          SlideTransition(
                            position: _offsetAnimation,
                            child: Visibility(
                              visible: widget.deleteNft,
                              child: GestureDetector(
                                onTap: delete,
                                child: Icon(
                                  PhosphorIcons.minusCircle(PhosphorIconsStyle.bold),
                                  color: Colors.red,
                                  size: 20.sp,
                                ),
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
                                        colors: <Color>[AppColors.greyDark, AppColors.greyLight.withValues(alpha: 0.6)],
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
