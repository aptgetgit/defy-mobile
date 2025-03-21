import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../app/routes/router.dart';

class DashboardFloatingActionButton extends StatefulWidget {
  const DashboardFloatingActionButton({
    super.key,
    required this.show,
  });
  final bool show;

  @override
  State<DashboardFloatingActionButton> createState() =>
      _DashboardFloatingActionButtonState();
}

class _DashboardFloatingActionButtonState
    extends State<DashboardFloatingActionButton>
    with SingleTickerProviderStateMixin {
  bool dialogOpen = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Align(
        child: GestureDetector(
          onTap: () async {
            await _controller.forward();
            setState(() {
              dialogOpen = true;
            });
            await showDialog(
              context: context,
              useSafeArea: false,
              builder: (BuildContext dialogContext) => DashboardActionButtonDialog(
                parentContext: context, // Pass the parent context that has GoRouter
              ),
            );
            await _controller.reverse();
            setState(() {
              dialogOpen = false;
            });
          },
          child: CircleAvatar(
            backgroundColor: AppColors.blue,
            radius: (50 / 2).r,
            child: AnimatedRotation(
              turns: dialogOpen ? 0.5 : 0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              child: Icon(
                size: 26.sp,
                PhosphorIcons.caretDoubleUp(PhosphorIconsStyle.bold),
                color: AppColors.white,
              ),
            ),
          ),
        ),
      );
}

class DashboardActionButtonDialog extends StatefulWidget {
  const DashboardActionButtonDialog({
    super.key,
    required this.parentContext, 
  });
  final BuildContext parentContext; 

  @override
  State<DashboardActionButtonDialog> createState() =>
      _DashboardActionButtonDialogState();
}

class _DashboardActionButtonDialogState
    extends State<DashboardActionButtonDialog>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _exitAnimation;
  bool _isExiting = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    
    // New animation for exiting buttons
    _exitAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    
    _controller.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _exitWithAnimation(Function() navigationCallback) {
    setState(() {
      _isExiting = true;
    });
    
    _controller
      ..duration = const Duration(milliseconds: 400)
      ..reset()
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed || 
            (_controller.value > 0.9 && status == AnimationStatus.forward)) {
          _controller.removeStatusListener((AnimationStatus status) {});
          
          // Pop the dialog first
          Navigator.of(context).pop();
          
          // Then execute the navigation
          navigationCallback();
        }
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (BuildContext context, Widget? child) => Opacity(
          opacity: _isExiting ? 1 - _exitAnimation.value : _fadeAnimation.value,
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                alignment: Alignment.bottomLeft,
                constraints: const BoxConstraints.tightFor(),
                padding: EdgeInsets.all(20.w),
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                      Colors.white,
                      Color.fromARGB(182, 255, 255, 255),
                    ],
                    stops: <double>[0.1, 0.9],
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    physics: const PageScrollPhysics(),
                    controller: _scrollController,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.87,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AnimatedBuilder(
                                  animation: _exitAnimation,
                                  builder: (BuildContext context, Widget? child) {
                                    final double offset = _isExiting 
                                        ? -MediaQuery.of(context).size.height * _exitAnimation.value 
                                        : 0.0;
                                    return Transform.translate(
                                      offset: Offset(0, offset),
                                      child: _IconButton(
                                        onTap: () {
                                          _exitWithAnimation(() {
                                            // Your buy navigation logic here
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        backgroundColor: AppColors.green,
                                        label: 'Buy',
                                        child: Icon(PhosphorIcons.plus(), size: 24.sp),
                                      ),
                                    );
                                  },
                                ),
                                AnimatedBuilder(
                                  animation: _exitAnimation,
                                  builder: (BuildContext context, Widget? child) {
                                    final double offset = _isExiting 
                                        ? -MediaQuery.of(context).size.height * _exitAnimation.value * 1.05
                                        : 0.0;
                                    return Transform.translate(
                                      offset: Offset(0, offset),
                                      child: _IconButton(
                                        onTap: () {
                                          _exitWithAnimation(() {
                                            // Your send navigation logic here
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        backgroundColor: AppColors.blue,
                                        label: 'Send',
                                        child: Icon(PhosphorIconsFill.paperPlaneTilt, size: 24.sp),
                                      ),
                                    );
                                  },
                                ),
                                AnimatedBuilder(
                                  animation: _exitAnimation,
                                  builder: (BuildContext context, Widget? child) {
                                    final double offset = _isExiting 
                                        ? -MediaQuery.of(context).size.height * _exitAnimation.value * 1.1
                                        : 0.0;
                                    return Transform.translate(
                                      offset: Offset(0, offset),
                                      child: _IconButton(
                                        onTap: () {
                                          _exitWithAnimation(() async {
                                            await const ReceiveScreenRoute().push(widget.parentContext);
                                          });
                                        },
                                        backgroundColor: const Color.fromARGB(255, 249, 34, 112),
                                        label: 'Receive',
                                        child: Icon(PhosphorIcons.arrowDown(), size: 24.sp),
                                      ),
                                    );
                                  },
                                ),
                                AnimatedBuilder(
                                  animation: _exitAnimation,
                                  builder: (BuildContext context, Widget? child) {
                                    final double offset = _isExiting 
                                        ? -MediaQuery.of(context).size.height * _exitAnimation.value * 1.15
                                        : 0.0;
                                    return Transform.translate(
                                      offset: Offset(0, offset),
                                      child: _IconButton(
                                        onTap: () {
                                          _exitWithAnimation(() async {
                                            await const SwapRoute().push(widget.parentContext);
                                          });
                                        },
                                        backgroundColor: AppColors.yellow,
                                        label: 'Swap',
                                        child: Icon(PhosphorIcons.arrowsCounterClockwise(), size: 24.sp),
                                      ),
                                    );
                                  },
                                ),
                                AnimatedBuilder(
                                  animation: _exitAnimation,
                                  builder: (BuildContext context, Widget? child) {
                                    final double offset = _isExiting 
                                        ? -MediaQuery.of(context).size.height * _exitAnimation.value * 1.2
                                        : 0.0;
                                    return Transform.translate(
                                      offset: Offset(0, offset),
                                      child: _IconButton(
                                        onTap: () {
                                          _exitWithAnimation(() async {
                                            await const WalletMoreScreenRoute().push(widget.parentContext);
                                          });
                                        },
                                        backgroundColor: AppColors.red,
                                        label: 'More',
                                        child: Icon(PhosphorIcons.caretDown(), size: 24.sp),
                                      ),
                                    );
                                  },
                                ),
                              ],
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
        ),
      );
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    this.label,
    this.onTap,
    required this.backgroundColor,
    required this.child,
  });
  final String? label;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: backgroundColor,
                  child: child,
                ),
                if (label != null) Gap(5.w),
                if (label != null) Gap(10.w),
                Text(
                  label!,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Gap(20.h),
        ],
      );
}