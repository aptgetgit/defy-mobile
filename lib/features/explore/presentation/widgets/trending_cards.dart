import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TrendingCards extends StatefulWidget {

  const TrendingCards({required this.isToggled, super.key});
  final bool isToggled;

  @override
  State<TrendingCards> createState() => _TrendingCardsState();
}

class _TrendingCardsState extends State<TrendingCards> {
  final ScrollController _scrollController = ScrollController();
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_scrollController.hasClients) {
        final double maxScroll = _scrollController.position.maxScrollExtent;
        final double newOffset = _scrollController.offset + 338.w;

        if (newOffset >= maxScroll) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            newOffset,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTrending(int direction) {
    final double offset = _scrollController.offset + (direction * 338.w);
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) => Container(
        width: 361.w,
        height: 168.h,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  widget.isToggled ? 'Launching' : 'Trending',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                _buildScrollButton(
                  icon: PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
                  onTap: () => _scrollTrending(-1),
                ),
                SizedBox(width: 8.w),
                _buildScrollButton(
                  icon: PhosphorIcons.caretRight(PhosphorIconsStyle.bold),
                  onTap: () => _scrollTrending(1),
                ),
              ],
            ),
            Gap(12.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Row(
                children: <Widget>[
                  _buildTrendingCard(
                    emoji: '😎',
                    title: 'Coolers',
                    subtitle: 'Hot Emoji 🔥',
                    percentage: '+2.5%',
                    percentageColor: Colors.green,
                  ),
                  Gap(12.w),
                  _buildTrendingCard(
                    emoji: '🌍',
                    title: 'Earth',
                    subtitle: 'Hot Emoji 🔥',
                    percentage: '-3.1%',
                    percentageColor: Colors.red,
                  ),
                  Gap(12.w),
                  _buildTrendingCard(
                    emoji: '🚀',
                    title: 'Space',
                    subtitle: 'Trending Now',
                    percentage: '+4.7%',
                    percentageColor: Colors.green,
                  ),
                  Gap(12.w),
                  _buildTrendingCard(
                    emoji: '🎮',
                    title: 'Gaming',
                    subtitle: 'Popular Choice',
                    percentage: '-1.8%',
                    percentageColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildScrollButton({required IconData icon, required VoidCallback onTap}) => GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 32.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFE0E0E0),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 18.sp,
            color: Colors.black54,
          ),
        ),
      ),
    );

  Widget _buildTrendingCard({
    required String emoji,
    required String title,
    required String subtitle,
    required String percentage,
    required Color percentageColor,
  }) =>
      Container(
        width: 163.w,
        height: 103.h,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      emoji,
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                ),
                Gap(8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(10.h),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        percentageColor == Colors.green
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: percentageColor,
                        size: 20.sp,
                      ),
                      Text(
                        percentage,
                        style: TextStyle(
                          color: percentageColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 2.w),
                    ),
                    child: Icon(
                      Icons.arrow_outward,
                      size: 16.sp,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
