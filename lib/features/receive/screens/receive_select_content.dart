// screens/receive_select_content.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
  bool _showSearchIcon = false;
  String _searchQuery = '';
  bool _isTextFieldFocused = false; // Add this to track focus state
  final FocusNode _searchFocusNode = FocusNode();

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

  void _onScroll() {
    if (_scrollController.offset > 100 && !_showSearchIcon) {
      setState(() {
        _showSearchIcon = true;
      });
    } else if (_scrollController.offset <= 100 && _showSearchIcon) {
      setState(() {
        _showSearchIcon = false;
      });
    }
    if (_scrollController.offset > 100 && !ref.read(searchIconVisibilityProvider)) {
      ref.read(searchIconVisibilityProvider.notifier).state = true;
    } else if (_scrollController.offset <= 100 && ref.read(searchIconVisibilityProvider)) {
      ref.read(searchIconVisibilityProvider.notifier).state = false;
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
    final shouldScrollToTop = ref.watch(scrollToTopProvider);
    
    // Scroll to top when signaled
    if (shouldScrollToTop) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AnimatedOpacity(
          opacity: _showSearchIcon ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              height: 45.h,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 244, 244, 246),
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // Centered icon and hint text when _searchQuery is empty
                  if (!_isTextFieldFocused && _searchQuery.isEmpty)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Gap(8.w), // Control the gap here
                        Text(
                          'Search Assets',
                          style: TextStyle(
                            color: AppColors.greyLight,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  // TextField and animated icon
                  Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(width: 40.w), // Reserve space for the icon
                          Expanded(
                            child: TextField(
                              focusNode: _searchFocusNode, // Use the focus node
                              autofocus: false, // Don't autofocus
                              showCursor: _isTextFieldFocused || _searchQuery.isNotEmpty, // Only show cursor when focused or has text
                              controller: _searchController,
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
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        // Use _isTextFieldFocused as part of the condition
                        left: (_isTextFieldFocused || _searchQuery.isNotEmpty) 
                            ? 12.w 
                            : (MediaQuery.of(context).size.width - 44.w - 22.w - 8.w - 150.w) / 2 - 20.w,
                        top: 12.5.h,
                        child: Icon(
                          PhosphorIconsBold.magnifyingGlass,
                          color: AppColors.greyLight,
                          size: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(20.h),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            itemCount: _assets.length,
            itemBuilder: (BuildContext context, int index) {
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