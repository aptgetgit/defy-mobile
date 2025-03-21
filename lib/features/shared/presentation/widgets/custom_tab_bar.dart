import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart';

class CustomTabBar extends StatelessWidget {

  const CustomTabBar({
    required this.tabController, required this.tabs, super.key,
    this.trailing,
    this.isScrollable = true,
  });
  final TabController tabController;
  final List<String> tabs;
  final Widget? trailing;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: TabBar(
            controller: tabController,
            isScrollable: isScrollable,
            indicatorColor: Colors.black,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.w),
              // insets: EdgeInsets.symmetric(horizontal: 10.w),
            ),
            tabAlignment: TabAlignment.start,
            labelColor: Colors.black,
            unselectedLabelColor: AppColors.greyLight,
            labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
            labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            indicatorWeight: 1.w,
            dividerHeight: 1.h,
            dividerColor: AppColors.greyVeryLight,
            // indicatorPadding: EdgeInsets.zero,
            // indicatorSize: TabBarIndicatorSize.label,
            splashFactory: NoSplash.splashFactory,

            tabs: tabs.map((String text) => Tab(text: text)).toList(),
          ),
        ),
        if (trailing != null) const Gap(8),
        if (trailing != null) trailing!,
      ],
    );
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate(this.tabBar);
  final Widget tabBar;

  @override
  double get minExtent => kToolbarHeight; // Minimum height for tab bar

  @override
  double get maxExtent => kToolbarHeight ; // Maximum height remains same

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Material(
    color: Colors.white,
    elevation: overlapsContent ? 4 : 0, // Add elevation when overlapping
    shadowColor: Colors.black.withValues(alpha: 0.1),
    child: Padding(
      padding: EdgeInsets.only(top: 10.h, left: 12.w, right: 12.w), // Add padding to top
      child: tabBar, // The entire row containing tabs + trailing widget
    ),
  );

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
