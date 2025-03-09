import 'package:flutter/material.dart';
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
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 2),
            ),
            tabAlignment: TabAlignment.start,
            labelColor: Colors.black,
            unselectedLabelColor: AppColors.greyLight,
            labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            labelPadding: const EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.zero,
            indicatorWeight: 1,
            dividerHeight: 1,
            dividerColor: AppColors.greyVeryLight,
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
  double get minExtent => kToolbarHeight - 10; // Minimum height for tab bar

  @override
  double get maxExtent => kToolbarHeight - 10; // Maximum height remains same

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Material(
    color: Colors.white,
    elevation: overlapsContent ? 4 : 0, // Add elevation when overlapping
    shadowColor: Colors.black.withValues(alpha: 0.1),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: tabBar, // The entire row containing tabs + trailing widget
    ),
  );

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}