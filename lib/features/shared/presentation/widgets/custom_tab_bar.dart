import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    required this.tabController, 
    required this.tabs, 
    super.key,
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
        child: Stack(
          clipBehavior: Clip.none, // Allow content to overflow
          children: [
            // Grey bottom line that spans the entire width
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 1.h,
                color: AppColors.greyVeryLight,
              ),
            ),
            // Custom TabBar with modified indicator
            TabBar(
              controller: tabController,
              isScrollable: isScrollable,
              // Use custom indicator painter that will completely cover the grey line
              indicator: _CustomIndicator(
                color: Colors.black,
                height: 2.h, // Make this slightly thicker than the grey line
                insets: EdgeInsets.zero,
              ),
              tabAlignment: TabAlignment.start,
              labelColor: Colors.black,
              unselectedLabelColor: AppColors.greyLight,
              labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
              labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              dividerHeight: 0, // No built-in divider
              dividerColor: Colors.transparent,
              indicatorWeight: 0, // No default indicator
              splashFactory: NoSplash.splashFactory,
              tabs: tabs.map((String text) => Tab(text: text)).toList(),
            ),
          ],
        ),
      ),
      if (trailing != null) const Gap(8),
      if (trailing != null) trailing!,
    ],
  );
}

// Custom indicator that draws directly on top of the grey line
class _CustomIndicator extends Decoration {
  const _CustomIndicator({
    required this.color,
    required this.height,
    required this.insets,
  });

  final Color color;
  final double height;
  final EdgeInsetsGeometry insets;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomIndicatorPainter(
      color: color,
      height: height,
      insets: insets,
    );
  }
}

class _CustomIndicatorPainter extends BoxPainter {
  _CustomIndicatorPainter({
    required this.color,
    required this.height,
    required this.insets,
  });

  final Color color;
  final double height;
  final EdgeInsetsGeometry insets;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    
    final Rect rect = offset & configuration.size!;
    
    // Since ImageConfiguration doesn't have direction, use a default TextDirection
    // or pass it as a parameter if needed
    final EdgeInsets resolvedInsets = insets.resolve(TextDirection.ltr);
    
    // Calculate indicator position to exactly cover the grey line
    final double indicatorY = rect.bottom - height;
    
    final Rect indicator = Rect.fromLTWH(
      rect.left + resolvedInsets.left,
      indicatorY,
      rect.width - resolvedInsets.horizontal,
      height,
    );
    
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    
    canvas.drawRect(indicator, paint);
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate(this.tabBar);
  final Widget tabBar;

  @override
  double get minExtent => kToolbarHeight;

  @override
  double get maxExtent => kToolbarHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Material(
    color: Colors.white,
    elevation: overlapsContent ? 4 : 0,
    shadowColor: Colors.black.withOpacity(0.1),
    child: Padding(
      padding: EdgeInsets.only(top: 10.h, left: 12.w, right: 12.w),
      child: tabBar,
    ),
  );

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
