import 'package:flutter/material.dart';
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
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.4, 0),
      end: const Offset(-0.2, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    
    // If selection mode is already active, show animation immediately
    if (widget.showSelection) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(TokenItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Animate when showSelection changes
    if (oldWidget.showSelection != widget.showSelection) {
      if (widget.showSelection) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(left: 8.w, bottom: 2.h),
    child: GestureDetector(
      onTap: widget.onTap,
      child: ListTile(
        title: Text(
          widget.token.name, 
          style: TextStyle(
            fontSize: 18.sp, 
            fontWeight: FontWeight.w500,
            color: widget.isSelected && widget.isHiding ? Colors.grey : Colors.black,
          ),
        ),
        subtitle: Text(
          '${widget.token.amount} ${widget.token.currency}', 
          style: TextStyle(
            fontSize: 14.sp, 
            fontWeight: FontWeight.w500,
            color: widget.isSelected && widget.isHiding ? Colors.grey : AppColors.greyLight,
          ),
        ),
        leading: Stack(
          children: <Widget>[
            Opacity(
              opacity: widget.isSelected && widget.isHiding ? 0.5 : 1,
              child: ClipOval(
                child: Image.asset(widget.token.imagePath, width: 44.w, height: 44.h),
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
        trailing: widget.showSelection
            ? _buildSelectionTrailing()
            : _buildNormalTrailing(),
      ),
    ),
  );

  Widget _buildSelectionTrailing() => Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      // Slide animation for the text column
      SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
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
              ),
              Text(
                '${widget.token.percentageChange}%',
                style: TextStyle(
                  color: widget.token.percentageChange >= 0 ? Colors.green : Colors.red,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      // Animated gap that changes with the animation progress
      SizeTransition(
        sizeFactor: _animationController,
        axis: Axis.horizontal,
        child: Gap(16.w),
      ),
      // Fade in for checkbox
      FadeTransition(
        opacity: _fadeAnimation,
        child: CustomCheckbox(
          isChecked: widget.isSelected,
          isRound: true,
          onTap: widget.onCheckboxTap,
        ),
      ),
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