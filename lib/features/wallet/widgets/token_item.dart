import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_check_box.dart';
import '../data/models/token_model.dart';

class TokenItem extends StatefulWidget {
  const TokenItem({
    super.key,
    required this.token,
    required this.isSelected,
    required this.isInWatchlist,
    required this.showSelection,
    required this.onCheckboxTap,
    this.onTap,
    this.isHiding = false,
  });
  final Token token;
  final bool isSelected;
  final bool isInWatchlist;
  final bool showSelection;
  final VoidCallback onCheckboxTap;
  final VoidCallback? onTap;
  final bool isHiding;
  
  @override
  State<TokenItem> createState() => _TokenItemState();
}

class _TokenItemState extends State<TokenItem> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;
  bool _shouldAnimateOut = false;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    
    _heightAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(TokenItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // CRITICAL CHANGE: Check if we're exiting selection mode AND this token was selected and marked for hiding
    // Use oldWidget values as they tell us the state BEFORE the change
    if (oldWidget.showSelection && !widget.showSelection && oldWidget.isSelected && oldWidget.isHiding) {
      print('${widget.token.name}: Exiting selection mode with token selected and hiding=true, will animate out');
      _triggerHideAnimation();
    }
    
    // When entering selection mode, reset any animations
    if (!oldWidget.showSelection && widget.showSelection) {
      print('${widget.token.name}: Entering selection mode, resetting animation');
      _resetAnimation();
    }
  }

  void _triggerHideAnimation() {
    if (_shouldAnimateOut) {
      return;
    }
    
    setState(() {
      _shouldAnimateOut = true;
    });
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _animationController.forward().then((_) {
          if (mounted) {
            setState(() {});
          }
        });
      }
    });
  }

  void _resetAnimation() {
    if (!_shouldAnimateOut) {
      return;
    }
    
    setState(() {
      _shouldAnimateOut = false;
    });
    _animationController.reset();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_shouldAnimateOut && _animationController.isCompleted) {
      return const SizedBox.shrink();
    }
    
    return SizeTransition(
      sizeFactor: _shouldAnimateOut ? _heightAnimation : const AlwaysStoppedAnimation(1.0),
      axisAlignment: -1.0,
      child: _buildContent(),
    );
  }

  // Rest of the class remains the same...
  Widget _buildContent() =>
    // Existing implementation
    GestureDetector(
      onTap: () {
        widget.onTap?.call();
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.h),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Opacity(
                        opacity: widget.isSelected && widget.isHiding ? 0.5 : 1,
                        child: ClipOval(
                          child: Hero(
                            tag: 'token_image_${widget.token.imagePath}',
                            child: Image.asset(widget.token.imagePath, width: 44.w, height: 44.h),
                          ),
                        ),
                      ),
                      if (widget.isInWatchlist && widget.showSelection)
                        Positioned(
                          top: -4.h,
                          left: -4.w,
                          child: Image.asset('assets/icons/watchlist-logo2.png', width: 21.w, height: 21.h),
                        ),
                    ],
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.token.name,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: widget.isSelected && widget.isHiding ? Colors.grey : Colors.black,
                        ),
                      ),
                      Text(
                        '${widget.token.amount} ${widget.token.currency}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: widget.isSelected && widget.isHiding ? Colors.grey : AppColors.greyLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              if (widget.showSelection) _buildSelectionTrailing() else _buildNormalTrailing(),
            ],
          ),
        ),
      ),
    );

  Widget _buildSelectionTrailing() => Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            '\$${widget.token.balance}',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: widget.isSelected && widget.isHiding ? Colors.grey : Colors.black,
            ),
          ).animate().slideX(
            duration: const Duration(milliseconds: 300),
            begin: 0.3,
            end: 0,
            curve: Curves.easeOut,
          ),
          Text(
            '${widget.token.percentageChange}%',
            style: TextStyle(
              color: widget.token.percentageChange >= 0 ? Colors.green : Colors.red,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ).animate().slideX(
            duration: const Duration(milliseconds: 300),
            begin: 0.3,
            end: 0,
            curve: Curves.easeOut,
          ),
        ],
      ),
      Gap(16.w),
      CustomCheckbox(
        isChecked: widget.isSelected,
        isRound: true,
        onTap: widget.onCheckboxTap,
      ).animate()
        .fadeIn(duration: const Duration(milliseconds: 400), curve: Curves.easeOut)
    ],
  );

  Widget _buildNormalTrailing() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      Text(
        '\$${widget.token.balance}',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        '${widget.token.percentageChange}%',
        style: TextStyle(
          color: widget.token.percentageChange >= 0 ? Colors.green : Colors.red,
          fontSize: 14.sp,
        ),
      ),
    ],
  );
}