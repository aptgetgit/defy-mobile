// screens/receive_select_content.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../providers/receive_page_provider.dart';
import '../providers/scroll_provider.dart';


class ReceiveSelectContent extends ConsumerStatefulWidget {

  const ReceiveSelectContent({required this.onAssetSelected, super.key});
  final VoidCallback onAssetSelected;

  @override
  _ReceiveSelectContentState createState() => _ReceiveSelectContentState();
}

class _ReceiveSelectContentState extends ConsumerState<ReceiveSelectContent> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  double _scrollProgress = 0.0; // Replace _showSearchIcon with a progress value
  String _searchQuery = '';
  bool _isTextFieldFocused = false;
  final FocusNode _searchFocusNode = FocusNode();
  
  // Constants for animation
  final double _scrollThreshold = 60.0;  // Point at which animation completes

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onTextChange);
    _searchFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _searchController
      ..removeListener(_onTextChange)
      ..dispose();
    _searchFocusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    super.dispose();
  }

  // Updated scroll handler to calculate progress percentage
  void _onScroll() {
    if (_scrollController.hasClients) {
      // Calculate scrolling progress as a value between 0.0 and 1.0
      final double progress = (_scrollController.offset / _scrollThreshold).clamp(0.0, 1.0);
      
      if (progress != _scrollProgress) {
        setState(() {
          _scrollProgress = progress;
        });
        
        // If user is scrolling and search field is focused and search bar is collapsing beyond 50%,
        // unfocus the search field to ensure proper interaction
        if (progress > 0.01 && _searchFocusNode.hasFocus) {
          _searchFocusNode.unfocus();
        }
        
        // Update provider based on threshold crossing
        final bool isVisible = progress < .75;
        if (!isVisible && !ref.read(searchIconVisibilityProvider)) {
          ref.read(searchIconVisibilityProvider.notifier).state = true;
        } else if (isVisible && ref.read(searchIconVisibilityProvider)) {
          ref.read(searchIconVisibilityProvider.notifier).state = false;
        }
      }
    }
  }

  // Add focus change listener
  void _onFocusChange() {
    setState(() {
      _isTextFieldFocused = _searchFocusNode.hasFocus;
    });
  }

  void _onTextChange() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  void _clearText() {
    setState(() {
      _searchController.clear();
      _searchQuery = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool shouldScrollToTop = ref.watch(scrollToTopProvider);
    
    // Scroll to top when signaled
    if (shouldScrollToTop) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
    
    // Calculate height and opacity based on scroll progress
    final double maxHeight = 65.h; // Max height (search bar + gap)
    final double currentHeight = maxHeight * (1 - _scrollProgress);
    final double currentOpacity = 1 - _scrollProgress;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Container that scales based on scroll progress
        AnimatedContainer(
          duration: const Duration(milliseconds: 150), // Faster animation to feel responsive
          curve: Curves.easeOutCubic, // Smoother curve
          height: currentHeight, // Progressive height change
          child: AnimatedOpacity(
            opacity: currentOpacity, // Progressive opacity change
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOutCubic,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  // Search bar
                  SizedBox(
                    height: 45.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Search bar row
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // If search bar is partially collapsed, scroll back to top first
                                    if (_scrollProgress > 0.01) {
                                      _scrollController.animateTo(
                                        0,
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.easeOut,
                                      );
                                      // Wait for animation to complete before focusing
                                      Future.delayed(const Duration(milliseconds: 300), () {
                                        _searchFocusNode.requestFocus();
                                      });
                                    } else {
                                      // Otherwise, focus immediately
                                      _searchFocusNode.requestFocus();
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                                    height: 45.h * (1 - _scrollProgress * 0.3), // Small height reduction for effect
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 244, 244, 246),
                                      borderRadius: BorderRadius.circular(40.r),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        // Centered hint text when text field is not focused and empty
                                        // if (!_isTextFieldFocused && _searchQuery.isEmpty)
                                        //   Row(
                                        //     mainAxisSize: MainAxisSize.min,
                                        //     children: <Widget>[
                                        //       Gap(8.w), // Control the gap here
                                        //       Text(
                                        //         'Search for assets',
                                        //         style: TextStyle(
                                        //           color: AppColors.greyLight,
                                        //           fontSize: 16.sp,
                                        //           fontWeight: FontWeight.w500,
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // TextField and animated icon
                                        Stack(
                                          children: <Widget>[
                                            Stack(
                                              alignment: Alignment.center,
                                              children: <Widget>[
                                                // Animated Positioned for Search Icon
                                                AnimatedPositioned(
                                                  duration: const Duration(milliseconds: 600),
                                                  curve: Curves.easeInOut,
                                                  left: (_isTextFieldFocused || _searchQuery.isNotEmpty)
                                                      ? 12.w
                                                      : (MediaQuery.of(context).size.width - 44.w - 22.w - 8.w - 150.w) / 2 - 20.w,
                                                  top: 12.5.h,
                                                  child: Hero(
                                                    tag: 'searchIconHero',
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: Icon(
                                                        PhosphorIconsBold.magnifyingGlass,
                                                        color: AppColors.greyLight,
                                                        size: 20.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Animated Positioned for "Search for assets" Text
                                                AnimatedPositioned(
                                                  duration: const Duration(milliseconds: 600),
                                                  curve: Curves.easeInOut,
                                                  left: (_isTextFieldFocused || _searchQuery.isNotEmpty)
                                                      ? 40.w // Adjust this value to align with the search icon
                                                      : (MediaQuery.of(context).size.width - 44.w - 22.w - 8.w - 150.w) / 2 + 25.w,
                                                  top: 12.5.h,
                                                  child: AnimatedOpacity(
                                                    duration: const Duration(milliseconds: 1500),
                                                    opacity: (!_isTextFieldFocused && _searchQuery.isEmpty) ? 1.0 : 0.0,
                                                    child: Text(
                                                      'Search for assets',
                                                      style: TextStyle(
                                                        color: AppColors.greyLight,
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // TextField and animated icon
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(width: 40.w), // Reserve space for the icon
                                                    Expanded(
                                                      child: TextField(
                                                        focusNode: _searchFocusNode, // Use the focus node
                                                        showCursor: _isTextFieldFocused || _searchQuery.isNotEmpty, // Only show cursor when focused or has text
                                                        controller: _searchController,
                                                        enabled: _scrollProgress < 0.01, // Disable text field when significantly collapsed
                                                        onChanged: (String value) {
                                                          setState(() {
                                                            _searchQuery = value;
                                                          });
                                                        },
                                                        style: TextStyle(
                                                          color: AppColors.black,
                                                          fontSize: 16.sp,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                        textAlign: _searchQuery.isNotEmpty ? TextAlign.left : TextAlign.center,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText: '', // Empty hint since we show it manually
                                                          contentPadding: EdgeInsets.symmetric(vertical: 11.h),
                                                          suffixIcon: _searchQuery.isNotEmpty
                                                              ? IconButton(
                                                                  icon: CircleAvatar(
                                                                    backgroundColor: const Color.fromARGB(255, 189, 189, 189),
                                                                    radius: 10.r,
                                                                    child: Center(
                                                                      child: Icon(
                                                                        PhosphorIconsBold.x,
                                                                        color: AppColors.white,
                                                                        size: 12.sp,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onPressed: _clearText,
                                                                )
                                                              : null,
                                                          suffixIconConstraints: const BoxConstraints(),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Gap scales with the animation
                  SizedBox(height: 12.h * (1 - _scrollProgress)), // Reduced from 20.h to 12.h // Reduced from 20.h to 12.h
                ],
              ),
            ),
          ),
        ),
        
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            // Add top padding to compensate for search bar disappearing
            // This makes the list appear to "take over" the space
            physics: const BouncingScrollPhysics(), // Better scrolling feel
            itemCount: _assets.length,
            itemBuilder: (BuildContext context, int index) {
              // Asset item building remains the same...
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
                  ref.read(receiveProvider.notifier).selectAsset(asset);
                  widget.onAssetSelected();
                },
              );
            },
          ),
        ),
      ],
    );
  }

  final List<Map<String, String>> _assets = <Map<String, String>>[
    <String, String>{'name': 'Aptos', 'symbol': 'APT', 'imagePath': 'assets/icons/aptos.png'},
    <String, String>{'name': 'Gui inu', 'symbol': 'GUI', 'imagePath': 'assets/icons/gui-inu.png'},
    <String, String>{'name': 'Bluemove', 'symbol': 'MOVE', 'imagePath': 'assets/icons/bluemove.png'},
    <String, String>{'name': 'Pancake', 'symbol': 'CAKE', 'imagePath': 'assets/icons/pancake.png'},
    <String, String>{'name': 'Thala', 'symbol': 'THL', 'imagePath': 'assets/icons/thala.png'},
    <String, String>{'name': 'Thala', 'symbol': 'THL', 'imagePath': 'assets/icons/thala.png'},
    <String, String>{'name': 'Bluemove', 'symbol': 'MOVE', 'imagePath': 'assets/icons/bluemove.png'},
    <String, String>{'name': 'Thala', 'symbol': 'THL', 'imagePath': 'assets/icons/thala.png'},
    <String, String>{'name': 'Bluemove', 'symbol': 'MOVE', 'imagePath': 'assets/icons/bluemove.png'},
    <String, String>{'name': 'Aptos', 'symbol': 'APT', 'imagePath': 'assets/icons/aptos.png'},
    <String, String>{'name': 'Gui inu', 'symbol': 'GUI', 'imagePath': 'assets/icons/gui-inu.png'},
  ];
}

class AssetItem extends StatelessWidget {
  const AssetItem({
    required this.name, required this.symbol, required this.imagePath, super.key,
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
            style: TextStyle(fontSize: 14.sp, color: const Color.fromARGB(255, 151, 157, 170)),
          ),
        ),
      );
}