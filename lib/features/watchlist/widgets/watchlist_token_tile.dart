import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class WatchlistTokenTile extends StatefulWidget {
  const WatchlistTokenTile({
    required this.tokenData,
    required this.deleteNft, 
    this.onDelete,
    super.key,
  });
  final Map<String, String> tokenData;
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
      curve: const Interval(0.3, 1, curve: Curves.easeOut),
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
                                    if(widget.deleteNft)
                                      Text(
                                        displayValue,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ).animate().slideX(duration: const Duration(milliseconds: 300), begin: 0.5, end: 0),
                                    if(!widget.deleteNft)
                                      Text(
                                        displayValue,
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
                          AnimatedBuilder(
                            animation: _controller,
                            builder: (BuildContext context, Widget? child) {
                              final bool isFadingOut = !widget.deleteNft && _controller.value > 0;
                              
                              return Opacity(
                                opacity: isFadingOut 
                                    ? _controller.value
                                    : _opacityAnimation.value,
                                child: Visibility(
                                  visible: widget.deleteNft || isFadingOut,
                                  child: TweenAnimationBuilder<double>(
                                    duration: const Duration(milliseconds: 500),
                                    tween: Tween<double>(
                                      begin: 0.8,
                                      end: 1,
                                    ),
                                    curve: Curves.elasticOut,
                                    builder: (BuildContext context, double value, Widget? child) => Transform.scale(
                                      scale: value,
                                      child: child,
                                    ),
                                    child: GestureDetector(
                                      onTap: delete,
                                      child: Icon(
                                        PhosphorIconsFill.minusCircle,
                                        color: AppColors.red,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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