import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class TransactionView extends ConsumerStatefulWidget {
  final String heading;
  final String image;
  final String name;
  final String value;
  final Function? onTransactionComplete;
  const TransactionView({
    super.key,
    required this.heading,
    required this.image,
    required this.name,
    required this.value,
    required this.onTransactionComplete,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionViewState();
}

class _TransactionViewState extends ConsumerState<TransactionView> {
  bool _showLoading = true;
  bool _showTick = false;

  @override
  void initState() {
    super.initState();
    _startTimers();
  }

  void _startTimers() {
    // Show loading for 3 seconds
    Timer(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showLoading = false;
          _showTick = true;
        });
      }

      // Show tick for 3 seconds, then redirect
      Timer(Duration(seconds: 3), () {
        if (mounted) {
          widget.onTransactionComplete?.call();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.heading,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                if (widget.image.startsWith('http') ||
                    widget.image.startsWith('https') ||
                    widget.image.startsWith('www'))
                  CachedNetworkImage(
                    imageUrl: widget.image,
                    width: 40.w,
                    height: 40.h,
                  )
                else
                  Image.asset(
                    widget.image,
                    width: 40.w,
                    height: 40.h,
                  ),
                const SizedBox(height: 10),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.value,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Text(
                  _showLoading
                      ? 'Processing Transaction'
                      : '${widget.heading} Complete',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyDark,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                if (_showLoading)
                  Lottie.asset(
                    'assets/animations/transaction-loading.json',
                    width: 40.w,
                    height: 40.h,
                  )
                else if (_showTick)
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 40.w,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
