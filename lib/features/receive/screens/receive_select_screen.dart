// screens/receive_select_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


import '../../../config/theme/colors.dart';
import '../providers/receive_page_provider.dart';
import '../widgets/progress_bar.dart';

class ReceiveSelectScreen extends ConsumerStatefulWidget {
  const ReceiveSelectScreen({super.key});

  @override
  _ReceiveSelectScreenState createState() => _ReceiveSelectScreenState();
}

class _ReceiveSelectScreenState extends ConsumerState<ReceiveSelectScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _showSearchIcon = false;

  // Add animation controller for smoother transitions
  late AnimationController _animationController;
  late Animation<double> _searchBarAnimation;

  // Threshold for scroll detection
  static const double _scrollThreshold = 80.0;

  @override
  void initState() {
    super.initState();

    // Setup animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _searchBarAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut, // Smooth in-and-out curve
    );

    _scrollController.addListener(_onScroll);

    // Reset the page to 1 when this screen is shown
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(receiveProvider.notifier).setPage(1);
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _animationController.dispose();
    super.dispose();
  }

  // Enhanced scroll handler with smoother animation
  void _onScroll() {
    // Calculate animation progress based on scroll position
    final double scrollPercentage =
        (_scrollController.offset / _scrollThreshold).clamp(0.0, 1.0);

    // Update animation controller to match scroll
    _animationController.value = scrollPercentage;

    // Update visibility flag for header icon
    if (scrollPercentage >= 0.5 && !_showSearchIcon) {
      setState(() {
        _showSearchIcon = true;
      });
    } else if (scrollPercentage < 0.5 && _showSearchIcon) {
      setState(() {
        _showSearchIcon = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(PhosphorIconsBold.caretLeft, size: 24.sp),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(right: 42.w),
            child: const ProgressBar(currentPage: 1),
          ),
          actions: [
            // Header search icon that appears when scrolled
            AnimatedBuilder(
              animation: _searchBarAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _searchBarAnimation.value,
                  child: IconButton(
                    icon: Icon(
                      PhosphorIconsBold.magnifyingGlass,
                      size: 24.sp,
                      color: Color.lerp(
                        AppColors.greyLight,
                        Colors.black,
                        _searchBarAnimation.value,
                      ),
                    ),
                    onPressed: () {
                      // Scroll back to top to show search bar
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(width: 8.w),
          ],
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // Fixed header - doesn't scroll
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   
                    Text(
                      'Select Asset',
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
                    ),
                    Gap(8.h),
                    Text(
                      'Request tokens',
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                    Gap(16.h),
                  ],
                ),
              ),
            ),

            // Search bar that scrolls with the list
            SliverToBoxAdapter(
              child: AnimatedBuilder(
                animation: _scrollController,
                builder: (context, child) {
                  // Calculate scroll progress
                  final double scrollOffset = _scrollController.hasClients ? _scrollController.offset : 0.0;
                  final double scrollProgress = (scrollOffset / _scrollThreshold).clamp(0.0, 1.0);

                  return Opacity(
                    opacity: 1.0 - scrollProgress, // Fade out as we scroll
                    child: Transform.translate(
                      offset: Offset(0, -10 * scrollProgress), // Move up slightly
                      child: Transform.scale(
                        scale: 1.0 - (0.1 * scrollProgress), // Shrink slightly
                        child: Container(
                          height: 56.h - (16.h * scrollProgress), // Explicit height reduction
                          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: AppColors.greyVeryLight,
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Search Assets',
                                  style: TextStyle(
                                    color: AppColors.greyLight,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 24.w,
                                child: Icon(
                                  PhosphorIconsBold.magnifyingGlass,
                                  color: AppColors.greyLight,
                                  size: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Asset list that scrolls with the search bar
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final Map<String, String> assetData = _assets[index];
                  final Asset asset = Asset(
                    name: assetData['name']!,
                    symbol: assetData['symbol']!,
                    imagePath: assetData['imagePath']!,
                  );
                  return AssetItem(
                    name: asset.name,
                    symbol: asset.symbol,
                    imagePath: asset.imagePath,
                    onTap: () {
                      // Select the asset and navigate to the next screen
                      ref.read(receiveProvider.notifier).selectAsset(asset);
                      ref.read(receiveProvider.notifier).setPage(2);
                    },
                  );
                },
                childCount: _assets.length,
              ),
            ),

            // Bottom padding
            SliverToBoxAdapter(
              child: SizedBox(height: 16.h),
            ),
          ],
        ),
      );

  final List<Map<String, String>> _assets = <Map<String, String>>[
    <String, String>{
      'name': 'Aptos',
      'symbol': 'APT',
      'imagePath': 'assets/icons/aptos.png'
    },
    <String, String>{
      'name': 'Gui inu',
      'symbol': 'GUI',
      'imagePath': 'assets/icons/gui-inu.png'
    },
    <String, String>{
      'name': 'Bluemove',
      'symbol': 'MOVE',
      'imagePath': 'assets/icons/bluemove.png'
    },
    <String, String>{
      'name': 'Pancake',
      'symbol': 'CAKE',
      'imagePath': 'assets/icons/pancake.png'
    },
    <String, String>{
      'name': 'Thala',
      'symbol': 'THL',
      'imagePath': 'assets/icons/thala.png'
    },
    <String, String>{
      'name': 'Thala',
      'symbol': 'THL',
      'imagePath': 'assets/icons/thala.png'
    },
    <String, String>{
      'name': 'Bluemove',
      'symbol': 'MOVE',
      'imagePath': 'assets/icons/bluemove.png'
    },
    <String, String>{
      'name': 'Thala',
      'symbol': 'THL',
      'imagePath': 'assets/icons/thala.png'
    },
    <String, String>{
      'name': 'Bluemove',
      'symbol': 'MOVE',
      'imagePath': 'assets/icons/bluemove.png'
    },
  ];
}

// Widget for Each Asset Item
class AssetItem extends StatelessWidget {
  const AssetItem({
    super.key,
    required this.name,
    required this.symbol,
    required this.imagePath,
    this.onTap,
  });

  final String name;
  final String symbol;
  final String imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(imagePath),
            radius: 22.r,
          ),
          title: Text(
            name,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            symbol,
            style: TextStyle(
                fontSize: 14.sp, color: const Color.fromARGB(255, 151, 157, 170)),
          ),
        ),
      );
}

// Updated _SearchBarHeaderDelegate with shrinking height and width
class _SearchBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Animation<double> animation;
  final double minHeight;
  final double maxHeight;

  _SearchBarHeaderDelegate({
    required this.animation,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Direct calculation based on scroll position (0-1 range)
    final double scrollProgress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    
    // Use AnimatedContainer for smoother transitions
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: maxExtent,
      child: Stack(
        children: [
          // Search bar with direct animation tied to scroll
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Opacity(
                opacity: 1.0 - scrollProgress,
                child: Transform.translate(
                  offset: Offset(0, -10 * scrollProgress), // Move up slightly
                  child: Transform.scale(
                    scale: 1.0 - (0.1 * scrollProgress), // Shrink slightly
                    child: Container(
                      height: 56.h - (16.h * scrollProgress), // Explicit height reduction
                      decoration: BoxDecoration(
                        color: AppColors.greyVeryLight,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Search text
                          Center(
                            child: Text(
                              'Search Assets',
                              style: TextStyle(
                                color: AppColors.greyLight,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          // Magnifying glass icon
                          Positioned(
                            left: 24.w,
                            child: Icon(
                              PhosphorIconsBold.magnifyingGlass,
                              color: AppColors.greyLight,
                              size: 18.sp,
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
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SearchBarHeaderDelegate oldDelegate) =>
      animation != oldDelegate.animation ||
      minHeight != oldDelegate.minHeight ||
      maxHeight != oldDelegate.maxHeight;
}

